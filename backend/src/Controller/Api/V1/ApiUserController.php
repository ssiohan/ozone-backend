<?php

namespace App\Controller\Api\V1;

use App\Entity\User;
use App\Entity\UserRole;
use App\Repository\RoleRepository;
use App\Repository\UserRepository;
use App\Repository\UserRoleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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
        // On récupère le contenur de la requête envoyé en POST au format JSON
        $userJson = $request->getContent();
        // On désirialize pour transformer le JSON en Objet (User::class)
        $user = $serializer->deserialize($userJson, User::class, 'json');
        // On créé le nouvel utilisateur en base de données il récupère un "id" auto increment
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
}
