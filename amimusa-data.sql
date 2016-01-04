-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 03, 2016 at 02:50 PM
-- Server version: 5.5.44
-- PHP Version: 5.4.41-0+deb7u1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET foreign_key_checks = 0;


--
-- Database: `amimusa`
--

--
-- Dumping data for table `contributors`
--

-- INSERT INTO `contributors` (`id`, `name`, `email`, `description`, `link_to_profile`, `inscription_date`, `username`, `password`, `security_token`, `active`) VALUES
-- (0, 'anonimo', 'anonimo@server.net', NULL, NULL, '2015-11-11 23:02:49', '', '', NULL, 1),
-- (34, 'manou', 'amimusa@yahoo.es', 'Hace tiempo que deje de escribir porque decidí ser feliz, no quería mirar más a mis penunbras ...\r\nNo obstante aquí comparto algunos de los escritos que me sirvieron como deshago en muchas ocasiones.\r\n\r\nHe decidido cambiar el formato de http://amimusa.net/man.u/ y crear este espacio donde todos y todas podamos compartir nuestros momentos de inspiración, dando especialmente importancia precisamente a "eso" que nos inspira.\r\n\r\n¡Espero conocer todas tus musas!', 'https://www.facebook.com/jmanuel.velasco', '2015-06-25 20:48:30', 'amimusa', 'd8578edf8458ce06fbc5bb76a58c5ca4', NULL, 1),
-- (36, 'Óscar', 'oscar.gaeta@gmail.com', NULL, NULL, '2015-08-10 21:23:45', 'Óscar', 'c2f57cddc5cdedf77b7fa7d0c80b5f47', NULL, 1),
-- (46, 'Natalia', 'nataliamunevar@gmail.com', NULL, NULL, '2015-09-22 16:36:01', 'Natalia Muse', '3d08a58706613c0a448a4ebe8e0a89b3', NULL, 1),
-- (48, 'montserrat', 'gpasesores@outlook.es', NULL, NULL, '2015-12-05 21:05:30', 'montserrat', '5c0b24b86609dd62d15ebafb873cc555', NULL, 1);

--
-- Dumping data for table `contributors`
--

