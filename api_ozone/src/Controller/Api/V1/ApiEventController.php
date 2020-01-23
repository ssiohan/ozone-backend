<?php

namespace App\Controller\Api\V1;

use App\Entity\Event;
use App\Form\EventType;
use App\Repository\EventRepository;
use App\Repository\UserRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/api/v1", name="api_v1_")
 */
class ApiEventController extends AbstractController
{
    /**
     * Permet de vérifier si l'id de l'url est correct
     * et si un event avec cet id existe en database
     * Retourne soit un objet JsonResonse, soit un objet Event
     * @param string $id
     */
    public function checkEventId($id)
    {
        // On protège la route edit contre les injections,
        // en testant que $id est bien de type numeric
        if (!is_numeric($id)) {
            return new JsonResponse(
                ['error' => "Event ID '{$id}' not valid !"],
                Response::HTTP_BAD_REQUEST
            );
        } else {
            // On récupère l'événement en base de données
            $entityManager = $this->getDoctrine()->getManager();
            $event = $entityManager->getRepository(Event::class)->find($id);
            // Si l'événement dont l'id est fourni en URL n'existe pas,
            // on retourne une erreur 400 en JSON
            if (empty($event)) {
                return new JsonResponse(
                    ['error' => "Event with ID '{$id}' not found !"],
                    Response::HTTP_BAD_REQUEST
                );
            } else {
                // Sinon on retourne l'event trouvé sous forme d'Objet Event        
                return $event;
            }
        }
    }

    // TODO: public function isAuthorOrAdmin()

    /**
     * @Route("/events", name="events_list", methods={"GET"})
     */
    public function list(EventRepository $eventRepository)
    {
        $events = $eventRepository->findAll();
        return $this->json(
            $events,
            200,
            [],
            ['groups' => 'events_list']
        );
    }

    /**
     * @Route("/events/{id}", name="event_show", methods={"GET"})
     */
    public function show($id)
    {
        // On check si le event id est valide et existe en database
        // S'il existe checkEventId() retourne le $event au format Object
        $event = $this->checkEventId($id);

        // Si $event est un Object JsonResponse on l'envoi en réponse HTTP JSON
        // Cela veut dire que checkEventId a rencontré une erreur
        if (is_a($event, JsonResponse::class)) {
            return $event;
        } else {
            // On retourne le $event en réponse HTTP JSON
            return $this->json(
                $event,
                201,
                [],
                ['groups' => 'events_list']
            );
        }
    }

    /**
     * @Route("/events", name="event_new", methods={"POST"})
     * @isGranted("ROLE_USER")
     */
    public function new(
        Request $request,
        SerializerInterface $serializer,
        EntityManagerInterface $em,
        UserRepository $userRepository
    ) {
        // On récupère le contenu de la requête envoyé en POST au format JSON
        $eventJson = $request->getContent();

        // On transforme le JSON reçu en Array associatif (true en 2nd argument)
        $eventArray = json_decode($eventJson, true);

        // On récupère l'user dont l'id a été fourni dans la requête HTTP JSON
        $user = $userRepository->find($eventArray['author']);

        // On déserialize pour transformer le JSON en Objet (Event::class)
        $event = $serializer->deserialize($eventJson, Event::class, 'json');

        // On définit l'user récupéré comme créateur de l'event
        $event->setAuthor($user);

        // On créé le nouvel événement en base de données,
        // il récupère donc un "id" auto-increment
        $em->persist($event);
        $em->flush();

        return $this->json(
            $event,
            201,
            [],
            ['groups' => 'events_list']
        );
    }

    /**
     * @Route("/events/{id}", name="events_edit", methods={"PATCH"})
     * @isGranted("ROLE_USER")
     */
    public function edit(Request $request, EntityManagerInterface $em, $id)
    {
        // On check si le event id est valide et existe en database
        $event = $this->checkEventId($id);
        if (is_a($event, JsonResponse::class)) {
            return $event;
        } else {
            // On décode les modifications fournies dans la requête JSON / HTTP "PATCH"
            // On obtient donc un array avec la même structure que le JSON.
            $eventJson = json_decode($request->getContent(), true);

            // On verifie si la clef date_event a été fournie dans la requête
            // Si oui on convertit la date au format DateTime à partir de ('Y-m-d')
            // On refresh la date d'event fournie ou
            // sinon on remet la date qui existait déjà.
            if (array_key_exists('date_event', $eventJson)) {
                $event->setDateEvent(new DateTime($eventJson['date_event']));
            }

            // On passe par le form Symfony eventType,
            // car il prend un array en entrée pour le convertir en objet Event::class
            $form = $this->createForm(EventType::class, $event);

            // En précisant false en second paramètre de la méthode submit(),
            // on demande à ne modifier que les éléments fournis dans la requete HTTP
            $form->submit($eventJson, false);

            // On met à jour la date de modification de l'event
            $event->setUpdatedAt(new DateTime());

            // On met à jour l'event en database                     
            $em->persist($event);
            $em->flush();

            return $this->json(
                $event,
                201,
                [],
                ['groups' => 'events_list']
            );
        }
    }

    /**
     * @Route("/events/{id}", name="events_delete", methods={"DELETE"})
     */
    public function delete(EntityManagerInterface $em, $id)
    {
        // On check si le event id est valide et existe en database
        $event = $this->checkEventId($id);
        if (is_a($event, JsonResponse::class)) {
            return $event;
        } else {
            // Si l'event existe on le supprime de la database                        
            $em->remove($event);
            $em->flush();
            // On retourne un message JSON qui informe de la suppression du $event
            return $this->json(
                "Event '{$event->getTitle()}' has been successfully deleted !",
                200,
                [],
                ['groups' => 'users_list']
            );
        }
    }
}
