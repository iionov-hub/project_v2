-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `type` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO role (title, description, type) VALUES
  ('Administrator', 'Категория для администрации', 'admin'),
  ('Moderator', 'Категория для модераторов', 'moder'),
  ('User', 'Обычный пользователь', 'user');

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) NOT NULL,
  `e_mail` varchar(128) NOT NULL,
  `password` varchar(64) NOT NULL,
  `date_of_registration` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_role` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  KEY `user_FK` (`id_role`),
  CONSTRAINT `user_FK` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO user (nickname, e_mail, password, date_of_registration, id_role) VALUES
--   Админы
  ('Agamarana', 'Agamarana@rambler.ru', 'rWMZMmgS9S', '2010-01-01 00:00:00.000000', 1),
  ('Saberfire', 'Saberfire@my.com', 'GFNejN1tIe', '2010-01-01 00:00:00.000000', 1),
--   Модераторы
  ('Fekree', 'Fekree@mail.ru', 'GFNejN1tIe', '2010-01-02 00:00:00.000000', 2),
  ('Malozel', 'Malozel@yahoo.com', 'GFNejN1tIe', '2010-01-03 00:00:00.000000', 2),
  ('Gavilas', 'Gavilas@yahoo.com', 'GFNejN1tIe', '2010-01-04 00:00:00.000000', 2),
  ('Dokazahn', 'Dokazahn@rambler.ru', 'GFNejN1tIe', '2010-01-05 00:00:00.000000', 2),
  ('Brightmane', 'Brightmane@mail.ru', 'GFNejN1tIe', '2010-01-06 00:00:00.000000', 2),
--   Пользователи
  ('Keraris',	'Keraris@yandex.ru', 'kxOeNa0o9x', '2010-01-07 00:00:00.000000', 3),
  ('Mugami', 'Mugami@mail.ru', 'YXDIl3BJtd', '2010-01-08 00:00:00.000000', 3),
  ('Dagas', 'Dagas@mail.ru', 'HaM2CRjzrf', '2010-01-09 00:00:00.000000', 3),
  ('Whitemane',	'Whitemane@gmail.com', 'kxOeNa0o9x', '2010-01-10 00:00:00.000000', 3),
  ('Fem', 'Fem@my.com', 'YXDIl3BJtd', '2010-01-11 00:00:00.000000', 3),
  ('Ianrad', 'Ianrad@my.com', 'HaM2CRjzrf', '2010-01-12 00:00:00.000000', 3),
  ('Morlurus',	'Morlurus@mail.ru', 'kxOeNa0o9x', '2010-01-13 00:00:00.000000', 3),
  ('Faerg', 'Faerg@mail.ru', 'YXDIl3BJtd', '2010-01-14 00:00:00.000000', 3),
  ('Sharpredeemer', 'Sharpredeemer@yahoo.com', 'HaM2CRjzrf', '2010-01-15 00:00:00.000000', 3),
  ('Taurr',	'Taurr@gmail.com', 'kxOeNa0o9x', '2010-01-16 00:00:00.000000', 3),
  ('Kerim', 'Kerim@my.com', 'YXDIl3BJtd', '2010-01-17 00:00:00.000000', 3),
  ('Kalkis', 'Kalkis@yahoo.com', 'HaM2CRjzrf', '2010-01-18 00:00:00.000000', 3),
  ('Narana', 'Narana@yandex.ru', 'HaM2CRjzrf', '2010-01-19 00:00:00.000000', 3);

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `num_message` int NOT NULL DEFAULT '0',
  `date_last_visit` datetime NOT NULL,
  `is_banned` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_info_FK` (`id_user`),
  CONSTRAINT `user_info_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO user_info (id_user, num_message, date_last_visit, is_banned) VALUES
  (1,  0, '2012-01-19 00:00:00.000000', FALSE ),
  (2,  0, '2012-02-19 00:00:00.000000', FALSE ),
  (3,  0, '2012-03-19 00:00:00.000000', FALSE ),
  (4,  0, '2012-04-19 00:00:00.000000', FALSE ),
  (5,  0, '2012-05-19 00:00:00.000000', FALSE ),
  (6,  0, '2012-06-19 00:00:00.000000', FALSE ),
  (7,  0, '2012-07-19 00:00:00.000000', FALSE ),
  (8,  0, '2012-08-19 00:00:00.000000', FALSE ),
  (9,  0, '2012-09-19 00:00:00.000000', FALSE ),
  (10,  0, '2012-10-19 00:00:00.000000', FALSE ),
  (11,  0, '2012-11-19 00:00:00.000000', FALSE ),
  (12,  0, '2012-12-19 00:00:00.000000', FALSE ),
  (13,  0, '2013-01-19 00:00:00.000000', FALSE ),
  (14,  0, '2013-02-19 00:00:00.000000', FALSE ),
  (15,  0, '2013-03-19 00:00:00.000000', FALSE ),
  (16,  0, '2013-04-19 00:00:00.000000', FALSE ),
  (17,  0, '2013-05-19 00:00:00.000000', FALSE ),
  (18,  0, '2013-06-19 00:00:00.000000', FALSE ),
  (19,  0, '2013-07-19 00:00:00.000000', FALSE ),
  (20,  0, '2013-08-19 00:00:00.000000', FALSE );

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_title_counter_idx` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO category (title) VALUES
  ('Развлечения'),
  ('Разное'),
  ('Компьютеры');

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `forum_FK` (`id_category`),
  KEY `forum_title_idx` (`title`),
  CONSTRAINT `forum_FK` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO forum (id_category, title, description) VALUES
    (1, 'Аниме', 'В этом форуме общаются все любители японской поп-культуры.'),
    (1, 'Кино', 'Раздел для обсуждения фильмов и всего связанного с кинопромышленностью'),
    (1, 'Сериалы', 'Раздел для обсуждения сериалов'),
    (1, 'Музыка', 'Раздел для обсуждения музыки всех направлений, а также клубной и концертной жизни'),
    (2, 'YYY', 'Скрытый раздел, созданный для свободного общения на интересующие вас темы.'),
    (2, 'Спорт', 'Обсуждение спортивных событий здесь!'),
    (3, 'Ferrum Forum', 'Форум о железяках.'),
    (3, 'Soft & OS', 'Форум о софте и операционках.'),
    (3, 'Moбильный Форум', 'Форум о мобильных технологиях, девайсах и гаджетах');

