<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\User as BaseUser;
use Captcha\Bundle\CaptchaBundle\Validator\Constraints as CaptchaAssert;


/**
 * Contributors
 *
 * @ORM\Table(name="contributors", uniqueConstraints={@ORM\UniqueConstraint(name="username_UNIQUE", columns={"username"})})
 * @ORM\Entity
 */
class Contributors extends BaseUser
{
    /**
     * @CaptchaAssert\ValidCaptcha(
     *      message = "CAPTCHA validation failed, try again."
     * )
     */
    protected $captchaCode;
    
    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=80, nullable=true)
     */
    private $name;

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
    protected $id;

    public function getCaptchaCode()
    {
      return $this->captchaCode;
    }
  
    public function setCaptchaCode($captchaCode)
    {
      $this->captchaCode = $captchaCode;
    }

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
     * Set salt
     *
     * @param string $salt
     *
     * @return Contributors
     */
    public function setSalt($salt)
    {
        $this->salt = $salt;

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
