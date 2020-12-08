<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Contact;
use AppBundle\Form\Type\ContactType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ContactController extends Controller
{
    /**
     * @Route("/contact")
     */
    public function getForm(Request $request)
    {
        // create contact form
        $contactForm = $this->createForm(new ContactType(), new Contact());

        // initially, the message shown to the visitor is empty
        $message = '';

        $contactForm ->handleRequest($request);
        if ($contactForm->isValid()) {
            // Captcha validation passed
            // TODO: send email
            $message = 'Your message was sent successfully.';
        }

        return $this->render('AppBundle:Contact:contact.html.twig', array(
            'form' => $contactForm->createView(),
            'message' => $message
        ));
    }
}
