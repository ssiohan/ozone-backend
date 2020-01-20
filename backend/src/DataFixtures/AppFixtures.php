<?php

namespace App\DataFixtures;

use App\Entity\Event;
use App\Entity\Role;
use App\Entity\User;
use DateTime;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        //$product = new Product();
        //$manager->persist($product);

        // Création des rôles
        $role = new Role();
        $role->setName('ROLE_USER');
        $manager->persist($role);
        $manager->flush();
        $role = new Role();
        $role->setName('ROLE_AMIN');
        $manager->persist($role);
        $manager->flush();
        $role = new Role();
        $role->setName('ROLE_PARTNER');
        $manager->persist($role);
        $manager->flush();

        // Création d'un utilisateur
        $user = new User();
        $user   ->setEmail('machin@machin.com')
                ->setUsername('Machin')
                ->setPwdHash('machin');                
        $manager->persist($user);
        $manager->flush();
        $user = new User();
        $user   ->setEmail('truc@machin.com')
                ->setUsername('Truc')
                ->setPwdHash('truc');
        $manager->persist($user);
        $manager->flush();

        // Création d'un événement
        $user = $manager->getRepository(User::class)->findOneBy(['username'=>'Machin']); 
        
        $event = new Event();
        $event->setTitle('Event Test')
            ->setTypeEvent('Atelier')
            ->setDescription('Un event de test')
            ->setDateEvent(new DateTime())
            ->setPainfulness(5)
            ->setDuration(4)
            ->setSocietalImpact(3)
            ->setEnvironmentalImpact(2)
            ->setUserMin(5)
            ->setUserMax(20)
            ->setLatitude('45.55875')
            ->setLongitude('4.45654')
            ->setUserId($user);
        
        $manager->persist($event);
        $manager->flush();
    }
}
