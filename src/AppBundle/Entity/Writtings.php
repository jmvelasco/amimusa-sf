<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Writtings
 *
 * @ORM\Table(name="writtings", indexes={@ORM\Index(name="publication_type_FK", columns={"publication_type"})})
 * @ORM\Entity
 */
class Writtings
{
    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=80, nullable=false)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="body", type="text", nullable=true)
     */
    private $body;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="creation_date", type="datetime", nullable=true)
     */
    private $creationDate;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="modification_date", type="datetime", nullable=true)
     */
    private $modificationDate;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \AppBundle\Entity\PublicationsType
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\PublicationsType")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="publication_type", referencedColumnName="id")
     * })
     */
    private $publicationType;



    /**
     * Set title
     *
     * @param string $title
     *
     * @return Writtings
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set body
     *
     * @param string $body
     *
     * @return Writtings
     */
    public function setBody($body)
    {
        $this->body = $body;

        return $this;
    }

    /**
     * Get body
     *
     * @return string
     */
    public function getBody()
    {
        return $this->body;
    }

    /**
     * Set creationDate
     *
     * @param \DateTime $creationDate
     *
     * @return Writtings
     */
    public function setCreationDate($creationDate)
    {
        $this->creationDate = $creationDate;

        return $this;
    }

    /**
     * Get creationDate
     *
     * @return \DateTime
     */
    public function getCreationDate()
    {
        return $this->creationDate;
    }

    /**
     * Set modificationDate
     *
     * @param \DateTime $modificationDate
     *
     * @return Writtings
     */
    public function setModificationDate($modificationDate)
    {
        $this->modificationDate = $modificationDate;

        return $this;
    }

    /**
     * Get modificationDate
     *
     * @return \DateTime
     */
    public function getModificationDate()
    {
        return $this->modificationDate;
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
     * Set publicationType
     *
     * @param \AppBundle\Entity\PublicationsType $publicationType
     *
     * @return Writtings
     */
    public function setPublicationType(\AppBundle\Entity\PublicationsType $publicationType = null)
    {
        $this->publicationType = $publicationType;

        return $this;
    }

    /**
     * Get publicationType
     *
     * @return \AppBundle\Entity\PublicationsType
     */
    public function getPublicationType()
    {
        return $this->publicationType;
    }
}
