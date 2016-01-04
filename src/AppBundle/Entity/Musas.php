<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Musas
 *
 * @ORM\Table(name="musas", uniqueConstraints={@ORM\UniqueConstraint(name="name_UNIQUE", columns={"name"})})
 * @ORM\Entity
 */
class Musas
{
    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=45, nullable=true)
     */
    private $name;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Publications", mappedBy="idMusa")
     */
    private $idPublication;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idPublication = new \Doctrine\Common\Collections\ArrayCollection();
    }


    /**
     * Set name
     *
     * @param string $name
     *
     * @return Musas
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Add idPublication
     *
     * @param \AppBundle\Entity\Publications $idPublication
     *
     * @return Musas
     */
    public function addIdPublication(\AppBundle\Entity\Publications $idPublication)
    {
        $this->idPublication[] = $idPublication;

        return $this;
    }

    /**
     * Remove idPublication
     *
     * @param \AppBundle\Entity\Publications $idPublication
     */
    public function removeIdPublication(\AppBundle\Entity\Publications $idPublication)
    {
        $this->idPublication->removeElement($idPublication);
    }

    /**
     * Get idPublication
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getIdPublication()
    {
        return $this->idPublication;
    }
}
