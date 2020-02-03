<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EventUserRepository")
 */
class EventUser
{

    /**
     * @ORM\Id()
     * @ORM\ManyToOne(targetEntity="App\Entity\Event", inversedBy="eventUsers")
     * @ORM\JoinColumn(nullable=false)
     * @Groups("users_list")
     */
    private $event;

    /**
     * @ORM\Id()
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="userEvents")
     * @ORM\JoinColumn(nullable=false)
     * @Groups("events_list")
     */
    private $user;

    /**
     * @ORM\Column(type="boolean")
     */
    private $attendance;

    public function __toString()
    {
        return (string) $this->getEvent() . ' => ' . $this->getUser();
    }

    public function getEvent(): ?Event
    {
        return $this->event;
    }

    public function setEvent(?Event $event): self
    {
        $this->event = $event;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function getAttendance(): ?bool
    {
        return $this->attendance;
    }

    public function setAttendance(bool $attendance): self
    {
        $this->attendance = $attendance;

        return $this;
    }
}
