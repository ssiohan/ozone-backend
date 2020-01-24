<?php

namespace App\DataFixtures;

use App\Entity\Event;
use App\Entity\Role;
use App\Entity\User;
use DateTime;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AppFixtures extends Fixture
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
    }
    
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
        $user->setEmail('machin@machin.com')
            ->setPseudo('Machin')
            ->setPassword($this->passwordEncoder->encodePassword(
                $user,
                $user->getPseudo()
            ));
        $manager->persist($user);
        $manager->flush();
        $user = new User();
        $user->setEmail('truc@machin.com')
            ->setPseudo('Truc')
            ->setPassword($this->passwordEncoder->encodePassword(
                $user,
                $user->getPseudo()
            ));
        $manager->persist($user);
        $manager->flush();

        // Création d'un événement
        $user = $manager->getRepository(User::class)->findOneBy(['pseudo' => 'Machin']);

        $event = new Event();
        $event->setTitle('Event Test')
            ->setTypeEvent('Atelier')
            ->setDescription('Un event de test')
            ->setDateEvent(new DateTime())
            ->setPainfulness(5)
            ->setDuration(4)
            ->setImpactSocietal(3)
            ->setImpactEnvironmental(2)
            ->setUserMin(5)
            ->setUserMax(20)
            ->setLatitude('45.55875')
            ->setLongitude('4.45654')
            ->setAuthor($user);

        $manager->persist($event);
        $manager->flush();
    }
}
