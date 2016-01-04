<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Contributors
 *
 * @ORM\Table(name="contributors", uniqueConstraints={@ORM\UniqueConstraint(name="email_UNIQUE", columns={"email"}), @ORM\UniqueConstraint(name="username_UNIQUE", columns={"username"})})
 * @ORM\Entity
 */
class Contributors
{
    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=80, nullable=false)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=80, nullable=false)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", length=16777215, nullable=true)
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(name="link_to_profile", type="string", length=80, nullable=true)
     */
    private $linkToProfile;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="inscription_date", type="datetime", nullable=true)
     */
    private $inscriptionDate;

    /**
     * @var string
     *
     * @ORM\Column(name="username", type="string", length=45, nullable=false)
     */
    private $username;

    /**
     * @var string
     *
     * @ORM\Column(name="password", type="string", length=128, nullable=false)
     */
    private $password;

    /**
     * @var string
     *
     * @ORM\Column(name="security_token", type="string", length=128, nullable=true)
     */
    private $securityToken;

    /**
     * @var boolean
     *
     * @ORM\Column(name="active", type="boolean", nullable=false)
     */
    private $active = '1';

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;



    /**
     * Set name
     *
     * @param string $name
     *
     * @return Contributors
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
     * Set email
     *
     * @param string $email
     *
     * @return Contributors
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Contributors
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set linkToProfile
     *
     * @param string $linkToProfile
     *
     * @return Contributors
     */
    public function setLinkToProfile($linkToProfile)
    {
        $this->linkToProfile = $linkToProfile;

        return $this;
    }

    /**
     * Get linkToProfile
     *
     * @return string
     */
    public function getLinkToProfile()
    {
        return $this->linkToProfile;
    }

    /**
     * Set inscriptionDate
     *
     * @param \DateTime $inscriptionDate
     *
     * @return Contributors
     */
    public function setInscriptionDate($inscriptionDate)
    {
        $this->inscriptionDate = $inscriptionDate;

        return $this;
    }

    /**
     * Get inscriptionDate
     *
     * @return \DateTime
     */
    public function getInscriptionDate()
    {
        return $this->inscriptionDate;
    }

    /**
     * Set username
     *
     * @param string $username
     *
     * @return Contributors
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Get username
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set password
     *
     * @param string $password
     *
     * @return Contributors
     */
    public function setPassword($password)
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Get password
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Set securityToken
     *
     * @param string $securityToken
     *
     * @return Contributors
     */
    public function setSecurityToken($securityToken)
    {
        $this->securityToken = $securityToken;

        return $this;
    }

    /**
     * Get securityToken
     *
     * @return string
     */
    public function getSecurityToken()
    {
        return $this->securityToken;
    }

    /**
     * Set active
     *
     * @param boolean $active
     *
     * @return Contributors
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active
     *
     * @return boolean
     */
    public function getActive()
    {
        return $this->active;
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
}
