<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Example;
use AppBundle\Form\Type\ExampleType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ExampleController extends Controller
{
    /**
     * @Route("/example")
     */
    public function getForm(Request $request)
    {
        // create example form
        $exampleForm = $this->createForm(new ExampleType(), new Example());

        // initially, the message shown to the visitor is empty
        $message = '';

        $exampleForm ->handleRequest($request);
        if ($exampleForm->isValid()) {
            // Captcha validation passed
            $message = 'CAPTCHA validation passed, human visitor confirmed!';
        }

        return $this->render('AppBundle:Example:example.html.twig', array(
            'form' => $exampleForm->createView(),
            'message' => $message
        ));
    }
}
