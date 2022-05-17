-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2021 at 04:27 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskit`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add company', 7, 'add_company'),
(26, 'Can change company', 7, 'change_company'),
(27, 'Can delete company', 7, 'delete_company'),
(28, 'Can view company', 7, 'view_company'),
(29, 'Can add gender', 8, 'add_gender'),
(30, 'Can change gender', 8, 'change_gender'),
(31, 'Can delete gender', 8, 'delete_gender'),
(32, 'Can view gender', 8, 'view_gender'),
(33, 'Can add names', 9, 'add_names'),
(34, 'Can change names', 9, 'change_names'),
(35, 'Can delete names', 9, 'delete_names'),
(36, 'Can view names', 9, 'view_names'),
(37, 'Can add rating', 10, 'add_rating'),
(38, 'Can change rating', 10, 'change_rating'),
(39, 'Can delete rating', 10, 'delete_rating'),
(40, 'Can view rating', 10, 'view_rating'),
(41, 'Can add username and pass', 11, 'add_usernameandpass'),
(42, 'Can change username and pass', 11, 'change_usernameandpass'),
(43, 'Can delete username and pass', 11, 'delete_usernameandpass'),
(44, 'Can view username and pass', 11, 'view_usernameandpass'),
(45, 'Can add position', 12, 'add_position'),
(46, 'Can change position', 12, 'change_position'),
(47, 'Can delete position', 12, 'delete_position'),
(48, 'Can view position', 12, 'view_position'),
(49, 'Can add status', 13, 'add_status'),
(50, 'Can change status', 13, 'change_status'),
(51, 'Can delete status', 13, 'delete_status'),
(52, 'Can view status', 13, 'view_status'),
(53, 'Can add task comments', 14, 'add_taskcomments'),
(54, 'Can change task comments', 14, 'change_taskcomments'),
(55, 'Can delete task comments', 14, 'delete_taskcomments'),
(56, 'Can view task comments', 14, 'view_taskcomments'),
(57, 'Can add task file', 15, 'add_taskfile'),
(58, 'Can change task file', 15, 'change_taskfile'),
(59, 'Can delete task file', 15, 'delete_taskfile'),
(60, 'Can view task file', 15, 'view_taskfile'),
(61, 'Can add task rating', 16, 'add_taskrating'),
(62, 'Can change task rating', 16, 'change_taskrating'),
(63, 'Can delete task rating', 16, 'delete_taskrating'),
(64, 'Can view task rating', 16, 'view_taskrating'),
(65, 'Can add tasks', 17, 'add_tasks'),
(66, 'Can change tasks', 17, 'change_tasks'),
(67, 'Can delete tasks', 17, 'delete_tasks'),
(68, 'Can view tasks', 17, 'view_tasks'),
(69, 'Can add title', 18, 'add_title'),
(70, 'Can change title', 18, 'change_title'),
(71, 'Can delete title', 18, 'delete_title'),
(72, 'Can view title', 18, 'view_title');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$OM9BR3N66TARDv1nYfKmXR$yUMqfqcBdG9S8XOfGXx0rzAZDua7hgGBJLPdpo6QPmo=', '2021-07-18 09:38:50.665898', 1, 'faiyaz', '', '', 'faiyazkabir50@gmail.com', 1, 1, '2021-07-18 09:38:34.929480');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `comapny_name` varchar(45) NOT NULL,
  `company_registered_date` datetime NOT NULL,
  `company_id_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`comapny_name`, `company_registered_date`, `company_id_key`) VALUES