INSERT INTO `contributors` (`id`, `name`, `email`, `description`, `link_to_profile`, `inscription_date`, `username`, `password`, `security_token`, `active`, `username_canonical`, `email_canonical`, `enabled`, `salt`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, NULL, 'amimusamanou@gmail.com', NULL, NULL, NULL, 'manou', '$2y$13$sos1m4lcwdwco400kkkkkuwFYrDxdgpw.iR7ENcmG5SgnzpaI.aaK', NULL, 1, 'manou', 'amimusamanou@gmail.com', 1, 'sos1m4lcwdwco400kkkkk0gogw0c0c', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id_publication`, `date`, `referer`) VALUES
(66, '2015-09-15 15:41:27', '47.60.39.176'),
(75, '2015-09-15 15:43:46', '47.60.39.176'),
(76, '2015-09-15 15:45:10', '47.60.39.176'),
(79, '2015-09-15 15:47:02', '47.60.39.176'),
(83, '2015-09-15 15:49:00', '47.60.39.176'),
(43, '2015-09-15 15:50:31', '47.60.39.176'),
(60, '2015-09-15 16:25:44', '47.60.39.176'),
(59, '2015-09-15 16:26:24', '47.60.39.176'),
(54, '2015-09-15 16:30:19', '47.60.39.176'),
(46, '2015-09-16 08:27:03', '193.146.141.200'),
(86, '2015-09-16 08:33:56', '193.146.141.200'),
(81, '2015-09-16 08:34:49', '193.146.141.200'),
(82, '2015-09-16 08:34:53', '193.146.141.200'),
(67, '2015-09-16 08:36:07', '193.146.141.200'),
(55, '2015-09-16 08:37:32', '193.146.141.200'),
(51, '2015-09-16 08:38:48', '193.146.141.200'),
(48, '2015-09-16 17:39:28', '47.60.37.17'),
(70, '2015-09-22 16:33:34', '2.155.140.167'),
(82, '2015-09-22 16:34:24', '2.155.140.167'),
(67, '2015-09-28 18:22:13', '90.170.96.140'),
(54, '2015-11-12 20:40:36', '90.175.240.20'),
(90, '2015-12-30 20:26:18', '90.175.240.20');

--
-- Dumping data for table `musas`
--

INSERT INTO `musas` (`id`, `name`) VALUES
(182, 'amor'),
(197, 'ana'),
(193, 'angie'),
(195, 'crecimiento'),
(186, 'desengaño'),
(201, 'fanstasia'),
(199, 'luna'),
(222, 'momento'),
(194, 'muerte'),
(183, 'nostalgia'),
(196, 'padres'),
(220, 'prueba'),
(200, 'rabia'),
(198, 'raquel'),
(185, 'teresa'),
(224, 'viaje');

--
-- Dumping data for table `publications`
--

INSERT INTO `publications` (`id`, `id_contributor`, `id_writting`, `id_state`) VALUES
(41, 1, 61, 1),
(42, 1, 62, 1),
(43, 1, 63, 1),
(44, 1, 64, 1),
(45, 1, 65, 1),
(46, 1, 66, 1),
(48, 1, 68, 1),
(49, 1, 69, 1),
(50, 1, 70, 1),
(51, 1, 71, 1),
(52, 1, 72, 1),
(53, 1, 73, 1),
(54, 1, 74, 1),
(55, 1, 75, 1),
(56, 1, 76, 1),
(57, 1, 77, 1),
(58, 1, 78, 1),
(59, 1, 79, 1),
(60, 1, 80, 1),
(61, 1, 81, 1),
(62, 1, 82, 1),
(63, 1, 83, 1),
(64, 1, 84, 1),
(65, 1, 85, 1),
(66, 1, 86, 1),
(67, 1, 87, 1),
(68, 1, 88, 1),
(69, 1, 89, 1),
(70, 1, 90, 1),
(71, 1, 91, 1),
(72, 1, 92, 1),
(73, 1, 93, 1),
(74, 1, 94, 1),
(75, 1, 95, 1),
(76, 1, 96, 1),
(77, 1, 97, 1),
(78, 1, 98, 1),
(79, 1, 99, 1),
(80, 1, 100, 1),
(81, 1, 101, 1),
(82, 1, 102, 1),
(83, 1, 103, 1),
(84, 1, 104, 1),
(86, 1, 106, 1),
(87, 1, 107, 1),
(90, 1, 110, 1);

--
-- Dumping data for table `publications_musas`
--

INSERT INTO `publications_musas` (`id_publication`, `id_musa`) VALUES
(41, 182),
(49, 182),
(65, 182),
(70, 182),
(42, 183),
(43, 183),
(52, 183),
(64, 183),
(66, 183),
(68, 183),
(74, 183),
(75, 183),
(76, 183),
(77, 183),
(78, 183),
(79, 183),
(83, 183),
(44, 185),
(45, 185),
(48, 185),
(46, 186),
(50, 193),
(51, 193),
(53, 194),
(63, 194),
(54, 195),
(56, 195),
(57, 195),
(58, 195),
(59, 195),
(60, 195),
(61, 195),
(62, 195),
(80, 195),
(87, 195),
(55, 196),
(67, 197),
(69, 198),
(71, 199),
(72, 199),
(73, 199),
(84, 199),
(81, 200),
(82, 200),
(86, 201),
(90, 224);

--
-- Dumping data for table `writtings`
--

INSERT INTO `writtings` (`id`, `title`, `body`, `creation_date`, `modification_date`, `publication_type`) VALUES
(61, 'El amor', 'Más hermoso\r<br />que el sol resplandeciente\r<br />en el horizonte.\r<br />Más doloroso\r<br />que la aguja que se clava\r<br />en la vena de la muerte.\r<br />El bien más necesario...\r<br />Proporciona\r<br />todos los placeres\r<br />de la vida.\r<br />Es la respuesta de nuestra existencia.', '2015-06-28 10:44:57', NULL, NULL),
(62, 'La espina', 'Qué es lo que queda\r<br />después de la amistad.\r<br />Que acabó con duda escondida\r<br />de a quien amar...\r<br />¿Al amigo de hace tiempo \r<br />o a la tan querida libertad?', '2015-06-28 10:48:42', NULL, NULL),
(63, 'Las cuatro estaciones', 'Avanza la vida, \r<br />y estoy sin ti.\r<br />El tiempo pasa\r<br />pero sigo sin ti.\r<br />¿Cuándo llegara el día\r<br />que nos refugiemos juntos\r<br />de este mundo tan absurdo?\r<br />Las hojas caen\r<br />y no te acercas... \r<br />¡nieva! y tu no estás.\r<br />Llega la primavera,\r<br />bella y fresca.\r<br />Viene el calor\r<br />y sigue siendo tu ausencia\r<br />la que acompaña a mi dolor.', '2015-06-28 10:51:16', NULL, NULL),
(64, 'Espiritu Libre', 'Con la mente lo intento,\r<br />mis ojos son el instrumento,\r<br />me esfuerzo y no consigo\r<br />que tu mente esté conmigo.\r<br />De tanto empeño,\r<br />la cabeza me acaba doliendo.\r<br />Ahora frustrado y cansado\r<br />pues tus ojos no me han mirado.\r<br />\r<br />De repente lo entiendo todo,\r<br />todo, me parece perfecto.\r<br />Yo no soy quien\r<br />para dominar tu espíritu libre,\r<br />haciendo viento...\r<br />con su movimiento.\r<br />\r<br />De repente lo entiendo todo,\r<br />todo te doy,\r<br />y tomo.', '2015-06-28 10:53:43', NULL, NULL),
(65, 'La perdida de la inocencia', 'Tu eras un ángel\r<br />perdido en el desierto\r<br />y me encontraste.\r<br />Yo era un ingenuo,\r<br />muy fácil de enamorarme.\r<br />Crecimos juntos\r<br />en este mundo de malages,\r<br />y nos quisimos tanto\r<br />que el tiempo iba volando.\r<br />¡Éramos uno!\r<br />Hasta que vino el diablo\r<br />a destruirnos.\r<br />Tu sigues siendo un ángel,\r<br />libre como el viento\r<br />en el desierto.\r<br />Sin embargo,\r<br />ahora yo no soy ingenuo,\r<br />y cada paso que doy…\r<br />me quemo.', '2015-06-28 10:54:36', NULL, NULL),
(66, 'La Pluma', 'Como una pluma,\r<br />caigo desde lo alto.\r<br />Donde yo nací.\r<br />Como una pluma.\r<br />Despacio.\r<br />Sólo a intervalos.\r<br />Pero caigo.\r<br />Por instantes,\r<br />en el mismo nivel,\r<br />planeo y observo el mundo.\r<br />Pero caigo.\r<br />No quiero llegar al suelo…\r<br />No puedo llegar al suelo…\r<br />No debo llegar al suelo…\r<br />Pero caigo.\r<br />Gritar pidiendo a un águila\r<br />que venga en mi rescate,\r<br />que me adopte como a una pluma suya más\r<br />y así me haga subir...\r<br />que no me deje bajar.\r<br />Y si lo hago,\r<br />que sea acompañado\r<br />y me libere de esta soledad.', '2015-06-28 10:55:25', NULL, NULL),
(68, 'El beneficio del perdon', 'Alivio dudoso.\r<br />Perdón miedoso.\r<br />Amor tramposo.\r<br />Escóndete en el desierto de azúcar...\r<br />Ven al paraíso del color del corazón...\r<br />Aún no. Vive y escapa de la vida,\r<br />muere y vive la noche,\r<br />resucita como Cristo...\r<br />Aún no. Mentes confusas sueñan contigo\r<br />en un mar azul, color del cielo\r<br />refugio de los pájaros\r<br />que son libres de volar\r<br />a través del tiempo...\r<br />Aún no.\r<br />Alivio no aliviado.\r<br />Perdón escarmentado.\r<br />Amor tramposo.\r<br />Refúgiate en las olas del mar negro,\r<br />olvídate de amar a nadie más...\r<br />Ahora sí.\r<br />\r<br />Vive sin frenos,\r<br />vete donde quieras ir,\r<br />vuelve a tu casa...\r<br />Ahora sí.\r<br />\r<br />Lo que quieras...\r<br />Nadie te va a enseñar a morir.', '2015-06-28 12:26:13', NULL, NULL),
(69, 'Te veo', 'Te veo cuando te sueño,\r<br />te veo cuando pienso en ti.\r<br />Te veo cuando te alejas\r<br />y te acercas de mi.\r<br />Te veo cuando te siento,\r<br />y te siento cuando tu quieras\r<br />que esto sea así.\r<br />Te veo y ya no te veo.\r<br />Dime porque quieres que me aleje de ti.', '2015-06-28 12:28:25', NULL, NULL),
(70, 'Angie', 'Yo no quiero nada,\r<br />solo ser tu mirada.\r<br />Yo no quiero nada,\r<br />solo que te apoyes,\r<br />cuando estés cansada.\r<br />Yo no quiero nada...\r<br />¡Sólo tu cuerpo!\r<br />¡Sólo tu alma!\r<br />Yo no quiero nada,\r<br />sólo ser...\r<br />Quien te acompaña', '2015-06-28 12:34:34', NULL, NULL),
(71, 'ANGustia', '¡Madre de la noche!\r<br />Libérame de las tinieblas.\r<br />En la cueva sucumbo,\r<br />alejado del beso maldito.\r<br />¡Padre de la ausencia!\r<br />Libérame de su recuerdo.\r<br />Arropado entre sábanas de arroz,\r<br />aunado con tabaco.\r<br />Entra en mi,\r<br />y que ella sea el pasado.', '2015-06-28 12:35:01', NULL, NULL),
(72, 'Esperando', 'No estoy para nadie,\r<br />o para agarrarme a un clavo ardiendo.\r<br />Un guiño, una caricia...\r<br />y darte todo lo que llevo dentro.\r<br />\r<br />Ésta sé no es la solución,\r<br />que alivie mi tormento.\r<br />Ni esperar entre oasis \r<br />en este desierto de amor,\r<br />hasta recuperar lo que ya creía eterno.', '2015-06-28 12:36:24', NULL, NULL),
(73, 'Manolito, mi amogo manu...', 'Manolito mi amigo manu,\r<br />el que vivía en la calle picó,\r<br />desengañado de la vida\r<br />se junto con malas compañías. \r<br />¿Qué son malas compañías?\r<br />Tú verás,...\r<br />tu vida, es tu vida.\r<br />Pero Manolito, mi amogo manu...\r<br />al jaco entregó su vida.', '2015-06-28 12:37:12', NULL, NULL),
(74, 'Armaduras', 'Que te voy a decir a ti que me escuchas, \r<br />si me escuchas tienes interés\r<br />y al interés sólo le falta decisión. \r<br />\r<br />Quiero que me escuches tú \r<br />que vives alejado del mundo. \r<br />Quiero despertar contigo en otro lugar, \r<br />donde ya no existan armaduras.\r<br />Ni las de lucha en la edad media,\r<br />ni las de lucha en el siglo 21. \r<br />\r<br />¿De que te proteges?', '2015-06-28 12:38:21', NULL, NULL),
(75, 'Canto a los padres', '¿Qué estáis tristes?\r<br />¿Qué estáis ciegos?\r<br />...\r<br />Pues no veis que los días pasan\r<br />...\r<br />¿Qué es lo que os hace falta?\r<br />Examinad vuestras raíces\r<br />y contemplar el árbol...\r<br />¿Acaso no lo veis florecido?\r<br />\r<br />Quizá haya margaritas\r<br />donde querías ver claveles\r<br />...\r<br />aunque\r<br />...\r<br />¡Acaso no es bella toda flor\r<br />que consigue sacar sus colores!', '2015-06-28 12:39:17', NULL, NULL),
(76, 'Ereflex 22', 'Terremoto mental.\r<br />Revolución de pensamientos.\r<br />Apagados,\r<br />extinguidos como el fuego.\r<br />¿Es mejor así?\r<br />...Hallar un oasis en el desierto\r<br />Me sentía más vivo\r<br />en aquellos tiempos\r<br />Muerte cerebral\r<br />encauzado en la sociedad,\r<br />no es mejor así,\r<br />pues ahora me siento muerto.\r<br />¿Cómo vivir?\r<br />¿En qué soñar?\r<br />¿Cómo escapar de la realidad\r<br />sin eludir la responsabilidad?\r<br />Quizá ya sea tarde.\r<br />Quizá sea mi hora.\r<br />¡Pero cómo!\r<br />¡Acaso no soy yo\r<br />quien controla mi universo!', '2015-06-28 12:40:05', NULL, NULL),
(77, 'Pensamiento perturbado', 'Mente perturbada.\r<br />Mente inquieta.\r<br />La cabeza me da vueltas\r<br />hasta que revienta.\r<br />Revienta, revienta\r<br />maldita cabeza\r<br />deja de dar vueltas,\r<br />déjame vivir en paz.\r<br />\r<br />Doy vueltas\r<br />y veo puertas\r<br />nadie las abre\r<br />nadie las cierra.\r<br />Entonces me doy cuenta\r<br />soy yo el que tiene\r<br />que ir a abrir\r<br />de todas\r<br />las que yo quiera.', '2015-06-28 12:40:30', NULL, NULL),
(78, 'Prision Interna', 'Como espero encontrarte\r<br />si estoy sin buscarte,\r<br />a ti que me regalaste el día\r<br />cuando era la noche la que vivía.\r<br />Entonces que hago yo,\r<br />un loco errante\r<br />sin salir de mi jaula\r<br />quiero encontrarte.\r<br />\r<br />Pero no te veo.\r<br />Pero no te siento.\r<br />Jaula estúpida,\r<br />artificial...\r<br />Prisión interna\r<br />¡quiero salir ya!', '2015-06-28 12:41:57', NULL, NULL),
(79, 'Fruto de la Alquimia', 'Aunque la primera vez\r<br />convertí mi cuerpo en un ciclón.\r<br />No me he arrepentido\r<br />de tomar la decisión.\r<br />Pues desde que\r<br />a ti te conocí,\r<br />se me han quitado ya\r<br />las ganas de morir.\r<br />Fruto de la alquimia,\r<br />Fruto de la alquimia,\r<br />eliminas de mi mente\r<br />toda pesadilla.\r<br />\r<br />Fruto de la alquimia,\r<br />Fruto de la alquimia,\r<br />eliminas de mi mente\r<br />toda pesadilla.', '2015-06-28 12:42:20', NULL, NULL),
(80, 'Fruto de la Alquimia II', 'Sigo muerto,\r<br />porque no hago lo que quiero...\r<br />lo que pienso.\r<br />De que sirve pensar...\r<br />Acomodado en el sofá...\r<br />¡Si luego no hay esfuerzo\r<br />para cambiar lo que nos\r<br />consume por dentro!\r<br />\r<br />Fruto de la alquimia,\r<br />es verdad, eliminas pesadillas.\r<br />Pero luego tu te vas,\r<br />y aca me quedo\r<br />yo solo con mi lamento.', '2015-06-28 12:42:42', NULL, NULL),
(81, 'Buscando la Paz Interior', 'Mente inquieta, la cabeza da vueltas.\r<br />Indecisiones,\r<br />es lo que me atormenta.\r<br />\r<br />Brújula desimantada,\r<br />sólo puedo guiarme por el alma.\r<br />\r<br />Paralizado, obsesionado y atascado\r<br />sin dejarme fluir como el agua,\r<br />entendiendo la naturaleza\r<br />y no cuestionarse nada.', '2015-06-28 12:43:08', NULL, NULL),
(82, 'Amimusa MAN U', 'Todos estamos muertos\r<br />porque todos somos las mismas,\r<br />no nos damos cuenta\r<br />porque vamos de viaje al infinito.\r<br />¿Qué es el infinito?\r<br />El infinito es el universo,\r<br />que un día fue un punto...\r<br />lo que seremos cuando nos hagamos\r<br />conscientes de nuestro destino.\r<br />Todos estamos locos\r<br />porque todos somos las mismas.\r<br />¡Por qué no nos haremos conscientes\r<br />de la cuenta atrás....\r<br />.... del 3,2,1!\r<br />¡Los números!,\r<br />lenguaje universal.\r<br />¡Las drogas!\r<br />la lanzadera espacial\r<br />al vuelo eterno\r<br />cuando se olvida aterrizar.\r<br />Cuando despiertes\r<br />serás consciente de tu muerte.\r<br />Cuando duermas\r<br />te creerás despierta.\r<br />Vuelve a la vida cuando quieras.\r<br />Vuelve a la vida cuando puedas.', '2015-06-28 12:45:29', NULL, NULL),
(83, 'El arte de morir', 'Tu vida son mis recuerdos\r<br />y mi vida es pensar en ti.\r<br />La vida sólo es\r<br />lo que recuerden los demás de ti.', '2015-06-28 12:45:49', NULL, NULL),
(84, 'La habitacion oscura', 'Cuando todo parece que empieza...\r<br />Cuando todo está acabando...\r<br />Se ve una luz en el fondo de la habitación oscura\r<br />que ilumina el infinito\r<br />Cuando todo parece que termina...\r<br />Cuando todo está empezando\r<br />Se produce un apagón\r<br />que deja a oscuras tu rostro en la habitación oscura.\r<br />Quiero recordarte tal y como eras.\r<br />Quiero que aparezcas tal y como éramos.\r<br />Quiero poder sentirte al final de la habitación.\r<br />\r<br />¡Llama explosiva que iluminas la habitación oscura!\r<br />¡Llama expansiva que penetras en toda esquina de la habitación oscura!\r<br />¿Son eso tus ojos?\r<br />¡los dos puntos que veo en el infinito!\r<br />¡los dos puntos que se convierten en uno cuando me acerco!', '2015-06-28 12:46:11', NULL, NULL),
(85, 'Ciberbeso', 'Sus ojos te miran...\r<br />Silencio.\r<br />Sientes su respiración...\r<br />Silencio.\r<br />Se abren nuevos canales de comunicación...\r<br />Palabras.\r<br />Mentes diversas se fusionan...\r<br />Pensamientos.\r<br />La respiración cada vez está más presente,\r<br />los labios chocan una y otra vez...\r<br />Impactos.\r<br />¡Los jugos salivales se entremezclan!\r<br />¡Conforman una mar por el que perderse\r<br />y no querer volver!\r<br />¡Burbujas positivas nadan libremente!\r<br />Dos cuerpos que se convierten en uno.\r<br />¡Es una fusión!\r<br />¡Es magia!\r<br />Es...\r<br />tu beso.', '2015-06-28 12:46:28', NULL, NULL),
(86, 'Tus ojos', 'Noche del terremoto,\r<br />locura colectiva...\r<br />y por unos instantes\r<br />la noche se convirtió en día.\r<br />\r<br />No te conozco.\r<br />No se quien eres.\r<br />Nada de tu vida...\r<br />Pero recuerdo bien esos ojos,\r<br />en la noche...\r<br />color del día.', '2015-06-28 12:47:16', NULL, NULL),
(87, '¿Quien eres?', 'No te conocía\r<br />pero entraste en mi vida...\r<br />reordenada, reestructurada, renovada\r<br />...como el agua cristalina.\r<br />\r<br />Quiero llegar más lejos,\r<br />descuartizar tu cerebro.\r<br />\r<br />Quiero llegar más lejos,\r<br />sentir tu cuerpo.\r<br />¡Irresistible!\r<br />Como el frío no resiste al hielo.\r<br />\r<br />¿Quién eres?\r<br />Una excusa para eludir mi responsabilidad\r<br />o un sueño que deseo sea realidad.', '2015-06-28 12:48:15', NULL, NULL),
(88, 'Cuando duermo', 'Cierro los ojos\r<br />y veo tu rostro\r<br />dibujado en mi mente\r<br />resplandeciente\r<br />Se repite el ciclo\r<br />vuelta a lo mismo\r<br />hasta que duermo\r<br />y te veo en mis sueños.', '2015-06-28 12:48:45', NULL, NULL),
(89, 'Coincidencia', 'Una mirada,\r<br />algo con lo que soñar...\r<br />Una coincidencia,\r<br />algo que imaginar...\r<br />Ojos rasgados,\r<br />tez morena,\r<br />de mirada intensa y sincera...\r<br />\r<br />Un encuentro,\r<br />algo que recordar...\r<br />Un beso,\r<br />el sueño hecho realidad.', '2015-06-28 12:49:10', NULL, NULL),
(90, 'Frente a frente, mirada contra mirada', 'Tumbados en la misma cama...\r<br />frente a frente,\r<br />mirada contra mirada.\r<br />Suavemente acaricio tu espalda...\r<br />frente a frente,\r<br />mirada contra mirada.\r<br />Comprimimos el aire que nos separa...\r<br />frente a frente,\r<br />mirada contra mirada.\r<br />Tu te haces mía y yo me hago tuyo...\r<br />frente a frente,\r<br />mirada contra mirada.\r<br />Y despertamos juntos en mi mundo...\r<br />frente a frente,\r<br />mirada contra mirada.', '2015-06-28 12:49:39', NULL, NULL),
(91, 'Encuentro', 'La casualidad nos puso\r<br />en el mismo camino.\r<br />Al explorador de la noche,\r<br />quien la investiga y examina.\r<br />A la luna bohemia,\r<br />que le da a la noche\r<br />una continua y bella sonrisa.\r<br />Las palabras se quitaron el velo\r<br />y ahí apareciste tu.\r<br />Tus labios carnosos.\r<br />Tu mirada de gata,\r<br />unida con una espiral\r<br />por la que penetrar\r<br />en tu mente, tan bella...\r<br />resplandeciente.\r<br />Esa mirada de gato\r<br />me ha cautivado,\r<br />Y solo se que no ha sido un sueño,\r<br />Solo se, que ahora tengo un deseo.', '2015-06-28 12:50:24', NULL, NULL),
(92, 'Luna, ¡vuelve!', 'Llega la hora\r<br />y veo tu esplendor.\r<br />Te siento,\r<br />linterna de la noche,\r<br />sonrisa del oscuro cielo\r<br />que iluminas las tinieblas\r<br />siendo el reflejo del sol.\r<br />Sin ti la noche\r<br />es una cara pecosa\r<br />a la que le falta la sonrisa,\r<br />eso que tenemos en común tu y yo.\r<br />Por eso vuelve,\r<br />cuando te vas\r<br />solo quiero eso…\r<br />¡Vuelve!\r<br />Aun respetando tu retiro,\r<br />la noche no es lo mismo sin vos.', '2015-06-28 12:50:48', NULL, NULL),
(93, 'Luna', 'Salí a contemplar la noche\r<br />y allá en lo alto estabas tu.\r<br />Solitaria.\r<br />Independiente.\r<br />Entre las tinieblas,\r<br />tú eras la única luz.\r<br />Estudiando la manera\r<br />de atenazarte entre mi brazos.\r<br />Sin arrebatarte a nada ni a nadie,\r<br />pues no quiero secuestrarte,\r<br />deseo que me absorbas tu.\r<br />Empápame de la claridad\r<br />que regalas al crepúsculo.\r<br />Candil de la noche\r<br />conviértete en mi luz.\r<br />Sin ti la noche sólo es oscuridad,\r<br />donde vagar y vagar.\r<br />Sin vislumbrar el camino,\r<br />caminando, en la ambigüedad.', '2015-06-28 12:51:08', NULL, NULL),
(94, 'Alojado en una ola', 'Me alojaré en una ola\r<br />que me lleve hasta el final de la mar.\r<br />Donde sé tú estas aguardando,\r<br />sentada en la orilla\r<br />regalándole tu presencia.\r<br />Las corrientes me conducirán\r<br />diluido entre la sal.\r<br />Tocaré tus pies descalzos, desnudos\r<br />frente a esa multitud de agua espumosa.\r<br />Tú sabes que estoy de viaje,\r<br />tú sabes que voy a llegar.\r<br />Del mismo modo yo sé\r<br />que me has estado acompañando\r<br />en el transcurso del paseo,\r<br />desde el infinito...\r<br />hasta el amor en libertad.', '2015-06-28 12:51:39', NULL, NULL),
(95, 'La reina de U', 'Ya esta echándose la noche encima de nuestras vidas.\r<br />Un día más muere sin su aliento cercano...\r<br />...sin su aliento, sin su ánimo ni compañía.\r<br />No obstante salgo triunfador\r<br />al frío y húmedo mundo\r<br />porque éste me pertenece.\r<br />Convencido que llegará el día\r<br />en que encontraré para él\r<br />la reina que lo merece.\r<br />\r<br />Y mientras tanto...\r<br />disfruto de cada escama\r<br />que recorro por su espalda.\r<br />Bailando su zigzagueo,\r<br />busco la mirada…\r<br />y espero el encuentro.', '2015-06-28 12:52:11', NULL, NULL),
(96, 'Princesa de U', 'Buscando el camino hacia la luz...\r<br />Esperando encontrarte como siempre...\r<br />Esa es mi esperanza,\r<br />cuando abro los ojos\r<br />y a los sueños les doy muerte. \r<br />Buscando tu escondite,\r<br />pues seguro estoy que existes.\r<br />Examino toda mirada,\r<br />sin perder nunca la esperanza.\r<br />¿Pero que hago cuando me quedo sin aliento?\r<br />¿Dónde repongo la energía consumida?\r<br />Regálame tan solo una sonrisa\r<br />y así florecerá de nuevo mi flor marchita.\r<br />¡Hazme tu ilusión!\r<br />¡Déjame ser tu genio!\r<br />Que apareceré no con tres...\r<br />sino con todos tus deseos.\r<br />Sé que uno es libertad,\r<br />te doy toda la que yo tengo.\r<br />Quizá otro sea encontrar,\r<br />como yo, a tu ángel eterno…\r<br />de este momento.\r<br />Pues ya no busques más,\r<br />el te ha estado siguiendo.\r<br />Sólo has de besar,\r<br />al que esta noche…\r<br />Te da aliento.', '2015-06-28 12:52:39', NULL, NULL),
(97, 'Día de Borrasca', 'No mires al cielo,\r<br />no eches cuenta a ese cuatrero,\r<br />que lleva días empeñado\r<br />en robarme a mi amor.\r<br />Mírame a los ojos\r<br />y dime si no sientes lo que yo.\r<br />Si no te lo expresan ellos...\r<br />Escúchame, por favor.\r<br />Cual ICARO navega por el cielo\r<br />yo también persigo a mi amor,\r<br />que lleva días escondido.\r<br />¡Nubes! ¡Traérmelo!\r<br />¡Quiero sentir su calor!\r<br />Así cuando aparezca,\r<br />le regalare esta canción.\r<br />Templanza y paciencia...\r<br />¡Aparece! Mi amor Sol.', '2015-06-28 12:53:00', NULL, NULL),
(98, 'Estrella espejismo', 'Encontrar una estrella,\r<br />acercarme…\r<br />A ver si es ella.\r<br />Para capturarla,\r<br />acomodarla en la almohada.\r<br />Después comprobar que era Marte,\r<br />la luz que brillaba.\r<br />Por lo tanto sé que he de seguir…\r<br />Buscando a mi amada.', '2015-06-28 12:53:24', NULL, NULL),
(99, 'Envie de te voir', 'J''ai l''envie de te voir,\r<br />mais tu ne m''appelles pas.\r<br />J''en ai marre d''attendre\r<br />de lire ton message.\r<br />Je vois ton prenom,\r<br />dans ma liste de contacts.\r<br />El reflechis que faire,\r<br />T''appeller...\r<br />ou laisser tomber.', '2015-06-28 12:53:52', NULL, NULL),
(100, 'Chercher', 'Que se passe-t-il dans ma vie,\r<br />je suis perdu\r<br />je ne trouve pas mon truc,\r<br />donc qu''est-ce qu''il faut faire...\r<br />Chercher.\r<br />Chercher.\r<br />C''est pour Ça,\r<br />que je suis venu à Brest.\r<br />Pour trouver Ça,\r<br />que je ne sais pas ce que c''est.\r<br />Mais...\r<br />Chercher.\r<br />Chercher.\r<br />Donc, faut pas s''arrêter là.\r<br />Peut être demain il sera trop tard.\r<br />Et tous tes trucs sont passé devant toi.\r<br />Donc, réveille toi... mec.\r<br />Donc, réveille toi... belle.\r<br />Bouge toi, mec.\r<br />Grouille toi, belle.\r<br />Et viens avec moi pour...\r<br />Chercher.\r<br />Chercher.', '2015-06-28 12:54:09', NULL, NULL),
(101, 'La-bel', 'Cara de angel.\r<br />Corazón de piedra.\r<br />Mente de demonio.', '2015-06-28 12:54:41', NULL, NULL),
(102, 'Replace', 'A rey muerto, rey puesto.\r<br />Pero ni tu erás un rey,\r<br />y muchos menos te has muerto.', '2015-06-28 12:54:59', NULL, NULL),
(103, 'Consuelo', 'La música son tus palabras.\r<br />La almohada es tu cuerpo.\r<br />El humo que inhalo son tus besos.\r<br />El humo que suspiro, la rabia...\r<br />porque en realidad no estás conmigo.\r<br />\r<br />Imaginarte debo,\r<br />ya que abrazarte, quiero y no puedo.\r<br />\r<br />Consolar el deseo con cuerpos perfectos\r<br />que juegan y bailan para mí,\r<br />allí en aquella pantalla...\r<br />lejanos, frios y ajenos.\r<br />Ven, acercaté a mí.\r<br />évitame este consuelo\r<br />cuando no estás aquí.', '2015-06-28 12:56:27', NULL, NULL),
(104, 'Luna', 'El reflejo de Luna descansa, en este día de melancolía, sobre el agua que queda en unos de los cráteres que tiene la piedra roja al final de la playa, o al principio, siempre hay dos formas de mirar las cosas. A Tomás le apasionó tanto Luna que se precipitó corriendo para tomarla y llevársela a su amada. Con la sorpresa que, bien para enseñarle que Luna no pertenecía a nadie, bien por que así debía de ser… Luna había dado un salto para subirse a lo más alto del oscuro cielo pecoso.', '2015-06-28 12:56:53', NULL, NULL),
(106, 'Resureccion', 'Te imagino solo de torso, con una cara de felicidad terrible. Seguramente estarás allí, donde siempre has querido ir, con quien siempre has querido estar... \r\nMe invadía una rabia capaz de levantar pirámides, porque la ingestión de pastillas, al fin y al cabo, la habías hecho por mis rechazos a tus cada vez más constantes intrusiones en mi vida. Sin dejarme elegir los momentos en los que deseaba compartir mi tiempo contigo. \r\nLa rabia la canalicé en un solo pensamiento... lo que había ocurrido no dependía de mí. Yo no tenía el control sobre tus acciones, y no debía sentirme responsable de la escena que contemplaba. Inicie sin tener conciencia de ello movimientos circulares con los brazos acompañado de respiraciones profundas, para acabar depositando las palmas de mis manos sobre tu cuerpo. \r\nUn chorro de energía unió el espacio que separaba mis manos de tu pecho, se me erizó el cabello y después de que una lombriz de vida atravesará mi cuerpo para introducirse en el tuyo, despertaste tranquila de tu viaje.', '2015-06-28 12:59:47', NULL, NULL),
(107, 'Quiero ser capitán', 'Después de las tormentas siempre viene la calma, exactamente igual que después del día llega la noche. Aquí, en la calma absoluta teñida de azul verdoso y bajo el resplandor de los pocos rayos de sol que nos quedan, aún se puede contemplar a una muchacha intentando levantar una vela, y lo consigue. Se desliza suavemente como un pato en un estanque. Relajado, echo el ancla entre las rocas para no dejar escapar los pensamientos que circulan y convierto el espigón en una isla. Con la misma tranquilidad puedo observar cuerpos semidesnudos que seguramente se escandalizarían si los viese en sostén y bragas. \r<br />¡Pero si es lo mismo!\r<br />¡Cuanta hipocresía!\r<br />Pero así es el mundo, o te agarras a él y navegas bajo el timón del capitán o te quedas en la isla viendo pasar barcos.\r<br />Muchas veces dudo, muchas veces no sé que hacer. Muchas veces me quedaría en la isla esperando, amarrándome a cualquier otro barco con cualquier otro capitán que pasara frente a mi isla. Pero para ello ya están mis creadores, para aliviarme de cualquier duda, para decidir por mí en todo momento lo que es y no es correcto. Perezoso de mí, por no poner mis neuronas a ejercitar, me dejo llevar. Lo más fácil y lo que más me cuesta.\r<br />Yo quiero ser capitán, capitán de mi propio barco. Yo quiero ser capitán y luchar contra las tormentas, no quiero sentir como otro capitán me arrastra, intentando reparar el rumbo que fijo como remero rebelde.\r<br />Y continuo viendo cuerpos semidesnudos, desde mi isla, la que no se mueve. Aca me quedo porque me siento a salvo, contemplando sirenas y dispuesto a coger el timón cuando la marea crezca, y mientras tanto, contemplo sirenas cigarro adulterado en mano.', '2015-06-28 13:00:30', NULL, NULL),
(110, 'Viaje', 'Viajé, llegué, vi\r\nvolé, soñé, fui,\r\namé, jugué, di\r\ny volví a Madrid.', '2015-08-10 21:27:03', NULL, NULL);

SET foreign_key_checks = 1;