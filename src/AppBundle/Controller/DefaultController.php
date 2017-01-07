<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Musas;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\FormError;
use Symfony\Component\HttpFoundation\Response;

use Doctrine\ORM\Query\ResultSetMapping;

use AppBundle\Entity\Publications;
use AppBundle\Entity\Writtings;
use AppBundle\Entity\Contributors;
use AppBundle\Entity\Likes;
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
        $allMusas = $repository->findAll();
        $musas = array();

        // Filter by musas with publications
        foreach ($allMusas as $musa) {
            if (count($musa->getIdPublication()) > 0) {
                $musas[] = $musa;
            }
        }

        return $this->render('default/index.html.twig', array(
            'musas' => $musas
        ));
    }

    /**
     * @Route("/musas/{idMusa}", name="show-musas")
     */
    public function showAction($idMusa, Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $repository = $em->getRepository('AppBundle:Musas');
        $publicationsMusas = $repository->find($idMusa);

        $LikesRepository = $em->getRepository('AppBundle:Likes');
        $likes = array();
        $publications = $publicationsMusas->getIdPublication()->getValues();

        if (count($publications) > 1) {

            foreach ($publicationsMusas->getIdPublication()->getValues() as $k => $v) {
                $publicationId = $v->getId();
                $likes[$publicationId] = count($LikesRepository->findByIdPublication($publicationId));
            }

            return $this->render('default/show.html.twig', array(
                'publications'  => $publicationsMusas->getIdPublication()->getValues(),
                'likes'         => $likes,
                'musa'          => $publicationsMusas->getName(),
                'returnPath'    => $request->headers->get('referer')
            ));

        } else {
            $idPublication = $publications[0]->getId();
            $response = $this->forward('AppBundle:Default:showPublication', array(
                'idPublication'  => $idPublication,
            ));

            return $response;
        }


    }


    /**
     * @Route("/publication/{idPublication}", name="show-publication")
     */
    public function showPublicationAction($idPublication, Request $request)
    {
        $repository = $this->getDoctrine()->getRepository('AppBundle:Publications');
        $publication = current($repository->findById($idPublication));

        $referer = $request->headers->get('referer');

        $returnPath = (strpos($referer, 'facebook') !== false) ? $this->generateUrl('homepage') : $referer;

        return $this->render('default/showpublication.html.twig', array(
            //'publications' => $publication,
            'id' => $publication->getId(),
            'title' => $publication->getIdWritting()->getTitle(),
            'body' => $publication->getIdWritting()->getBody(),
            'contributorId' => $publication->getIdContributor()->getId(),
            'username' => $publication->getIdContributor()->getUsername(),
            'musa' => current($publication->getIdMusa()->getValues())->getName(),
            'returnPath' => $returnPath
        ));

    }

    /**
     * @Route("/like/{idPublication}", name="like-publication")
     */
    public function likePublicationAction($idPublication, Request $request)
    {
        $like = new Likes();
        $like->setIdPublication($idPublication);
        $date = new \DateTime('now');

        $like->setDate($date->getTimestamp());
        $like->setReferer($request->getClientIp());

        $em = $this->getDoctrine()->getManager();
        $em->getRepository('AppBundle:Likes');
        $em->persist($like);
        $em->flush();

        return new Response('
            <body bgcolor="#2d2d2d">
            <p style="color:#d2d2d2;font-family: Arial;text-align:center;font-size:2em;">¡Gracias!</p>
            </body>
        ');

    }


    /**
     * @Route("/new", name="new-publication")
     */
    public function newAction(Request $request)
    {

        $isAnonymous = $request->query->get('anonymous');
        if ( !is_null($this->getUser()) || (('true' == $isAnonymous)) || $request->isMethod('POST')) {

            $em = $this->getDoctrine()->getManager();
            $musasRepository = $em->getRepository('AppBundle:Musas');
            $musas = $musasRepository->findAll();

            $form = $this->createFormBuilder()
                ->setAction($this->generateUrl('new-publication'))
                ->add('title', 'text', array('label' => 'Título'))
                ->add('body', 'textarea', array('label' => 'Escrito'))
                //->add('musas', 'textarea', array('label' => '¿Quién es tu musa?','required' => false))
                ->add('musas', 'text', array('label' => '¿Quién es tu musa?','required' => false))
                ->add('musasid_list', 'hidden')
                ->add('save', 'submit', array('label' => 'Guardar'))
                ->getForm();

            if ($request->isMethod('POST')) {
                $form->handleRequest($request);
                if ( $form->isValid() ) {
                    $writting = new Writtings();
                    $writtingData = $form->getData();

                    $writting->setTitle($writtingData['title']);
                    $writting->setBody(str_replace("\n", "<br>", $writtingData['body']));

                    if (!empty($writtingData['musasid_list'])) {
                        $publicationTypeRepository = $em->getRepository('AppBundle:PublicationsType');
                        $publicationType = $publicationTypeRepository->find(1);
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
                        if (null != $this->getUser()) {
                            $contributor = $contributorsRepository->find($this->getUser()->getId());
                        } else {
                            // Create anonymous user
                            $userManager = $this->get('fos_user.user_manager');
                            $user = $userManager->createUser();
                            $user->setEnabled(false);

                            $length = 8;
                            $token = bin2hex(random_bytes($length));
                            $ip = $this->container->get('request')->getClientIp();
                            $username = 'anonymous-' . $token . '@' . $ip;

                            $user->setUsername($username);
                            $user->setEmail($username);
                            $user->setSalt('randomString-'.$username);
                            $user->setPassword('randomPassword-'.$username);
                            $user->setLastLogin(new \DateTime());

                            $userManager->updateUser($user);

                            $contributor = $contributorsRepository->find($user->getId());
                        }
                        

                        $publication = new Publications();
                        $publication->setIdContributor($contributor);
                        $publication->setIdState($state);
                        $publication->setIdWritting($writting);

                        $musasId = explode(",", $writtingData['musasid_list']);
                        foreach($musasId as $musaId) {
                            if (!empty($musaId)) {
                                $musa = $musasRepository->find($musaId);
                                $publication->addIdMusa($musa);
                            }

                        }
                        $em->persist($publication);
                        $em->flush();

                        return $this->redirectToRoute('homepage');
                    } else {
                        $form->get('musas')->addError(new FormError('Debes indicar al menos una musa para poder registrar tu inspiración.'));
                        return $this->render('default/new.html.twig',
                            array(
                                'formMobile' => $form->createView(),
                                'formDesktop' => $form->createView(),
                                'musas' => $musas,
                            ));
                    }


                }
            } else {
                return $this->render('default/new.html.twig',
                    array(
                        'formMobile' => $form->createView(),
                        'formDesktop' => $form->createView(),
                        'musas' => $musas,
                    ));
            }
        } else {
            return $this->render('default/anonymous.html.twig');
        }        

    }

    /**
     * @Route("/edit/{idPublication}/{idMusa}", name="edit-publication")
     */
    public function editAction($idPublication, $idMusa, Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $musasRepository = $em->getRepository('AppBundle:Musas');
        $musas = $musasRepository->findAll();

        $publicationRepository = $em->getRepository('AppBundle:Publications');
        $publication = $publicationRepository->find($idPublication);

        $form = $this->createFormBuilder()
            ->setAction($this->generateUrl('edit-publication', array( 'idPublication' => $idPublication, 'idMusa' => $idMusa)))
            ->add('title', 'text', array('label' => 'Título'))
            ->add('body', 'textarea', array('label' => 'Escrito'))
            //->add('musas', 'textarea', array('label' => '¿Quién es tu musa?','required' => false))
            ->add('musas', 'text', array('label' => '¿Quién es tu musa?','required' => false))
            ->add('musasid_list', 'hidden')
            ->add('publicationid', 'hidden')
            ->add('save', 'submit', array('label' => 'Guardar'))
            ->getForm();

        $writting = $publication->getIdWritting();

        $form->get('title')->setData($writting->getTitle());
        $form->get('body')->setData(preg_replace("/<br>/", "\n", $writting->getBody()));

        $musasListArr = array();
        foreach($publication->getIdMusa() as $m) {
            array_push($musasListArr, $m->getId());
        };
        $musasList = implode(",", $musasListArr);
        $form->get('musasid_list')->setData($musasList);
        $form->get('publicationid')->setData($idPublication);

        if ($request->isMethod('POST')) {
            $form->handleRequest($request);
            $writtingData = $form->getData();

            $writting->setTitle($writtingData['title']);
            $writting->setBody(str_replace("\n", "<br>", $writtingData['body']));

            foreach($publication->getIdMusa() as $musas) {
                $publication->removeIdMusa($musas);
            }
            $musasId = explode(",", $writtingData['musasid_list']);
            foreach($musasId as $musaId) {
                $musa = $musasRepository->find($musaId);
                $publication->addIdMusa($musa);
            }
            $date = new \DateTime();
            $writting->setModificationDate($date);

            $em->persist($publication);
            $em->flush();

            return $this->redirectToRoute('fos_user_profile_show', array('idContributor' => $this->getUser()->getId()));
        }

        return $this->render('default/edit.html.twig', array(
            'formMobile' => $form->createView(),
            'formDesktop' => $form->createView(),
            'musas' => $musas,
            'returnPath' => $request->headers->get('referer')
        ));

    }

    /**
     * @Route("/delete/{idPublication}/{idMusa}", name="delete-publication")
     */
    public function deleteAction($idPublication, $idMusa, Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $publicationRepository = $em->getRepository('AppBundle:Publications');
        $publication = $publicationRepository->find($idPublication);
        $em->remove($publication);
        $em->flush();

        return $this->redirectToRoute('fos_user_profile_show', array('idContributor' => $this->getUser()->getId()));
    }

    /**
     * @Route("/search-musa/", name="search-musa")
     */
    public function searchMusaAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $musasRepository = $em->getRepository('AppBundle:Musas');
        $musas = $musasRepository->findAll();

        $musaToSearch = $request->request->get('name', 'n/a');

        foreach($musas as $musaObj) {
            if (str_replace("\n","",$musaObj->getName()) == $musaToSearch) {
                return new Response($musaObj->getId());
            }
        }

        $musa = new Musas();
        $musa->setName($musaToSearch);
        $em->persist($musa);
        $em->flush();

        return new Response($musa->getId());
    }
}
