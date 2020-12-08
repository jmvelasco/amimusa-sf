<?php

namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class ExampleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('captchaCode', 'captcha', array(
                'captchaConfig' => 'ExampleCaptcha',
                'label' => 'Retype the characters from the picture'
            ))
            ->add('submit', 'submit')
        ;
    }

    public function getName()
    {
        return 'basic';
    }
}
