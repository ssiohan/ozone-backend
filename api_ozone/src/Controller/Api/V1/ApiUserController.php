<?php

namespace App\Controller\Api\V1;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ApiUserController extends AbstractController
{
    /**
     * @Route("/api/v1/api/user", name="api_v1_api_user")
     */
    public function index()
    {
        return $this->render('api/v1/api_user/index.html.twig', [
            'controller_name' => 'ApiUserController',
        ]);
    }
}