--
-- Table structure for table `forum_info`
--

DROP TABLE IF EXISTS `forum_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_forum` int NOT NULL,
  `num_posts` int NOT NULL DEFAULT '0',
  `last_post_id` int DEFAULT NULL,
  `last_post_author_id` int DEFAULT NULL,
  `last_post_timestamp` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `forum_info_FK` (`id_forum`),
  CONSTRAINT `forum_info_FK` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO forum_info (id_forum, num_posts, last_post_id, last_post_author_id, last_post_timestamp) VALUES
  (1, 0, NULL, NULL, NULL),
  (2, 0, NULL, NULL, NULL),
  (3, 0, NULL, NULL, NULL),
  (4, 0, NULL, NULL, NULL),
  (5, 0, NULL, NULL, NULL),
  (6, 0, NULL, NULL, NULL),
  (7, 0, NULL, NULL, NULL),
  (8, 0, NULL, NULL, NULL),
  (9, 0, NULL, NULL, NULL);

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_author` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `is_important` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `date_of_creation` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `topic_FK` (`id_author`),
  CONSTRAINT `topic_FK` FOREIGN KEY (`id_author`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO topic (id_author, title, text, is_important, is_active, is_approved, date_of_creation) VALUES
--   Anime
  (11, 'Обсуждалка', 'Обсуждаем увиденное, делимся впечатлениями.', FALSE, TRUE, TRUE, '2010-06-08 00:00:00.000000'),
  (11, 'Что посмотреть?', 'Приветствуем вас наши любимые отаку и простые прохожие Данная тема предназначена для консультаций по подбору аниме к просмотру Для начала ознакомьтесь со списком рекомендаций от Anime Group и с сезонами нынешнего года. сли же вы не нашли подходящего варианта, то оставьте заявку в теме. Форма заявки свободная, по возможности прикладывайте ссылку на MAL, так будет проще что либо советовать.', FALSE, TRUE, TRUE, '2010-06-08 00:00:00.000000'),
-- Кино
  (12, 'Поиск фильмов по описанию', 'Если вы когда-то смотрели фильм, он вам очень понравился и вы захотели его посмотреть еще раз, но не помните названия или актеров, оставляйте заявку в этой теме, вам обязательно помогут.Пишите как можно более подробней: Сюжет, всякие моменты и т.п.Также важно:За просьбу дать ссылку на скачивание выставляется "нестандартное нарушение".За выкладывание ссылки на скачивание выставляется "недопустимая ссылка".', FALSE, TRUE, TRUE, '2010-06-08 00:00:00.000000'),
--   Сериалы
  (13, 'Игра престолов / Game of Thrones', '«Игра престолов» новый сериал HBO, основанный на бестселлерах Джорджа Р.Р. Мартина. В мире, где лето и зимы длятся десятилетиями, на кону корона Вестероса. Предательство, похоть, интриги и сверхъестественные силы сотрясают все четыре стороны Королевства — от плетущего интриги юга, диких восточных земель, до замерзшего севера и древней Стены, что защищает королевство от тьмы за нею. Короли и королевы, рыцари и мятежники, лжецы и благородные люди борются за власть в кровавом сражении за Железный Трон.,', FALSE, TRUE, TRUE, '2010-06-08 00:00:00.000000'),
  (14, 'Кремниевая долина', 'История о группе гиков, готовящих к запуску собственные стартапы в высокотехнологичном центре Сан-Франциско.', FALSE, FALSE, FALSE, '2010-06-08 00:00:00.000000');


--
-- Table structure for table `topic_info`
--

DROP TABLE IF EXISTS `topic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_topic` int NOT NULL,
  `num_posts` int NOT NULL DEFAULT '0',
  `last_post_author_id` int DEFAULT NULL,
  `last_post_timestamp` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `topic_info_FK` (`id_topic`),
  CONSTRAINT `topic_info_FK` FOREIGN KEY (`id_topic`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO topic_info (id_topic, num_posts, last_post_author_id, last_post_timestamp) VALUES
  (1, 0, 11, '2010-06-08 00:00:00.000000'),
  (2, 0, 12, '2010-06-08 00:00:00.000000'),
  (3, 0, 12, '2010-06-08 00:00:00.000000'),
  (4, 7, 12, '2012-01-19 00:00:00.000000'),
  (5, 0, 14, '2010-06-08 00:00:00.000000');

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_author` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `subtext` text,
  `date_of_creation` datetime DEFAULT NULL,
  `date_last_edit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_FK` (`id_author`),
  CONSTRAINT `post_FK` FOREIGN KEY (`id_author`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO post (id_author, title, text, subtext, date_of_creation, date_last_edit) VALUES
--   Game of Thrones
  (1, NULL, 'Только б не убили великана...у меня плохое предчувствие', NULL, '2012-01-19 00:00:00.000000', '2012-01-19 00:00:00.000000'),
  (2, NULL, 'Вот и завершилась линия обучения Арии у безликого бога, которая в итоге оставила неприятный осадок. Было очень много надежд, что покажут много чего крутого, но в итоге показали два чела. Завершилась линия тем, что Ария каким-то непонятным образом с невероятными колотыми ранами (которые должны были раскрыться от падений) одолела лучшую ученицу безликого. Попахивает супергеройским кино.Не совсем понятным образом слили Риверран. Или нам чего-то еще покажут или Эдмур Талли слил свое родовое поместье ради сына которого он зачал от женщины которую видел всего один раз. Wtf ?', NULL, '2012-01-19 00:00:00.000000', '2012-01-19 00:00:00.000000'),
  (12, NULL, 'Гора за свое минутное появление выглядит лучше, чем несколько прошлых эпизодов вместе взятых. Лучше бы он и остальных завалил, раз Томмен, этот бесхребетный сопляк, только Его Воробейшество слушает. И про что говорила Серсея со своим некромантом?Пес шикарен - как его резня в начале, так и диалоги с Братством в конце (готов пересматривать их раз за разом).Мейрин в осаде, тут прилетает Резист к огню, а значит в следующей серии все кораблики спалит дракон, что не может не радовать. Надеюсь покажут, а не просто скипнут бой.Осада Риверрана интересной получилась, пусть и без боя, но музыка и диалоги норм.Наконец линии с Безликим богом и девочкой Без Имени оживлялку вкололи. Правда под конец уж совсем понятно стало, что 2-ю девку заманивают в ловушку. Ну и Девочка снова обрела имя. Теперь отомстит всем в своем списке.', NULL, '2012-01-19 00:00:00.000000', '2012-01-19 00:00:00.000000'),
  (13, NULL, 'Поржал с разборки с бандитами и Псом, у лысого явно стальные яйца, раз топор ударился с таким звуком.Ария наконец то возвращается. Томена наконец то сольют, Серсия конечно мать неудачница, вырастила тряпку, маньяка и тихоню.Ну а в следующей нас ждет битва бастрадов...', NULL, '2012-01-19 00:00:00.000000', '2012-01-19 00:00:00.000000'),
  (12, NULL, 'Да нормальный Томен и сестричка его. Это мамаша вечно устраивает такие замуты, что потом перемалываются ее дети и не только.', NULL, '2012-01-19 00:00:00.000000', '2012-01-19 00:00:00.000000'),
  (13, NULL, 'Тряпка - Томмен, Маньяк - Джоффри, а кто тихоня? ', NULL, '2012-01-19 00:00:00.000000', '2012-01-19 00:00:00.000000'),
  (12, NULL, 'Мирцела наверное', NULL, '2012-01-19 00:00:00.000000', '2012-01-19 00:00:00.000000');

--
-- Table structure for table `forum_topic`
--

DROP TABLE IF EXISTS `forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_topic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_forum` int NOT NULL,
  `id_topic` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `forum_topic_FK` (`id_forum`),
  KEY `forum_topic_FK_1` (`id_topic`),
  CONSTRAINT `forum_topic_FK` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `forum_topic_FK_1` FOREIGN KEY (`id_topic`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO forum_topic (id_forum, id_topic) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (3, 5);

--
-- Table structure for table `topic_post`
--

DROP TABLE IF EXISTS `topic_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_topic` int NOT NULL,
  `id_post` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `topic_post_FK` (`id_topic`),
  KEY `topic_post_FK_1` (`id_post`),
  CONSTRAINT `topic_post_FK` FOREIGN KEY (`id_topic`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `topic_post_FK_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO topic_post (id_topic, id_post) VALUES
  (4, 1),
  (4, 2),
  (4, 3),
  (4, 4),
  (4, 5),
  (4, 6),
  (4, 7);
--
-- Table structure for table `moderator_forum`
--

DROP TABLE IF EXISTS `moderator_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderator_forum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_forum` int NOT NULL,
  `id_user` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `moderator_forum_FK` (`id_forum`),
  KEY `moderator_forum_FK_1` (`id_user`),
  CONSTRAINT `moderator_forum_FK` FOREIGN KEY (`id_forum`) REFERENCES `forum` (`id`),
  CONSTRAINT `moderator_forum_FK_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO moderator_forum (id_forum, id_user) VALUES
  (1, 3),
  (1, 4),
  (2, 3),
  (2, 4),
  (3, 3),
  (3, 4),
  (4, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (7, 8),
  (7, 9);



DROP VIEW IF EXISTS `v_users_info`;
/* Создаем вьюшку для просмотра информации пользователя */
CREATE VIEW v_users_info AS
SELECT u.nickname , u.e_mail , r.title
  FROM user as u JOIN role as r ON  u.id_role = r.id;

DROP VIEW IF EXISTS `v_forum_info`;
/* создаем вьюшку для просмотра всего форума */
CREATE VIEW v_forum_info AS
SELECT f.title as forum_title , f.description, u.nickname as author_topic, t.title as topic_title,u2.nickname as author_post , p.text
  FROM forum_topic as ft  JOIN forum as f ON  ft.id_forum = f.id
                          JOIN topic as t ON  ft.id_topic = t.id
                     LEFT JOIN topic_post as tp ON  tp.id_topic = t.id
                     LEFT JOIN post as p ON tp.id_post = p.id
                     LEFT JOIN user as u ON u.id_user = t.id_author
                     LEFT JOIN user as u2 ON u2.id_user = p.id_author;



/*!50001 DROP VIEW IF EXISTS `v_forum_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_forum_info` AS select `f`.`title` AS `forum_title`,`f`.`description` AS `description`,`u`.`nickname` AS `author_topic`,`t`.`title` AS `topic_title`,`u2`.`nickname` AS `author_post`,`p`.`text` AS `text` from ((((((`forum_topic` `ft` join `forum` `f` on((`ft`.`id_forum` = `f`.`id`))) join `topic` `t` on((`ft`.`id_topic` = `t`.`id`))) left join `topic_post` `tp` on((`tp`.`id_topic` = `t`.`id`))) left join `post` `p` on((`tp`.`id_post` = `p`.`id`))) left join `user` `u` on((`u`.`id_user` = `t`.`id_author`))) left join `user` `u2` on((`u2`.`id_user` = `p`.`id_author`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-01 20:26:34
