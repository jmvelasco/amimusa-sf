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
        $user = $this->getUser();

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
            'publications' => $publications
        ));
    }
}
