<?php

namespace App\Controller\Api\V1;

use App\Entity\Role;
use App\Entity\Event;
use App\Entity\EventUser;
use App\Entity\User;
use App\Entity\UserRole;
use App\Form\UserType;
use App\Repository\RoleRepository;
use App\Repository\UserRepository;
use App\Controller\Api\V1\ApiEventController;
use DateTime;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @Route("/api/v1", name="api_v1_")
 */
class ApiUserController extends AbstractController
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
    }

    /**
     * Permet de vérifier si l'id de l'url est correct
     * et si un user avec cet id existe en database
     * Retourne soit un objet 'JsonResonse', soit un objet 'User'
     * @param string $id
     */
    public function checkUserId($id)
    {
        // On protège les routes concernées contre les injections,
        // en testant que $id est bien de type numeric
        if (!is_numeric($id)) {
            // On retourne l'erreur JSON correspondante
            return new JsonResponse(
                ['error' => "ID({$id}) format invalide ! (attendu : nombre)"],
                Response::HTTP_BAD_REQUEST
            );
        } else {
            // On tente de récupérer l'utilisateur en base de données
            $em = $this->getDoctrine()->getManager();
            $user = $em->getRepository(User::class)->find($id);
            // Si l'utilisateur dont l'id est fourni en URL n'existe pas,
            // on retourne une erreur 400 en JSON
            if (empty($user)) {
                // On retourne l'erreur JSON correspondante
                return new JsonResponse(
                    ['error' => "ID({$id}) n'existe pas !"],
                    Response::HTTP_BAD_REQUEST
                );
            // Sinon on retourne l'utilisateur trouvé sous forme d'Objet 'User'
            } else {
                return $user;
            }
        }
    }

    /**
     * @Route("/get_user_id/{email}", name="get_user_id", methods={"GET"})
     */
    public function getUserId($email)
    {
        // On essaye de récupèrer l'utilisateur en base de données
        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository(User::class)->findOneBy(['email' => $email]);

        // Si l'addresse email n'existe pas on retourne un message d'erreur JSON
        if (empty($user)) {
            // On retourne l'erreur JSON correspondante
            return new JsonResponse(
                ['error' => "L'email '$email' n'existe pas !"],
                Response::HTTP_BAD_REQUEST
            );
        // Sinon on retourne l'id de l'utilisateur dont l'email est fourni
        } else {
            return new JsonResponse(
                ['User ID' => $user->getId()]
            );
        }
    }

    /**
     * @Route("/users/{id}/is_admin", name="user_is_admin", methods={"GET"})
     */
    public function isAdmin($id, RoleRepository $roleRepository)
    {
        // On check si l'id de l'utilisateur est valide et existe en database
        // S'il existe checkUserId() retourne le $user au format Object
        $user = $this->checkUserId($id);

        // Si $user est un Object JsonResponse on l'envoi en réponse HTTP JSON
        // Cela veut dire que checkUserId a rencontré une erreur
        if (is_a($user, JsonResponse::class)) {
            // On retourne l'erreur JSON correspondante
            return $user;
        // Sinon on va chercher une relation Utilisateur/Rôle dans la table 'user_role'
        } else {
            $idRoleAdmin = $roleRepository->findOneBy(['name' => 'ROLE_ADMIN']);
            $em = $this->getDoctrine()->getManager();
            $isAdmin = $em->getRepository(UserRole::class)->findOneBy([
                'user' => $id,
                'role' => $idRoleAdmin
            ]);
            // Si la recherche trouve une relation alors isAdmin vaudra 'true'
            // Sinon isAdmin vaudra 'false'
            ($isAdmin) ? $isAdmin = true : $isAdmin = false;
            // On retourne la réponse JSON
            return new JsonResponse(
                ['isAdmin' => $isAdmin]
            );
        }
    }

    /**
     * @Route("/users/{id}/has_role/{role}", name="user_has_role", methods={"GET"})
     */
    public function userHasRole($id, $role, RoleRepository $roleRepository)
    {
        // On check si le user id est valide et existe en database
        // S'il existe checkUserId() retourne le $user au format Object
        $user = $this->checkUserId($id);
        // Si $user est un Object JsonResponse on l'envoi en réponse HTTP JSON
        // Cela veut dire que checkUserId a rencontré une erreur
        if (is_a($user, JsonResponse::class)) {
            // On retourne l'erreur JSON correspondante
            return $user;
        // Sinon on va chercher une relation Utilisateur/Rôle dans la table 'user_role'
        } else {
            // Récupère l'id du role spécifié
            $idRole = $roleRepository->findOneBy(['name' => "$role"]);
            $em = $this->getDoctrine()->getManager();
            // Vérifie l'existance de la relation user_id/role_id dans la table 'user_role'
            $isRole = $em->getRepository(UserRole::class)->findOneBy([
                'user' => $id,
                'role' => $idRole
            ]);
            // Si la recherche ne trouve rien, elle retourne null
            ($isRole) ? $isRole = true : $isRole = false;
            // On retourne la réponse JSON
            return new JsonResponse([
                "has" => (bool) $isRole,
                "role" => (string) $role
            ]);
        }
    }

    /**
     * Mise à jour automatique des relations dans la table UserRole,
     * par rapport aux rôles fournis dans le champ rôles de la table User.
     */
    public function setUserRoles($id)
    {
        // Récupération des différents Repositories nécéssaires
        $em = $this->getDoctrine()->getManager();
        $userRoleRepository = $em->getRepository(UserRole::class);
        $roleRepository = $em->getRepository(Role::class);
        $userRepository = $em->getRepository(User::class);
        // On récupère l'user dont l'id est fourni
        $user = $userRepository->findOneBy(['id' => $id]);
        // On récupère ses rôles présents dans le champ rôles User
        $userRoles = $user->getRoles();
        // Pour chacun des rôles on vérifie si une relation existe déjà dans la table user_role
        // Si çà n'existe pas on ajoute la relation, si elle existe déjà on ne fait rien...
        foreach ($userRoles as $userRole) {
            $thisUserRoles[] = $roleRepository->findOneBy(['name' => $userRole]);
            foreach ($thisUserRoles as $role) {
                $roleExist = $userRoleRepository->findBy(['user' => $id, 'role' => $role]);
                if (empty($roleExist)) {
                    $userRole = new UserRole();
                    $userRole->setUser($user)->setRole($role);
                    $em->persist($userRole);
                    $em->flush();
                }
            }
        }
    }
    /**
     * @Route("/users/{id}/has_subscribed/{event}", name="user_has_subscribed", methods={"GET"})
     */
    public function userHasSubscribed($id, $event)
    {
        // On check si le user id est valide et existe en database
        // S'il existe checkUserId() retourne le $user au format Object
        $user = $this->checkUserId($id);
        // Si $user est un Object JsonResponse on l'envoi en réponse HTTP JSON
        // Cela veut dire que checkUserId a rencontré une erreur
        if (is_a($user, JsonResponse::class)) {
            // On retourne l'erreur JSON correspondante
            return $user;
        } else {
            // récupère l'id de l'event spécifié
            $em = $this->getDoctrine()->getManager();
            // on cherche une instance de l'event et de l'utilisateur dans l'entité EventUser
            $isSubscribed = $em->getRepository(EventUser::class)->findOneBy([
                'user' => $id,
                'event' => $event
            ]);
            // Si la recherche ne trouve rien, elle retourne null
            ($isSubscribed != null) ? $isSubscribed = true : $isSubscribed = false;
            // On retourne la réponse JSON
            return new JsonResponse(["isSub" => $isSubscribed]);
        }
    }

    /**
     * ajout des relations dans la table EventUser
     * @Route("/users/{id}/user_subscribe/{event}", name="user_subscribe", methods={"POST"})
     */
    public function setUserEvent($id, $event, ApiEventController $apiEventController)
    {
        // On check si le user id est valide et existe en database
        // S'il existe checkUserId() retourne le $user au format Object
        $user = $this->checkUserId($id);
        $event = $apiEventController->checkEventId($event);
        // Si $user est un Object JsonResponse on l'envoi en réponse HTTP JSON
        // Cela veut dire que checkUserId a rencontré une erreur
        // Puis on fait la même vérification pour $event
        if ((is_a($user, JsonResponse::class))) {
            // On retourne l'erreur JSON correspondante
            return $user;
        } elseif (is_a($event, JsonResponse::class)) {
            // On retourne l'erreur JSON correspondante
            return $event;
        } else {
            // Récupération des différents Repositories nécéssaires
            $em = $this->getDoctrine()->getManager();
            $eventRepository = $em->getRepository(Event::class);
            $userRepository = $em->getRepository(User::class);
            // On récupère l'user dont l'id est fourni
            $user = $userRepository->findOneBy(['id' => $id]);
            // On récupère l'event dont l'id est fourni
            $event = $eventRepository->findOneBy(['id' => $event]);
            // On vérifie si l'user a déjà soucris à l'event ou pas
            if (
                $this->userHasSubscribed($id, $event)->getContent('isSub') == '{"isSub":true}'
            ) {
                // On retourne la réponse JSON
                return new JsonResponse("Utilisateur déja inscrit à cet événement !");
            } else {
                $EventUser = new EventUser();
                $EventUser->setUser($user)->setEvent($event);
                $em->persist($EventUser);
                $em->flush();
                // On retourne la réponse JSON
                return new JsonResponse("Participation à l'événement ajoutée !");
            }
        }
    }

    /**
     * @Route("/users", name="users_list", methods={"GET"})
     * @isGranted("ROLE_USER")
     */
    public function list(UserRepository $userRepository)
    {
        $users = $userRepository->findAll();
        return $this->json(
            $users,
            200,
            [],
            ['groups' => 'users_list']
        );
    }

    /**
     * @Route("/users/{id}", name="users_show", methods={"GET"})
     * @isGranted("ROLE_USER")
     */
    public function show($id)
    {
        // On check si le user id est valide et existe en database
        // S'il existe checkUserId() retourne le $user au format Object
        $user = $this->checkUserId($id);

        // Si $user est un Object JsonResponse on l'envoi en réponse HTTP JSON
        // Cela veut dire que checkUserId a rencontré une erreur
        if (is_a($user, JsonResponse::class)) {
            return $user;
        } else {
            // On retourne le $user en réponse HTTP JSON
            return $this->json(
                $user,
                201,
                [],
                ['groups' => 'users_list']
            );
        }
    }

    /**
     * @Route("/users", name="users_new", methods={"POST"})
     */
    public function new(
        Request $request,
        SerializerInterface $serializer,
        EntityManagerInterface $em
    ) {
        // On récupère le contenu de la requête envoyé en POST au format JSON
        $userJson = $request->getContent();
        // On tente la création de l'utilisateur avec les données fournies en JSON
        try {
            // On déserialize pour transformer le JSON en Objet (User::class)
            $user = $serializer->deserialize($userJson, User::class, 'json');
            // On hash le password du user reçu en JSON (avant l'écriture en database)
            $user->setPassword($this->passwordEncoder->encodePassword(
                $user,
                $user->getPassword()
            ));
            // On ajoute le ROLE_USER dans le champ rôles de l'User
            $user->setRoles(["ROLE_USER"]);
            // On définit une image par defaut si aucune n'est pas fournie
            ($user->getAvatar() == null) ?: $user->setAvatar("user-default.png");
            // On créé le nouvel utilisateur en base de données,
            // il récupère donc un "id" auto-increment           
            $em->persist($user);
            $em->flush();
            // Création des associations dans la table user_role
            $this->setUserRoles($user->getId());
            // On retourne l'utilisateur créé en JSON
            return $this->json(
                $user,
                201,
                [],
                ['groups' => 'users_list']
            );
        // En cas d'erreur, on retourne le message d'erreur en JSON
        } catch (UniqueConstraintViolationException $uniqueException) {
            return $this->json([
                'status' => 400,
                'alert' => "L'email ou le pseudo choisi existe déjà !",
                'error_message' => $uniqueException->getMessage()
            ], 400);
        }
    }

    /**
     * @Route("/users/{id}", name="users_edit", methods={"PATCH"})
     * @isGranted("ROLE_USER")
     */
    public function edit(Request $request, EntityManagerInterface $em, $id)
    {
        // On check si le user id est valide et existe en database
        $user = $this->checkUserId($id);
        if (is_a($user, JsonResponse::class)) {
            return $user;
        } else {
            // On tente la création de l'utilisateur avec les données fournies en JSON
            try {
                // On décode les modifications fournies dans la requête JSON / HTTP "PATCH"
                // On obtient donc un array avec la même structure que le JSON.
                $userJson = json_decode($request->getContent(), true);
                // On verifie si la clef birthdate a été fournie dans la requête
                // Si oui on convertit la date au format DateTime à partir de ('Y-m-d')
                // On refresh la date anniversaire fournie ou sinon on remet la date qui existait déjà.
                if (array_key_exists('birthdate', $userJson)) {
                    $user->setBirthdate(new DateTime($userJson['birthdate']));
                }
                // On passe par le form Symfony UserType,
                // car il prend un array en entrée pour le convertir en objet User::class
                $form = $this->createForm(UserType::class, $user);
                // En précisant false en second paramètre de la méthode submit(),
                // on demande à ne modifier que les éléments fournis dans la requete HTTP
                $form->submit($userJson, false);
                // On met à jour la date de modification de l'user
                $user->setUpdatedAt(new DateTime());
                // On hash le password du user si reçu en JSON (avant l'écriture en database)
                if (array_key_exists('password', $userJson)) {
                    $user->setPassword($this->passwordEncoder->encodePassword(
                        $user,
                        $user->getPassword()
                    ));
                }
                // On met à jour l'user en database
                $em->persist($user);
                $em->flush();
                // Mise à jour auto des rôles lors de l'edition de l'user
                $this->setUserRoles($id);
                // On retourne l'utilisateur modifié en JSON
                return $this->json(
                    $user,
                    201,
                    [],
                    ['groups' => 'users_list']
                );
            // En cas d'erreur, on retourne le message d'erreur en JSON
            } catch (UniqueConstraintViolationException $uniqueException) {
                return $this->json([
                    'status' => 400,
                    'alert' => "L'email ou le pseudo choisi existe déjà !",
                    'error_message' => $uniqueException->getMessage()
                ], 400);
            }
        }
    }

    /**
     * @Route("/users/{id}", name="users_delete", methods={"DELETE"})
     * @isGranted("ROLE_USER")
     */
    public function delete(EntityManagerInterface $em, $id)
    {
        // On check si le user id est valide et existe en database
        $user = $this->checkUserId($id);
        if (is_a($user, JsonResponse::class)) {
            return $user;
        } else {
            // Si l'user existe on le supprime de la database                        
            $em->remove($user);
            $em->flush();
            // On retourne un message JSON qui informe de la suppression du $user
            return $this->json(
                "User '{$user->getUsername()}' a été correctement supprimé !",
                200,
                [],
                ['groups' => 'users_list']
            );
        }
    }
}
