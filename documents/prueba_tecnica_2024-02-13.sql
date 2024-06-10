# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal)
# Base de datos: prueba_tecnica
# Tiempo de Generación: 2024-02-13 06:40:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `slug`, `visible`)
VALUES
	(1,'Laravel','laravel',1),
	(2,'VueJs','vuejs',1);

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla category_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_post`;

CREATE TABLE `category_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`category_id`,`post_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `category_blog_category_idx` (`category_id`) USING BTREE,
  KEY `category_blog_blog_idx` (`post_id`) USING BTREE,
  CONSTRAINT `category_post_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `category_post_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category_post` WRITE;
/*!40000 ALTER TABLE `category_post` DISABLE KEYS */;

INSERT INTO `category_post` (`id`, `category_id`, `post_id`)
VALUES
	(1,1,1),
	(2,2,3);

/*!40000 ALTER TABLE `category_post` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`,`user_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `comment_user_idx` (`user_id`),
  CONSTRAINT `comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `datetime`)
VALUES
	(1,1,2,'Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.\r\n\r\nEst ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et. Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.','2024-02-13 06:36:35'),
	(2,2,3,'Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.','2024-02-13 06:36:44'),
	(3,3,2,'His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu.','2024-02-13 06:36:49'),
	(4,5,2,'His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu.','2024-02-13 06:36:52'),
	(5,4,3,'Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.','2024-02-13 06:36:56'),
	(6,4,2,'His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu.','2024-02-13 06:36:59');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `picture` varchar(128) DEFAULT NULL,
  `short_content` text NOT NULL,
  `content` longtext DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comment` tinyint(4) NOT NULL DEFAULT 0,
  `pending` tinyint(4) NOT NULL DEFAULT 0,
  `public` tinyint(4) NOT NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`,`user_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `blog_user_idx` (`user_id`) USING BTREE,
  CONSTRAINT `post_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `picture`, `short_content`, `content`, `added`, `updated`, `comment`, `pending`, `public`, `active`)
VALUES
	(1,1,'Laravel Collections','laravel-collections','https://www.google.com/url?sa=i&url=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FGoogle_Im%25C3%25A1genes&psig=AOvVaw3mXB2Xhpk_v_SZT5','Vis id minim dicant sensibus. Pri aliquip conclusionemque ad, ad malis evertitur torquatos his. Has ei solum harum reprimique, id illum saperet tractatos his. Ei omnis soleat antiopam quo. Ad augue inani postulant mel, mel ea qualisque forensibus.','Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.\r\n\r\nHis audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu.\r\n\r\nEst ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et. Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.','2021-06-04 10:02:26','2021-06-10 07:18:10',1,0,1,1),
	(3,3,'Laravel Requests','laravel-request','https://www.google.com/url?sa=i&url=https%3A%2F%2Fnergiza.com%2Fairzone-y-otros-sistemas-de-zonificacion-funcionan-bien%2F&psig=','Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.','Vis id minim dicant sensibus. Pri aliquip conclusionemque ad, ad malis evertitur torquatos his. Has ei solum harum reprimique, id illum saperet tractatos his. Ei omnis soleat antiopam quo. Ad augue inani postulant mel, mel ea qualisque forensibus.\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.\r\n\r\nEst ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et. Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.\r\n\r\nExpetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.\r\n\r\nHis audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu.\r\n\r\nIn mel saperet expetendis. Vitae urbanitas sadipscing nec ut, at vim quis lorem labitur. Exerci electram has et, vidit solet tincidunt quo ad, moderatius contentiones nec no. Nam et puto abhorreant scripserit, et cum inimicus accusamus.\r\n\r\nMei eu mollis albucius, ex nisl contentiones vix. Duo persius volutpat at, cu iuvaret epicuri mei. Duo posse pertinacia no, ex dolor contentiones mea. Nec omnium utamur dignissim ne. Mundi lucilius salutandi an sea, ne sea aeque iudico comprehensam. Populo delicatissimi ad pri. Ex vitae accusam vivendum pro.\r\n\r\nLorem salutandi eu mea, eam in soleat iriure assentior. Tamquam lobortis id qui. Ea sanctus democritum mei, per eu alterum electram adversarium. Ea vix probo dicta iuvaret, posse epicurei suavitate eam an, nam et vidit menandri. Ut his accusata petentium.\r\n\r\nMeis vocent signiferumque pri et. Facilis corpora recusabo ne quo, eum ne eruditi blandit suscipiantur. Mazim sapientem sed id, sea debet commune iracundia in. Eius falli propriae te usu. In usu nonummy volumus expetenda, sint quando facilisis ei per, delectus constituto sea te.\r\n\r\nCu nam labores lobortis definiebas, ei aliquyam salutatus persequeris quo, cum eu nemore fierent dissentiunt. Per vero dolor id, vide democritum scribentur eu vim, pri erroribus temporibus ex. Euismod molestie offendit has no. Quo te semper invidunt quaestio, per vituperatoribus sadipscing ei, partem aliquyam sensibus in cum.','2021-06-04 10:19:44','2021-06-10 07:18:29',1,0,1,1),
	(4,3,'Laravel Models','laravel-models','https://www.google.com/url?sa=i&url=https%3A%2F%2Fnergiza.com%2Fairzone-y-otros-sistemas-de-zonificacion-funcionan-bien%2F&psig=','Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.','Vis id minim dicant sensibus. Pri aliquip conclusionemque ad, ad malis evertitur torquatos his. Has ei solum harum reprimique, id illum saperet tractatos his. Ei omnis soleat antiopam quo. Ad augue inani postulant mel, mel ea qualisque forensibus.\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.\r\n\r\nEst ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et. Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.\r\n\r\nExpetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.\r\n\r\nHis audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu.\r\n\r\nIn mel saperet expetendis. Vitae urbanitas sadipscing nec ut, at vim quis lorem labitur. Exerci electram has et, vidit solet tincidunt quo ad, moderatius contentiones nec no. Nam et puto abhorreant scripserit, et cum inimicus accusamus.\r\n\r\nMei eu mollis albucius, ex nisl contentiones vix. Duo persius volutpat at, cu iuvaret epicuri mei. Duo posse pertinacia no, ex dolor contentiones mea. Nec omnium utamur dignissim ne. Mundi lucilius salutandi an sea, ne sea aeque iudico comprehensam. Populo delicatissimi ad pri. Ex vitae accusam vivendum pro.\r\n\r\nLorem salutandi eu mea, eam in soleat iriure assentior. Tamquam lobortis id qui. Ea sanctus democritum mei, per eu alterum electram adversarium. Ea vix probo dicta iuvaret, posse epicurei suavitate eam an, nam et vidit menandri. Ut his accusata petentium.\r\n\r\nMeis vocent signiferumque pri et. Facilis corpora recusabo ne quo, eum ne eruditi blandit suscipiantur. Mazim sapientem sed id, sea debet commune iracundia in. Eius falli propriae te usu. In usu nonummy volumus expetenda, sint quando facilisis ei per, delectus constituto sea te.\r\n\r\nCu nam labores lobortis definiebas, ei aliquyam salutatus persequeris quo, cum eu nemore fierent dissentiunt. Per vero dolor id, vide democritum scribentur eu vim, pri erroribus temporibus ex. Euismod molestie offendit has no. Quo te semper invidunt quaestio, per vituperatoribus sadipscing ei, partem aliquyam sensibus in cum.','2021-06-04 10:19:44','2021-06-10 07:18:29',1,0,1,1),
	(5,3,'VueJs components','vuejs-components','https://www.google.com/url?sa=i&url=https%3A%2F%2Fnergiza.com%2Fairzone-y-otros-sistemas-de-zonificacion-funcionan-bien%2F&psig=','Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.','Vis id minim dicant sensibus. Pri aliquip conclusionemque ad, ad malis evertitur torquatos his. Has ei solum harum reprimique, id illum saperet tractatos his. Ei omnis soleat antiopam quo. Ad augue inani postulant mel, mel ea qualisque forensibus.\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.\r\n\r\nEst ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et. Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.\r\n\r\nExpetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex. Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.\r\n\r\nHis audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu.\r\n\r\nIn mel saperet expetendis. Vitae urbanitas sadipscing nec ut, at vim quis lorem labitur. Exerci electram has et, vidit solet tincidunt quo ad, moderatius contentiones nec no. Nam et puto abhorreant scripserit, et cum inimicus accusamus.\r\n\r\nMei eu mollis albucius, ex nisl contentiones vix. Duo persius volutpat at, cu iuvaret epicuri mei. Duo posse pertinacia no, ex dolor contentiones mea. Nec omnium utamur dignissim ne. Mundi lucilius salutandi an sea, ne sea aeque iudico comprehensam. Populo delicatissimi ad pri. Ex vitae accusam vivendum pro.\r\n\r\nLorem salutandi eu mea, eam in soleat iriure assentior. Tamquam lobortis id qui. Ea sanctus democritum mei, per eu alterum electram adversarium. Ea vix probo dicta iuvaret, posse epicurei suavitate eam an, nam et vidit menandri. Ut his accusata petentium.\r\n\r\nMeis vocent signiferumque pri et. Facilis corpora recusabo ne quo, eum ne eruditi blandit suscipiantur. Mazim sapientem sed id, sea debet commune iracundia in. Eius falli propriae te usu. In usu nonummy volumus expetenda, sint quando facilisis ei per, delectus constituto sea te.\r\n\r\nCu nam labores lobortis definiebas, ei aliquyam salutatus persequeris quo, cum eu nemore fierent dissentiunt. Per vero dolor id, vide democritum scribentur eu vim, pri erroribus temporibus ex. Euismod molestie offendit has no. Quo te semper invidunt quaestio, per vituperatoribus sadipscing ei, partem aliquyam sensibus in cum.','2021-06-04 10:19:44','2021-06-10 07:18:29',1,0,1,1);

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `full_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `full_name`)
VALUES
	(1,'usuario_1','Usuario 1'),
	(2,'usuario_2','Usuario 2'),
	(3,'usuario_3','Usuario 3');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
