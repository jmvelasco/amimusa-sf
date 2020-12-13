<?php

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', 'text')
            ->add('email', 'email')
            ->add('subject', 'text')
            ->add('message', 'textarea')
            ->add('captchaCode', 'captcha', array(
                'captchaConfig' => 'ContactCaptcha',
                'label' => 'Retype the characters from the picture'
            ))
            ->add('submit', 'submit')
        ;
    }

    public function getName()
    {
        return 'contact';
    }
}
