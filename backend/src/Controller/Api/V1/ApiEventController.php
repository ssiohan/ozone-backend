<?php

namespace App\Controller\Api\V1;

use App\Entity\Event;
use App\Repository\EventRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/api/v1", name="api_v1_")
 */
class ApiEventController extends AbstractController
{
    /**
     * @Route("/events", name="events_list", methods={"GET"})
     */
    public function list(EventRepository $eventRepository)
    {
        $events = $eventRepository->findAll();
        return $this->json($events, 200, [], ['groups' => 'events_list']);
    }

    /**
     * @Route("/events/{id}", name="event_show", methods={"GET"})
     */
    public function show(EventRepository $eventRepository, $id)
    {
        $event = $eventRepository->findOneBy(['id' => $id]);
        return $this->json($event, 200, [], ['groups' => 'events_list']);
    }

    /**
     * @Route("/events", name="event_new", methods={"POST"})
     */
    public function new(
        Request $request,
        SerializerInterface $serializer,
        EntityManagerInterface $em
    ) {
        $eventJson = $request->getContent();
        $event = $serializer->deserialize($eventJson, Event::class, 'json');

        dd($event);
        $em->persist($event);
        $em->flush();
        return $this->json($event, 201, [], ['groups' => 'events_list']);
    }
}
