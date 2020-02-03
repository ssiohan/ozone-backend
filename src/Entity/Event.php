<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\Serializer\Annotation\Groups;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EventRepository")
 * @Vich\Uploadable
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
     * @ORM\Column(type="string", length=50)
     * @Groups({"users_list", "events_list"})
     */
    private $typeEvent;

    /**
     * @ORM\Column(type="string", length=100)
     * @Groups({"users_list", "events_list"})
     */
    private $title;

    /**
     * @ORM\Column(type="text")
     * @Groups({"users_list", "events_list"})
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"users_list", "events_list"})
     */
    private $status;

    /**
     * @ORM\Column(type="datetime")
     * @Groups({"users_list", "events_list"})
     */
    private $dateEvent;

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
    private $impactSocietal;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $impactEnvironmental;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $userMin;

    /**
     * @ORM\Column(type="smallint")
     * @Groups({"users_list", "events_list"})
     */
    private $userMax;

    /**
     * @ORM\Column(type="string", length=50)
     * @Groups({"users_list", "events_list"})
     */
    private $city;

    /**
     * @ORM\Column(type="string", length=20)
     * @Groups({"users_list", "events_list"})
     */
    private $latitude;

    /**
     * @ORM\Column(type="string", length=20)
     * @Groups({"users_list", "events_list"})
     */
    private $longitude;

    /**
     * @ORM\Column(type="string", length=150, nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $adress;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Groups({"events_list"})
     */
    private $image;

    /**
     * @Vich\UploadableField(mapping="images", fileNameProperty="image")
     * @var File|null
     */
    private $imageFile;

    /**
     * @ORM\Column(type="smallint", nullable=true)
     * @Groups({"users_list", "events_list"})
     */
    private $bonus;

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
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="createdEvents")
     * @ORM\JoinColumn(nullable=false)
     * @Groups({"events_list"})
     */
    private $author;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\EventUser", mappedBy="event", orphanRemoval=true)
     * @Groups({"events_list"})
     */
    private $eventUsers;

    public function __construct()
    {
        $this->eventUsers = new ArrayCollection();

        $this->createdAt = new \DateTime;
        $this->status = "Planifié";
    }

    public function __toString()
    {
        return (string) $this->getTitle();
    }

    /**
     * {@inheritdoc}
     */
    public function serialize(): string
    {
        return serialize([$this->image]);
    }

    /**
     * {@inheritdoc}
     */
    public function unserialize($serialized): void
    {
        [$this->image] = unserialize($serialized, ['allowed_classes' => false]);
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

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(string $city): self
    {
        $this->city = $city;

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

    public function setImageFile(File $image = null)
    {
        $this->imageFile = $image;

        // VERY IMPORTANT:
        // It is required that at least one field changes if you are using Doctrine,
        // otherwise the event listeners won't be called and the file is lost
        if ($image) {
            // if 'updatedAt' is not defined in your entity, use another property
            $this->updatedAt = new \DateTime;
        }
    }

    public function getImageFile()
    {
        return $this->imageFile;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

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
