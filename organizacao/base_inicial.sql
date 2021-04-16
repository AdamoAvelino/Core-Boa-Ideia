-- --------------------------------------------------------
-- Servidor:                     172.21.0.2
-- Versão do servidor:           5.7.22 - MySQL Community Server (GPL)
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para banco
DROP DATABASE IF EXISTS `banco`;
CREATE DATABASE IF NOT EXISTS `banco` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `banco`;

-- Copiando estrutura para tabela banco.accounts
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_class_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `initial_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `final_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_account_class_id_foreign` (`account_class_id`),
  KEY `accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `accounts_account_class_id_foreign` FOREIGN KEY (`account_class_id`) REFERENCES `account_classes` (`id`),
  CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.accounts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `account_class_id`, `user_id`, `name`, `description`, `active`, `initial_date`, `final_date`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'Editora Mágica', 'Conta da editora mágica', 1, '2020-03-08 21:30:33', NULL, '2020-03-08 21:30:33', '2020-03-08 21:41:06'),
	(2, 1, 4, 'Lari Bolo', 'Conta do site laribolo.', 1, '2020-05-03 20:39:51', NULL, '2020-05-03 20:39:51', '2020-05-03 20:39:51');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.account_classes
DROP TABLE IF EXISTS `account_classes`;
CREATE TABLE IF NOT EXISTS `account_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.account_classes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `account_classes` DISABLE KEYS */;
INSERT INTO `account_classes` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Freemium', 'Com apenas uma filial', '2020-03-08 21:22:30', '2020-03-08 21:22:30');
/*!40000 ALTER TABLE `account_classes` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.categories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Dicas', '2020-03-08 17:57:18', '2020-03-08 17:57:18');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `comment_id` int(10) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_comment_id_foreign` (`comment_id`),
  CONSTRAINT `comments_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.comments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.editorials
DROP TABLE IF EXISTS `editorials`;
CREATE TABLE IF NOT EXISTS `editorials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.editorials: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `editorials` DISABLE KEYS */;
INSERT INTO `editorials` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(2, 'Engenharia Civil', '2020-03-10 02:44:09', '2020-03-10 02:44:09');
/*!40000 ALTER TABLE `editorials` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.migrations: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(123, '2014_10_12_000000_create_users_table', 1),
	(124, '2014_10_12_100000_create_password_resets_table', 1),
	(125, '2020_02_08_234491_create_statuses_table', 1),
	(126, '2020_02_08_234500_create_posts_table', 1),
	(127, '2020_02_08_234501_create_categories_table', 1),
	(128, '2020_02_08_234502_create_comments_table', 1),
	(129, '2020_03_01_230858_create_editorials_table', 1),
	(130, '2020_03_01_230912_create_produces_table', 1),
	(131, '2020_03_01_232712_create_account_classes_table', 1),
	(132, '2020_03_01_232721_create_accounts_table', 1),
	(133, '2020_03_09_151408_create_modulos_table', 1),
	(134, '2020_03_09_151409_create_roles_table', 1),
	(135, '2020_03_09_151448_create_permissions_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.modulos
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE IF NOT EXISTS `modulos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.modulos: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Post', 'Modulos que concentraram artigos', '2020-03-08 02:20:04', '2020-03-08 02:20:04'),
	(2, 'Modulos', 'Concentrador de modulos do sistema, conforme uma módulo nasce é necessário cadastra-lo aqui', '2020-03-08 02:21:15', '2020-03-08 02:21:15'),
	(3, 'Category', 'Concentrador de categoria dos artigos', '2020-03-08 02:22:20', '2020-03-08 02:22:20'),
	(4, 'Status', 'Registros que determinam uma situação dos artigos', '2020-03-08 02:23:01', '2020-03-08 02:23:01'),
	(5, 'Role', 'Modulo que administra perifs do sistema', '2020-03-08 02:24:07', '2020-03-08 02:24:07'),
	(6, 'Permissions', 'Módulo que administra as permissões que cada perfil pode ter', '2020-03-08 02:24:54', '2020-03-08 02:24:54'),
	(7, 'User', 'Modulo de administração de usuários', '2020-03-08 02:25:24', '2020-03-08 02:25:24');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulo_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_modulo_id_foreign` (`modulo_id`),
  CONSTRAINT `permissions_modulo_id_foreign` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.permissions: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `label`, `modulo_id`, `created_at`, `updated_at`) VALUES
	(1, 'post_view', 'permissão para visualização de artigos', 1, '2020-03-08 02:26:06', '2020-03-08 02:26:06'),
	(2, 'post_edit', 'Permisão para edição de artigos', 1, '2020-03-08 02:26:49', '2020-03-08 02:26:49'),
	(3, 'post_cretae', 'Permissão para criação de artigos', 1, '2020-03-08 02:36:51', '2020-03-08 02:36:51'),
	(4, 'pos_delete', 'Permissão para deletar artigos', 1, '2020-03-08 02:37:29', '2020-03-08 02:37:29'),
	(5, 'modulo_view', 'Permissçao para visualização de módulos', 2, '2020-03-08 02:38:16', '2020-03-08 02:38:16'),
	(6, 'modulo_edit', 'Permissão para edição de módulos', 2, '2020-03-08 02:38:45', '2020-03-08 02:38:45'),
	(7, 'modulo_create', 'Permissão para criação de módulos', 2, '2020-03-08 02:39:17', '2020-03-08 02:39:17'),
	(8, 'modulo_delete', 'Permissão para deletar modulos', 2, '2020-03-08 02:39:45', '2020-03-08 02:39:45'),
	(9, 'category_view', 'Permissão para visualização de categoria', 3, '2020-03-08 02:40:21', '2020-03-08 02:40:21'),
	(10, 'category_edit', 'Permissão para edição de categorias', 3, '2020-03-08 02:40:53', '2020-03-08 02:40:53'),
	(11, 'category_create', 'Permissão para criação de categoria', 3, '2020-03-08 02:41:18', '2020-03-08 02:41:18'),
	(12, 'category_delete', 'permissão para deletar categoria', 3, '2020-03-08 02:41:45', '2020-03-08 02:41:45'),
	(13, 'status_view', 'Permissão para visualização de status', 4, '2020-03-08 02:42:25', '2020-03-08 02:42:25'),
	(14, 'status_edit', 'Permissão para edição de status', 4, '2020-03-08 02:43:09', '2020-03-08 02:43:09'),
	(15, 'status_create', 'Permissão para criação de status', 4, '2020-03-08 02:43:38', '2020-03-08 02:43:38'),
	(16, 'status_delete', 'Permissão para deletar status', 4, '2020-03-08 02:43:59', '2020-03-08 02:43:59'),
	(17, 'role_view', 'permissão para visualização de perfis', 5, '2020-03-08 02:44:43', '2020-03-08 02:44:43'),
	(18, 'role_edit', 'Permissão para edição de perfis', 5, '2020-03-08 02:45:10', '2020-03-08 02:45:10'),
	(19, 'role_create', 'Permissão para criação de perfis', 5, '2020-03-08 02:45:45', '2020-03-08 02:45:45'),
	(20, 'role_delete', 'Permissão para deletar perfis', 5, '2020-03-08 02:46:18', '2020-03-08 02:46:18'),
	(21, 'permission_view', 'Permissão para visualização de Permissões', 6, '2020-03-08 02:46:52', '2020-03-08 02:46:52'),
	(22, 'permission_edit', 'Permissão para edição de Permissões', 6, '2020-03-08 02:47:09', '2020-03-08 02:47:09'),
	(23, 'permission_create', 'Permissão para criação de Permissões', 6, '2020-03-08 02:47:32', '2020-03-08 02:47:32'),
	(24, 'permission_delete', 'Permissão para deletar de Permissões', 6, '2020-03-08 02:47:56', '2020-03-08 02:47:56'),
	(25, 'user_view', 'permissão para visualização de usuários', 7, '2020-03-08 02:48:44', '2020-03-08 02:48:44'),
	(26, 'user_edit', 'permissão para edição de usuários', 7, '2020-03-08 02:49:03', '2020-03-08 02:49:03'),
	(27, 'user_create', 'permissão para criação de usuários', 7, '2020-03-08 02:49:23', '2020-03-08 02:49:23'),
	(28, 'user_delete', 'permissão para deletar usuários', 7, '2020-03-08 02:49:43', '2020-03-08 02:49:43'),
	(29, 'user_view_admin', 'Visualização  de usuários para administradores de produtoras', 7, '2020-07-20 14:22:43', '2020-07-20 14:22:43'),
	(30, 'user_view_coordenador', 'Visualização  de usuários para coordenadores de produtoras', 7, '2020-07-20 14:23:50', '2020-07-20 14:38:57'),
	(31, 'user_view_self', 'Visualização  do próprio perfil', 7, '2020-07-20 14:25:38', '2020-07-20 14:25:38'),
	(32, 'user_view_any', 'Pode ver muitos usuários', 7, '2020-07-20 14:55:40', '2020-07-20 14:55:40'),
	(33, 'role_view_coordenador', 'Visualização de roles hierarquicamente abaixo do perfil coordenador', 5, '2020-07-21 14:57:25', '2020-07-21 14:57:25'),
	(34, 'role_view_admin', 'Visualização de roles hierarquicamente abaixo do perfil de admin', 5, '2020-07-21 14:57:57', '2020-07-21 14:57:57');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.permission_role: ~48 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 1),
	(5, 9, 1),
	(6, 11, 1),
	(8, 26, 1),
	(9, 1, 2),
	(10, 2, 2),
	(11, 9, 2),
	(12, 11, 2),
	(13, 1, 3),
	(14, 2, 3),
	(15, 3, 3),
	(16, 9, 3),
	(17, 10, 3),
	(18, 11, 3),
	(19, 13, 3),
	(20, 17, 3),
	(21, 18, 3),
	(22, 19, 3),
	(23, 21, 3),
	(24, 22, 3),
	(25, 23, 3),
	(29, 1, 4),
	(30, 2, 4),
	(31, 3, 4),
	(32, 4, 4),
	(33, 9, 4),
	(34, 10, 4),
	(35, 11, 4),
	(36, 12, 4),
	(37, 13, 4),
	(38, 14, 4),
	(39, 15, 4),
	(40, 16, 4),
	(42, 26, 4),
	(43, 27, 4),
	(44, 28, 4),
	(46, 27, 3),
	(48, 26, 3),
	(51, 26, 2),
	(53, 31, 1),
	(54, 31, 2),
	(55, 30, 3),
	(56, 29, 4),
	(57, 25, 1),
	(58, 25, 2),
	(59, 25, 3),
	(60, 25, 4),
	(61, 17, 4),
	(62, 18, 4),
	(63, 19, 4),
	(64, 20, 4),
	(65, 33, 3),
	(66, 34, 4);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revisor` int(10) unsigned DEFAULT NULL,
  `date_review` timestamp NULL DEFAULT NULL,
  `publisher` int(10) unsigned DEFAULT NULL,
  `date_published` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_revisor_publisher_title_index` (`revisor`,`publisher`,`title`),
  KEY `posts_status_id_foreign` (`status_id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.posts: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `user_id`, `status_id`, `title`, `description`, `image`, `revisor`, `date_review`, `publisher`, `date_published`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'Como incluir um post no markcontent', 'Se você tiver permissão de incluir um post, vá no menu "Post", clica na sessão "Post" e no botão verde com um sinal de "+". Inclua o titulo e escreva seu post.\r\nNão se esqueça de selecionar uma dica e um status', NULL, NULL, NULL, NULL, NULL, '2020-05-01 14:45:47', '2020-05-01 14:45:47'),
	(3, 2, 1, 'Como definir permissões aos usuários', 'Primeiro verifique se há algum perfil cadastrado para o usáraio, caso não tenha, cinfigure um ou mais perfís para ele e as permissões já estão determinadas', NULL, NULL, NULL, NULL, NULL, '2020-05-01 16:33:24', '2020-05-01 16:33:24');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.post_category
DROP TABLE IF EXISTS `post_category`;
CREATE TABLE IF NOT EXISTS `post_category` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `post_category_category_id_foreign` (`category_id`),
  KEY `post_category_post_id_foreign` (`post_id`),
  CONSTRAINT `post_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_category_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.post_category: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` (`post_id`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL),
	(3, 1, NULL, NULL);
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.produces
DROP TABLE IF EXISTS `produces`;
CREATE TABLE IF NOT EXISTS `produces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` bigint(20) unsigned NOT NULL,
  `telephone` int(11) unsigned NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produces_cnpj_email_index` (`cnpj`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.produces: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `produces` DISABLE KEYS */;
