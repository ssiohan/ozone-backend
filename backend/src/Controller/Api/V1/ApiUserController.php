<?php

namespace App\Controller\Api\V1;

use App\Entity\User;
use App\Entity\UserRole;
use App\Form\UserType;
use App\Repository\RoleRepository;
use App\Repository\UserRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/api/v1", name="api_v1_")
 */
class ApiUserController extends AbstractController
{
    /**
     * @Route("/users", name="users_list", methods={"GET"})
     */
    public function list(UserRepository $userRepository)
    {
        $users = $userRepository->findAll();
        return $this->json($users, 200, [], ['groups' => 'users_list']);
    }

    /**
     * @Route("/users/{id}", name="users_show", methods={"GET"})
     */
    public function show(UserRepository $userRepository, $id)
    {
        $user = $userRepository->findOneBy(['id' => $id]);
        return $this->json($user, 200, [], ['groups' => 'users_list']);
    }

    /**
     * @Route("/users", name="users_new", methods={"POST"})
     */
    public function new(
        Request $request,
        SerializerInterface $serializer,
        EntityManagerInterface $em,
        RoleRepository $roleRepository
    ) {
        // On récupère le contenu de la requête envoyé en POST au format JSON
        $userJson = $request->getContent();
        // On désirialize pour transformer le JSON en Objet (User::class)
        $user = $serializer->deserialize($userJson, User::class, 'json');
        // On créé le nouvel utilisateur en base de données, il récupère donc un "id" auto-increment
        $em->persist($user);
        $em->flush();

        // On récupère l'id du ROLE_USER
        $roleUserId = $roleRepository->findOneBy(['name' => 'ROLE_USER']);

        // On créé le UserRole à partir du $user et RoleUserId récupérés
        $userRole = new UserRole();
        $userRole->setUser($user)->setRole($roleUserId);
        $em->persist($userRole);
        $em->flush();

        return $this->json($user, 201, [], ['groups' => 'users_list']);
    }
    /**
     * @Route("/users/{id}", name="users_edit", methods={"PUT"})
     */
    public function edit(
        Request $request,
        EntityManagerInterface $em,
        UserRepository $userRepository,
        $id
    ) {

        // On protège la route edit contre les injections en testant que $id est bien de type numeric
        if (!is_numeric($id)) {
            return new JsonResponse(
                ['message' => "User ID : {$id} is not valid"],
                Response::HTTP_BAD_REQUEST
            );
        }

        // On récupère l'utilisateur en base de données
        $user = $userRepository->find($id);

        // Si l'utilisateur dont l'id est fourni en URL n'existe pas on retourne une erreur 400 en JSON
        if (empty($user)) {
            return new JsonResponse(
                ['message' => "User with ID : {$id} not found !"],
                Response::HTTP_BAD_REQUEST
            );
        }

        // On créé un Array Temporaire pour héberger les données de l'user récupérées en database
        $query = $em
            ->createQuery("SELECT u FROM App\Entity\User u WHERE u.id = :id")
            ->setParameter('id', $id);
        // On récupère l'user en database sous forme d'Array        
        $userArray = $query->getArrayResult();

        // On actualise le updated_at à la date du jour de la modif
        $userArray[0]['updated_at'] = new DateTime();

        // On décode les modification fournies dans la requête HTTP "PUT" en JSON
        // On obtient donc un array avec la même structure que le JSON.
        $userJson = json_decode($request->getContent(), true);

        // On verifie si la clef birthdate a été fournie dans la requête
        // Si oui on convertit la date au format DateTime à partir de ('Y-m-d')
        if (array_key_exists('birthdate', $userJson)) {
            $birthDate = new DateTime($userJson['birthdate']);
            $userJson['birthdate'] = $birthDate;
        }

        // On actualise l'userArray avec les données envoyées dans la requête
        $userArrayNew = array_merge($userArray[0], $userJson);

        // On passe par le form Symfony UserType,
        // car il prend un array en entrée pour le convertir en objet User::class
        $form = $this->createForm(UserType::class, $user);
        $form->submit($userArrayNew, );

        // On refresh la date anniversaire fournie ou sinon on remet la date qui existait déjà.
        $user->setBirthdate($userArrayNew['birthdate']);

        //On met à jour l'user en database                        
        $em->persist($user);
        $em->flush();

        return $this->json($user, 201, [], ['groups' => 'users_list']);
    }
}
