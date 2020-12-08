<?php

namespace App\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
// Importing the CaptchaType class
use Captcha\Bundle\CaptchaBundle\Form\Type\CaptchaType;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class)
            ->add('email', EmailType::class)
            ->add('subject', TextType::class)
            ->add('message', TextareaType::class)
            ->add('captchaCode', CaptchaType::class, array(
                'captchaConfig' => 'ContactCaptcha',
                'label' => 'Retype the characters from the picture'
            ))
            ->add('submit', SubmitType::class)
        ;
    }
}
