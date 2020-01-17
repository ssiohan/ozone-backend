<?php

namespace App\Controller\Api\V1;

use App\Entity\User;
use App\Repository\UserRepository;
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
        EntityManagerInterface $em
    ) {
        $userJson = $request->getContent();
        // dd($userJson);
        $user = $serializer->deserialize($userJson, User::class, 'json');
        $em->persist($user);
        $em->flush();
        return $this->json($user, 201, [], ['groups' => 'users_list']);
    }
}
