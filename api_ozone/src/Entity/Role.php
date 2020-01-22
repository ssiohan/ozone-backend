<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\RoleRepository")
 */
class Role
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\UserRole", mappedBy="role", orphanRemoval=true)
     */
    private $roleUsers;

    public function __construct()
    {
        $this->roleUsers = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection|UserRole[]
     */
    public function getRoleUsers(): Collection
    {
        return $this->roleUsers;
    }

    public function addRoleUser(UserRole $roleUser): self
    {
        if (!$this->roleUsers->contains($roleUser)) {
            $this->roleUsers[] = $roleUser;
            $roleUser->setRole($this);
        }

        return $this;
    }

    public function removeRoleUser(UserRole $roleUser): self
    {
        if ($this->roleUsers->contains($roleUser)) {
            $this->roleUsers->removeElement($roleUser);
            // set the owning side to null (unless already changed)
            if ($roleUser->getRole() === $this) {
                $roleUser->setRole(null);
            }
        }

        return $this;
    }
}
