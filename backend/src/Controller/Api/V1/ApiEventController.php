<?php

namespace App\Controller\Api\V1;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ApiEventController extends AbstractController
{
    /**
     * @Route("/api/v1/api/event", name="api_v1_api_event")
     */
    public function index()
    {
        return $this->render('api/v1/api_event/index.html.twig', [
            'controller_name' => 'ApiEventController',
        ]);
    }
}
