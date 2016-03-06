<?php

namespace AppBundle\Controller;

use FOS\UserBundle\Controller\ProfileController as BaseController;
use FOS\UserBundle\Model\UserInterface;

use Symfony\Component\Security\Core\Exception\AccessDeniedException;



class ProfileController extends BaseController
{
    /**
     * Show the user
     */
    public function showAction()
    {
        $userId = $this->getRequest()->query->get('idContributor');


        if (is_null($userId) || (!is_null($this->getUser())) && ($userId == $this->getUser()->getId()) ) {
            // Load de user logged user
            $user = $this->getUser();
            $editPermision = true;
        } else {
            // Load de user with the given userId
            $em = $this->getDoctrine()->getManager();
            $contributorsRepository = $em->getRepository('AppBundle:Contributors');
            $user = $contributorsRepository->find($userId);
            $editPermision = false;
        }

        if (is_null($user)) {
            return $this->redirect('/');
        }

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        }

        $em = $this->getDoctrine()->getManager();
        $publicationRepository = $em->getRepository('AppBundle:Publications');

        $query = $publicationRepository->createQueryBuilder('p')
            ->where('p.idContributor = :idContributor')
            ->setParameter('idContributor', $user->getId())
            ->getQuery();

        $publications = $query->getResult();
        //var_dump($publications);exit;

        return $this->render('FOSUserBundle:Profile:show.html.twig', array(
            'user' => $user,
            'publications' => $publications,
            'editPermision' => $editPermision
        ));
    }
}
