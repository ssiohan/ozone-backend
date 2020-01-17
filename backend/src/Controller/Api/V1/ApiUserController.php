<?php

namespace App\Controller\Api\V1;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

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
     * @Route("/users/{id}", name="user_show", methods={"GET"})
     */
    public function one(UserRepository $userRepository, $id)
    {
        $user = $userRepository->findOneBy(['id'=> $id]);

        return $this->json($user, 200, [], ['groups' => 'users_list']);

    }

    /**
     * @Route("/users", name="user_new", methods={"POST"})
     */
    public function new(UserRepository $userRepository, $id)
    {
        $user = $userRepository->findOneBy(['id'=> $id]);

        return $this->json($user, 200, [], ['groups' => 'users_list']);

    }
}