INSERT INTO `produces` (`id`, `name`, `cnpj`, `telephone`, `email`, `created_at`, `updated_at`) VALUES
	(3, 'Rock Content', 22222222222222, 1123568974, 'rock.contato@rockcontent.com.br', '2020-03-10 01:45:06', '2020-03-10 01:45:06'),
	(5, 'Laribolo', 84697905000152, 1123568974, 'contato@laribolo.com.br', '2020-05-03 20:40:44', '2020-05-03 20:40:44');
/*!40000 ALTER TABLE `produces` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.produce_editorial
DROP TABLE IF EXISTS `produce_editorial`;
CREATE TABLE IF NOT EXISTS `produce_editorial` (
  `produce_id` int(10) unsigned NOT NULL,
  `editorial_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `produce_editorial_produce_id_foreign` (`produce_id`),
  KEY `produce_editorial_editorial_id_foreign` (`editorial_id`),
  CONSTRAINT `produce_editorial_editorial_id_foreign` FOREIGN KEY (`editorial_id`) REFERENCES `editorials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produce_editorial_produce_id_foreign` FOREIGN KEY (`produce_id`) REFERENCES `produces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.produce_editorial: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produce_editorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `produce_editorial` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `produce_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_produce_id_foreign` (`produce_id`),
  CONSTRAINT `roles_produce_id_foreign` FOREIGN KEY (`produce_id`) REFERENCES `produces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.roles: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `produce_id`, `name`, `label`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Editor', 'Usuarios que podem criar seus artigos para oferecer a produtoras', '2020-03-08 02:16:15', '2020-03-08 02:16:15'),
	(2, NULL, 'Revisor', 'Responsaveis para validar artigos de editores de uma produtora', '2020-03-08 02:17:25', '2020-03-08 02:17:25'),
	(3, NULL, 'Coordenador', 'Responsaveis para criara demanda de artigos para publicação', '2020-03-08 02:18:13', '2020-05-01 14:07:40'),
	(4, NULL, 'Admin', 'Responsaveis por uma conta produtora', '2020-03-08 02:18:56', '2020-03-08 02:18:56'),
	(5, NULL, 'Root', 'Desenvolvedor e mantenedor do sistema', '2020-03-08 02:19:24', '2020-03-08 02:19:24');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.role_user
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.role_user: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 5),
	(2, 2, 2),
	(4, 3, 1),
	(7, 4, 4),
	(9, 5, 2),
	(10, 2, 3);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.statuses
DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.statuses: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Editando', '2020-05-01 14:36:36', '2020-05-01 14:36:36'),
	(2, 'Revisando', '2020-05-01 14:36:47', '2020-05-01 14:36:47'),
	(3, 'Reprovado', '2020-05-01 14:36:56', '2020-05-01 14:36:56'),
	(4, 'Publicado', '2020-05-01 14:37:03', '2020-05-01 14:37:03');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` bigint(20) DEFAULT NULL,
  `cpf` bigint(20) DEFAULT NULL,
  `cnpj` bigint(20) DEFAULT NULL,
  `photo` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_cpf_unique` (`cpf`),
  UNIQUE KEY `users_cnpj_unique` (`cnpj`),
  KEY `users_cnpj_cpf_name_email_index` (`cnpj`,`cpf`,`name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.users: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `telephone`, `cpf`, `cnpj`, `photo`, `active`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Adamo Avelino', 'adamo.avelino@gmail.com', NULL, 31882104854, NULL, 'public/MJxfMVkaN8L5r86pVa0EUEEtuaAIPFp26OMPg2b4.jpeg', 1, '$2y$10$.6v01eMzSvrMgmhYVDigE.2fy8/oVlumWb6WQQvK/jWJu.85rxfCG', 'Iq9VXqfZpAVrmbCI5vCjFEE3BK2HHhsYY57TsVNg4Bd3jULluDmFlQZUCYh0', '2020-03-08 02:15:54', '2020-06-17 03:07:14'),
	(2, 'Ana Beatriz', 'ana.beatriz@gmail.com.br', 1123568974, NULL, NULL, 'public/dQNoI725aQm6wUUYKvFjJKSGdMcauliXqcTW9Zyj.jpeg', 1, '$2y$10$ChZLPJeM39DLS07YUnMzfOA9VgjdjVciTxfVIrV5gvrX1ZO.mG3yC', 'cvXKEM4fR7hRRiRVcWlMyVDkvjUUNLh3A0ILeGEjEdP8Iag5R8rd1Tsev0K2', '2020-03-08 03:02:41', '2020-07-21 04:45:54'),
	(3, 'Maira Edurada', 'maria.eduarda@gmail.com', 1156897415, NULL, NULL, NULL, 1, '$2y$10$zudpAdJqurh3YFzKRk9Lw.KHdW9QrWKUHS6EKYnvN/WVcQoeUzvre', 'trIaCB2qWfS2cpDedbQF7ld23hjEL41pKir35pfXpQtE84IsqJebTp4F2fSC', '2020-05-01 20:28:15', '2020-07-21 04:57:57'),
	(4, 'Larissa', 'larissa@gmail.com', 11996584123, 32659874125, NULL, 'public/CQPBtQXAx7b9qkJfHvZJA5Anr7bCrA59wHLeZ8TG.jpeg', 1, '$2y$10$iOqLZ2C6TkJ3QDwP9ub4TOYm89p7XS4SRAi4pp9YMXz8DqNIefdOu', 'tPRmckwLG1ogGZbYGdHoM8M55rMoI7rEf1792FOcdNjruzUt17yU1k46pqv2', '2020-05-03 20:33:56', '2020-06-24 21:01:30'),
	(5, 'Cida', 'maria.apareceida@gmail.com', NULL, NULL, NULL, NULL, 1, '$2y$10$/f1CTEaL6ZG/Xch7B26k1ui1lahFrKrDJpRbB7UZAI8rbDii0gPm6', '4mLW7pk2h6md3a2MYn1sG0NVR03cOlcOOQJfLQBqVA0Rir23ey15KkLMkvU5', '2020-05-03 23:34:16', '2020-05-03 23:34:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Copiando estrutura para tabela banco.user_produce
DROP TABLE IF EXISTS `user_produce`;
CREATE TABLE IF NOT EXISTS `user_produce` (
  `produce_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  KEY `user_produce_produce_id_foreign` (`produce_id`),
  KEY `user_produce_user_id_foreign` (`user_id`),
  CONSTRAINT `user_produce_produce_id_foreign` FOREIGN KEY (`produce_id`) REFERENCES `produces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_produce_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela banco.user_produce: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `user_produce` DISABLE KEYS */;
INSERT INTO `user_produce` (`produce_id`, `user_id`) VALUES
	(5, 4),
	(5, 2),
	(5, 5),
	(5, 3);
/*!40000 ALTER TABLE `user_produce` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
