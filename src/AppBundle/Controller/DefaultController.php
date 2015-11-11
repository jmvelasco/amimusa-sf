<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\FormError;

use AppBundle\Entity\Publications;
use AppBundle\Entity\Writtings;
use AppBundle\Entity\Contributors;
use AppBundle\Entity\States;
use AppBundle\Entity\PublicationsType;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $repository = $this->getDoctrine()->getRepository('AppBundle:Musas');
        $musas = $repository->findAll();

        return $this->render('default/index.html.twig', array(
            'musas' => $musas
        ));
    }

    /**
     * @Route("/musas/{idMusa}")
     */
    public function showAction($idMusa)
    {
        $repository = $this->getDoctrine()->getRepository('AppBundle:Musas');
        $publicationsMusas = $repository->find($idMusa);
        $publications = $publicationsMusas->getIdPublication()->getValues();

        return $this->render('default/show.html.twig', array(
            'publications' => $publications
        ));

    }

    /**
     * @Route("/new", name="nuevo")
     */
    public function newAction(Request $request)
    {

        $em = $this->getDoctrine()->getManager();
        $musasRepository = $em->getRepository('AppBundle:Musas');
        $musas = $musasRepository->findAll();

        $form = $this->createFormBuilder()
            ->setAction($this->generateUrl('nuevo'))
            ->add('title', 'text', array('label' => 'Título'))
            ->add('body', 'textarea', array('label' => 'Escrito'))
            ->add('musas', 'textarea', array('label' => 'Musas','required' => false))
            ->add('musasid_list', 'hidden')
            ->add('save', 'submit', array('label' => 'Guardar'))
            ->getForm();

        if ($request->isMethod('POST')) {
            $form->handleRequest($request);
            if ( $form->isValid() ) {
                // perform some action, such as saving the task to the database
                $writting = new Writtings();
                $writtingData = $form->getData();

                $writting->setTitle($writtingData['title']);
                $writting->setBody(str_replace("\n", "<br>", $writtingData['body']));

                if (!empty($writtingData['musasid_list'])) {
                    $publicationTypeRepository = $em->getRepository('AppBundle:PublicationsType');
                    $publicationType = $publicationTypeRepository->find(23);
                    $writting->setPublicationType($publicationType);

                    $date = new \DateTime();
                    $writting->setModificationDate($date);
                    $writting->setCreationDate($date);

                    $em->getRepository('AppBundle:Writtings');
                    $em->persist($writting);
                    $em->flush();

                    $statesRepository = $em->getRepository('AppBundle:States');
                    $state = $statesRepository->find(1);

                    $contributorsRepository = $em->getRepository('AppBundle:Contributors');
                    $contributor = $contributorsRepository->find(34);

                    $publication = new Publications();
                    $publication->setIdContributor($contributor);
                    $publication->setIdState($state);
                    $publication->setIdWritting($writting);

                    $musasId = explode(",", $writtingData['musasid_list']);
                    foreach($musasId as $musaId) {
                        $musa = $musasRepository->find($musaId);
                        $publication->addIdMusa($musa);
                    }
                    $em->persist($publication);
                    $em->flush();

                    return $this->redirectToRoute('homepage');
                } else {
                    $form->get('musas')->addError(new FormError('Debes indicar al menos una musa para poder registrar tu inspiración.'));
                    return $this->render('default/new.html.twig',
                        array(
                            'form' => $form->createView(),
                            'musas' => $musas,
                        ));
                }


            }
        } else {
            return $this->render('default/new.html.twig',
                array(
                    'form' => $form->createView(),
                    'musas' => $musas,
                ));
        }

    }
}
