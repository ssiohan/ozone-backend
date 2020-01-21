<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 * @UniqueEntity("email")
 * @UniqueEntity("username")
 */
class User
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"users_list", "events_list"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, unique=true)
     * @Groups({"users_list", "events_list"})
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=100, unique=true)
     * @Groups({"users_list", "events_list"})
     */
    private $username;

    /**
     * @ORM\Column(type="string", length=100, nullable=true)
     * @Groups({"users_list", "events_list"}) 
     */
    private $firstname;

    /**
     * @ORM\Column(type="string", length=100, nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $lastname;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $description;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $birthdate;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"users_list", "events_list"})
     */
    private $pwd_hash;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $avatar;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"users_list", "events_list"})
     */
    private $created_at;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $updated_at;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"users_list", "events_list"})
     */
    private $status;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"users_list", "events_list"})
     */
    private $experience;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"users_list", "events_list"})
     */
    private $credit;

    /**
     * // mappedBy="user_id" modifié en mappedBy="user" sinon çà buggait
     * @ORM\OneToMany(targetEntity="App\Entity\Event", mappedBy="user")
     * @Groups("users_list")
     */
    private $events;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\EventUser", mappedBy="user", orphanRemoval=true)
     * @Groups("users_list")
     */
    private $eventUsers;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\UserRole", mappedBy="user", orphanRemoval=true)
     * @Groups({"users_list", "events_list"})
     */
    private $userRoles;

    public function __construct()
    {
        // Récupère tous les événements créés par l'utilisateur
        $this->events = new ArrayCollection();

        $this->created_at = new \DateTime;
        $this->status = true;
        $this->experience = 0;
        $this->credit = 0;
        $this->eventUsers = new ArrayCollection();
        $this->userRoles = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getUsername(): ?string
    {
        return $this->username;
    }

    public function setUsername(string $username): self
    {
        $this->username = $username;

        return $this;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(?string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(?string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getBirthdate(): ?\DateTimeInterface
    {
        return $this->birthdate;
    }

    public function setBirthdate(?\DateTimeInterface $birthdate): self
    {
        $this->birthdate = $birthdate;

        return $this;
    }

    public function getPwdHash(): ?string
    {
        return $this->pwd_hash;
    }

    public function setPwdHash(string $pwd_hash): self
    {
        $this->pwd_hash = $pwd_hash;

        return $this;
    }

    public function getAvatar(): ?string
    {
        return $this->avatar;
    }

    public function setAvatar(?string $avatar): self
    {
        $this->avatar = $avatar;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeInterface $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(?\DateTimeInterface $updated_at): self
    {
        $this->updated_at = $updated_at;

        return $this;
    }

    public function getStatus(): ?bool
    {
        return $this->status;
    }

    public function setStatus(bool $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function getExperience(): ?int
    {
        return $this->experience;
    }

    public function setExperience(int $experience): self
    {
        $this->experience = $experience;

        return $this;
    }

    public function getCredit(): ?int
    {
        return $this->credit;
    }

    public function setCredit(int $credit): self
    {
        $this->credit = $credit;

        return $this;
    }

    /**
     * @return Collection|Event[]
     */
    public function getEvents(): Collection
    {
        return $this->events;
    }

    public function addEvent(Event $event): self
    {
        if (!$this->events->contains($event)) {
            $this->events[] = $event;
            $event->setUserId($this);
        }

        return $this;
    }

    public function removeEvent(Event $event): self
    {
        if ($this->events->contains($event)) {
            $this->events->removeElement($event);
            // set the owning side to null (unless already changed)
            if ($event->getUserId() === $this) {
                $event->setUserId(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|EventUser[]
     */
    public function getEventUsers(): Collection
    {
        return $this->eventUsers;
    }

    public function addEventUser(EventUser $eventUser): self
    {
        if (!$this->eventUsers->contains($eventUser)) {
            $this->eventUsers[] = $eventUser;
            $eventUser->setUser($this);
        }

        return $this;
    }

    public function removeEventUser(EventUser $eventUser): self
    {
        if ($this->eventUsers->contains($eventUser)) {
            $this->eventUsers->removeElement($eventUser);
            // set the owning side to null (unless already changed)
            if ($eventUser->getUser() === $this) {
                $eventUser->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|UserRole[]
     */
    public function getUserRoles(): Collection
    {
        return $this->userRoles;
    }

    public function addUserRole(UserRole $userRole): self
    {
        if (!$this->userRoles->contains($userRole)) {
            $this->userRoles[] = $userRole;
            $userRole->setUser($this);
        }

        return $this;
    }

    public function removeUserRole(UserRole $userRole): self
    {
        if ($this->userRoles->contains($userRole)) {
            $this->userRoles->removeElement($userRole);
            // set the owning side to null (unless already changed)
            if ($userRole->getUser() === $this) {
                $userRole->setUser(null);
            }
        }

        return $this;
    }
}
