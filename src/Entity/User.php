<?php

namespace App\Entity;

use App\Entity\Event;
use App\Entity\EventUser;
use App\Entity\UserRole;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Serializer\Annotation\Groups;
use Vich\UploaderBundle\Mapping\Annotation as Vich;


/**
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 * @UniqueEntity(fields={"email"}, message="There is already an account with this email")
 * @Vich\Uploadable
 */
class User implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"users_list", "events_list"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     * @Groups({"users_list", "events_list_admin"})
     */
    private $email;

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=100, unique=true)
     * @Groups({"users_list", "events_list"})
     */
    private $pseudo;

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
     * @Groups({"users_list", "events_list_admin"})
     */
    private $birthdate;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $avatar;

    /**
     * @Vich\UploadableField(mapping="images", fileNameProperty="avatar")
     * @var File|null
     */
    private $avatarFile;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"users_list", "events_list"})
     */
    private $experience;

    /**
     * @ORM\Column(type="integer")
     * @Groups({"users_list", "events_list_admin"})
     */
    private $credit;

    /**
     * @ORM\Column(type="boolean")
     * @Groups({"users_list", "events_list"})
     */
    private $status;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"users_list", "events_list"})
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $updatedAt;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Event", mappedBy="author")
     * @Groups({"users_list"})
     */
    private $createdEvents;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\EventUser", mappedBy="user", orphanRemoval=true)
     * @Groups({"users_list"})
     */
    private $userEvents;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\UserRole", mappedBy="user", orphanRemoval=true)
     * @Groups({"users_list", "events_list_admin"})
     */
    private $userRoles;

    public function __construct()
    {
        // Récupère tous les événements créés par l'utilisateur
        $this->createdEvents = new ArrayCollection();
        $this->userRoles = new ArrayCollection();
        $this->userEvents = new ArrayCollection();

        $this->createdAt = new \DateTime;
        $this->status = true;
        $this->experience = 0;
        $this->credit = 0;
    }

    public function __toString()
    {
        return (string) $this->getEmail();
    }

    public function serialize()
    {
        return serialize($this->id);
    }

    public function unserialize($serialized)
    {
        $this->id = unserialize($serialized);
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

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getPseudo(): ?string
    {
        return $this->pseudo;
    }

    public function setPseudo(string $pseudo): self
    {
        $this->pseudo = $pseudo;

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

    public function setAvatarFile(File $avatar = null)
    {
        $this->avatarFile = $avatar;

        // VERY IMPORTANT:
        // It is required that at least one field changes if you are using Doctrine,
        // otherwise the event listeners won't be called and the file is lost
        if ($avatar) {
            // if 'updatedAt' is not defined in your entity, use another property
            $this->updatedAt = new \DateTime;
        }
    }

    public function getAvatarFile()
    {
        return $this->avatarFile;
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
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

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
    public function getCreatedEvents(): Collection
    {
        return $this->createdEvents;
    }

    public function addCreatedEvent(Event $createdEvent): self
    {
        if (!$this->createdEvents->contains($createdEvent)) {
            $this->createdEvents[] = $createdEvent;
            $createdEvent->setAuthor($this);
        }

        return $this;
    }

    public function removeCreatedEvent(Event $createdEvent): self
    {
        if ($this->createdEvents->contains($createdEvent)) {
            $this->createdEvents->removeElement($createdEvent);
            // set the owning side to null (unless already changed)
            if ($createdEvent->getAuthor() === $this) {
                $createdEvent->setAuthor(null);
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

    /**
     * @return Collection|EventUser[]
     */
    public function getUserEvents(): Collection
    {
        return $this->userEvents;
    }

    public function addUserEvent(EventUser $userEvent): self
    {
        if (!$this->userEvents->contains($userEvent)) {
            $this->userEvents[] = $userEvent;
            $userEvent->setUser($this);
        }

        return $this;
    }

    public function removeUserEvent(EventUser $userEvent): self
    {
        if ($this->userEvents->contains($userEvent)) {
            $this->userEvents->removeElement($userEvent);
            // set the owning side to null (unless already changed)
            if ($userEvent->getUser() === $this) {
                $userEvent->setUser(null);
            }
        }

        return $this;
    }
}
