<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EventRepository")
 */
class Event
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @Groups({"users_list", "events_list"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"users_list", "events_list"})
     */
    private $title;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"users_list", "events_list"})
     */
    private $type_event;

    /**
     * @ORM\Column(type="text")
     * @Groups({"users_list", "events_list"})
     */
    private $description;

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
     * @ORM\Column(type="datetime")
     * @Groups({"users_list", "events_list"})
     */
    private $date_event;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"users_list", "events_list"})
     */
    private $status;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $painfulness;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $duration;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $societal_impact;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $environmental_impact;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $user_min;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $user_max;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $bonus;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $adress;

    /**
     * @ORM\Column(type="string")
     * @Groups({"users_list", "events_list"})
     */
    private $latitude;

    /**
     * @ORM\Column(type="string")
     * @Groups({"users_list", "events_list"})
     */
    private $longitude;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="events")
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"events_list"})
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\EventUser", mappedBy="event", orphanRemoval=true)
     * @Groups("events_list")
     */
    private $eventUsers;

    public function __construct()
    {
        $this->created_at = new \DateTime;
        $this->status = "Planifié";
        $this->eventUsers = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getTypeEvent(): ?string
    {
        return $this->type_event;
    }

    public function setTypeEvent(string $type_event): self
    {
        $this->type_event = $type_event;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

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

    public function getDateEvent(): ?\DateTimeInterface
    {
        return $this->date_event;
    }

    public function setDateEvent(\DateTimeInterface $date_event): self
    {
        $this->date_event = $date_event;

        return $this;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(string $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function getPainfulness(): ?int
    {
        return $this->painfulness;
    }

    public function setPainfulness(int $painfulness): self
    {
        $this->painfulness = $painfulness;

        return $this;
    }

    public function getDuration(): ?int
    {
        return $this->duration;
    }

    public function setDuration(int $duration): self
    {
        $this->duration = $duration;

        return $this;
    }

    public function getSocietalImpact(): ?int
    {
        return $this->societal_impact;
    }

    public function setSocietalImpact(int $societal_impact): self
    {
        $this->societal_impact = $societal_impact;

        return $this;
    }

    public function getEnvironmentalImpact(): ?int
    {
        return $this->environmental_impact;
    }

    public function setEnvironmentalImpact(int $environmental_impact): self
    {
        $this->environmental_impact = $environmental_impact;

        return $this;
    }

    public function getUserMin(): ?int
    {
        return $this->user_min;
    }

    public function setUserMin(int $user_min): self
    {
        $this->user_min = $user_min;

        return $this;
    }

    public function getUserMax(): ?int
    {
        return $this->user_max;
    }

    public function setUserMax(int $user_max): self
    {
        $this->user_max = $user_max;

        return $this;
    }

    public function getBonus(): ?int
    {
        return $this->bonus;
    }

    public function setBonus(?int $bonus): self
    {
        $this->bonus = $bonus;

        return $this;
    }

    public function getAdress(): ?string
    {
        return $this->adress;
    }

    public function setAdress(?string $adress): self
    {
        $this->adress = $adress;

        return $this;
    }

    public function getLatitude(): ?string
    {
        return $this->latitude;
    }

    public function setLatitude(string $latitude): self
    {
        $this->latitude = $latitude;

        return $this;
    }

    public function getLongitude(): ?string
    {
        return $this->longitude;
    }

    public function setLongitude(string $longitude): self
    {
        $this->longitude = $longitude;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function getUserId(): ?User
    {
        return $this->user;
    }

    public function setUserId(?User $user): self
    {
        $this->user = $user;

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
            $eventUser->setEvent($this);
        }

        return $this;
    }

    public function removeEventUser(EventUser $eventUser): self
    {
        if ($this->eventUsers->contains($eventUser)) {
            $this->eventUsers->removeElement($eventUser);
            // set the owning side to null (unless already changed)
            if ($eventUser->getEvent() === $this) {
                $eventUser->setEvent(null);
            }
        }

        return $this;
    }
}
