<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Publications
 *
 * @ORM\Table(name="publications", indexes={@ORM\Index(name="contributor_FK", columns={"id_contributor"}), @ORM\Index(name="state_FK", columns={"id_state"}), @ORM\Index(name="writting_FK", columns={"id_writting"})})
 * @ORM\Entity
 */
class Publications
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \AppBundle\Entity\Writtings
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Writtings")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_writting", referencedColumnName="id")
     * })
     */
    private $idWritting;

    /**
     * @var \AppBundle\Entity\States
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\States")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_state", referencedColumnName="id")
     * })
     */
    private $idState;

    /**
     * @var \AppBundle\Entity\Contributors
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Contributors")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_contributor", referencedColumnName="id")
     * })
     */
    private $idContributor;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Musas", inversedBy="idPublication")
     * @ORM\JoinTable(name="publications_musas",
     *   joinColumns={
     *     @ORM\JoinColumn(name="id_publication", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="id_musa", referencedColumnName="id")
     *   }
     * )
     */
    private $idMusa;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idMusa = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set idWritting
     *
     * @param \AppBundle\Entity\Writtings $idWritting
     *
     * @return Publications
     */
    public function setIdWritting(\AppBundle\Entity\Writtings $idWritting = null)
    {
        $this->idWritting = $idWritting;

        return $this;
    }

    /**
     * Get idWritting
     *
     * @return \AppBundle\Entity\Writtings
     */
    public function getIdWritting()
    {
        return $this->idWritting;
    }

    /**
     * Set idState
     *
     * @param \AppBundle\Entity\States $idState
     *
     * @return Publications
     */
    public function setIdState(\AppBundle\Entity\States $idState = null)
    {
        $this->idState = $idState;

        return $this;
    }

    /**
     * Get idState
     *
     * @return \AppBundle\Entity\States
     */
    public function getIdState()
    {
        return $this->idState;
    }

    /**
     * Set idContributor
     *
     * @param \AppBundle\Entity\Contributors $idContributor
     *
     * @return Publications
     */
    public function setIdContributor(\AppBundle\Entity\Contributors $idContributor = null)
    {
        $this->idContributor = $idContributor;

        return $this;
    }

    /**
     * Get idContributor
     *
     * @return \AppBundle\Entity\Contributors
     */
    public function getIdContributor()
    {
        return $this->idContributor;
    }

    /**
     * Add idMusa
     *
     * @param \AppBundle\Entity\Musas $idMusa
     *
     * @return Publications
     */
    public function addIdMusa(\AppBundle\Entity\Musas $idMusa)
    {
        $this->idMusa[] = $idMusa;

        return $this;
    }

    /**
     * Remove idMusa
     *
     * @param \AppBundle\Entity\Musas $idMusa
     */
    public function removeIdMusa(\AppBundle\Entity\Musas $idMusa)
    {
        $this->idMusa->removeElement($idMusa);
    }

    /**
     * Get idMusa
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getIdMusa()
    {
        return $this->idMusa;
    }
}
