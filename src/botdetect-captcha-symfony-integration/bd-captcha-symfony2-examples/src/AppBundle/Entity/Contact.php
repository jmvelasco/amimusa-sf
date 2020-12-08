<?php

namespace AppBundle\Entity;

use Symfony\Component\Validator\Constraints as Assert;
use Captcha\Bundle\CaptchaBundle\Validator\Constraints as CaptchaAssert;

class Contact
{
    /**
     * @Assert\Length(
     *      min = 2,
     *      max = 10,
     *      minMessage = "Your name must be at least {{ limit }} characters long",
     *      maxMessage = "Your name cannot be longer than {{ limit }} characters"
     * )
     */
    protected $name;

    /**
     * @Assert\Email(
     *      message = "The email '{{ value }}' is not a valid email.",
     * )
     */
    protected $email;

    /**
     * @Assert\Length(
     *      min = 1,
     *      max = 50,
     *      minMessage = "Your subject must be at least {{ limit }} characters long",
     *      maxMessage = "Your subject cannot be longer than {{ limit }} characters"
     * )
     */
    protected $subject;

    /**
     * @Assert\Length(
     *      min = 2,
     *      max = 255,
     *      minMessage = "Your message must be at least {{ limit }} characters long",
     *      maxMessage = "Your message cannot be longer than {{ limit }} characters"
     * )
     */
    protected $message;

    /**
     * @CaptchaAssert\ValidCaptcha(
     *      message = "CAPTCHA validation failed, try again."
     * )
     */
    protected $captchaCode;

    public function getCaptchaCode()
    {
        return $this->captchaCode;
    }

    public function setCaptchaCode($captchaCode)
    {
        $this->captchaCode = $captchaCode;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email)
    {
        $this->email = $email;
    }

    public function getSubject()
    {
        return $this->subject;
    }

    public function setSubject($subject)
    {
        $this->subject = $subject;
    }

    public function getMessage()
    {
        return $this->message;
    }

    public function setMessage($message)
    {
        $this->message = $message;
    }
}
