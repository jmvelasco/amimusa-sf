<?php

namespace App\Controller;

use App\Entity\Contact;
use App\Form\Type\ContactType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact")
     */
    public function getForm(Request $request)
    {
        // create contact form
        $form = $this->createForm(ContactType::class, new Contact());

        // initially, the message shown to the visitor is empty
        $message = '';

        $form ->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            // Captcha validation passed
            // TODO: send email
            $message = 'Your message was sent successfully.';
        }

        return $this->render('contact/index.html.twig', array(
            'form' => $form->createView(),
            'message' => $message
        ));
    }
}
