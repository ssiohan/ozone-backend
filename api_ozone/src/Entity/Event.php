<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EventRepository")
 */
class Event
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $title;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $typeEvent;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $updatedAt;

    /**
     * @ORM\Column(type="datetime")
     */
    private $dateEvent;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $status;

    /**
     * @ORM\Column(type="smallint")
     */
    private $painfulness;

    /**
     * @ORM\Column(type="smallint")
     */
    private $duration;

    /**
     * @ORM\Column(type="smallint")
     */
    private $impactSocietal;

    /**
     * @ORM\Column(type="smallint")
     */
    private $impactEnvironmental;

    /**
     * @ORM\Column(type="smallint")
     */
    private $userMin;

    /**
     * @ORM\Column(type="smallint")
     */
    private $userMax;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     */
    private $bonus;

    /**
     * @ORM\Column(type="string", length=150, nullable=true)
     */
    private $adress;

    /**
     * @ORM\Column(type="string", length=20)
     */
    private $latitude;

    /**
     * @ORM\Column(type="string", length=20)
     */
    private $longitude;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="createdEvents")
     * @ORM\JoinColumn(nullable=false)
     */
    private $author;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\EventUser", mappedBy="event", orphanRemoval=true)
     */
    private $eventUsers;

    public function __construct()
    {
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
        return $this->typeEvent;
    }

    public function setTypeEvent(string $typeEvent): self
    {
        $this->typeEvent = $typeEvent;

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

    public function getDateEvent(): ?\DateTimeInterface
    {
        return $this->dateEvent;
    }

    public function setDateEvent(\DateTimeInterface $dateEvent): self
    {
        $this->dateEvent = $dateEvent;

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

    public function getImpactSocietal(): ?int
    {
        return $this->impactSocietal;
    }

    public function setImpactSocietal(int $impactSocietal): self
    {
        $this->impactSocietal = $impactSocietal;

        return $this;
    }

    public function getImpactEnvironmental(): ?int
    {
        return $this->impactEnvironmental;
    }

    public function setImpactEnvironmental(int $impactEnvironmental): self
    {
        $this->impactEnvironmental = $impactEnvironmental;

        return $this;
    }

    public function getUserMin(): ?int
    {
        return $this->userMin;
    }

    public function setUserMin(int $userMin): self
    {
        $this->userMin = $userMin;

        return $this;
    }

    public function getUserMax(): ?int
    {
        return $this->userMax;
    }

    public function setUserMax(int $userMax): self
    {
        $this->userMax = $userMax;

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

    public function getAuthor(): ?User
    {
        return $this->author;
    }

    public function setAuthor(?User $author): self
    {
        $this->author = $author;

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