('linkedin', '2021-07-18 09:47:27', 2),
('Bangladesh Railway', '2021-08-07 18:56:24', 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-07-18 09:46:02.434517', '1', 'Names object (1)', 1, '[{\"added\": {}}]', 9, 1),
(2, '2021-07-18 09:46:31.847316', '1', 'UsernameAndPass object (1)', 1, '[{\"added\": {}}]', 11, 1),
(3, '2021-07-18 09:47:29.250066', '1', 'Company object (1)', 1, '[{\"added\": {}}]', 7, 1),
(4, '2021-07-18 10:11:50.436606', '2', 'UsernameAndPass object (2)', 2, '[{\"changed\": {\"fields\": [\"Emp id\", \"Emp username\"]}}]', 11, 1),
(5, '2021-07-18 14:23:49.889893', '133', 'UsernameAndPass object (133)', 3, '', 11, 1),
(6, '2021-07-18 14:23:53.847777', '134', 'UsernameAndPass object (134)', 3, '', 11, 1),
(7, '2021-07-18 14:24:08.594898', '135', 'UsernameAndPass object (135)', 1, '[{\"added\": {}}]', 11, 1),
(8, '2021-07-18 14:24:32.256928', '135', 'UsernameAndPass object (135)', 3, '', 11, 1),
(9, '2021-07-18 14:24:35.373203', '1', 'UsernameAndPass object (1)', 3, '', 11, 1),
(10, '2021-07-18 14:24:42.171832', '136', 'UsernameAndPass object (136)', 1, '[{\"added\": {}}]', 11, 1),
(11, '2021-07-18 14:24:51.653437', '136', 'UsernameAndPass object (136)', 3, '', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'accounts', 'company'),
(8, 'accounts', 'gender'),
(9, 'accounts', 'names'),
(12, 'accounts', 'position'),
(10, 'accounts', 'rating'),
(11, 'accounts', 'usernameandpass'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(13, 'task', 'status'),
(14, 'task', 'taskcomments'),
(15, 'task', 'taskfile'),
(16, 'task', 'taskrating'),
(17, 'task', 'tasks'),
(18, 'task', 'title');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2021-07-16 13:34:31.023044'),
(2, 'contenttypes', '0001_initial', '2021-07-16 13:34:31.147988'),
(3, 'auth', '0001_initial', '2021-07-16 13:34:32.507045'),
(4, 'admin', '0001_initial', '2021-07-16 13:34:32.772609'),
(5, 'admin', '0002_logentry_remove_auto_add', '2021-07-16 13:34:32.788230'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-16 13:34:32.803850'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-07-16 13:34:32.991331'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-07-16 13:34:33.319388'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-07-16 13:34:33.366244'),
(10, 'auth', '0004_alter_user_username_opts', '2021-07-16 13:34:33.381840'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-07-16 13:34:33.491190'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-07-16 13:34:33.491190'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-07-16 13:34:33.507177'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-07-16 13:34:33.631816'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-07-16 13:34:33.741450'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-07-16 13:34:33.772405'),
(17, 'auth', '0011_update_proxy_permissions', '2021-07-16 13:34:33.787995'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-07-16 13:34:33.928588'),
(19, 'sessions', '0001_initial', '2021-07-16 13:34:34.116204'),
(20, 'accounts', '0002_position', '2021-07-18 09:44:22.723113'),
(21, 'task', '0001_initial', '2021-07-20 19:14:43.232736');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3ffcxl3km733oaw3j1uwtkjrqd6feb6i', '.eJyrViotTi3KTFGyMtQBM_MSc1OVrJTSEjMrE6sMTQ0NlHSUUnMLoMJuYGEF78SkzCIliIb4gvzizJLM_DwlKxMdpeT83ILEvMp4sIm1AMb7H3o:1mJkbg:6ZRURVsjMEUJLX3vnaHSchWs5zjd4KLfE7i4UFeP62U', '2021-09-10 22:45:52.185672'),
('cu6kcpizg9rrx157ciyyj7nl8wxdiv98', '.eJyrViotTi3KTFGyMjQz1AFz8hJzU5WslEpSi0tAXENDAyUdpdTcAnRxA1OgeHJ-bkFiXmU82ASI_viC_OLMksz8PCUr41oAChQgTg:1m7a9Z:66vltuuB5BDZqH78kQIk-dm4XdUREQEVQn8YZtwwAtI', '2021-08-08 09:10:33.647770'),
('fxw02gsa65is92pkkei0t6nzd11kxbr6', '.eJxdj8ESwiAMRP-Fs9MhBVrq0bvfwASasVULnUIPjuO_C7YH9bhvk83myQyuaTBrpMWMPTsyYIdvZtHdyBejv6K_hMoFn5bRVmWk2t1YnUNP99M--xMwYBzyNpECqboaHefcKVDYCBJcOtS8a7XurNWidVrJWmhEa21DWkqymUCLpVWJKxWhgU2YOcQxjcGzo9iIx4nysUQxFQnA8x5N8z_nKnMXphn94_M2vN4idVa7:1m6NKJ:BOIfxA4trPB3xnDzoc_70P3wY2HjSuhWahYwQqWuPog', '2021-08-05 01:16:39.296235'),
('jr0mr6w9p6bwdjgi1y2zn1bhoaz5lj4v', '.eJyrViotTi3KTFGyMjQz1AFz8hJzU5WslEpSi0tAXENDAyUdpdTcAnRxA1OgeHJ-bkFiXmU82ASI_viC_OLMksz8PCUr41oAChQgTg:1m7a9V:QVZp-dQfQLewRyyDtc4hzQ5pMjAC1jOndfBBCT7OVGM', '2021-08-08 09:10:29.181151');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `gender_primary_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `gender` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`gender_primary_id`, `emp_id`, `gender_id`, `gender`) VALUES
(1, 1, 1, 'male'),
(8, 156, 1, 'Male'),
(9, 159, 1, 'Male'),
(10, 160, 1, 'Male'),
(11, 161, 1, 'Male'),
(12, 162, 1, 'Male'),
(13, 163, 1, 'Male'),
(14, 164, 1, 'Male'),
(15, 165, 1, 'Male'),
(16, 166, 1, 'Male'),
(17, 167, 2, 'Female'),
(18, 168, 1, 'Male'),
(19, 169, 1, 'Male'),
(20, 170, 1, 'Male'),
(21, 171, 1, 'Male'),
(22, 172, 1, 'Male'),
(23, 173, 1, 'Male'),
(24, 174, 1, 'Male'),
(25, 175, 1, 'Male'),
(26, 176, 1, 'Male'),
(27, 177, 1, 'Male'),
(28, 178, 1, 'Male'),
(29, 179, 1, 'Male'),
(30, 180, 1, 'Male'),
(31, 181, 1, 'Male'),
(32, 182, 1, 'Male'),
(33, 183, 1, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `names`
--

CREATE TABLE `names` (
  `names_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(127) NOT NULL,
  `emp_contact_Number` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `names`
--

INSERT INTO `names` (`names_id`, `emp_id`, `emp_name`, `emp_contact_Number`, `company_id`) VALUES
(1, 1, 'Faiyaz Kabir', 1873842041, 1),
(12, 156, 'random', 1819220250, 1),
(13, 159, 'testuser1', 19182874, 1),
(14, 160, 'testuser3', 1928310293, 1),
(15, 161, 'testuser105', 10128381, 1),
(16, 162, 'Modon Mohon Mojumder', 1234567890, 2),
(17, 163, 'Golam Mostafa Rumi', 1234567890, 2),
(18, 164, 'Khandaker Mohammad Tarek', 1234567890, 2),
(19, 165, 'Bashir Ahmed Choudhury', 1234567890, 2),
(20, 166, 'Anwar Ahmed', 1234567890, 2),
(21, 167, 'Abida Sultana', 1234567890, 2),
(22, 168, 'Fayez Ahmed', 1234567890, 2),
(23, 169, 'Nironjon Dey', 1234567890, 2),
(24, 170, 'Ahmed Saiful Islam', 1234567890, 2),
(25, 171, 'Zahid Hossain', 1234567890, 2),
(26, 172, 'Awal Talukder Rajib', 1234567890, 2),
(27, 173, 'Mizanur Rahman', 1234567890, 2),
(28, 174, 'Shamim Ahmed', 1234567890, 2),
(29, 175, 'Syed Mohiuddin Ahmed', 1234567890, 2),
(30, 176, 'Shahzalal Majhi', 1234567890, 2),
(31, 177, 'Gurupodo Das', 1234567890, 2),
(32, 178, 'Tofajjol Ahmed', 1234567890, 2),
(33, 179, 'Syed Kamrul Haque', 1234567890, 2),
(34, 180, 'Md. Zahid Hussain', 1711229555, 2),
(35, 181, 'hideyoshi takata', 1239871, 1),
(36, 182, 'random name', 1928310293, 1),
(37, 183, 'Atil Rakin', 1234567890, 2);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_position_id` int(11) NOT NULL,
  `emp_position_name` varchar(32) NOT NULL,
  `company_id` int(11) NOT NULL,
  `manager_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `emp_id`, `emp_position_id`, `emp_position_name`, `company_id`, `manager_id`) VALUES
(1, 1, 4, 'admin', 1, NULL),
(12, 156, 1, 'employee', 1, '159'),
(13, 159, 2, 'sub-manager', 1, '161'),
(14, 160, 2, 'sub-manager', 1, '161'),
(15, 161, 3, 'manager', 1, NULL),
(16, 169, 1, 'employee', 2, '165'),
(17, 170, 1, 'employee', 2, '165'),
(18, 171, 1, 'employee', 2, '165'),
(19, 172, 1, 'employee', 2, '165'),
(20, 173, 1, 'employee', 2, '166'),
(21, 174, 1, 'employee', 2, '166'),
(22, 175, 1, 'employee', 2, '167'),
(23, 176, 1, 'employee', 2, '167'),
(24, 177, 1, 'employee', 2, '167'),
(25, 178, 1, 'employee', 2, '168'),
(26, 179, 1, 'employee', 2, '168'),
(27, 165, 2, 'sub-manager', 2, '162'),
(28, 166, 2, 'sub-manager', 2, '163'),
(29, 167, 2, 'sub-manager', 2, '164'),
(30, 168, 2, 'sub-manager', 2, '162'),
(31, 162, 3, 'manager', 2, NULL),
(32, 163, 3, 'manager', 2, NULL),
(33, 164, 3, 'manager', 2, NULL),
(34, 180, 4, 'admin', 2, NULL),
(35, 181, 1, 'employee', 1, NULL),
(36, 182, 1, 'employee', 1, NULL),
(37, 183, 1, 'employee', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `emp_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `emp_id`, `emp_rating`) VALUES
(7, 166, 0),
(9, 167, 0),
(10, 159, 0),
(11, 160, 0),
(12, 168, 0),
(13, 165, 0),
(14, 179, 0),
(15, 183, 0),
(16, 181, 0),
(17, 178, 0),
(18, 177, 0),
(19, 156, 0),
(20, 169, 0),
(21, 170, 0),
(22, 171, 0),
(23, 172, 0),
(24, 173, 0),
(25, 174, 0),
(26, 175, 0),
(27, 176, 0),
(28, 182, 0);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `task_id`, `task_status`) VALUES
(9, 9, 'processing'),
(10, 10, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `task_recepient_id` int(11) NOT NULL,
  `task_provider_id` int(11) NOT NULL,
  `issue_date` date NOT NULL COMMENT 'YYYY-MM-DD',
  `deadline_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `task_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `task_recepient_id`, `task_provider_id`, `issue_date`, `deadline_date`, `completion_date`, `task_desc`) VALUES
(9, 169, 165, '2021-08-28', '2021-08-28', '2021-08-28', 'check for any errors in the project'),
(10, 169, 165, '2021-08-28', '2021-08-31', NULL, 'check whether the trains in the kamlapur railway station are leaving and arriving on time');

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `task_comments_primary` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `commenter_id` int(11) NOT NULL,
  `task_comment` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task_comments`
--

INSERT INTO `task_comments` (`task_comments_primary`, `task_id`, `commenter_id`, `task_comment`) VALUES
(3, 9, 169, 'On it but will take some time'),
(4, 9, 169, 'Will have it done by monday'),
(5, 10, 169, 'cannot finish it on time but will try');

-- --------------------------------------------------------

--
-- Table structure for table `task_file`
--

CREATE TABLE `task_file` (
  `task_file_id` int(11) NOT NULL,
  `task_id` varchar(45) NOT NULL,
  `file_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `task_rating`
--

CREATE TABLE `task_rating` (
  `task_rating_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `task_title_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`task_title_id`, `task_id`, `task_title`) VALUES
(9, 9, 'revise the plans for the metro railway'),
(10, 10, 'check on the status of the station at kamlapur railway station');

-- --------------------------------------------------------

--
-- Table structure for table `username_and_pass`
--

CREATE TABLE `username_and_pass` (
  `emp_id` int(11) NOT NULL,
  `emp_username` varchar(127) NOT NULL,
  `emp_pass` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `username_and_pass`
--

INSERT INTO `username_and_pass` (`emp_id`, `emp_username`, `emp_pass`) VALUES
(1, 'faiyaz1510', 'addidas05'),
(156, 'random123', '1234'),
(159, 'testuser108', '1234'),
(160, 'testuser109', '1234'),
(161, 'testuser110', '1234'),
(162, 'mmm162', '1234'),
(163, 'gmr163', '1234'),
(164, 'kmt164', '1234'),
(165, 'bac165', '1234'),
(166, 'aa166', '1234'),
(167, 'as167', '1234'),
(168, 'fa168', '1234'),
(169, 'nd169', '1234'),
(170, 'asi170', '1234'),
(171, 'zh171', '1234'),
(172, 'atr172', '1234'),
(173, 'mr173', '1234'),
(174, 'sa174', '1234'),
(175, 'sma175', '1234'),
(176, 'sm176', '1234'),
(177, 'gd177', '1234'),
(178, 'ta178', '1234'),
(179, 'skh179', '1234'),
(180, 'mzh180', '1234'),
(181, 'tkt', '1312'),
(182, 'testemployee', '1234'),
(183, 'atl129', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id_key`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_primary_id`);

--
-- Indexes for table `names`
--
ALTER TABLE `names`
  ADD PRIMARY KEY (`names_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`task_comments_primary`);

--
-- Indexes for table `task_file`
--
ALTER TABLE `task_file`
  ADD PRIMARY KEY (`task_file_id`);

--
-- Indexes for table `task_rating`
--
ALTER TABLE `task_rating`
  ADD PRIMARY KEY (`task_rating_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`task_title_id`);

--
-- Indexes for table `username_and_pass`
--
ALTER TABLE `username_and_pass`
  ADD PRIMARY KEY (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_primary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `names`
--
ALTER TABLE `names`
  MODIFY `names_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `task_comments_primary` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `task_file`
--
ALTER TABLE `task_file`
  MODIFY `task_file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_rating`
--
ALTER TABLE `task_rating`
  MODIFY `task_rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `task_title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `username_and_pass`
--
ALTER TABLE `username_and_pass`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
