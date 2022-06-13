-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 26, 2021 alle 11:56
-- Versione del server: 10.4.19-MariaDB
-- Versione PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keycloak`
--
USE keycloak;
-- --------------------------------------------------------

--
-- Dump dei dati per la tabella `keycloak_role`
--

INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('164968461921338650', 'yourstore', b'0', "USER_SEARCH", '164968461921338650', 'yourstore', NULL, NULL),
('164968461921338651', 'yourstore', b'0', "USER_READ", '164968461921338651', 'yourstore', NULL, NULL),
('164968461921338652', 'yourstore', b'0', "USER_CREATE", '164968461921338652', 'yourstore', NULL, NULL),
('164968461921338653', 'yourstore', b'0', "USER_UPDATE", '164968461921338653', 'yourstore', NULL, NULL),
('164968461921338654', 'yourstore', b'0', "USER_DELETE", '164968461921338654', 'yourstore', NULL, NULL),
('164968461921338655', 'yourstore', b'0', "USER_REPORT", '164968461921338655', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES
('164968461921338650', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921338651', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921338652', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921338653', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921338654', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921338655', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');
INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('1649684619213386562', 'yourstore', b'0', "USER_FIND_BY_THE_ORDER_OBJECT_KEY" , '1649684619213386562', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES ('1649684619213386562', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');   


INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('164968461921325620', 'yourstore', b'0', "ORDER_SEARCH", '164968461921325620', 'yourstore', NULL, NULL),
('164968461921325621', 'yourstore', b'0', "ORDER_READ", '164968461921325621', 'yourstore', NULL, NULL),
('164968461921325622', 'yourstore', b'0', "ORDER_CREATE", '164968461921325622', 'yourstore', NULL, NULL),
('164968461921325623', 'yourstore', b'0', "ORDER_UPDATE", '164968461921325623', 'yourstore', NULL, NULL),
('164968461921325624', 'yourstore', b'0', "ORDER_DELETE", '164968461921325624', 'yourstore', NULL, NULL),
('164968461921325625', 'yourstore', b'0', "ORDER_REPORT", '164968461921325625', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES
('164968461921325620', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921325621', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921325622', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921325623', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921325624', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921325625', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');
INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('1649684619213256265', 'yourstore', b'0', "ORDER_FIND_BY_USER", '1649684619213256265', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES ('1649684619213256265', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');

INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('1649684619213256250', 'yourstore', b'0', "ORDER_FIND_BY_THE_ORDER_ITEM_OBJECT_KEY" , '1649684619213256250', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES ('1649684619213256250', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');   


INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('164968461921311500', 'yourstore', b'0', "ORDER_ITEM_SEARCH", '164968461921311500', 'yourstore', NULL, NULL),
('164968461921311501', 'yourstore', b'0', "ORDER_ITEM_READ", '164968461921311501', 'yourstore', NULL, NULL),
('164968461921311502', 'yourstore', b'0', "ORDER_ITEM_CREATE", '164968461921311502', 'yourstore', NULL, NULL),
('164968461921311503', 'yourstore', b'0', "ORDER_ITEM_UPDATE", '164968461921311503', 'yourstore', NULL, NULL),
('164968461921311504', 'yourstore', b'0', "ORDER_ITEM_DELETE", '164968461921311504', 'yourstore', NULL, NULL),
('164968461921311505', 'yourstore', b'0', "ORDER_ITEM_REPORT", '164968461921311505', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES
('164968461921311500', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921311501', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921311502', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921311503', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921311504', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921311505', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');
INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('1649684619213115062', 'yourstore', b'0', "ORDER_ITEM_FIND_BY_ORDER", '1649684619213115062', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES ('1649684619213115062', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');

INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('1649684619213115030', 'yourstore', b'0', "ORDER_ITEM_FIND_BY_PRODUCT", '1649684619213115030', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES ('1649684619213115030', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');


INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('164968461921398300', 'yourstore', b'0', "PRODUCT_SEARCH", '164968461921398300', 'yourstore', NULL, NULL),
('164968461921398301', 'yourstore', b'0', "PRODUCT_READ", '164968461921398301', 'yourstore', NULL, NULL),
('164968461921398302', 'yourstore', b'0', "PRODUCT_CREATE", '164968461921398302', 'yourstore', NULL, NULL),
('164968461921398303', 'yourstore', b'0', "PRODUCT_UPDATE", '164968461921398303', 'yourstore', NULL, NULL),
('164968461921398304', 'yourstore', b'0', "PRODUCT_DELETE", '164968461921398304', 'yourstore', NULL, NULL),
('164968461921398305', 'yourstore', b'0', "PRODUCT_REPORT", '164968461921398305', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES
('164968461921398300', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921398301', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921398302', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921398303', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921398304', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('164968461921398305', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');
INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('1649684619213983050', 'yourstore', b'0', "PRODUCT_FIND_BY_THE_ORDER_ITEM_OBJECT_KEY" , '1649684619213983050', 'yourstore', NULL, NULL);

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES ('1649684619213983050', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');   



COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;