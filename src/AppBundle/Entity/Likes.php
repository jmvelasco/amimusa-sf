<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Likes
 *
 * @ORM\Table(name="likes", indexes={@ORM\Index(name="publication_IDX", columns={"id_publication"})})
 * @ORM\Entity
 */
class Likes
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id_publication", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idPublication;

    /**
     * @var integer
     *
     * @ORM\Column(name="date", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $date;

    /**
     * @var string
     *
     * @ORM\Column(name="referer", type="string", length=255)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $referer;


    /**
     * Set idPublication
     *
     * @param integer $idPublication
     *
     * @return Likes
     */
    public function setIdPublication($idPublication)
    {
        $this->idPublication = $idPublication;

        return $this;
    }

    /**
     * Get idPublication
     *
     * @return integer
     */
    public function getIdPublication()
    {
        return $this->idPublication;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return Likes
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set referer
     *
     * @param string $referer
     *
     * @return Likes
     */
    public function setReferer($referer)
    {
        $this->referer = $referer;

        return $this;
    }

    /**
     * Get referer
     *
     * @return string
     */
    public function getReferer()
    {
        return $this->referer;
    }

}
