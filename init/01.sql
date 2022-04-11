-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 26, 2021 alle 11:27
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

-- --------------------------------------------------------

--
-- Struttura della tabella `admin_event_entity`
--

CREATE TABLE `admin_event_entity` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `associated_policy`
--

CREATE TABLE `associated_policy` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `authentication_execution`
--

CREATE TABLE `authentication_execution` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `authentication_execution`
--

INSERT INTO `authentication_execution` (`ID`, `ALIAS`, `AUTHENTICATOR`, `REALM_ID`, `FLOW_ID`, `REQUIREMENT`, `PRIORITY`, `AUTHENTICATOR_FLOW`, `AUTH_FLOW_ID`, `AUTH_CONFIG`) VALUES
('015f7c13-aacd-4ea7-af33-e60a536eb950', NULL, 'idp-create-user-if-unique', 'master', '4e401db3-105f-4f71-8bf6-cf0540e9b2a2', 2, 10, b'0', NULL, 'e3defff9-c64d-4f6a-a436-99954478efb1'),
('06aa7301-738e-4199-afbf-28f5593c68c0', NULL, 'idp-username-password-form', 'master', 'bd1cc057-c86c-46d5-bdd0-6755ab2d29ef', 0, 10, b'0', NULL, NULL),
('06fc602a-dac9-481d-bb49-bcc7815efbf7', NULL, 'client-secret', 'yourstore', '01844f76-fab3-45ca-880a-73b78c214dbc', 2, 10, b'0', NULL, NULL),
('096f8c83-7981-4f70-a9fd-4a9c9628f5c0', NULL, 'conditional-user-configured', 'master', '2e5526d6-7ed6-44a4-94f6-29de505f95ce', 0, 10, b'0', NULL, NULL),
('0a15c928-8d0a-407d-b3e8-072a9aff6122', NULL, 'direct-grant-validate-otp', 'yourstore', 'e2da5fc2-1ca4-4d55-9434-24e0fcb29261', 0, 20, b'0', NULL, NULL),
('0acb0840-5988-487c-8d2f-e58f420bd994', NULL, NULL, 'master', 'bd1cc057-c86c-46d5-bdd0-6755ab2d29ef', 1, 20, b'1', '7d793ac5-b660-4800-9554-e1a6698581d9', NULL),
('0b763d95-3c49-4e00-a1df-ff31091ef373', NULL, NULL, 'master', '96ae4141-6a82-4ea0-bb2f-a876bc380924', 1, 30, b'1', '2cc67243-da55-40b1-8c01-e7a0bd965357', NULL),
('0d827049-dfc7-44d6-9cb2-6b4f3ebde956', NULL, 'direct-grant-validate-password', 'yourstore', 'ef32da8a-4a86-49ec-b7bd-3d752e4f394c', 0, 20, b'0', NULL, NULL),
('0f625bd8-5431-42a0-b45a-dded0a67a60a', NULL, NULL, 'yourstore', '3c2de22e-eb86-47d4-b3ba-5982f0139a01', 1, 20, b'1', '580810e2-6a24-44b9-a771-6b1eaecf2fd9', NULL),
('104190c4-dd69-4265-9330-22a4b784085b', NULL, 'direct-grant-validate-username', 'master', '96ae4141-6a82-4ea0-bb2f-a876bc380924', 0, 10, b'0', NULL, NULL),
('11bff5df-4309-4361-a9ef-6bd23ba94509', NULL, NULL, 'master', '4e401db3-105f-4f71-8bf6-cf0540e9b2a2', 2, 20, b'1', '04407ffb-3bbb-440a-ae27-1dfb605833e6', NULL),
('1ba7594c-abef-4b79-9b29-dc10c8b637ab', NULL, 'idp-review-profile', 'master', '5bcdada1-b55f-4470-9f68-dffd7022e837', 0, 10, b'0', NULL, '36e942a5-5031-438f-9779-0cac8f733107'),
('1c07cac9-d326-4477-a984-fda1f488dc8d', NULL, NULL, 'master', '62339d01-ea34-47d4-bb93-67b15fa03daa', 2, 20, b'1', 'bd1cc057-c86c-46d5-bdd0-6755ab2d29ef', NULL),
('1d4ad5ef-53d9-449d-a052-ada26b689b2e', NULL, 'http-basic-authenticator', 'master', '40fcb3ee-c6f4-4aa6-814c-ce88a4e31139', 0, 10, b'0', NULL, NULL),
('2000f05a-767b-4a1d-9553-9c6f69bff4f8', NULL, 'auth-spnego', 'yourstore', 'ca989664-4c7c-4517-b575-9bdeb7ce065f', 3, 20, b'0', NULL, NULL),
('22258f9a-5b2f-446b-a81b-52c955fcd3a1', NULL, 'registration-password-action', 'master', '4fd27334-d2c6-4d32-8911-5400d04402b9', 0, 50, b'0', NULL, NULL),
('27056659-1d24-481a-a39d-63b1ca9a5685', NULL, 'registration-page-form', 'yourstore', '1509b59c-6381-4eb8-bd23-211fbf1de267', 0, 10, b'1', '0c48c2f5-1843-4430-901b-c964bbc05280', NULL),
('2d8ea826-d42a-4d5e-b3ee-561b86c7e892', NULL, 'auth-username-password-form', 'yourstore', '2252e55d-08dc-47c3-8db5-306ef37ee4c2', 0, 10, b'0', NULL, NULL),
('2ea05998-0742-4ce1-93c6-772a710afe75', NULL, 'conditional-user-configured', 'master', '2cc67243-da55-40b1-8c01-e7a0bd965357', 0, 10, b'0', NULL, NULL),
('308e78e5-104f-48fd-9d5e-8c314dc19c2b', NULL, 'client-jwt', 'master', '817832b3-3bd1-49e2-b308-45e6686c2c52', 2, 20, b'0', NULL, NULL),
('376b072d-fdca-438e-a8e0-407be619fa0f', NULL, 'registration-profile-action', 'yourstore', '0c48c2f5-1843-4430-901b-c964bbc05280', 0, 40, b'0', NULL, NULL),
('389546be-703e-48e1-947d-39efa0bc6bea', NULL, 'reset-otp', 'master', '2e5526d6-7ed6-44a4-94f6-29de505f95ce', 0, 20, b'0', NULL, NULL),
('3b93f066-defc-4949-a2db-17d92af6c835', NULL, 'no-cookie-redirect', 'yourstore', '10d6f816-ffb0-4e46-b07a-8adb4ceeccbf', 0, 10, b'0', NULL, NULL),
('3d7215d4-f203-4ef0-91bc-c3113a35be1a', NULL, 'registration-password-action', 'yourstore', '0c48c2f5-1843-4430-901b-c964bbc05280', 0, 50, b'0', NULL, NULL),
('42f412bd-9b08-403c-a666-afdd083a1a97', NULL, 'conditional-user-configured', 'yourstore', 'aec2285e-c543-4f5c-b86b-d2bae0de2722', 0, 10, b'0', NULL, NULL),
('45508721-c4c5-49e3-b010-7d2034d71672', NULL, NULL, 'yourstore', 'd664caab-a3f5-4fcf-95d8-c534a65344b8', 2, 20, b'1', '3c2de22e-eb86-47d4-b3ba-5982f0139a01', NULL),
('45a5a0e6-98b0-40c4-87e0-799e33af4f5a', NULL, NULL, 'master', 'f10376dc-21f7-4fb6-b1d6-f2b1cf2e471d', 1, 40, b'1', '2e5526d6-7ed6-44a4-94f6-29de505f95ce', NULL),
('46c4a30d-5190-4080-9e8c-6fdcc9f6b290', NULL, 'basic-auth', 'master', 'a0a6de04-597b-4d75-a6be-200187a841a2', 0, 10, b'0', NULL, NULL),
('46cebcb2-4f5a-4b97-a0b7-27830b2449f0', NULL, 'auth-cookie', 'yourstore', 'ca989664-4c7c-4517-b575-9bdeb7ce065f', 2, 10, b'0', NULL, NULL),
('48ff134c-29ed-4814-8db6-8339612e30bd', NULL, 'http-basic-authenticator', 'yourstore', '63cf5fc3-658c-4160-9418-8eef219fbac8', 0, 10, b'0', NULL, NULL),
('494fbf52-d8e3-42ef-aa00-3a8585468f16', NULL, 'conditional-user-configured', 'yourstore', '580810e2-6a24-44b9-a771-6b1eaecf2fd9', 0, 10, b'0', NULL, NULL),
('4a0a9b02-8bcd-4101-913c-23c444d92177', NULL, 'auth-spnego', 'master', 'a0a6de04-597b-4d75-a6be-200187a841a2', 3, 30, b'0', NULL, NULL),
('4a67f911-ef78-41bc-bab8-4024de8807f5', NULL, 'idp-email-verification', 'master', '62339d01-ea34-47d4-bb93-67b15fa03daa', 2, 10, b'0', NULL, NULL),
('4d657672-2abf-4ab8-93fd-8bdd4c7f3348', NULL, 'auth-otp-form', 'master', '4b7b4d52-ef10-4aad-acfe-adc433e0fa3f', 0, 20, b'0', NULL, NULL),
('4ebeebdb-4dad-4eb2-8b29-6ddad81ce41e', NULL, NULL, 'yourstore', 'dea0f920-eb0f-4c13-925d-f82c93bfd848', 1, 40, b'1', 'e33dbbd8-7d7b-4775-8100-690e5303a7e0', NULL),
('4f4d2796-0b4d-4f83-9b68-5380fd482662', NULL, 'registration-profile-action', 'master', '4fd27334-d2c6-4d32-8911-5400d04402b9', 0, 40, b'0', NULL, NULL),
('4f922406-c0c4-49a6-b2c0-ae1e0729d84b', NULL, 'idp-username-password-form', 'yourstore', '3c2de22e-eb86-47d4-b3ba-5982f0139a01', 0, 10, b'0', NULL, NULL),
('52183fa6-a39f-48c9-8ebb-869c6c1bdd9a', NULL, 'docker-http-basic-authenticator', 'yourstore', '4f6bad4d-f3db-4268-8a18-4d8c659bd515', 0, 10, b'0', NULL, NULL),
('536c21a6-7f45-4246-afd1-993d162586b0', NULL, 'auth-username-password-form', 'master', '846bb8c2-af4b-4b26-bd08-92d74356b2a3', 0, 10, b'0', NULL, NULL),
('5740db9d-3753-43c5-b2be-ed33e1972280', NULL, 'reset-credential-email', 'yourstore', 'dea0f920-eb0f-4c13-925d-f82c93bfd848', 0, 20, b'0', NULL, NULL),
('5d171a4e-434c-456a-b5a1-40f08e143ed6', NULL, 'basic-auth-otp', 'master', 'a0a6de04-597b-4d75-a6be-200187a841a2', 3, 20, b'0', NULL, NULL),
('5f7bf3b6-22ba-4c91-9168-658e709e2a94', NULL, 'conditional-user-configured', 'master', '7d793ac5-b660-4800-9554-e1a6698581d9', 0, 10, b'0', NULL, NULL),
('6259ad75-47b4-4bb6-84c1-c0b4eeb83aea', NULL, 'conditional-user-configured', 'master', '4b7b4d52-ef10-4aad-acfe-adc433e0fa3f', 0, 10, b'0', NULL, NULL),
('646fd957-5134-498c-9e1b-264099d6e5d5', NULL, NULL, 'master', '846bb8c2-af4b-4b26-bd08-92d74356b2a3', 1, 20, b'1', '4b7b4d52-ef10-4aad-acfe-adc433e0fa3f', NULL),
('68ab23ab-25a8-46b3-bd05-63ab6de1c515', NULL, NULL, 'yourstore', '10d6f816-ffb0-4e46-b07a-8adb4ceeccbf', 0, 20, b'1', '81f0ce66-6f9a-4cf8-b0cd-3c5624ca32c6', NULL),
('6a4d1675-2371-4784-b036-49899f1f7eb6', NULL, 'idp-review-profile', 'yourstore', '2dcea42b-76ae-4530-8ccc-3efc2567064b', 0, 10, b'0', NULL, '1963fc01-1e47-44e0-8a25-ea271932d60f'),
('6ed01549-18b7-4f4d-92cf-aec11bbbc60c', NULL, 'client-x509', 'master', '817832b3-3bd1-49e2-b308-45e6686c2c52', 2, 40, b'0', NULL, NULL),
('72b4d7d1-0586-452c-a21c-217160be221a', NULL, 'client-secret-jwt', 'yourstore', '01844f76-fab3-45ca-880a-73b78c214dbc', 2, 30, b'0', NULL, NULL),
('780adde1-a592-4c24-a0fe-fefafdabcf0d', NULL, 'registration-recaptcha-action', 'master', '4fd27334-d2c6-4d32-8911-5400d04402b9', 3, 60, b'0', NULL, NULL),
('7832f44f-6692-4850-b0cc-daa7ad90cbe6', NULL, 'identity-provider-redirector', 'master', 'b5b2c689-0ef4-45b8-b0de-198fcd050582', 2, 25, b'0', NULL, NULL),
('79d40773-932d-46fb-91fb-943201759b8a', NULL, NULL, 'yourstore', 'ef32da8a-4a86-49ec-b7bd-3d752e4f394c', 1, 30, b'1', 'e2da5fc2-1ca4-4d55-9434-24e0fcb29261', NULL),
('818f8a05-c919-41f5-827c-c1eae3989672', NULL, 'client-jwt', 'yourstore', '01844f76-fab3-45ca-880a-73b78c214dbc', 2, 20, b'0', NULL, NULL),
('83f3a1a7-1aa4-463e-8e8f-d58e0ad0b9f3', NULL, NULL, 'master', '5bcdada1-b55f-4470-9f68-dffd7022e837', 0, 20, b'1', '4e401db3-105f-4f71-8bf6-cf0540e9b2a2', NULL),
('8597827b-d571-4544-b520-6d7fe0e1fca3', NULL, NULL, 'yourstore', 'ca989664-4c7c-4517-b575-9bdeb7ce065f', 2, 30, b'1', '2252e55d-08dc-47c3-8db5-306ef37ee4c2', NULL),
('85d2b0bf-ccd5-499b-adc0-eca7f81c64dd', NULL, NULL, 'master', '04407ffb-3bbb-440a-ae27-1dfb605833e6', 0, 20, b'1', '62339d01-ea34-47d4-bb93-67b15fa03daa', NULL),
('867d6bf5-648f-4bd9-8b41-58e4f497e503', NULL, 'client-x509', 'yourstore', '01844f76-fab3-45ca-880a-73b78c214dbc', 2, 40, b'0', NULL, NULL),
('87d9e6ce-bd5a-4f3f-a2e7-2e68c79c1f10', NULL, 'direct-grant-validate-otp', 'master', '2cc67243-da55-40b1-8c01-e7a0bd965357', 0, 20, b'0', NULL, NULL),
('89546760-c33a-4230-b8f1-49c98550abb7', NULL, 'no-cookie-redirect', 'master', '9d27cb2b-e811-4d32-89d6-2369d7c270a5', 0, 10, b'0', NULL, NULL),
('897e5ad2-7f6a-46db-b0e3-50ab2b291a40', NULL, NULL, 'yourstore', '2252e55d-08dc-47c3-8db5-306ef37ee4c2', 1, 20, b'1', 'aec2285e-c543-4f5c-b86b-d2bae0de2722', NULL),
('8a9f8a3f-3baf-4960-bbd1-90fc71cf1ed6', NULL, NULL, 'yourstore', '70293e24-dd89-4919-b2a5-25a17587db12', 2, 20, b'1', '0fb3e595-9359-457e-ac5e-beda466c120c', NULL),
('8d7e2075-d544-470e-8542-047d988c49c2', NULL, 'idp-create-user-if-unique', 'yourstore', '70293e24-dd89-4919-b2a5-25a17587db12', 2, 10, b'0', NULL, 'eb619964-7547-4015-bda1-343fae95ef07'),
('8e7f4baa-cc09-4aec-9cdd-f5499f98c62b', NULL, 'basic-auth-otp', 'yourstore', '81f0ce66-6f9a-4cf8-b0cd-3c5624ca32c6', 3, 20, b'0', NULL, NULL),
('90b985ab-ddf4-4340-a789-15c238640ddd', NULL, 'direct-grant-validate-password', 'master', '96ae4141-6a82-4ea0-bb2f-a876bc380924', 0, 20, b'0', NULL, NULL),
('910e925c-4428-4247-9552-c277cf7756e9', NULL, 'auth-spnego', 'yourstore', '81f0ce66-6f9a-4cf8-b0cd-3c5624ca32c6', 3, 30, b'0', NULL, NULL),
('9a52330a-c47c-4cc2-8d7c-0547f7a7e550', NULL, 'idp-confirm-link', 'master', '04407ffb-3bbb-440a-ae27-1dfb605833e6', 0, 10, b'0', NULL, NULL),
('9d3a960f-50df-4df5-b3bd-116bea408548', NULL, 'auth-cookie', 'master', 'b5b2c689-0ef4-45b8-b0de-198fcd050582', 2, 10, b'0', NULL, NULL),
('9dd05e18-c1d7-4dab-bfa4-9ce0acb078c3', NULL, 'registration-recaptcha-action', 'yourstore', '0c48c2f5-1843-4430-901b-c964bbc05280', 3, 60, b'0', NULL, NULL),
('a1b6bd69-ec74-4963-9ac7-d8abbe286168', NULL, 'auth-spnego', 'master', 'b5b2c689-0ef4-45b8-b0de-198fcd050582', 3, 20, b'0', NULL, NULL),
('a5d881cc-132d-49cd-ac31-f4362930de5d', NULL, 'reset-credentials-choose-user', 'master', 'f10376dc-21f7-4fb6-b1d6-f2b1cf2e471d', 0, 10, b'0', NULL, NULL),
('aa424ef5-23cd-4b78-98b4-59c85998d09d', NULL, NULL, 'yourstore', '2dcea42b-76ae-4530-8ccc-3efc2567064b', 0, 20, b'1', '70293e24-dd89-4919-b2a5-25a17587db12', NULL),
('aca1e7f6-1daf-4c1e-96a9-ebbd95d5d225', NULL, 'conditional-user-configured', 'yourstore', 'e2da5fc2-1ca4-4d55-9434-24e0fcb29261', 0, 10, b'0', NULL, NULL),
('acb3c38a-46bd-44e2-b0aa-ebd59f90517d', NULL, 'conditional-user-configured', 'yourstore', 'e33dbbd8-7d7b-4775-8100-690e5303a7e0', 0, 10, b'0', NULL, NULL),
('ba6a0782-e982-4370-8bf6-5145075c3d44', NULL, 'direct-grant-validate-username', 'yourstore', 'ef32da8a-4a86-49ec-b7bd-3d752e4f394c', 0, 10, b'0', NULL, NULL),
('bb6891e2-10ab-41c7-888b-74892a0bba02', NULL, 'basic-auth', 'yourstore', '81f0ce66-6f9a-4cf8-b0cd-3c5624ca32c6', 0, 10, b'0', NULL, NULL),
('bbc598f8-814d-4266-b8ac-72c3cd1f32b1', NULL, 'reset-credential-email', 'master', 'f10376dc-21f7-4fb6-b1d6-f2b1cf2e471d', 0, 20, b'0', NULL, NULL),
('bf963817-2c68-4a55-bf74-262192c51cf9', NULL, 'registration-user-creation', 'yourstore', '0c48c2f5-1843-4430-901b-c964bbc05280', 0, 20, b'0', NULL, NULL),
('c3a20dfe-2d95-47d8-a4b6-47d6b2c71969', NULL, 'client-secret-jwt', 'master', '817832b3-3bd1-49e2-b308-45e6686c2c52', 2, 30, b'0', NULL, NULL),
('c40a1390-7f17-45ee-8152-726363f67936', NULL, 'idp-email-verification', 'yourstore', 'd664caab-a3f5-4fcf-95d8-c534a65344b8', 2, 10, b'0', NULL, NULL),
('c85a302e-e842-41bf-b24f-d8bab190ffb0', NULL, 'identity-provider-redirector', 'yourstore', 'ca989664-4c7c-4517-b575-9bdeb7ce065f', 2, 25, b'0', NULL, NULL),
('ce246a66-27d8-4179-93ea-d09358b63aaa', NULL, 'registration-user-creation', 'master', '4fd27334-d2c6-4d32-8911-5400d04402b9', 0, 20, b'0', NULL, NULL),
('d18e3360-b784-4129-9526-ef94d95d5197', NULL, 'auth-otp-form', 'yourstore', 'aec2285e-c543-4f5c-b86b-d2bae0de2722', 0, 20, b'0', NULL, NULL),
('d60d0b94-59f5-4526-924d-c3b5cdb28115', NULL, 'auth-otp-form', 'yourstore', '580810e2-6a24-44b9-a771-6b1eaecf2fd9', 0, 20, b'0', NULL, NULL),
('d9f3c13a-bee6-41b9-b743-a300234f55d5', NULL, 'reset-otp', 'yourstore', 'e33dbbd8-7d7b-4775-8100-690e5303a7e0', 0, 20, b'0', NULL, NULL),
('e0b9235d-2506-43d1-946e-a3e82a698da0', NULL, 'reset-credentials-choose-user', 'yourstore', 'dea0f920-eb0f-4c13-925d-f82c93bfd848', 0, 10, b'0', NULL, NULL),
('e2e93c31-0778-4030-8dfe-233862a38ba5', NULL, 'client-secret', 'master', '817832b3-3bd1-49e2-b308-45e6686c2c52', 2, 10, b'0', NULL, NULL),
('e4b3c940-e27a-4a6d-8a06-005b776cd4eb', NULL, 'reset-password', 'master', 'f10376dc-21f7-4fb6-b1d6-f2b1cf2e471d', 0, 30, b'0', NULL, NULL),
('e960dbaa-6482-4902-8b92-8f880e55cb30', NULL, 'reset-password', 'yourstore', 'dea0f920-eb0f-4c13-925d-f82c93bfd848', 0, 30, b'0', NULL, NULL),
('ea171dc0-3659-4e63-bf93-609a1d8d823a', NULL, NULL, 'yourstore', '0fb3e595-9359-457e-ac5e-beda466c120c', 0, 20, b'1', 'd664caab-a3f5-4fcf-95d8-c534a65344b8', NULL),
('ec09493e-a7eb-4423-bedf-ebe21a91ee15', NULL, 'registration-page-form', 'master', 'd65c0316-90a9-463b-8927-961ee7883045', 0, 10, b'1', '4fd27334-d2c6-4d32-8911-5400d04402b9', NULL),
('ec2e68a9-817a-47a1-94d8-2dfdba97448f', NULL, 'auth-otp-form', 'master', '7d793ac5-b660-4800-9554-e1a6698581d9', 0, 20, b'0', NULL, NULL),
('f7000a7b-9e90-4c51-a998-21ad6021f70d', NULL, 'idp-confirm-link', 'yourstore', '0fb3e595-9359-457e-ac5e-beda466c120c', 0, 10, b'0', NULL, NULL),
('f9c51fc5-5955-4b93-b9ff-27409d6bf537', NULL, NULL, 'master', '9d27cb2b-e811-4d32-89d6-2369d7c270a5', 0, 20, b'1', 'a0a6de04-597b-4d75-a6be-200187a841a2', NULL),
('fef148a9-9225-4491-a8c8-621144fee8c8', NULL, 'docker-http-basic-authenticator', 'master', '88d3e3c3-7532-467d-baed-36bfe0cc8ea6', 0, 10, b'0', NULL, NULL),
('ff1f294f-9313-49f2-af7f-ad3610092f2d', NULL, NULL, 'master', 'b5b2c689-0ef4-45b8-b0de-198fcd050582', 2, 30, b'1', '846bb8c2-af4b-4b26-bd08-92d74356b2a3', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `authentication_flow`
--

CREATE TABLE `authentication_flow` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `authentication_flow`
--

INSERT INTO `authentication_flow` (`ID`, `ALIAS`, `DESCRIPTION`, `REALM_ID`, `PROVIDER_ID`, `TOP_LEVEL`, `BUILT_IN`) VALUES
('01844f76-fab3-45ca-880a-73b78c214dbc', 'clients', 'Base authentication for clients', 'yourstore', 'client-flow', b'1', b'1'),
('04407ffb-3bbb-440a-ae27-1dfb605833e6', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', b'0', b'1'),
('0c48c2f5-1843-4430-901b-c964bbc05280', 'registration form', 'registration form', 'yourstore', 'form-flow', b'0', b'1'),
('0fb3e595-9359-457e-ac5e-beda466c120c', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'yourstore', 'basic-flow', b'0', b'1'),
('10d6f816-ffb0-4e46-b07a-8adb4ceeccbf', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'yourstore', 'basic-flow', b'1', b'1'),
('1509b59c-6381-4eb8-bd23-211fbf1de267', 'registration', 'registration flow', 'yourstore', 'basic-flow', b'1', b'1'),
('2252e55d-08dc-47c3-8db5-306ef37ee4c2', 'forms', 'Username, password, otp and other auth forms.', 'yourstore', 'basic-flow', b'0', b'1'),
('2cc67243-da55-40b1-8c01-e7a0bd965357', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('2dcea42b-76ae-4530-8ccc-3efc2567064b', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'yourstore', 'basic-flow', b'1', b'1'),
('2e5526d6-7ed6-44a4-94f6-29de505f95ce', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', b'0', b'1'),
('3c2de22e-eb86-47d4-b3ba-5982f0139a01', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'yourstore', 'basic-flow', b'0', b'1'),
('40fcb3ee-c6f4-4aa6-814c-ce88a4e31139', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', b'1', b'1'),
('4b7b4d52-ef10-4aad-acfe-adc433e0fa3f', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('4e401db3-105f-4f71-8bf6-cf0540e9b2a2', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', b'0', b'1'),
('4f6bad4d-f3db-4268-8a18-4d8c659bd515', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'yourstore', 'basic-flow', b'1', b'1'),
('4fd27334-d2c6-4d32-8911-5400d04402b9', 'registration form', 'registration form', 'master', 'form-flow', b'0', b'1'),
('580810e2-6a24-44b9-a771-6b1eaecf2fd9', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'yourstore', 'basic-flow', b'0', b'1'),
('5bcdada1-b55f-4470-9f68-dffd7022e837', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', b'1', b'1'),
('62339d01-ea34-47d4-bb93-67b15fa03daa', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', b'0', b'1'),
('63cf5fc3-658c-4160-9418-8eef219fbac8', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'yourstore', 'basic-flow', b'1', b'1'),
('70293e24-dd89-4919-b2a5-25a17587db12', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'yourstore', 'basic-flow', b'0', b'1'),
('7d793ac5-b660-4800-9554-e1a6698581d9', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('817832b3-3bd1-49e2-b308-45e6686c2c52', 'clients', 'Base authentication for clients', 'master', 'client-flow', b'1', b'1'),
('81f0ce66-6f9a-4cf8-b0cd-3c5624ca32c6', 'Authentication Options', 'Authentication options.', 'yourstore', 'basic-flow', b'0', b'1'),
('846bb8c2-af4b-4b26-bd08-92d74356b2a3', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', b'0', b'1'),
('88d3e3c3-7532-467d-baed-36bfe0cc8ea6', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', b'1', b'1'),
('96ae4141-6a82-4ea0-bb2f-a876bc380924', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', b'1', b'1'),
('9d27cb2b-e811-4d32-89d6-2369d7c270a5', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', b'1', b'1'),
('a0a6de04-597b-4d75-a6be-200187a841a2', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', b'0', b'1'),
('aec2285e-c543-4f5c-b86b-d2bae0de2722', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'yourstore', 'basic-flow', b'0', b'1'),
('b5b2c689-0ef4-45b8-b0de-198fcd050582', 'browser', 'browser based authentication', 'master', 'basic-flow', b'1', b'1'),
('bd1cc057-c86c-46d5-bdd0-6755ab2d29ef', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', b'0', b'1'),
('ca989664-4c7c-4517-b575-9bdeb7ce065f', 'browser', 'browser based authentication', 'yourstore', 'basic-flow', b'1', b'1'),
('d65c0316-90a9-463b-8927-961ee7883045', 'registration', 'registration flow', 'master', 'basic-flow', b'1', b'1'),
('d664caab-a3f5-4fcf-95d8-c534a65344b8', 'Account verification options', 'Method with which to verity the existing account', 'yourstore', 'basic-flow', b'0', b'1'),
('dea0f920-eb0f-4c13-925d-f82c93bfd848', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'yourstore', 'basic-flow', b'1', b'1'),
('e2da5fc2-1ca4-4d55-9434-24e0fcb29261', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'yourstore', 'basic-flow', b'0', b'1'),
('e33dbbd8-7d7b-4775-8100-690e5303a7e0', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'yourstore', 'basic-flow', b'0', b'1'),
('ef32da8a-4a86-49ec-b7bd-3d752e4f394c', 'direct grant', 'OpenID Connect Resource Owner Grant', 'yourstore', 'basic-flow', b'1', b'1'),
('f10376dc-21f7-4fb6-b1d6-f2b1cf2e471d', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', b'1', b'1');

-- --------------------------------------------------------

--
-- Struttura della tabella `authenticator_config`
--

CREATE TABLE `authenticator_config` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `authenticator_config`
--

INSERT INTO `authenticator_config` (`ID`, `ALIAS`, `REALM_ID`) VALUES
('1963fc01-1e47-44e0-8a25-ea271932d60f', 'review profile config', 'yourstore'),
('36e942a5-5031-438f-9779-0cac8f733107', 'review profile config', 'master'),
('e3defff9-c64d-4f6a-a436-99954478efb1', 'create unique user config', 'master'),
('eb619964-7547-4015-bda1-343fae95ef07', 'create unique user config', 'yourstore');

-- --------------------------------------------------------

--
-- Struttura della tabella `authenticator_config_entry`
--

CREATE TABLE `authenticator_config_entry` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `authenticator_config_entry`
--

INSERT INTO `authenticator_config_entry` (`AUTHENTICATOR_ID`, `VALUE`, `NAME`) VALUES
('1963fc01-1e47-44e0-8a25-ea271932d60f', 'missing', 'update.profile.on.first.login'),
('36e942a5-5031-438f-9779-0cac8f733107', 'missing', 'update.profile.on.first.login'),
('e3defff9-c64d-4f6a-a436-99954478efb1', 'false', 'require.password.update.after.registration'),
('eb619964-7547-4015-bda1-343fae95ef07', 'false', 'require.password.update.after.registration');

-- --------------------------------------------------------

--
-- Struttura della tabella `broker_link`
--

CREATE TABLE `broker_link` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client`
--

CREATE TABLE `client` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT 0,
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `client`
--

INSERT INTO `client` (`ID`, `ENABLED`, `FULL_SCOPE_ALLOWED`, `CLIENT_ID`, `NOT_BEFORE`, `PUBLIC_CLIENT`, `SECRET`, `BASE_URL`, `BEARER_ONLY`, `MANAGEMENT_URL`, `SURROGATE_AUTH_REQUIRED`, `REALM_ID`, `PROTOCOL`, `NODE_REREG_TIMEOUT`, `FRONTCHANNEL_LOGOUT`, `CONSENT_REQUIRED`, `NAME`, `SERVICE_ACCOUNTS_ENABLED`, `CLIENT_AUTHENTICATOR_TYPE`, `ROOT_URL`, `DESCRIPTION`, `REGISTRATION_TOKEN`, `STANDARD_FLOW_ENABLED`, `IMPLICIT_FLOW_ENABLED`, `DIRECT_ACCESS_GRANTS_ENABLED`, `ALWAYS_DISPLAY_IN_CONSOLE`) VALUES
('0073d475-f323-4761-9131-a38a2a1a9a2d', b'1', b'0', 'admin-cli', 0, b'1', NULL, NULL, b'0', NULL, b'0', 'yourstore', 'openid-connect', 0, b'0', b'0', '${client_admin-cli}', b'0', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'1', b'0'),
('1672d599-7171-47c0-8246-d4db4d421ea9', b'1', b'0', 'master-realm', 0, b'0', NULL, NULL, b'1', NULL, b'0', 'master', NULL, 0, b'0', b'0', 'master Realm', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', b'1', b'0', 'broker', 0, b'0', NULL, NULL, b'1', NULL, b'0', 'yourstore', 'openid-connect', 0, b'0', b'0', '${client_broker}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', b'1', b'0', 'broker', 0, b'0', NULL, NULL, b'1', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_broker}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', b'1', b'0', 'security-admin-console', 0, b'1', NULL, '/admin/master/console/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_security-admin-console}', b'0', 'client-secret', '${authAdminUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', b'0', 'realm-management', 0, b'0', NULL, NULL, b'1', NULL, b'0', 'yourstore', 'openid-connect', 0, b'0', b'0', '${client_realm-management}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', b'1', b'0', 'account', 0, b'1', NULL, '/realms/yourstore/account/', b'0', NULL, b'0', 'yourstore', 'openid-connect', 0, b'0', b'0', '${client_account}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('8c0b103b-23e7-44b1-a722-6713674c3640', b'1', b'0', 'account-console', 0, b'1', NULL, '/realms/master/account/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_account-console}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('9de1f167-7240-4fe6-84de-2a871e589279', b'1', b'0', 'account-console', 0, b'1', NULL, '/realms/yourstore/account/', b'0', NULL, b'0', 'yourstore', 'openid-connect', 0, b'0', b'0', '${client_account-console}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', b'1', b'0', 'security-admin-console', 0, b'1', NULL, '/admin/yourstore/console/', b'0', NULL, b'0', 'yourstore', 'openid-connect', 0, b'0', b'0', '${client_security-admin-console}', b'0', 'client-secret', '${authAdminUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', b'1', b'0', 'admin-cli', 0, b'1', NULL, NULL, b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_admin-cli}', b'0', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'1', b'0'),
('dec12da6-e778-472a-9558-ef50042e49d1', b'1', b'0', 'yourstore-realm', 0, b'0', NULL, NULL, b'1', NULL, b'0', 'master', NULL, 0, b'0', b'0', 'yourstore Realm', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', b'1', b'0', 'account', 0, b'1', NULL, '/realms/master/account/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_account}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', b'1', b'1', 'spa', 0, b'1', NULL, NULL, b'0', ':', b'0', 'yourstore', 'openid-connect', -1, b'0', b'0', NULL, b'0', 'client-secret', ':', NULL, NULL, b'1', b'0', b'1', b'0');

-- --------------------------------------------------------

--
-- Struttura della tabella `client_attributes`
--

CREATE TABLE `client_attributes` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `client_attributes`
--

INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES
('7c4498bd-7460-4485-b217-092e9f6dc10e', 'S256', 'pkce.code.challenge.method'),
('8c0b103b-23e7-44b1-a722-6713674c3640', 'S256', 'pkce.code.challenge.method'),
('9de1f167-7240-4fe6-84de-2a871e589279', 'S256', 'pkce.code.challenge.method'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', 'S256', 'pkce.code.challenge.method'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', 'false', 'backchannel.logout.revoke.offline.tokens'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', 'true', 'backchannel.logout.session.required');

-- --------------------------------------------------------

--
-- Struttura della tabella `client_auth_flow_bindings`
--

CREATE TABLE `client_auth_flow_bindings` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_initial_access`
--

CREATE TABLE `client_initial_access` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_node_registrations`
--

CREATE TABLE `client_node_registrations` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_scope`
--

CREATE TABLE `client_scope` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `client_scope`
--

INSERT INTO `client_scope` (`ID`, `NAME`, `REALM_ID`, `DESCRIPTION`, `PROTOCOL`) VALUES
('26b95982-848e-4cbd-8f04-6720d5680943', 'roles', 'yourstore', 'OpenID Connect scope for add user roles to the access token', 'openid-connect'),
('2f766d61-b28e-4165-a1ac-a5435430c894', 'email', 'yourstore', 'OpenID Connect built-in scope: email', 'openid-connect'),
('3aa954f6-b118-40cf-a332-f2d3b0e544ca', 'profile', 'yourstore', 'OpenID Connect built-in scope: profile', 'openid-connect'),
('40a33ca3-3c56-45f5-81c9-a4d820b23563', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect'),
('42032ccc-af52-4e7a-a7c8-817a089af9fa', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect'),
('4504e010-e859-443b-a833-9daee4e2c08c', 'phone', 'yourstore', 'OpenID Connect built-in scope: phone', 'openid-connect'),
('4632922f-50c5-412f-a8c0-b1f01705e8fa', 'microprofile-jwt', 'yourstore', 'Microprofile - JWT built-in scope', 'openid-connect'),
('5f053946-cd36-4af8-9db5-4fa74c831069', 'offline_access', 'yourstore', 'OpenID Connect built-in scope: offline_access', 'openid-connect'),
('873a2d21-f57b-47b1-895b-3e2dca759255', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect'),
('894c3e8f-303d-4a47-b335-2082dce3dc64', 'role_list', 'yourstore', 'SAML role list', 'saml'),
('a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect'),
('b6adebd7-8138-49f1-af5a-45f3220009c5', 'web-origins', 'yourstore', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect'),
('c1c1e980-1ac1-4996-9f54-c8e8330d267d', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect'),
('d0741ee2-2bfb-49dd-8024-11ab4a45584f', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect'),
('d43a17d1-5289-4dc0-bb06-a290adccc490', 'role_list', 'master', 'SAML role list', 'saml'),
('f24d6d46-1042-4953-957a-51020078d0cc', 'address', 'yourstore', 'OpenID Connect built-in scope: address', 'openid-connect'),
('f46e1297-8cbb-45c5-8679-63b1d3fa80ea', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect'),
('f5eafb1e-505e-455b-8b6f-124de41afb57', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');

-- --------------------------------------------------------

--
-- Struttura della tabella `client_scope_attributes`
--

CREATE TABLE `client_scope_attributes` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `client_scope_attributes`
--

INSERT INTO `client_scope_attributes` (`SCOPE_ID`, `VALUE`, `NAME`) VALUES
('26b95982-848e-4cbd-8f04-6720d5680943', '${rolesScopeConsentText}', 'consent.screen.text'),
('26b95982-848e-4cbd-8f04-6720d5680943', 'true', 'display.on.consent.screen'),
('26b95982-848e-4cbd-8f04-6720d5680943', 'false', 'include.in.token.scope'),
('2f766d61-b28e-4165-a1ac-a5435430c894', '${emailScopeConsentText}', 'consent.screen.text'),
('2f766d61-b28e-4165-a1ac-a5435430c894', 'true', 'display.on.consent.screen'),
('2f766d61-b28e-4165-a1ac-a5435430c894', 'true', 'include.in.token.scope'),
('3aa954f6-b118-40cf-a332-f2d3b0e544ca', '${profileScopeConsentText}', 'consent.screen.text'),
('3aa954f6-b118-40cf-a332-f2d3b0e544ca', 'true', 'display.on.consent.screen'),
('3aa954f6-b118-40cf-a332-f2d3b0e544ca', 'true', 'include.in.token.scope'),
('40a33ca3-3c56-45f5-81c9-a4d820b23563', '${profileScopeConsentText}', 'consent.screen.text'),
('40a33ca3-3c56-45f5-81c9-a4d820b23563', 'true', 'display.on.consent.screen'),
('40a33ca3-3c56-45f5-81c9-a4d820b23563', 'true', 'include.in.token.scope'),
('42032ccc-af52-4e7a-a7c8-817a089af9fa', '', 'consent.screen.text'),
('42032ccc-af52-4e7a-a7c8-817a089af9fa', 'false', 'display.on.consent.screen'),
('42032ccc-af52-4e7a-a7c8-817a089af9fa', 'false', 'include.in.token.scope'),
('4504e010-e859-443b-a833-9daee4e2c08c', '${phoneScopeConsentText}', 'consent.screen.text'),
('4504e010-e859-443b-a833-9daee4e2c08c', 'true', 'display.on.consent.screen'),
('4504e010-e859-443b-a833-9daee4e2c08c', 'true', 'include.in.token.scope'),
('4632922f-50c5-412f-a8c0-b1f01705e8fa', 'false', 'display.on.consent.screen'),
('4632922f-50c5-412f-a8c0-b1f01705e8fa', 'true', 'include.in.token.scope'),
('5f053946-cd36-4af8-9db5-4fa74c831069', '${offlineAccessScopeConsentText}', 'consent.screen.text'),
('5f053946-cd36-4af8-9db5-4fa74c831069', 'true', 'display.on.consent.screen'),
('873a2d21-f57b-47b1-895b-3e2dca759255', '${emailScopeConsentText}', 'consent.screen.text'),
('873a2d21-f57b-47b1-895b-3e2dca759255', 'true', 'display.on.consent.screen'),
('873a2d21-f57b-47b1-895b-3e2dca759255', 'true', 'include.in.token.scope'),
('894c3e8f-303d-4a47-b335-2082dce3dc64', '${samlRoleListScopeConsentText}', 'consent.screen.text'),
('894c3e8f-303d-4a47-b335-2082dce3dc64', 'true', 'display.on.consent.screen'),
('a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', '${addressScopeConsentText}', 'consent.screen.text'),
('a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', 'true', 'display.on.consent.screen'),
('a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', 'true', 'include.in.token.scope'),
('b6adebd7-8138-49f1-af5a-45f3220009c5', '', 'consent.screen.text'),
('b6adebd7-8138-49f1-af5a-45f3220009c5', 'false', 'display.on.consent.screen'),
('b6adebd7-8138-49f1-af5a-45f3220009c5', 'false', 'include.in.token.scope'),
('c1c1e980-1ac1-4996-9f54-c8e8330d267d', '${rolesScopeConsentText}', 'consent.screen.text'),
('c1c1e980-1ac1-4996-9f54-c8e8330d267d', 'true', 'display.on.consent.screen'),
('c1c1e980-1ac1-4996-9f54-c8e8330d267d', 'false', 'include.in.token.scope'),
('d0741ee2-2bfb-49dd-8024-11ab4a45584f', '${phoneScopeConsentText}', 'consent.screen.text'),
('d0741ee2-2bfb-49dd-8024-11ab4a45584f', 'true', 'display.on.consent.screen'),
('d0741ee2-2bfb-49dd-8024-11ab4a45584f', 'true', 'include.in.token.scope'),
('d43a17d1-5289-4dc0-bb06-a290adccc490', '${samlRoleListScopeConsentText}', 'consent.screen.text'),
('d43a17d1-5289-4dc0-bb06-a290adccc490', 'true', 'display.on.consent.screen'),
('f24d6d46-1042-4953-957a-51020078d0cc', '${addressScopeConsentText}', 'consent.screen.text'),
('f24d6d46-1042-4953-957a-51020078d0cc', 'true', 'display.on.consent.screen'),
('f24d6d46-1042-4953-957a-51020078d0cc', 'true', 'include.in.token.scope'),
('f46e1297-8cbb-45c5-8679-63b1d3fa80ea', '${offlineAccessScopeConsentText}', 'consent.screen.text'),
('f46e1297-8cbb-45c5-8679-63b1d3fa80ea', 'true', 'display.on.consent.screen'),
('f5eafb1e-505e-455b-8b6f-124de41afb57', 'false', 'display.on.consent.screen'),
('f5eafb1e-505e-455b-8b6f-124de41afb57', 'true', 'include.in.token.scope');

-- --------------------------------------------------------

--
-- Struttura della tabella `client_scope_client`
--

CREATE TABLE `client_scope_client` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `client_scope_client`
--

INSERT INTO `client_scope_client` (`CLIENT_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`) VALUES
('0073d475-f323-4761-9131-a38a2a1a9a2d', '26b95982-848e-4cbd-8f04-6720d5680943', b'1'),
('0073d475-f323-4761-9131-a38a2a1a9a2d', '2f766d61-b28e-4165-a1ac-a5435430c894', b'1'),
('0073d475-f323-4761-9131-a38a2a1a9a2d', '3aa954f6-b118-40cf-a332-f2d3b0e544ca', b'1'),
('0073d475-f323-4761-9131-a38a2a1a9a2d', '4504e010-e859-443b-a833-9daee4e2c08c', b'0'),
('0073d475-f323-4761-9131-a38a2a1a9a2d', '4632922f-50c5-412f-a8c0-b1f01705e8fa', b'0'),
('0073d475-f323-4761-9131-a38a2a1a9a2d', '5f053946-cd36-4af8-9db5-4fa74c831069', b'0'),
('0073d475-f323-4761-9131-a38a2a1a9a2d', 'b6adebd7-8138-49f1-af5a-45f3220009c5', b'1'),
('0073d475-f323-4761-9131-a38a2a1a9a2d', 'f24d6d46-1042-4953-957a-51020078d0cc', b'0'),
('1672d599-7171-47c0-8246-d4db4d421ea9', '40a33ca3-3c56-45f5-81c9-a4d820b23563', b'1'),
('1672d599-7171-47c0-8246-d4db4d421ea9', '42032ccc-af52-4e7a-a7c8-817a089af9fa', b'1'),
('1672d599-7171-47c0-8246-d4db4d421ea9', '873a2d21-f57b-47b1-895b-3e2dca759255', b'1'),
('1672d599-7171-47c0-8246-d4db4d421ea9', 'a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', b'0'),
('1672d599-7171-47c0-8246-d4db4d421ea9', 'c1c1e980-1ac1-4996-9f54-c8e8330d267d', b'1'),
('1672d599-7171-47c0-8246-d4db4d421ea9', 'd0741ee2-2bfb-49dd-8024-11ab4a45584f', b'0'),
('1672d599-7171-47c0-8246-d4db4d421ea9', 'f46e1297-8cbb-45c5-8679-63b1d3fa80ea', b'0'),
('1672d599-7171-47c0-8246-d4db4d421ea9', 'f5eafb1e-505e-455b-8b6f-124de41afb57', b'0'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', '26b95982-848e-4cbd-8f04-6720d5680943', b'1'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', '2f766d61-b28e-4165-a1ac-a5435430c894', b'1'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', '3aa954f6-b118-40cf-a332-f2d3b0e544ca', b'1'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', '4504e010-e859-443b-a833-9daee4e2c08c', b'0'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', '4632922f-50c5-412f-a8c0-b1f01705e8fa', b'0'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', '5f053946-cd36-4af8-9db5-4fa74c831069', b'0'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', 'b6adebd7-8138-49f1-af5a-45f3220009c5', b'1'),
('25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', 'f24d6d46-1042-4953-957a-51020078d0cc', b'0'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', '40a33ca3-3c56-45f5-81c9-a4d820b23563', b'1'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', '42032ccc-af52-4e7a-a7c8-817a089af9fa', b'1'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', '873a2d21-f57b-47b1-895b-3e2dca759255', b'1'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', 'a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', b'0'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', 'c1c1e980-1ac1-4996-9f54-c8e8330d267d', b'1'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', 'd0741ee2-2bfb-49dd-8024-11ab4a45584f', b'0'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', 'f46e1297-8cbb-45c5-8679-63b1d3fa80ea', b'0'),
('6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', 'f5eafb1e-505e-455b-8b6f-124de41afb57', b'0'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', '40a33ca3-3c56-45f5-81c9-a4d820b23563', b'1'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', '42032ccc-af52-4e7a-a7c8-817a089af9fa', b'1'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', '873a2d21-f57b-47b1-895b-3e2dca759255', b'1'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', 'a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', b'0'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', 'c1c1e980-1ac1-4996-9f54-c8e8330d267d', b'1'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', 'd0741ee2-2bfb-49dd-8024-11ab4a45584f', b'0'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', 'f46e1297-8cbb-45c5-8679-63b1d3fa80ea', b'0'),
('7c4498bd-7460-4485-b217-092e9f6dc10e', 'f5eafb1e-505e-455b-8b6f-124de41afb57', b'0'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', '26b95982-848e-4cbd-8f04-6720d5680943', b'1'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', '2f766d61-b28e-4165-a1ac-a5435430c894', b'1'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', '3aa954f6-b118-40cf-a332-f2d3b0e544ca', b'1'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', '4504e010-e859-443b-a833-9daee4e2c08c', b'0'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', '4632922f-50c5-412f-a8c0-b1f01705e8fa', b'0'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', '5f053946-cd36-4af8-9db5-4fa74c831069', b'0'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', 'b6adebd7-8138-49f1-af5a-45f3220009c5', b'1'),
('8245b28e-98e6-49c2-9185-9d90e3fc649e', 'f24d6d46-1042-4953-957a-51020078d0cc', b'0'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', '26b95982-848e-4cbd-8f04-6720d5680943', b'1'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', '2f766d61-b28e-4165-a1ac-a5435430c894', b'1'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', '3aa954f6-b118-40cf-a332-f2d3b0e544ca', b'1'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', '4504e010-e859-443b-a833-9daee4e2c08c', b'0'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', '4632922f-50c5-412f-a8c0-b1f01705e8fa', b'0'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', '5f053946-cd36-4af8-9db5-4fa74c831069', b'0'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', 'b6adebd7-8138-49f1-af5a-45f3220009c5', b'1'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', 'f24d6d46-1042-4953-957a-51020078d0cc', b'0'),
('8c0b103b-23e7-44b1-a722-6713674c3640', '40a33ca3-3c56-45f5-81c9-a4d820b23563', b'1'),
('8c0b103b-23e7-44b1-a722-6713674c3640', '42032ccc-af52-4e7a-a7c8-817a089af9fa', b'1'),
('8c0b103b-23e7-44b1-a722-6713674c3640', '873a2d21-f57b-47b1-895b-3e2dca759255', b'1'),
('8c0b103b-23e7-44b1-a722-6713674c3640', 'a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', b'0'),
('8c0b103b-23e7-44b1-a722-6713674c3640', 'c1c1e980-1ac1-4996-9f54-c8e8330d267d', b'1'),
('8c0b103b-23e7-44b1-a722-6713674c3640', 'd0741ee2-2bfb-49dd-8024-11ab4a45584f', b'0'),
('8c0b103b-23e7-44b1-a722-6713674c3640', 'f46e1297-8cbb-45c5-8679-63b1d3fa80ea', b'0'),
('8c0b103b-23e7-44b1-a722-6713674c3640', 'f5eafb1e-505e-455b-8b6f-124de41afb57', b'0'),
('9de1f167-7240-4fe6-84de-2a871e589279', '26b95982-848e-4cbd-8f04-6720d5680943', b'1'),
('9de1f167-7240-4fe6-84de-2a871e589279', '2f766d61-b28e-4165-a1ac-a5435430c894', b'1'),
('9de1f167-7240-4fe6-84de-2a871e589279', '3aa954f6-b118-40cf-a332-f2d3b0e544ca', b'1'),
('9de1f167-7240-4fe6-84de-2a871e589279', '4504e010-e859-443b-a833-9daee4e2c08c', b'0'),
('9de1f167-7240-4fe6-84de-2a871e589279', '4632922f-50c5-412f-a8c0-b1f01705e8fa', b'0'),
('9de1f167-7240-4fe6-84de-2a871e589279', '5f053946-cd36-4af8-9db5-4fa74c831069', b'0'),
('9de1f167-7240-4fe6-84de-2a871e589279', 'b6adebd7-8138-49f1-af5a-45f3220009c5', b'1'),
('9de1f167-7240-4fe6-84de-2a871e589279', 'f24d6d46-1042-4953-957a-51020078d0cc', b'0'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', '26b95982-848e-4cbd-8f04-6720d5680943', b'1'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', '2f766d61-b28e-4165-a1ac-a5435430c894', b'1'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', '3aa954f6-b118-40cf-a332-f2d3b0e544ca', b'1'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', '4504e010-e859-443b-a833-9daee4e2c08c', b'0'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', '4632922f-50c5-412f-a8c0-b1f01705e8fa', b'0'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', '5f053946-cd36-4af8-9db5-4fa74c831069', b'0'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', 'b6adebd7-8138-49f1-af5a-45f3220009c5', b'1'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', 'f24d6d46-1042-4953-957a-51020078d0cc', b'0'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', '40a33ca3-3c56-45f5-81c9-a4d820b23563', b'1'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', '42032ccc-af52-4e7a-a7c8-817a089af9fa', b'1'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', '873a2d21-f57b-47b1-895b-3e2dca759255', b'1'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', 'a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', b'0'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', 'c1c1e980-1ac1-4996-9f54-c8e8330d267d', b'1'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', 'd0741ee2-2bfb-49dd-8024-11ab4a45584f', b'0'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', 'f46e1297-8cbb-45c5-8679-63b1d3fa80ea', b'0'),
('c9c526c4-7b5c-44b9-a1e4-32e7970a6cb8', 'f5eafb1e-505e-455b-8b6f-124de41afb57', b'0'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', '40a33ca3-3c56-45f5-81c9-a4d820b23563', b'1'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', '42032ccc-af52-4e7a-a7c8-817a089af9fa', b'1'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', '873a2d21-f57b-47b1-895b-3e2dca759255', b'1'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', 'a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', b'0'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', 'c1c1e980-1ac1-4996-9f54-c8e8330d267d', b'1'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', 'd0741ee2-2bfb-49dd-8024-11ab4a45584f', b'0'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', 'f46e1297-8cbb-45c5-8679-63b1d3fa80ea', b'0'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', 'f5eafb1e-505e-455b-8b6f-124de41afb57', b'0'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', '26b95982-848e-4cbd-8f04-6720d5680943', b'1'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', '2f766d61-b28e-4165-a1ac-a5435430c894', b'1'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', '3aa954f6-b118-40cf-a332-f2d3b0e544ca', b'1'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', '4504e010-e859-443b-a833-9daee4e2c08c', b'0'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', '4632922f-50c5-412f-a8c0-b1f01705e8fa', b'0'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', '5f053946-cd36-4af8-9db5-4fa74c831069', b'0'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', 'b6adebd7-8138-49f1-af5a-45f3220009c5', b'1'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', 'f24d6d46-1042-4953-957a-51020078d0cc', b'0');

-- --------------------------------------------------------

--
-- Struttura della tabella `client_scope_role_mapping`
--

CREATE TABLE `client_scope_role_mapping` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `client_scope_role_mapping`
--

INSERT INTO `client_scope_role_mapping` (`SCOPE_ID`, `ROLE_ID`) VALUES
('5f053946-cd36-4af8-9db5-4fa74c831069', 'a2cb8649-bc6d-4418-a8cc-80fdd677f43b'),
('f46e1297-8cbb-45c5-8679-63b1d3fa80ea', 'c56c4203-a26d-4fb4-8e86-a2278f53e5ac');

-- --------------------------------------------------------

--
-- Struttura della tabella `client_session`
--

CREATE TABLE `client_session` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_session_auth_status`
--

CREATE TABLE `client_session_auth_status` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_session_note`
--

CREATE TABLE `client_session_note` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_session_prot_mapper`
--

CREATE TABLE `client_session_prot_mapper` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_session_role`
--

CREATE TABLE `client_session_role` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `client_user_session_note`
--

CREATE TABLE `client_user_session_note` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `component`
--

CREATE TABLE `component` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `component`
--

INSERT INTO `component` (`ID`, `NAME`, `PARENT_ID`, `PROVIDER_ID`, `PROVIDER_TYPE`, `REALM_ID`, `SUB_TYPE`) VALUES
('045fb915-1d42-4bce-95c2-11cd6835fb87', 'Allowed Protocol Mapper Types', 'yourstore', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'yourstore', 'anonymous'),
('04a96835-b20e-426c-a19f-3cbcb8d5e49f', 'rsa-generated', 'yourstore', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'yourstore', NULL),
('17a44f4e-f4f4-4767-9a3f-10d114b5c220', 'Allowed Client Scopes', 'yourstore', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'yourstore', 'anonymous'),
('26515f61-7668-4f93-9b61-e4543a664fbe', 'Trusted Hosts', 'yourstore', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'yourstore', 'anonymous'),
('27f47f42-fae7-4fe9-9dd9-afb3d007fce3', 'Consent Required', 'yourstore', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'yourstore', 'anonymous'),
('3ba37944-359f-4002-98b8-fa92560cbb06', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated'),
('3f470d61-5d43-4197-881b-6ade4d3343d8', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('413f020a-dd22-4684-b146-562ab6f1c657', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('5049d02f-7f7a-466e-9ead-201a3d2157db', 'hmac-generated', 'yourstore', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'yourstore', NULL),
('54b86e35-e4b2-4973-a429-1f83ad39fcd8', 'aes-generated', 'master', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('5c1e2d20-7987-4a46-bc77-47eb46140e9f', 'Max Clients Limit', 'yourstore', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'yourstore', 'anonymous'),
('5c8f29c8-1eda-4c91-8388-1268130146de', 'aes-generated', 'yourstore', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'yourstore', NULL),
('69981276-706b-4795-acdf-d5958c690472', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('84ac7ebb-cba5-4183-9d0c-52c93a483acd', 'Full Scope Disabled', 'yourstore', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'yourstore', 'anonymous'),
('91d42b8c-2f14-4363-a41f-f48c5c1aa600', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('a43ab09c-a134-421b-8dcd-80a74b322028', 'hmac-generated', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated'),
('d29ababb-d99f-4f2f-9c8d-41dfc63c4818', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'Allowed Protocol Mapper Types', 'yourstore', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'yourstore', 'authenticated'),
('e3b09141-8446-4aa6-9bc9-bcb775ece8c9', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('efd36e9d-76a3-498f-a6cf-583c66657b0b', 'Allowed Client Scopes', 'yourstore', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'yourstore', 'authenticated'),
('fcebb056-3e04-4d4f-a21b-f6e72fe5cc72', 'rsa-generated', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `component_config`
--

CREATE TABLE `component_config` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `component_config`
--

INSERT INTO `component_config` (`ID`, `COMPONENT_ID`, `NAME`, `VALUE`) VALUES
('059ab143-de0c-4edc-9cf9-289ecb88af41', 'dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('0770b7e2-4f18-4090-8b2c-09746ab22df5', '5c8f29c8-1eda-4c91-8388-1268130146de', 'secret', '_j3clOMkehxZhsLPLiHWKw'),
('0ab47692-1202-470d-a1e6-780ae7d9231c', 'dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('0b0260b5-7a84-4add-be40-6faae304a27f', 'a43ab09c-a134-421b-8dcd-80a74b322028', 'priority', '100'),
('0d277962-c473-468e-889e-654af95e7484', '045fb915-1d42-4bce-95c2-11cd6835fb87', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('15cfc08d-579f-4f91-be5c-c6551122608b', '3ba37944-359f-4002-98b8-fa92560cbb06', 'allow-default-scopes', 'true'),
('2541bba0-6884-40fc-8e98-24daf6b19c27', '54b86e35-e4b2-4973-a429-1f83ad39fcd8', 'priority', '100'),
('2739662a-5e6f-44d5-aaf2-5dc650563b83', '69981276-706b-4795-acdf-d5958c690472', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('2860f883-dfaf-4c8c-9a7e-ac6fc326acec', '69981276-706b-4795-acdf-d5958c690472', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('2a04e65a-2ee8-4e80-8954-cd599c7367cf', '54b86e35-e4b2-4973-a429-1f83ad39fcd8', 'kid', 'fa18e310-60bc-4aaa-98e3-a6dec967af3e'),
('2fadbab1-92f1-48b4-a51c-67738920ca1d', '045fb915-1d42-4bce-95c2-11cd6835fb87', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('3125c79b-a932-4c7f-9cad-f09e4406dfce', 'dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('32be03c7-37ce-4568-b50b-1468aec89f58', 'b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('34840e52-1506-49c0-8d07-996dc1f84787', 'dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('37fb9c0d-8f2c-4299-9114-431e4fe984b0', 'dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('3da727b6-b1f2-40ba-9941-a4a24a8bdf82', '04a96835-b20e-426c-a19f-3cbcb8d5e49f', 'privateKey', 'MIIEpAIBAAKCAQEAoAYK9JOwUjlFK5/cu301a20UaSTHBgEdJr5XIkKAfTVQwj1chwm+UGF3DyMVair0j/c5nea/pP0iY6uuxKXJaxrI/L6LawSl1GBGw1RlOSB2eayaFY6AfW3guxGqfvhFY+nTHbLn1JPzMuMOhIclOspYozZVZGyEhdDRJ+GRM+ZFxSTZUMPgpt+G8foOuNaK1APCfYfdXecRHQNgVsriN6tqhdM6nxS/1Ng5pBVvRdhDPo8YQisrhytRZv4tJnZXa7rWQqVQFzhhpcv90sGq+PHacKYue+HPL6CWk8EAFhG+HUncB139h1MtqtFZatGI3iRONyDiRQJ76D9ecSAdzQIDAQABAoIBAGNNfKzrnWZY7ci1ioe6mlTQuvLIhM0AEfQB+BZliFCqrjPrWijebgB5iyWUkuxwPZW9SD7pe5HKF/YcCvczHjvdwk29fMzrdHDHUgJStAHwWDUHXBL2fFvZvLS5sMDcFkt7RaxPYjfzm96/Mjohl4PVH44g4HrSMKbNv41tF+tI/3YbMRcT6DLUYZpnRMCB9tHHV+7M/8I8rNS1W0X9W+Sg4F5oSzTFHe6HXwjYs8Ssy1dbudVy4GnS1Hx/UBWx1vQXm7go35wPWnHJP5jk6kb/ihbaFnsA7/Um2XQTH+IHBc74ScAE0k0pL4y1fI1PjlY0uHOI9j5XsdVhyt8ra40CgYEA/7rKwlb8YKVlnYgdo6uKJ0J7nR+++SCHIqcAh4ykLvgLob3KYOomXgZ7ov+M33V51U3o3tH/szsF8jsFykxZ40TsaO0heD3crFloyNxpkqmAVoXyiWQoGpCsILr3zY5PF8gNZuzBXcVqix57LP1iW6vSyiuWsJoq89w501EKF9cCgYEAoDFZkoU+whBxAIQ5Xw/Ze6j1sd6x2wxHi5mYEDTJOwnP4d0zFYmlipq6/9nu511mBu6o5f6G2E5xKIM8OH6pc43UGY2CVXkkxvxVTKebRWmcmiQYjBOue3h4X/+SAweGX13HCZgwGd5tUrzzVQrTqVE+eFqrDCyQXLnozNercvsCgYEA+chstagbORc0istiD/TEq5Y/gXh5o4LHG+y9Eqkn0QzM572miEUNFrgEWXB9G+L2Dofb1pCNznXvV+uYu0EaZ2dx9wbvsy/RdLKcK91GbU+MoHaTMOmYVmJLDmkxFCFVVeg8VvUX5kymxZ4POCGCygGpkXlD5dmf7LOF88brMd8CgYEAikoQCWz9wIpxAwEihe4o0ZgKgoK9B1ySZvExVMw867qMu285ql4pin4I8NYyZ4k5isJ9DA+uWQ1eopqoYhz2K8tETsrauO7b0OwEtyf54vJJPsfqaQKUngJh6H24juTwG2PZb27yF2Ls/YAgkEnIb2KzizK6dsgB2Aql7jBA0gECgYB44KbbJbVsJhf/r6MD4aUG7MJ1OMToh5fTSxHTaKpxnyT+6nczxD4S83XT2jOysv4oFon6ja1nPmJ8OR07LWCBSjrUxdymnFNNi7WMyEBpkXoEqZMoPEmoks74RNt3L/E9EsEUuV2eqJNTpjDGiOqQuDB7XKAxLEhSDSg8BadZag=='),
('3e46556b-75f7-426f-8fd9-20b97220067c', '045fb915-1d42-4bce-95c2-11cd6835fb87', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('43b590fc-611c-4a34-8db1-e08f25813446', 'b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('44271d96-3afd-475a-9a25-f5e0fe40aab2', '5c1e2d20-7987-4a46-bc77-47eb46140e9f', 'max-clients', '200'),
('4ced6da7-44b8-4bc0-bc51-8ba34edf745e', '5049d02f-7f7a-466e-9ead-201a3d2157db', 'secret', 'HigxC6ncci7vPQXXP5Rvya1_rqoGatCtC-vk-D4S2CF03LX7SaaLxqeQ7Gf1HBtsukX8OxMl-FtjStuiEG7K9g'),
('4eea01b1-e0c2-4e33-a904-4228d53b9baf', 'fcebb056-3e04-4d4f-a21b-f6e72fe5cc72', 'privateKey', 'MIIEowIBAAKCAQEAjIBNuLInj6W03H9cSmtiscse/BvSioAHGvNThq531IByeqlL0V8W6Z9Wqgzp9QBY5Kh31nrb86lC191J9pWT0bxJxf2nAow4mxh64Dx3tEAnngUekai2uFdIBoiLf7vS1bz8uH29z7SO38TI3YA8rd8YWSsyes8ay2h5ciPSYNc8mI54PoUPNoIeINcCHIQHshDNI30cgLVyYvsV43mcE1dopSdQ7NISgMEVZtEGDA1mL9AfOGqZKOuyyTj7k67HiH/fTgw8RYUeYAZY7aBFHPugmc3WwkjLoN6IUp4Z1nnSUAgOhT0tu4mTAaBT9FnOQ9T6F67IuOI1t13Ckhn+KwIDAQABAoIBAQCB4OD3yQg1C7Mi2UDRMm9rdx7PYlC/4xWuXhxqNcFj2ND6fqEtjD87+yU70PA8oPOLfAg7ZhsJJQA7V75ViXO5v9pagd3uxvxUss5zlrH5GA0HUCgv8cvmoBheob6Cd3ewSSE80k+yP3CLffdIepCdEcwKMZpaWDSmr48EagTBqxaU4Y+JcOHnPzG8tTAlYonw+JxPWrFqlypuzHzhn0+Kterzr5yOxRVaD39VzyW4Oqy/C9jbZoSfus7WKd2IIGqy7fDuNI5p8WBQPzLIunzPXbLbHe9h8rBre14j+kFSaTZRVmkLNpFolgXYfsnjAMhYngzEraltRtbpYG7kT93hAoGBAMiI6HlhPcv1+d6LFUK3orcMcpN8YPhNkOVsjCBhvMeLhW+X81xHK7H7RuBsSYW22UoJjIGaqTNSGGImkfBG3W4kH3tWlLBdRu9uSBzIOqrHVecKUX4G9bLPrS/ZuRYPt8jBohoF+sOXqh74dDT8LHcpn0IqgUlMYw8VpZYdRlPzAoGBALNcperwtvePqoO0DRAAK7+7zxo46rtFUbXZtjsLSFlEdxaiC7wQSmaCMdUEND2UBVPcqs6g+mKcFR1mLhtF7h02d0+oTihZHr5FvkGFfetbuu2o3skvm0LySgZwDYRARxnQd8cBSyrm92K71NEdzuQBg2fqF1Z9bHJ/pXYSrZLpAoGAev9mP5TCN4iegr4iAzLpLYcH+6gtPf8tYVqrs+zewjG0XVcA4FeS2G678UjZ65bUPdIPiSrYnu66n/DyUELW7Ahh+t+HAYmkyZSFzImPWlI7QSOWCkuwhcVVf2T2Xi6z1gHWMEn8nd03bhmMBTeq+kfgM9AoTlH47DalwqYgDbsCgYBVL42FtenQTiV4A82oacxddb94/stNQjD6o3oPNN6ZtxCwaSoVmc8cPH2aZDLDhEe7erSNCpugtey5V8xSG7ZpnXKxHIhyVVFqoQkpaVNSsvBm66tT9g5Rj21k/VcOFtEuC3q3w3+F0shv1jHPV87pL2bPtbh71XnqL4HQQDK78QKBgGwXQ4vnpVcYGKB7JDrGbqhmHhUKzNx5pSrUl4bx1r9tYyvAgyue0IxcXt19golmFVnxIzg2V8zl1Obc4pnnyWnATjZhPPzLTvzZQ0VkCDkRaN/DsFggZ15iYup3zFkXgePKCCuZJoPNyHNrU/CW+91DY3BMmRCcOXiIwWCeO0tH'),
('53e3f2de-f9a7-4c9f-b63e-4b48c12cbba7', '26515f61-7668-4f93-9b61-e4543a664fbe', 'host-sending-registration-request-must-match', 'true'),
('5704a97b-e239-4f98-b279-3f3161b51e5a', '5049d02f-7f7a-466e-9ead-201a3d2157db', 'priority', '100'),
('6b985cdd-01bc-4445-9f46-d2733d7c0f05', 'b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('758c3d72-1f1b-4061-a64f-429bcad1cd33', 'dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('77881c81-6832-4821-8191-dfcbdd88c0e3', 'efd36e9d-76a3-498f-a6cf-583c66657b0b', 'allow-default-scopes', 'true'),
('8931a734-791b-424b-aec1-89f5db9da06b', 'b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('89f90469-498c-42a7-8947-a4a242b1f530', 'dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('8b2876fe-fcee-47ad-9c27-a67171fd5b12', '69981276-706b-4795-acdf-d5958c690472', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('8b6c7fa2-7b7d-4925-b622-4a68dde5def9', '69981276-706b-4795-acdf-d5958c690472', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('920518fd-7a2e-4d33-82b9-969761237ea2', 'b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('973b19e4-b51b-4f53-b100-db267ca6c543', 'e3b09141-8446-4aa6-9bc9-bcb775ece8c9', 'allow-default-scopes', 'true'),
('a1765abd-2285-4a29-8930-307b87ae8fdc', '5c8f29c8-1eda-4c91-8388-1268130146de', 'priority', '100'),
('a1f04226-5d9e-4cdf-82a1-cda5fa81b1fc', '5c8f29c8-1eda-4c91-8388-1268130146de', 'kid', '9eb8e6f5-f1aa-4da3-99db-094c2a5ee9e1'),
('a3053364-deac-4a05-b57b-4dc882d8fa78', '3f470d61-5d43-4197-881b-6ade4d3343d8', 'max-clients', '200'),
('a6e2f06a-a541-4a77-974c-1e2babaa13cd', '69981276-706b-4795-acdf-d5958c690472', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('a745c4c4-1fad-4bb7-9ffb-27520cad87a1', 'b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('a944c0b5-68d6-4917-9825-333cd52de9b3', '54b86e35-e4b2-4973-a429-1f83ad39fcd8', 'secret', 'XiXkznE9mbBYTapWP-m3pg'),
('ad97a795-11d9-400e-aea4-ac5a6a60e3cb', '045fb915-1d42-4bce-95c2-11cd6835fb87', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('ae22c630-b277-42cb-bd52-0bf8ed3751b8', '26515f61-7668-4f93-9b61-e4543a664fbe', 'client-uris-must-match', 'true'),
('b9664ca7-ccae-4e87-bca5-47c0b66edea1', '045fb915-1d42-4bce-95c2-11cd6835fb87', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('bab64fe2-aa9f-4694-86e0-e02c0895cb7f', '69981276-706b-4795-acdf-d5958c690472', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('bb4bf26c-a1ad-4c2f-af0f-6d1e423fa169', 'fcebb056-3e04-4d4f-a21b-f6e72fe5cc72', 'certificate', 'MIICmzCCAYMCBgF609oqljANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwNzIzMTQ1MDI4WhcNMzEwNzIzMTQ1MjA4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCMgE24siePpbTcf1xKa2Kxyx78G9KKgAca81OGrnfUgHJ6qUvRXxbpn1aqDOn1AFjkqHfWetvzqULX3Un2lZPRvEnF/acCjDibGHrgPHe0QCeeBR6RqLa4V0gGiIt/u9LVvPy4fb3PtI7fxMjdgDyt3xhZKzJ6zxrLaHlyI9Jg1zyYjng+hQ82gh4g1wIchAeyEM0jfRyAtXJi+xXjeZwTV2ilJ1Ds0hKAwRVm0QYMDWYv0B84apko67LJOPuTrseIf99ODDxFhR5gBljtoEUc+6CZzdbCSMug3ohSnhnWedJQCA6FPS27iZMBoFP0Wc5D1PoXrsi44jW3XcKSGf4rAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADp9FyXhXTY9bxnSDmzFNqJ1HkyJ+K/NW8eSpBIXOMGiVSXjnztBI9sX604vlo3PV/rb2wXD4vt6bte/FCmaRcFkkYmIjlZQ6xLQpwcKoDtctEMQ6LI9MBTNARn1ap5qc5VsDl6fKvTC4J1jsyFPtcUP+9UKjd59vf+jGuaYn9otpPWPm0Mq6g1Gpm1y5eQFDYc/A2I5JaIzTpZJ3Bl/wpufWvIBHe0l6f3u+vysuSdAiUNVUxJPpCzazrfbkBTp5x5kGH2lD9dfyREpYeTNUOCgu2vULgsTLnkKyeLXdxWpOEiG7KNBx41ikS7QFY7XeN+f3LtyPgNPyIgrCcLMdiA='),
('bba17073-bd80-4645-87cd-5fb6c0a7ea74', '69981276-706b-4795-acdf-d5958c690472', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('bdc2dbe4-3a81-4413-a073-9b66194a0436', '045fb915-1d42-4bce-95c2-11cd6835fb87', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('c719df25-24e2-4021-9999-95609d40aaf7', '91d42b8c-2f14-4363-a41f-f48c5c1aa600', 'client-uris-must-match', 'true'),
('c7e89621-590e-4f17-b26f-178093cd1864', 'fcebb056-3e04-4d4f-a21b-f6e72fe5cc72', 'priority', '100'),
('ca9e6ddf-5d5c-4635-b0ec-1c477100ea19', 'b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('cdc62efd-be06-4be5-9084-1620fa333eaa', 'dc7ac6f7-be1c-4b78-b8c1-f088af26d03a', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('d0c9e5cd-eb81-494c-89f3-be0d7419ddd9', 'a43ab09c-a134-421b-8dcd-80a74b322028', 'algorithm', 'HS256'),
('d64b614d-e22a-4604-876b-0762c156fd26', '04a96835-b20e-426c-a19f-3cbcb8d5e49f', 'priority', '100'),
('d6ce58db-83ce-487d-8dc2-5fe91cab8643', 'a43ab09c-a134-421b-8dcd-80a74b322028', 'secret', 'P6J2ICI_9nXEP4qVY2mdjHJTmk24sOXgAg1be9kLhmCb1LOLcrdfnb7HDPcEUCxqc2cXBO8WYdz97vzPhlmpGA'),
('d8268c26-6707-4dae-8e74-aecd7384e7d2', '91d42b8c-2f14-4363-a41f-f48c5c1aa600', 'host-sending-registration-request-must-match', 'true'),
('dc6861f7-89d6-4df2-ab50-2e8299b1e035', '17a44f4e-f4f4-4767-9a3f-10d114b5c220', 'allow-default-scopes', 'true'),
('dd8c92fe-1829-45de-b584-89402d0384d2', '045fb915-1d42-4bce-95c2-11cd6835fb87', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('e6f91fd4-aa7b-4708-800f-28551b338988', 'a43ab09c-a134-421b-8dcd-80a74b322028', 'kid', '497aaad3-d181-4dbc-af88-d6299dcbe7dd'),
('eb35d3e0-b8f0-4a9d-9149-d97971979665', '5049d02f-7f7a-466e-9ead-201a3d2157db', 'algorithm', 'HS256'),
('ee7e56d8-c0a2-4a74-ad04-f50f390ec929', 'b0ea9e1c-ed68-44d5-8836-882c64255d1e', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('f788b083-5425-45a3-ba0b-4f3e8df88cac', '045fb915-1d42-4bce-95c2-11cd6835fb87', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('f79221d3-e09a-4fa0-86c1-b4c1985389a0', '5049d02f-7f7a-466e-9ead-201a3d2157db', 'kid', '1f5db150-1c9b-4f95-8dad-0d20fa04c907'),
('f92009fc-4188-4a9b-9bc6-abcd475e9461', '69981276-706b-4795-acdf-d5958c690472', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('fcbd795f-9e4c-41ea-a841-215b5ce3fc8f', '04a96835-b20e-426c-a19f-3cbcb8d5e49f', 'certificate', 'MIICpzCCAY8CBgF64hh4bTANBgkqhkiG9w0BAQsFADAXMRUwEwYDVQQDDAx2b2lsYTJzYW1wbGUwHhcNMjEwNzI2MDkxMzEyWhcNMzEwNzI2MDkxNDUyWjAXMRUwEwYDVQQDDAx2b2lsYTJzYW1wbGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCgBgr0k7BSOUUrn9y7fTVrbRRpJMcGAR0mvlciQoB9NVDCPVyHCb5QYXcPIxVqKvSP9zmd5r+k/SJjq67EpclrGsj8votrBKXUYEbDVGU5IHZ5rJoVjoB9beC7Eap++EVj6dMdsufUk/My4w6EhyU6ylijNlVkbISF0NEn4ZEz5kXFJNlQw+Cm34bx+g641orUA8J9h91d5xEdA2BWyuI3q2qF0zqfFL/U2DmkFW9F2EM+jxhCKyuHK1Fm/i0mdldrutZCpVAXOGGly/3Swar48dpwpi574c8voJaTwQAWEb4dSdwHXf2HUy2q0Vlq0YjeJE43IOJFAnvoP15xIB3NAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADIQiKlH7YcSyUVX7i/t/A30LqegSX2JwBHDFaRMvW+6Ojeah/B6kkbb4z/RmyTFts+RS2+tsZVGrk+w9GSc3txY60JiJ0ktVQApG48DXVpE3ssR2nzc67VpEveRT6m/7Ttd+cwcsJxgpjzLwKFN+zZrjJYdUMG6u0ANt+IyVWZSe2Uy0uWxswMTgrAlcwrCRQiOxDdBgolIbPBaPdR7VGdwIQxlZPzaJO8lIxHsTG5nuFCguDN72/+oy1whmQPLUAOfrkyqHQ8A16mdW7SmaqSqlu5iuqUOLwS/9zszCDsTU6EcibLdSO5o5yhfYbhrVljQbso38I1FW1SkR4CJUwI=');

-- --------------------------------------------------------

--
-- Struttura della tabella `composite_role`
--

CREATE TABLE `composite_role` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `composite_role`
--

INSERT INTO `composite_role` (`COMPOSITE`, `CHILD_ROLE`) VALUES
('10c02465-047b-4ea1-9ca5-43d92347540a', '75e9de18-df67-4ca4-ae7c-8f86f4d9d108'),
('256af1a6-0dfd-4609-af26-3842d47b52e4', '6526a020-3d74-474c-be45-ca31d9952ad8'),
('256af1a6-0dfd-4609-af26-3842d47b52e4', '780fe7ea-42a6-4862-a1c4-96e9b7476298'),
('256af1a6-0dfd-4609-af26-3842d47b52e4', 'c4917a20-42b5-4e4b-a229-9590c13d1f8c'),
('256af1a6-0dfd-4609-af26-3842d47b52e4', 'c56c4203-a26d-4fb4-8e86-a2278f53e5ac'),
('3ec75e50-4658-43c9-867b-9dab8be4a7e5', 'f8473156-72a2-4dbd-8d10-1265869cdf8e'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '1723f380-7919-464f-8dad-7ef7a744b623'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '180ffd4d-6b97-4d28-bb22-00d2d428b7a0'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '2ef969b2-59a1-4610-968a-a808c0dfb46a'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '3ec75e50-4658-43c9-867b-9dab8be4a7e5'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '66c326a7-ff7d-4089-a079-79ed978f96e8'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '6d71d720-16ea-4ab7-8dc2-db7fbb98cf5c'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '6f9043dd-1b85-4aa7-9aa8-15786bab5778'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '7ecd4a15-f7ee-42a9-b244-4ef2d45e3975'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '95974697-16b9-4cd2-877a-82886a40bcfa'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '9ca6b7fe-8a4c-4269-9904-fa8a9d782078'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '9e28f5f2-32ca-48fb-b209-0bbbf94bae55'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '9f58cae2-bbbb-4f9a-b270-4b3e5741395f'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', 'a31b2224-04f6-41c6-98b4-dc98a501aba6'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', 'bf04e200-5378-4720-ac7c-2aa2959a87a4'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', 'df14defa-9c76-40bd-a43a-958b5438c44a'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', 'f8473156-72a2-4dbd-8d10-1265869cdf8e'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', 'faf43590-cc0f-4e21-87bf-a01bd8f76fbe'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', 'fb1553ab-72e4-4626-bca2-fd06982e7e42'),
('40e8bc42-615a-4305-959b-a4156435ba16', '105e9786-6fe8-4439-8700-561a82a46a28'),
('40e8bc42-615a-4305-959b-a4156435ba16', '10c02465-047b-4ea1-9ca5-43d92347540a'),
('40e8bc42-615a-4305-959b-a4156435ba16', '14811a9b-3231-41a6-9dd8-9c3ca0985d6f'),
('40e8bc42-615a-4305-959b-a4156435ba16', '1bc3a1ac-d4fd-4b31-88b8-f4dd475c92a5'),
('40e8bc42-615a-4305-959b-a4156435ba16', '2412fde9-d40e-4eb8-9deb-0b3644c8e73b'),
('40e8bc42-615a-4305-959b-a4156435ba16', '24161732-3256-4493-8e9f-a725d54f6f53'),
('40e8bc42-615a-4305-959b-a4156435ba16', '2433af14-e71f-4ca3-a4c5-939e0fe23740'),
('40e8bc42-615a-4305-959b-a4156435ba16', '301d15e3-a5bc-4f89-b870-934bdbee7fc4'),
('40e8bc42-615a-4305-959b-a4156435ba16', '33fb0dc5-c330-4d12-8200-d626260b6892'),
('40e8bc42-615a-4305-959b-a4156435ba16', '36a3bb5f-49e7-46f9-9674-78cb6ce0d631'),
('40e8bc42-615a-4305-959b-a4156435ba16', '38269c27-c007-4614-82a8-76ebd834201b'),
('40e8bc42-615a-4305-959b-a4156435ba16', '3c70694c-daa0-482d-88f8-2909c2bbce01'),
('40e8bc42-615a-4305-959b-a4156435ba16', '40afc103-2f22-480e-8fcd-525488109906'),
('40e8bc42-615a-4305-959b-a4156435ba16', '5d218087-c3e9-490d-8a1c-962c3e8505c9'),
('40e8bc42-615a-4305-959b-a4156435ba16', '6a0a57fe-7a84-4a04-b077-8015d200b714'),
('40e8bc42-615a-4305-959b-a4156435ba16', '75e9de18-df67-4ca4-ae7c-8f86f4d9d108'),
('40e8bc42-615a-4305-959b-a4156435ba16', '7cba9309-9185-4c4d-9d28-e210abc9da31'),
('40e8bc42-615a-4305-959b-a4156435ba16', '8236c8f9-4364-490a-88a3-cfd6df8e560e'),
('40e8bc42-615a-4305-959b-a4156435ba16', '83d294b4-4310-4c77-947c-b8bf73dea3c5'),
('40e8bc42-615a-4305-959b-a4156435ba16', '8c35ce6a-ec14-479e-9e0a-8a15cb8a4867'),
('40e8bc42-615a-4305-959b-a4156435ba16', '93ea7c64-4947-425e-bad7-fb03fd104ec4'),
('40e8bc42-615a-4305-959b-a4156435ba16', '9627575d-ce69-435f-9dc9-f2d550382ae0'),
('40e8bc42-615a-4305-959b-a4156435ba16', '9ecb8f92-c17f-4b86-aad6-0f536eb92582'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'abfe8ec8-297e-4135-8d33-8ba8db8c43fd'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'b194aaa0-c5bd-46af-bf0d-c962fa507629'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'b51b887a-02e5-4931-be9b-6608872a5163'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'bba39dbf-7510-4cd6-8f30-688c015ea889'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'c53b7f6c-bfaf-4457-9cc1-ba98e0667275'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'caebb266-93b9-4a36-9bd3-42e2fcadbd62'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'cd10f61b-2d27-46c6-9f62-4e389d67f4ab'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'cec98e16-17d7-437d-9b09-0549c3326e8e'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'd7bb8860-96a1-4d52-8ae1-d8f8ea8c8a1d'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'd9145287-4010-4000-aea5-d0cd42744d24'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'dbdf1a1f-ca9f-4c21-a226-ee38468a05c7'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'e6be3a8f-3df5-486d-a518-2e049b234dd5'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'f1fabfcf-46d2-47fd-a4f1-95cfbb179fde'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'f80eb40c-7127-4d42-a020-142e130de5b3'),
('590f9e24-51fa-4dd3-a225-d6014c571c3b', '064ec1c9-d1db-4752-8d34-dee6844c743e'),
('5d218087-c3e9-490d-8a1c-962c3e8505c9', '9ecb8f92-c17f-4b86-aad6-0f536eb92582'),
('5d218087-c3e9-490d-8a1c-962c3e8505c9', 'c53b7f6c-bfaf-4457-9cc1-ba98e0667275'),
('68b3b76e-3ca7-4e98-a442-e1da7c78db2c', 'a2cb8649-bc6d-4418-a8cc-80fdd677f43b'),
('68b3b76e-3ca7-4e98-a442-e1da7c78db2c', 'd4de503b-dbe7-42aa-b3b6-ea1cc274d4bf'),
('68b3b76e-3ca7-4e98-a442-e1da7c78db2c', 'd885c93c-f6bf-4cd6-9f25-468e0b074569'),
('68b3b76e-3ca7-4e98-a442-e1da7c78db2c', 'e1691421-5819-4920-a638-5e2edce2579c'),
('6ba8b42b-49f0-4e8c-9a88-c958df7b1ffe', 'c1b01bb3-b7c6-4ba0-9a3e-d0ada5508583'),
('780fe7ea-42a6-4862-a1c4-96e9b7476298', '17d17a0f-fa7d-49d1-b764-9e5316884163'),
('b194aaa0-c5bd-46af-bf0d-c962fa507629', 'cec98e16-17d7-437d-9b09-0549c3326e8e'),
('bba39dbf-7510-4cd6-8f30-688c015ea889', '1bc3a1ac-d4fd-4b31-88b8-f4dd475c92a5'),
('bba39dbf-7510-4cd6-8f30-688c015ea889', '38269c27-c007-4614-82a8-76ebd834201b'),
('df14defa-9c76-40bd-a43a-958b5438c44a', '2ef969b2-59a1-4610-968a-a808c0dfb46a'),
('df14defa-9c76-40bd-a43a-958b5438c44a', '9ca6b7fe-8a4c-4269-9904-fa8a9d782078'),
('e1691421-5819-4920-a638-5e2edce2579c', 'b4c64fd4-ff18-4a3a-af76-2c46868ec920');

-- --------------------------------------------------------

--
-- Struttura della tabella `credential`
--

CREATE TABLE `credential` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext DEFAULT NULL,
  `CREDENTIAL_DATA` longtext DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `credential`
--

INSERT INTO `credential` (`ID`, `SALT`, `TYPE`, `USER_ID`, `CREATED_DATE`, `USER_LABEL`, `SECRET_DATA`, `CREDENTIAL_DATA`, `PRIORITY`) VALUES
('87233234-15d0-4966-b138-1fdd3f13e8dd', NULL, 'password', 'c94e0471-b8d4-42e0-b57e-08f9a817384b', 1627290939766, NULL, '{\"value\":\"pTvLPHqtZ9vjo/9qokHa6eYKyO3PoqPQQewRFfSOmdoVGKuXRbkUQoaUNc+tvG+dA6/J9OzkwZs7qZu5Ls5m0A==\",\"salt\":\"m7eADzt7EkdTr3S8RyJ5Gg==\",\"additionalParameters\":{}}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}', 10),
('c40b3eb1-846f-41c0-9176-c4e1f4c2f44d', NULL, 'password', 'c69f7d82-c1f1-46d0-9b02-bd9ae3a4d9dc', 1627290862244, NULL, '{\"value\":\"nnXSKUnXAJUX9O7bYXt+Eq4Xz+VE2D+0KoKixUxLhC7nCzD4qQ8kv7zV1pldLgNR9kAZJ8NgEaN+cxFqAA6y/A==\",\"salt\":\"5/xRYX3KHN7NQ1WiIk58Qg==\",\"additionalParameters\":{}}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}', 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `databasechangelog`
--

CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `databasechangelog`
--

INSERT INTO `databasechangelog` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2021-07-23 16:51:40', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2021-07-23 16:51:40', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2021-07-23 16:51:40', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2021-07-23 16:51:40', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2021-07-23 16:51:41', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2021-07-23 16:51:41', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2021-07-23 16:51:43', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2021-07-23 16:51:43', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2021-07-23 16:51:43', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2021-07-23 16:51:45', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2021-07-23 16:51:45', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2021-07-23 16:51:45', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2021-07-23 16:51:45', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-07-23 16:51:45', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-07-23 16:51:45', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-07-23 16:51:45', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-07-23 16:51:45', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2021-07-23 16:51:46', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2021-07-23 16:51:47', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2021-07-23 16:51:47', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-07-23 16:51:47', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-07-23 16:51:47', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2021-07-23 16:51:47', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2021-07-23 16:51:47', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2021-07-23 16:51:47', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2021-07-23 16:51:48', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2021-07-23 16:51:49', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2021-07-23 16:51:49', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2021-07-23 16:51:50', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2021-07-23 16:51:50', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2021-07-23 16:51:50', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2021-07-23 16:51:50', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-07-23 16:51:50', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-07-23 16:51:50', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-07-23 16:51:51', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2021-07-23 16:51:51', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-07-23 16:51:51', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2021-07-23 16:51:51', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2021-07-23 16:51:51', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-07-23 16:51:51', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-07-23 16:51:51', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2021-07-23 16:51:51', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-07-23 16:51:52', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2021-07-23 16:51:52', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-07-23 16:51:52', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-07-23 16:51:52', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-07-23 16:51:52', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-07-23 16:51:53', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-07-23 16:51:53', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2021-07-23 16:51:53', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2021-07-23 16:51:54', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2021-07-23 16:51:54', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2021-07-23 16:51:54', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2021-07-23 16:51:54', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-07-23 16:51:54', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-07-23 16:51:54', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-07-23 16:51:54', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-07-23 16:51:56', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2021-07-23 16:51:56', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2021-07-23 16:51:56', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-07-23 16:51:56', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-07-23 16:51:56', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2021-07-23 16:51:56', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2021-07-23 16:51:56', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-07-23 16:51:56', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2021-07-23 16:51:57', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-07-23 16:51:57', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2021-07-23 16:51:57', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2021-07-23 16:51:57', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2021-07-23 16:51:57', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2021-07-23 16:51:57', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-07-23 16:51:57', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-07-23 16:51:57', 73, 'EXECUTED', '7:3979a0ae07ac465e920ca696532fc736', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-07-23 16:51:57', 74, 'MARK_RAN', '7:5abfde4c259119d143bd2fbf49ac2bca', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-07-23 16:51:57', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-07-23 16:51:57', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-07-23 16:51:57', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-07-23 16:51:57', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-07-23 16:51:58', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-07-23 16:51:58', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-07-23 16:51:58', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-07-23 16:51:58', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-07-23 16:51:58', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-07-23 16:51:58', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-07-23 16:51:58', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2021-07-23 16:51:58', 86, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-07-23 16:51:58', 87, 'EXECUTED', '7:578d0b92077eaf2ab95ad0ec087aa903', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-07-23 16:51:58', 88, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-07-23 16:51:58', 89, 'EXECUTED', '7:f1313bcc2994a5c4dc1062ed6d8282d3', 'addColumn tableName=REALM; customChange', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-07-23 16:51:58', 90, 'EXECUTED', '7:90d763b52eaffebefbcbde55f269508b', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-07-23 16:51:58', 91, 'EXECUTED', '7:d554f0cb92b764470dccfa5e0014a7dd', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-07-23 16:51:58', 92, 'EXECUTED', '7:73193e3ab3c35cf0f37ccea3bf783764', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-07-23 16:51:58', 93, 'MARK_RAN', '7:90a1e74f92e9cbaa0c5eab80b8a037f3', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-07-23 16:51:58', 94, 'EXECUTED', '7:5b9248f29cd047c200083cc6d8388b16', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-07-23 16:51:58', 95, 'MARK_RAN', '7:64db59e44c374f13955489e8990d17a1', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-07-23 16:51:58', 96, 'EXECUTED', '7:329a578cdb43262fff975f0a7f6cda60', 'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2021-07-23 16:51:59', 97, 'EXECUTED', '7:fae0de241ac0fd0bbc2b380b85e4f567', 'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2021-07-23 16:51:59', 98, 'MARK_RAN', '7:075d54e9180f49bb0c64ca4218936e81', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('14.0.0-KEYCLOAK-18286-mysql', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2021-07-23 16:51:59', 99, 'EXECUTED', '7:b558ad47ea0e4d3c3514225a49cc0d65', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2021-07-23 16:51:59', 100, 'EXECUTED', '7:1a7f28ff8d9e53aeb879d76ea3d9341a', 'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '7051896344'),
('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2021-07-23 16:51:59', 101, 'EXECUTED', '7:2fd554456fed4a82c698c555c5b751b6', 'customChange', '', NULL, '3.5.4', NULL, NULL, '7051896344');

-- --------------------------------------------------------

--
-- Struttura della tabella `databasechangeloglock`
--

CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `databasechangeloglock`
--

INSERT INTO `databasechangeloglock` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
(1, b'0', NULL, NULL),
(1000, b'0', NULL, NULL),
(1001, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `default_client_scope`
--

CREATE TABLE `default_client_scope` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `default_client_scope`
--

INSERT INTO `default_client_scope` (`REALM_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`) VALUES
('master', '40a33ca3-3c56-45f5-81c9-a4d820b23563', b'1'),
('master', '42032ccc-af52-4e7a-a7c8-817a089af9fa', b'1'),
('master', '873a2d21-f57b-47b1-895b-3e2dca759255', b'1'),
('master', 'a6faeca6-84a1-43b2-ad2c-03d85c83a9bf', b'0'),
('master', 'c1c1e980-1ac1-4996-9f54-c8e8330d267d', b'1'),
('master', 'd0741ee2-2bfb-49dd-8024-11ab4a45584f', b'0'),
('master', 'd43a17d1-5289-4dc0-bb06-a290adccc490', b'1'),
('master', 'f46e1297-8cbb-45c5-8679-63b1d3fa80ea', b'0'),
('master', 'f5eafb1e-505e-455b-8b6f-124de41afb57', b'0'),
('yourstore', '26b95982-848e-4cbd-8f04-6720d5680943', b'1'),
('yourstore', '2f766d61-b28e-4165-a1ac-a5435430c894', b'1'),
('yourstore', '3aa954f6-b118-40cf-a332-f2d3b0e544ca', b'1'),
('yourstore', '4504e010-e859-443b-a833-9daee4e2c08c', b'0'),
('yourstore', '4632922f-50c5-412f-a8c0-b1f01705e8fa', b'0'),
('yourstore', '5f053946-cd36-4af8-9db5-4fa74c831069', b'0'),
('yourstore', '894c3e8f-303d-4a47-b335-2082dce3dc64', b'1'),
('yourstore', 'b6adebd7-8138-49f1-af5a-45f3220009c5', b'1'),
('yourstore', 'f24d6d46-1042-4953-957a-51020078d0cc', b'0');

-- --------------------------------------------------------

--
-- Struttura della tabella `event_entity`
--

CREATE TABLE `event_entity` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `federated_identity`
--

CREATE TABLE `federated_identity` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `federated_user`
--

CREATE TABLE `federated_user` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fed_user_attribute`
--

CREATE TABLE `fed_user_attribute` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fed_user_consent`
--

CREATE TABLE `fed_user_consent` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fed_user_consent_cl_scope`
--

CREATE TABLE `fed_user_consent_cl_scope` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fed_user_credential`
--

CREATE TABLE `fed_user_credential` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext DEFAULT NULL,
  `CREDENTIAL_DATA` longtext DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fed_user_group_membership`
--

CREATE TABLE `fed_user_group_membership` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fed_user_required_action`
--

CREATE TABLE `fed_user_required_action` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fed_user_role_mapping`
--

CREATE TABLE `fed_user_role_mapping` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `group_attribute`
--

CREATE TABLE `group_attribute` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `group_role_mapping`
--

CREATE TABLE `group_role_mapping` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `group_role_mapping`
--

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES
('1723f380-7919-464f-8dad-7ef7a744b623', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('2ef969b2-59a1-4610-968a-a808c0dfb46a', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('66c326a7-ff7d-4089-a079-79ed978f96e8', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('6f9043dd-1b85-4aa7-9aa8-15786bab5778', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('7ecd4a15-f7ee-42a9-b244-4ef2d45e3975', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('9ca6b7fe-8a4c-4269-9904-fa8a9d782078', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('9e28f5f2-32ca-48fb-b209-0bbbf94bae55', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('9f58cae2-bbbb-4f9a-b270-4b3e5741395f', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('bf04e200-5378-4720-ac7c-2aa2959a87a4', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('f8473156-72a2-4dbd-8d10-1265869cdf8e', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('faf43590-cc0f-4e21-87bf-a01bd8f76fbe', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a'),
('fb1553ab-72e4-4626-bca2-fd06982e7e42', 'a0e054dc-ff85-4c6a-8c09-56c651ce1d2a');

-- --------------------------------------------------------

--
-- Struttura della tabella `identity_provider`
--

CREATE TABLE `identity_provider` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `identity_provider_config`
--

CREATE TABLE `identity_provider_config` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `identity_provider_mapper`
--

CREATE TABLE `identity_provider_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `idp_mapper_config`
--

CREATE TABLE `idp_mapper_config` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `keycloak_group`
--

CREATE TABLE `keycloak_group` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `keycloak_group`
--

INSERT INTO `keycloak_group` (`ID`, `NAME`, `PARENT_GROUP`, `REALM_ID`) VALUES
('a0e054dc-ff85-4c6a-8c09-56c651ce1d2a', 'administrators', NULL, 'yourstore'),
('cfb65df7-9c94-439f-a2af-99e832d502d3', 'users', NULL, 'yourstore');

-- --------------------------------------------------------

--
-- Struttura della tabella `keycloak_role`
--

CREATE TABLE `keycloak_role` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `keycloak_role`
--

INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('064ec1c9-d1db-4752-8d34-dee6844c743e', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', b'1', '${role_view-consent}', 'view-consent', 'master', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', NULL),
('105e9786-6fe8-4439-8700-561a82a46a28', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_manage-realm}', 'manage-realm', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('10c02465-047b-4ea1-9ca5-43d92347540a', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_view-clients}', 'view-clients', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('14811a9b-3231-41a6-9dd8-9c3ca0985d6f', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_manage-authorization}', 'manage-authorization', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('1723f380-7919-464f-8dad-7ef7a744b623', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_impersonation}', 'impersonation', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('17d17a0f-fa7d-49d1-b764-9e5316884163', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', b'1', '${role_manage-account-links}', 'manage-account-links', 'master', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', NULL),
('180ffd4d-6b97-4d28-bb22-00d2d428b7a0', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('1bc3a1ac-d4fd-4b31-88b8-f4dd475c92a5', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_query-users}', 'query-users', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('2412fde9-d40e-4eb8-9deb-0b3644c8e73b', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_manage-authorization}', 'manage-authorization', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('24161732-3256-4493-8e9f-a725d54f6f53', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_manage-users}', 'manage-users', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('2433af14-e71f-4ca3-a4c5-939e0fe23740', 'master', b'0', '${role_create-realm}', 'create-realm', 'master', NULL, NULL),
('256af1a6-0dfd-4609-af26-3842d47b52e4', 'master', b'0', '${role_default-roles}', 'default-roles-master', 'master', NULL, NULL),
('2ef969b2-59a1-4610-968a-a808c0dfb46a', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_query-groups}', 'query-groups', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('301d15e3-a5bc-4f89-b870-934bdbee7fc4', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_create-client}', 'create-client', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('33fb0dc5-c330-4d12-8200-d626260b6892', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('36a3bb5f-49e7-46f9-9674-78cb6ce0d631', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_view-authorization}', 'view-authorization', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('38269c27-c007-4614-82a8-76ebd834201b', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_query-groups}', 'query-groups', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('3c70694c-daa0-482d-88f8-2909c2bbce01', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('3ec75e50-4658-43c9-867b-9dab8be4a7e5', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_view-clients}', 'view-clients', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('3fe5a0f4-e03e-443d-9778-8fc4f043f496', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_realm-admin}', 'realm-admin', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('40afc103-2f22-480e-8fcd-525488109906', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_view-authorization}', 'view-authorization', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('40e8bc42-615a-4305-959b-a4156435ba16', 'master', b'0', '${role_admin}', 'admin', 'master', NULL, NULL),
('46712146-689b-4f0b-80dd-142bc0b9085d', '89560863-f6a8-4a15-b726-f6ac6110a9ad', b'1', '${role_delete-account}', 'delete-account', 'yourstore', '89560863-f6a8-4a15-b726-f6ac6110a9ad', NULL),
('590f9e24-51fa-4dd3-a225-d6014c571c3b', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', b'1', '${role_manage-consent}', 'manage-consent', 'master', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', NULL),
('5d218087-c3e9-490d-8a1c-962c3e8505c9', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_view-users}', 'view-users', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('6526a020-3d74-474c-be45-ca31d9952ad8', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', b'1', '${role_view-profile}', 'view-profile', 'master', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', NULL),
('66c326a7-ff7d-4089-a079-79ed978f96e8', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('68b3b76e-3ca7-4e98-a442-e1da7c78db2c', 'yourstore', b'0', '${role_default-roles}', 'default-roles-yourstore', 'yourstore', NULL, NULL),
('6a0a57fe-7a84-4a04-b077-8015d200b714', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_impersonation}', 'impersonation', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('6ba8b42b-49f0-4e8c-9a88-c958df7b1ffe', '89560863-f6a8-4a15-b726-f6ac6110a9ad', b'1', '${role_manage-consent}', 'manage-consent', 'yourstore', '89560863-f6a8-4a15-b726-f6ac6110a9ad', NULL),
('6d71d720-16ea-4ab7-8dc2-db7fbb98cf5c', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_view-authorization}', 'view-authorization', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('6f9043dd-1b85-4aa7-9aa8-15786bab5778', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_manage-authorization}', 'manage-authorization', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('75e9de18-df67-4ca4-ae7c-8f86f4d9d108', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_query-clients}', 'query-clients', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('780fe7ea-42a6-4862-a1c4-96e9b7476298', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', b'1', '${role_manage-account}', 'manage-account', 'master', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', NULL),
('7cba9309-9185-4c4d-9d28-e210abc9da31', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_create-client}', 'create-client', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('7ecd4a15-f7ee-42a9-b244-4ef2d45e3975', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_manage-realm}', 'manage-realm', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('8236c8f9-4364-490a-88a3-cfd6df8e560e', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('83d294b4-4310-4c77-947c-b8bf73dea3c5', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_manage-events}', 'manage-events', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('8a1d1fe7-5e33-45d3-bc3b-2a61421a755f', '6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', b'1', '${role_read-token}', 'read-token', 'master', '6cf4ed30-6a93-4d22-b7d4-4415b2cc584b', NULL),
('8a80d139-9708-4c56-9bb8-b277a77df06f', '89560863-f6a8-4a15-b726-f6ac6110a9ad', b'1', '${role_view-applications}', 'view-applications', 'yourstore', '89560863-f6a8-4a15-b726-f6ac6110a9ad', NULL),
('8c35ce6a-ec14-479e-9e0a-8a15cb8a4867', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_view-events}', 'view-events', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('93ea7c64-4947-425e-bad7-fb03fd104ec4', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_view-realm}', 'view-realm', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('95974697-16b9-4cd2-877a-82886a40bcfa', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_view-events}', 'view-events', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('9627575d-ce69-435f-9dc9-f2d550382ae0', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('9ca6b7fe-8a4c-4269-9904-fa8a9d782078', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_query-users}', 'query-users', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('9e28f5f2-32ca-48fb-b209-0bbbf94bae55', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_create-client}', 'create-client', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('9ecb8f92-c17f-4b86-aad6-0f536eb92582', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_query-users}', 'query-users', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('9f58cae2-bbbb-4f9a-b270-4b3e5741395f', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_query-realms}', 'query-realms', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('a2cb8649-bc6d-4418-a8cc-80fdd677f43b', 'yourstore', b'0', '${role_offline-access}', 'offline_access', 'yourstore', NULL, NULL),
('a31b2224-04f6-41c6-98b4-dc98a501aba6', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_view-realm}', 'view-realm', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('abfe8ec8-297e-4135-8d33-8ba8db8c43fd', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_manage-clients}', 'manage-clients', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('b194aaa0-c5bd-46af-bf0d-c962fa507629', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_view-clients}', 'view-clients', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('b4c64fd4-ff18-4a3a-af76-2c46868ec920', '89560863-f6a8-4a15-b726-f6ac6110a9ad', b'1', '${role_manage-account-links}', 'manage-account-links', 'yourstore', '89560863-f6a8-4a15-b726-f6ac6110a9ad', NULL),
('b51b887a-02e5-4931-be9b-6608872a5163', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_manage-realm}', 'manage-realm', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('bba39dbf-7510-4cd6-8f30-688c015ea889', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_view-users}', 'view-users', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('bf04e200-5378-4720-ac7c-2aa2959a87a4', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_manage-users}', 'manage-users', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('c0a8509e-884f-4451-bcee-54531716a183', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', b'1', '${role_view-applications}', 'view-applications', 'master', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', NULL),
('c1b01bb3-b7c6-4ba0-9a3e-d0ada5508583', '89560863-f6a8-4a15-b726-f6ac6110a9ad', b'1', '${role_view-consent}', 'view-consent', 'yourstore', '89560863-f6a8-4a15-b726-f6ac6110a9ad', NULL),
('c4917a20-42b5-4e4b-a229-9590c13d1f8c', 'master', b'0', '${role_uma_authorization}', 'uma_authorization', 'master', NULL, NULL),
('c53b7f6c-bfaf-4457-9cc1-ba98e0667275', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_query-groups}', 'query-groups', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('c56c4203-a26d-4fb4-8e86-a2278f53e5ac', 'master', b'0', '${role_offline-access}', 'offline_access', 'master', NULL, NULL),
('caebb266-93b9-4a36-9bd3-42e2fcadbd62', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_manage-clients}', 'manage-clients', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('cd10f61b-2d27-46c6-9f62-4e389d67f4ab', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_view-realm}', 'view-realm', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('cec98e16-17d7-437d-9b09-0549c3326e8e', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_query-clients}', 'query-clients', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('d4de503b-dbe7-42aa-b3b6-ea1cc274d4bf', '89560863-f6a8-4a15-b726-f6ac6110a9ad', b'1', '${role_view-profile}', 'view-profile', 'yourstore', '89560863-f6a8-4a15-b726-f6ac6110a9ad', NULL),
('d7bb8860-96a1-4d52-8ae1-d8f8ea8c8a1d', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_manage-users}', 'manage-users', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('d885c93c-f6bf-4cd6-9f25-468e0b074569', 'yourstore', b'0', '${role_uma_authorization}', 'uma_authorization', 'yourstore', NULL, NULL),
('d9145287-4010-4000-aea5-d0cd42744d24', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_view-events}', 'view-events', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('dbdf1a1f-ca9f-4c21-a226-ee38468a05c7', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_query-realms}', 'query-realms', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('dcbe2163-809c-47b2-93b2-393e5e2e92e0', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', b'1', '${role_delete-account}', 'delete-account', 'master', 'f53b632f-7ada-4083-9f6d-3a25ae4161d7', NULL),
('df14defa-9c76-40bd-a43a-958b5438c44a', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_view-users}', 'view-users', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('e1691421-5819-4920-a638-5e2edce2579c', '89560863-f6a8-4a15-b726-f6ac6110a9ad', b'1', '${role_manage-account}', 'manage-account', 'yourstore', '89560863-f6a8-4a15-b726-f6ac6110a9ad', NULL),
('e6be3a8f-3df5-486d-a518-2e049b234dd5', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_manage-events}', 'manage-events', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('f1fabfcf-46d2-47fd-a4f1-95cfbb179fde', '1672d599-7171-47c0-8246-d4db4d421ea9', b'1', '${role_query-realms}', 'query-realms', 'master', '1672d599-7171-47c0-8246-d4db4d421ea9', NULL),
('f6f0d299-0c40-440c-bde4-459a03ab0531', '25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', b'1', '${role_read-token}', 'read-token', 'yourstore', '25ffac5a-4c0c-45eb-8c5e-e0e81f9b928f', NULL),
('f80eb40c-7127-4d42-a020-142e130de5b3', 'dec12da6-e778-472a-9558-ef50042e49d1', b'1', '${role_impersonation}', 'impersonation', 'master', 'dec12da6-e778-472a-9558-ef50042e49d1', NULL),
('f8473156-72a2-4dbd-8d10-1265869cdf8e', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_query-clients}', 'query-clients', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('faf43590-cc0f-4e21-87bf-a01bd8f76fbe', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_manage-clients}', 'manage-clients', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL),
('fb1553ab-72e4-4626-bca2-fd06982e7e42', '8245b28e-98e6-49c2-9185-9d90e3fc649e', b'1', '${role_manage-events}', 'manage-events', 'yourstore', '8245b28e-98e6-49c2-9185-9d90e3fc649e', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `migration_model`
--

CREATE TABLE `migration_model` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `migration_model`
--

INSERT INTO `migration_model` (`ID`, `VERSION`, `UPDATE_TIME`) VALUES
('8iqhe', '14.0.0', 1627051926);

-- --------------------------------------------------------

--
-- Struttura della tabella `offline_client_session`
--

CREATE TABLE `offline_client_session` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `offline_user_session`
--

CREATE TABLE `offline_user_session` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `policy_config`
--

CREATE TABLE `policy_config` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `protocol_mapper`
--

CREATE TABLE `protocol_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `protocol_mapper`
--

INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CLIENT_ID`, `CLIENT_SCOPE_ID`) VALUES
('0a35877d-7b2d-4bf5-8a15-9cf7cbed7c7f', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('0a4c8e26-7643-4aee-b3c4-80999ba02f0d', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '2f766d61-b28e-4165-a1ac-a5435430c894'),
('0cf5e042-6854-4c1a-834c-7ff35220bb65', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('13e59bdb-3d8f-4f1f-bc3d-9f4fd0e17899', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'c1c1e980-1ac1-4996-9f54-c8e8330d267d'),
('20ebb153-e065-4966-8014-acdf2ae20c71', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('228d8434-8dd6-447a-9d45-227bd2cb5460', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('22ed644a-1cb8-4ce5-a878-0a827331f577', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'f24d6d46-1042-4953-957a-51020078d0cc'),
('2a931723-9f78-437d-9c37-bf1402644570', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd0741ee2-2bfb-49dd-8024-11ab4a45584f'),
('2aca88a5-b1d5-438f-833e-c1a007a17f4b', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '873a2d21-f57b-47b1-895b-3e2dca759255'),
('2c89cf7e-92eb-4e10-abaf-b5535780645d', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('2cbdf850-bdf5-4832-8fff-6655631d14e5', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('34dd3d58-7d52-444b-a2aa-744988cdff7d', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('3ef988b9-c189-4e97-904a-9044df3610dd', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('420f8747-89f4-4351-9480-d7b0e9b41fd2', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '873a2d21-f57b-47b1-895b-3e2dca759255'),
('453519a3-0268-4910-8ed4-9fe9855eb1b2', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'c1c1e980-1ac1-4996-9f54-c8e8330d267d'),
('4fe74b80-cc59-4e2a-b543-6fb1b00c4fb7', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '9de1f167-7240-4fe6-84de-2a871e589279', NULL),
('52a582d1-ffce-48dc-9214-2b812740f710', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '4504e010-e859-443b-a833-9daee4e2c08c'),
('58ddb59c-2c9f-4a1d-8f8e-6c42afcd485b', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd0741ee2-2bfb-49dd-8024-11ab4a45584f'),
('5bd1cd99-0c8b-4e82-a381-088ac2eca12a', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('5f0a286d-2e0a-4e5f-8a3e-8ea4be9d7148', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('66da992a-b295-4a43-913d-91d7a73b60a5', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('6c34a695-4e77-456e-a409-00a6396264f4', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '4504e010-e859-443b-a833-9daee4e2c08c'),
('72aa38f6-d370-4f7e-be27-1ed6f6d3a6fe', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('745e3348-f121-4676-a95f-9addad024a8c', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '26b95982-848e-4cbd-8f04-6720d5680943'),
('7b90af68-9b57-4fed-86c5-9a6e1c713bdd', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('7c4e4d2f-c8fe-4ddf-8d90-f0fc9ff028fb', 'role list', 'saml', 'saml-role-list-mapper', NULL, '894c3e8f-303d-4a47-b335-2082dce3dc64'),
('7ffb15a6-ee7a-4f49-881d-dc7eef1e675c', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('8bde3b67-155f-43a1-a1f2-46e2153f9086', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'd43a17d1-5289-4dc0-bb06-a290adccc490'),
('8be2cb95-da98-4f74-a243-b9e27493539e', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'c1c1e980-1ac1-4996-9f54-c8e8330d267d'),
('8f9f950a-6edc-4e06-acc0-bc15527db10c', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '7c4498bd-7460-4485-b217-092e9f6dc10e', NULL),
('92ff4cae-5fbe-4b03-8fbd-9563e7fc31fb', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'f5eafb1e-505e-455b-8b6f-124de41afb57'),
('9942db52-e531-4a3e-bc93-dbbdb307130a', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '42032ccc-af52-4e7a-a7c8-817a089af9fa'),
('9a92c323-999a-4626-afc6-091dc21f5a73', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('9b016eef-b4c3-4424-b5d8-9cc7488657c2', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '8c0b103b-23e7-44b1-a722-6713674c3640', NULL),
('9b999819-77ec-4027-9ad7-c8ea5e666f94', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'b6adebd7-8138-49f1-af5a-45f3220009c5'),
('a6d98a75-80b6-4865-8088-3b5af80745c2', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f5eafb1e-505e-455b-8b6f-124de41afb57'),
('a99005ef-3afb-47eb-8afc-7dcb10353fb7', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('abcf1c4f-611f-4be6-8975-647538f035bf', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('ae8e44f0-290e-47d2-9a5c-596d1d82ede2', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('b02e0841-8cb6-4a69-aa2c-6dcc37ffe7cb', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '4632922f-50c5-412f-a8c0-b1f01705e8fa'),
('b6ed13aa-4d23-4b9a-bbd3-bb0c773605c6', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '26b95982-848e-4cbd-8f04-6720d5680943'),
('c4da36bc-dbaf-49b1-b2e2-10a2a2d35351', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('c54aae46-3fc0-4512-859c-7b80dbe59be9', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('c71e71a2-d180-4f3f-a20f-c2b3f15329e5', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('cd00bd4b-346c-4f3e-832b-f64c90decc74', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('d477440c-a128-4fa0-831a-d2c8512ffe7d', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '2f766d61-b28e-4165-a1ac-a5435430c894'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'a6faeca6-84a1-43b2-ad2c-03d85c83a9bf'),
('e28a5640-4c95-4e5b-be23-0d2ba34f4001', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('e3119b60-cab0-4b99-97ad-b10ffa6f349a', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('e3dbad8b-030b-4d10-a163-4557d11be9c6', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'bcf9ad29-2102-42ea-be8d-2e5d97ea835d', NULL),
('e4b18b32-c824-4ed2-882a-f90ab5595122', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '26b95982-848e-4cbd-8f04-6720d5680943'),
('eb331079-a2af-440d-8f83-cdcb7162c2de', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('f2b96020-c7bb-4f53-95d1-70d46b4042d6', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '40a33ca3-3c56-45f5-81c9-a4d820b23563'),
('fa73a25c-a0ec-4a26-8942-b95b0d5455b5', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '3aa954f6-b118-40cf-a332-f2d3b0e544ca'),
('fe488bd1-77cd-483e-bb14-0efb41cae14e', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '4632922f-50c5-412f-a8c0-b1f01705e8fa');

-- --------------------------------------------------------

--
-- Struttura della tabella `protocol_mapper_config`
--

CREATE TABLE `protocol_mapper_config` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `protocol_mapper_config`
--

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES
('0a35877d-7b2d-4bf5-8a15-9cf7cbed7c7f', 'true', 'access.token.claim'),
('0a35877d-7b2d-4bf5-8a15-9cf7cbed7c7f', 'family_name', 'claim.name'),
('0a35877d-7b2d-4bf5-8a15-9cf7cbed7c7f', 'true', 'id.token.claim'),
('0a35877d-7b2d-4bf5-8a15-9cf7cbed7c7f', 'String', 'jsonType.label'),
('0a35877d-7b2d-4bf5-8a15-9cf7cbed7c7f', 'lastName', 'user.attribute'),
('0a35877d-7b2d-4bf5-8a15-9cf7cbed7c7f', 'true', 'userinfo.token.claim'),
('0a4c8e26-7643-4aee-b3c4-80999ba02f0d', 'true', 'access.token.claim'),
('0a4c8e26-7643-4aee-b3c4-80999ba02f0d', 'email', 'claim.name'),
('0a4c8e26-7643-4aee-b3c4-80999ba02f0d', 'true', 'id.token.claim'),
('0a4c8e26-7643-4aee-b3c4-80999ba02f0d', 'String', 'jsonType.label'),
('0a4c8e26-7643-4aee-b3c4-80999ba02f0d', 'email', 'user.attribute'),
('0a4c8e26-7643-4aee-b3c4-80999ba02f0d', 'true', 'userinfo.token.claim'),
('0cf5e042-6854-4c1a-834c-7ff35220bb65', 'true', 'access.token.claim'),
('0cf5e042-6854-4c1a-834c-7ff35220bb65', 'locale', 'claim.name'),
('0cf5e042-6854-4c1a-834c-7ff35220bb65', 'true', 'id.token.claim'),
('0cf5e042-6854-4c1a-834c-7ff35220bb65', 'String', 'jsonType.label'),
('0cf5e042-6854-4c1a-834c-7ff35220bb65', 'locale', 'user.attribute'),
('0cf5e042-6854-4c1a-834c-7ff35220bb65', 'true', 'userinfo.token.claim'),
('13e59bdb-3d8f-4f1f-bc3d-9f4fd0e17899', 'true', 'access.token.claim'),
('13e59bdb-3d8f-4f1f-bc3d-9f4fd0e17899', 'resource_access.${client_id}.roles', 'claim.name'),
('13e59bdb-3d8f-4f1f-bc3d-9f4fd0e17899', 'String', 'jsonType.label'),
('13e59bdb-3d8f-4f1f-bc3d-9f4fd0e17899', 'true', 'multivalued'),
('13e59bdb-3d8f-4f1f-bc3d-9f4fd0e17899', 'foo', 'user.attribute'),
('20ebb153-e065-4966-8014-acdf2ae20c71', 'true', 'access.token.claim'),
('20ebb153-e065-4966-8014-acdf2ae20c71', 'zoneinfo', 'claim.name'),
('20ebb153-e065-4966-8014-acdf2ae20c71', 'true', 'id.token.claim'),
('20ebb153-e065-4966-8014-acdf2ae20c71', 'String', 'jsonType.label'),
('20ebb153-e065-4966-8014-acdf2ae20c71', 'zoneinfo', 'user.attribute'),
('20ebb153-e065-4966-8014-acdf2ae20c71', 'true', 'userinfo.token.claim'),
('228d8434-8dd6-447a-9d45-227bd2cb5460', 'true', 'access.token.claim'),
('228d8434-8dd6-447a-9d45-227bd2cb5460', 'birthdate', 'claim.name'),
('228d8434-8dd6-447a-9d45-227bd2cb5460', 'true', 'id.token.claim'),
('228d8434-8dd6-447a-9d45-227bd2cb5460', 'String', 'jsonType.label'),
('228d8434-8dd6-447a-9d45-227bd2cb5460', 'birthdate', 'user.attribute'),
('228d8434-8dd6-447a-9d45-227bd2cb5460', 'true', 'userinfo.token.claim'),
('22ed644a-1cb8-4ce5-a878-0a827331f577', 'true', 'access.token.claim'),
('22ed644a-1cb8-4ce5-a878-0a827331f577', 'preferred_username', 'claim.name'),
('22ed644a-1cb8-4ce5-a878-0a827331f577', 'true', 'id.token.claim'),
('22ed644a-1cb8-4ce5-a878-0a827331f577', 'String', 'jsonType.label'),
('22ed644a-1cb8-4ce5-a878-0a827331f577', 'username', 'user.attribute'),
('22ed644a-1cb8-4ce5-a878-0a827331f577', 'true', 'userinfo.token.claim'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'true', 'access.token.claim'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'true', 'id.token.claim'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'country', 'user.attribute.country'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'formatted', 'user.attribute.formatted'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'locality', 'user.attribute.locality'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'postal_code', 'user.attribute.postal_code'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'region', 'user.attribute.region'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'street', 'user.attribute.street'),
('27b27c65-c5af-4ebd-a49e-822046fad3f8', 'true', 'userinfo.token.claim'),
('2a931723-9f78-437d-9c37-bf1402644570', 'true', 'access.token.claim'),
('2a931723-9f78-437d-9c37-bf1402644570', 'phone_number', 'claim.name'),
('2a931723-9f78-437d-9c37-bf1402644570', 'true', 'id.token.claim'),
('2a931723-9f78-437d-9c37-bf1402644570', 'String', 'jsonType.label'),
('2a931723-9f78-437d-9c37-bf1402644570', 'phoneNumber', 'user.attribute'),
('2a931723-9f78-437d-9c37-bf1402644570', 'true', 'userinfo.token.claim'),
('2aca88a5-b1d5-438f-833e-c1a007a17f4b', 'true', 'access.token.claim'),
('2aca88a5-b1d5-438f-833e-c1a007a17f4b', 'email_verified', 'claim.name'),
('2aca88a5-b1d5-438f-833e-c1a007a17f4b', 'true', 'id.token.claim'),
('2aca88a5-b1d5-438f-833e-c1a007a17f4b', 'boolean', 'jsonType.label'),
('2aca88a5-b1d5-438f-833e-c1a007a17f4b', 'emailVerified', 'user.attribute'),
('2aca88a5-b1d5-438f-833e-c1a007a17f4b', 'true', 'userinfo.token.claim'),
('2c89cf7e-92eb-4e10-abaf-b5535780645d', 'true', 'access.token.claim'),
('2c89cf7e-92eb-4e10-abaf-b5535780645d', 'family_name', 'claim.name'),
('2c89cf7e-92eb-4e10-abaf-b5535780645d', 'true', 'id.token.claim'),
('2c89cf7e-92eb-4e10-abaf-b5535780645d', 'String', 'jsonType.label'),
('2c89cf7e-92eb-4e10-abaf-b5535780645d', 'lastName', 'user.attribute'),
('2c89cf7e-92eb-4e10-abaf-b5535780645d', 'true', 'userinfo.token.claim'),
('2cbdf850-bdf5-4832-8fff-6655631d14e5', 'true', 'access.token.claim'),
('2cbdf850-bdf5-4832-8fff-6655631d14e5', 'nickname', 'claim.name'),
('2cbdf850-bdf5-4832-8fff-6655631d14e5', 'true', 'id.token.claim'),
('2cbdf850-bdf5-4832-8fff-6655631d14e5', 'String', 'jsonType.label'),
('2cbdf850-bdf5-4832-8fff-6655631d14e5', 'nickname', 'user.attribute'),
('2cbdf850-bdf5-4832-8fff-6655631d14e5', 'true', 'userinfo.token.claim'),
('34dd3d58-7d52-444b-a2aa-744988cdff7d', 'true', 'access.token.claim'),
('34dd3d58-7d52-444b-a2aa-744988cdff7d', 'updated_at', 'claim.name'),
('34dd3d58-7d52-444b-a2aa-744988cdff7d', 'true', 'id.token.claim'),
('34dd3d58-7d52-444b-a2aa-744988cdff7d', 'String', 'jsonType.label'),
('34dd3d58-7d52-444b-a2aa-744988cdff7d', 'updatedAt', 'user.attribute'),
('34dd3d58-7d52-444b-a2aa-744988cdff7d', 'true', 'userinfo.token.claim'),
('3ef988b9-c189-4e97-904a-9044df3610dd', 'true', 'access.token.claim'),
('3ef988b9-c189-4e97-904a-9044df3610dd', 'website', 'claim.name'),
('3ef988b9-c189-4e97-904a-9044df3610dd', 'true', 'id.token.claim'),
('3ef988b9-c189-4e97-904a-9044df3610dd', 'String', 'jsonType.label'),
('3ef988b9-c189-4e97-904a-9044df3610dd', 'website', 'user.attribute'),
('3ef988b9-c189-4e97-904a-9044df3610dd', 'true', 'userinfo.token.claim'),
('420f8747-89f4-4351-9480-d7b0e9b41fd2', 'true', 'access.token.claim'),
('420f8747-89f4-4351-9480-d7b0e9b41fd2', 'email', 'claim.name'),
('420f8747-89f4-4351-9480-d7b0e9b41fd2', 'true', 'id.token.claim'),
('420f8747-89f4-4351-9480-d7b0e9b41fd2', 'String', 'jsonType.label'),
('420f8747-89f4-4351-9480-d7b0e9b41fd2', 'email', 'user.attribute'),
('420f8747-89f4-4351-9480-d7b0e9b41fd2', 'true', 'userinfo.token.claim'),
('52a582d1-ffce-48dc-9214-2b812740f710', 'true', 'access.token.claim'),
('52a582d1-ffce-48dc-9214-2b812740f710', 'phone_number_verified', 'claim.name'),
('52a582d1-ffce-48dc-9214-2b812740f710', 'true', 'id.token.claim'),
('52a582d1-ffce-48dc-9214-2b812740f710', 'boolean', 'jsonType.label'),
('52a582d1-ffce-48dc-9214-2b812740f710', 'phoneNumberVerified', 'user.attribute'),
('52a582d1-ffce-48dc-9214-2b812740f710', 'true', 'userinfo.token.claim'),
('58ddb59c-2c9f-4a1d-8f8e-6c42afcd485b', 'true', 'access.token.claim'),
('58ddb59c-2c9f-4a1d-8f8e-6c42afcd485b', 'phone_number_verified', 'claim.name'),
('58ddb59c-2c9f-4a1d-8f8e-6c42afcd485b', 'true', 'id.token.claim'),
('58ddb59c-2c9f-4a1d-8f8e-6c42afcd485b', 'boolean', 'jsonType.label'),
('58ddb59c-2c9f-4a1d-8f8e-6c42afcd485b', 'phoneNumberVerified', 'user.attribute'),
('58ddb59c-2c9f-4a1d-8f8e-6c42afcd485b', 'true', 'userinfo.token.claim'),
('5bd1cd99-0c8b-4e82-a381-088ac2eca12a', 'true', 'access.token.claim'),
('5bd1cd99-0c8b-4e82-a381-088ac2eca12a', 'given_name', 'claim.name'),
('5bd1cd99-0c8b-4e82-a381-088ac2eca12a', 'true', 'id.token.claim'),
('5bd1cd99-0c8b-4e82-a381-088ac2eca12a', 'String', 'jsonType.label'),
('5bd1cd99-0c8b-4e82-a381-088ac2eca12a', 'firstName', 'user.attribute'),
('5bd1cd99-0c8b-4e82-a381-088ac2eca12a', 'true', 'userinfo.token.claim'),
('5f0a286d-2e0a-4e5f-8a3e-8ea4be9d7148', 'true', 'access.token.claim'),
('5f0a286d-2e0a-4e5f-8a3e-8ea4be9d7148', 'gender', 'claim.name'),
('5f0a286d-2e0a-4e5f-8a3e-8ea4be9d7148', 'true', 'id.token.claim'),
('5f0a286d-2e0a-4e5f-8a3e-8ea4be9d7148', 'String', 'jsonType.label'),
('5f0a286d-2e0a-4e5f-8a3e-8ea4be9d7148', 'gender', 'user.attribute'),
('5f0a286d-2e0a-4e5f-8a3e-8ea4be9d7148', 'true', 'userinfo.token.claim'),
('66da992a-b295-4a43-913d-91d7a73b60a5', 'true', 'access.token.claim'),
('66da992a-b295-4a43-913d-91d7a73b60a5', 'preferred_username', 'claim.name'),
('66da992a-b295-4a43-913d-91d7a73b60a5', 'true', 'id.token.claim'),
('66da992a-b295-4a43-913d-91d7a73b60a5', 'String', 'jsonType.label'),
('66da992a-b295-4a43-913d-91d7a73b60a5', 'username', 'user.attribute'),
('66da992a-b295-4a43-913d-91d7a73b60a5', 'true', 'userinfo.token.claim'),
('6c34a695-4e77-456e-a409-00a6396264f4', 'true', 'access.token.claim'),
('6c34a695-4e77-456e-a409-00a6396264f4', 'phone_number', 'claim.name'),
('6c34a695-4e77-456e-a409-00a6396264f4', 'true', 'id.token.claim'),
('6c34a695-4e77-456e-a409-00a6396264f4', 'String', 'jsonType.label'),
('6c34a695-4e77-456e-a409-00a6396264f4', 'phoneNumber', 'user.attribute'),
('6c34a695-4e77-456e-a409-00a6396264f4', 'true', 'userinfo.token.claim'),
('72aa38f6-d370-4f7e-be27-1ed6f6d3a6fe', 'true', 'access.token.claim'),
('72aa38f6-d370-4f7e-be27-1ed6f6d3a6fe', 'website', 'claim.name'),
('72aa38f6-d370-4f7e-be27-1ed6f6d3a6fe', 'true', 'id.token.claim'),
('72aa38f6-d370-4f7e-be27-1ed6f6d3a6fe', 'String', 'jsonType.label'),
('72aa38f6-d370-4f7e-be27-1ed6f6d3a6fe', 'website', 'user.attribute'),
('72aa38f6-d370-4f7e-be27-1ed6f6d3a6fe', 'true', 'userinfo.token.claim'),
('745e3348-f121-4676-a95f-9addad024a8c', 'true', 'access.token.claim'),
('745e3348-f121-4676-a95f-9addad024a8c', 'resource_access.${client_id}.roles', 'claim.name'),
('745e3348-f121-4676-a95f-9addad024a8c', 'String', 'jsonType.label'),
('745e3348-f121-4676-a95f-9addad024a8c', 'true', 'multivalued'),
('745e3348-f121-4676-a95f-9addad024a8c', 'foo', 'user.attribute'),
('7b90af68-9b57-4fed-86c5-9a6e1c713bdd', 'true', 'access.token.claim'),
('7b90af68-9b57-4fed-86c5-9a6e1c713bdd', 'profile', 'claim.name'),
('7b90af68-9b57-4fed-86c5-9a6e1c713bdd', 'true', 'id.token.claim'),
('7b90af68-9b57-4fed-86c5-9a6e1c713bdd', 'String', 'jsonType.label'),
('7b90af68-9b57-4fed-86c5-9a6e1c713bdd', 'profile', 'user.attribute'),
('7b90af68-9b57-4fed-86c5-9a6e1c713bdd', 'true', 'userinfo.token.claim'),
('7c4e4d2f-c8fe-4ddf-8d90-f0fc9ff028fb', 'Role', 'attribute.name'),
('7c4e4d2f-c8fe-4ddf-8d90-f0fc9ff028fb', 'Basic', 'attribute.nameformat'),
('7c4e4d2f-c8fe-4ddf-8d90-f0fc9ff028fb', 'false', 'single'),
('7ffb15a6-ee7a-4f49-881d-dc7eef1e675c', 'true', 'access.token.claim'),
('7ffb15a6-ee7a-4f49-881d-dc7eef1e675c', 'birthdate', 'claim.name'),
('7ffb15a6-ee7a-4f49-881d-dc7eef1e675c', 'true', 'id.token.claim'),
('7ffb15a6-ee7a-4f49-881d-dc7eef1e675c', 'String', 'jsonType.label'),
('7ffb15a6-ee7a-4f49-881d-dc7eef1e675c', 'birthdate', 'user.attribute'),
('7ffb15a6-ee7a-4f49-881d-dc7eef1e675c', 'true', 'userinfo.token.claim'),
('8bde3b67-155f-43a1-a1f2-46e2153f9086', 'Role', 'attribute.name'),
('8bde3b67-155f-43a1-a1f2-46e2153f9086', 'Basic', 'attribute.nameformat'),
('8bde3b67-155f-43a1-a1f2-46e2153f9086', 'false', 'single'),
('8be2cb95-da98-4f74-a243-b9e27493539e', 'true', 'access.token.claim'),
('8be2cb95-da98-4f74-a243-b9e27493539e', 'realm_access.roles', 'claim.name'),
('8be2cb95-da98-4f74-a243-b9e27493539e', 'String', 'jsonType.label'),
('8be2cb95-da98-4f74-a243-b9e27493539e', 'true', 'multivalued'),
('8be2cb95-da98-4f74-a243-b9e27493539e', 'foo', 'user.attribute'),
('8f9f950a-6edc-4e06-acc0-bc15527db10c', 'true', 'access.token.claim'),
('8f9f950a-6edc-4e06-acc0-bc15527db10c', 'locale', 'claim.name'),
('8f9f950a-6edc-4e06-acc0-bc15527db10c', 'true', 'id.token.claim'),
('8f9f950a-6edc-4e06-acc0-bc15527db10c', 'String', 'jsonType.label'),
('8f9f950a-6edc-4e06-acc0-bc15527db10c', 'locale', 'user.attribute'),
('8f9f950a-6edc-4e06-acc0-bc15527db10c', 'true', 'userinfo.token.claim'),
('92ff4cae-5fbe-4b03-8fbd-9563e7fc31fb', 'true', 'access.token.claim'),
('92ff4cae-5fbe-4b03-8fbd-9563e7fc31fb', 'groups', 'claim.name'),
('92ff4cae-5fbe-4b03-8fbd-9563e7fc31fb', 'true', 'id.token.claim'),
('92ff4cae-5fbe-4b03-8fbd-9563e7fc31fb', 'String', 'jsonType.label'),
('92ff4cae-5fbe-4b03-8fbd-9563e7fc31fb', 'true', 'multivalued'),
('92ff4cae-5fbe-4b03-8fbd-9563e7fc31fb', 'foo', 'user.attribute'),
('9a92c323-999a-4626-afc6-091dc21f5a73', 'true', 'access.token.claim'),
('9a92c323-999a-4626-afc6-091dc21f5a73', 'picture', 'claim.name'),
('9a92c323-999a-4626-afc6-091dc21f5a73', 'true', 'id.token.claim'),
('9a92c323-999a-4626-afc6-091dc21f5a73', 'String', 'jsonType.label'),
('9a92c323-999a-4626-afc6-091dc21f5a73', 'picture', 'user.attribute'),
('9a92c323-999a-4626-afc6-091dc21f5a73', 'true', 'userinfo.token.claim'),
('a6d98a75-80b6-4865-8088-3b5af80745c2', 'true', 'access.token.claim'),
('a6d98a75-80b6-4865-8088-3b5af80745c2', 'upn', 'claim.name'),
('a6d98a75-80b6-4865-8088-3b5af80745c2', 'true', 'id.token.claim'),
('a6d98a75-80b6-4865-8088-3b5af80745c2', 'String', 'jsonType.label'),
('a6d98a75-80b6-4865-8088-3b5af80745c2', 'username', 'user.attribute'),
('a6d98a75-80b6-4865-8088-3b5af80745c2', 'true', 'userinfo.token.claim'),
('a99005ef-3afb-47eb-8afc-7dcb10353fb7', 'true', 'access.token.claim'),
('a99005ef-3afb-47eb-8afc-7dcb10353fb7', 'middle_name', 'claim.name'),
('a99005ef-3afb-47eb-8afc-7dcb10353fb7', 'true', 'id.token.claim'),
('a99005ef-3afb-47eb-8afc-7dcb10353fb7', 'String', 'jsonType.label'),
('a99005ef-3afb-47eb-8afc-7dcb10353fb7', 'middleName', 'user.attribute'),
('a99005ef-3afb-47eb-8afc-7dcb10353fb7', 'true', 'userinfo.token.claim'),
('abcf1c4f-611f-4be6-8975-647538f035bf', 'true', 'access.token.claim'),
('abcf1c4f-611f-4be6-8975-647538f035bf', 'true', 'id.token.claim'),
('abcf1c4f-611f-4be6-8975-647538f035bf', 'true', 'userinfo.token.claim'),
('ae8e44f0-290e-47d2-9a5c-596d1d82ede2', 'true', 'access.token.claim'),
('ae8e44f0-290e-47d2-9a5c-596d1d82ede2', 'given_name', 'claim.name'),
('ae8e44f0-290e-47d2-9a5c-596d1d82ede2', 'true', 'id.token.claim'),
('ae8e44f0-290e-47d2-9a5c-596d1d82ede2', 'String', 'jsonType.label'),
('ae8e44f0-290e-47d2-9a5c-596d1d82ede2', 'firstName', 'user.attribute'),
('ae8e44f0-290e-47d2-9a5c-596d1d82ede2', 'true', 'userinfo.token.claim'),
('b02e0841-8cb6-4a69-aa2c-6dcc37ffe7cb', 'true', 'access.token.claim'),
('b02e0841-8cb6-4a69-aa2c-6dcc37ffe7cb', 'groups', 'claim.name'),
('b02e0841-8cb6-4a69-aa2c-6dcc37ffe7cb', 'true', 'id.token.claim'),
('b02e0841-8cb6-4a69-aa2c-6dcc37ffe7cb', 'String', 'jsonType.label'),
('b02e0841-8cb6-4a69-aa2c-6dcc37ffe7cb', 'true', 'multivalued'),
('b02e0841-8cb6-4a69-aa2c-6dcc37ffe7cb', 'foo', 'user.attribute'),
('b6ed13aa-4d23-4b9a-bbd3-bb0c773605c6', 'true', 'access.token.claim'),
('b6ed13aa-4d23-4b9a-bbd3-bb0c773605c6', 'realm_access.roles', 'claim.name'),
('b6ed13aa-4d23-4b9a-bbd3-bb0c773605c6', 'String', 'jsonType.label'),
('b6ed13aa-4d23-4b9a-bbd3-bb0c773605c6', 'true', 'multivalued'),
('b6ed13aa-4d23-4b9a-bbd3-bb0c773605c6', 'foo', 'user.attribute'),
('c4da36bc-dbaf-49b1-b2e2-10a2a2d35351', 'true', 'access.token.claim'),
('c4da36bc-dbaf-49b1-b2e2-10a2a2d35351', 'profile', 'claim.name'),
('c4da36bc-dbaf-49b1-b2e2-10a2a2d35351', 'true', 'id.token.claim'),
('c4da36bc-dbaf-49b1-b2e2-10a2a2d35351', 'String', 'jsonType.label'),
('c4da36bc-dbaf-49b1-b2e2-10a2a2d35351', 'profile', 'user.attribute'),
('c4da36bc-dbaf-49b1-b2e2-10a2a2d35351', 'true', 'userinfo.token.claim'),
('c54aae46-3fc0-4512-859c-7b80dbe59be9', 'true', 'access.token.claim'),
('c54aae46-3fc0-4512-859c-7b80dbe59be9', 'updated_at', 'claim.name'),
('c54aae46-3fc0-4512-859c-7b80dbe59be9', 'true', 'id.token.claim'),
('c54aae46-3fc0-4512-859c-7b80dbe59be9', 'String', 'jsonType.label'),
('c54aae46-3fc0-4512-859c-7b80dbe59be9', 'updatedAt', 'user.attribute'),
('c54aae46-3fc0-4512-859c-7b80dbe59be9', 'true', 'userinfo.token.claim'),
('c71e71a2-d180-4f3f-a20f-c2b3f15329e5', 'true', 'access.token.claim'),
('c71e71a2-d180-4f3f-a20f-c2b3f15329e5', 'picture', 'claim.name'),
('c71e71a2-d180-4f3f-a20f-c2b3f15329e5', 'true', 'id.token.claim'),
('c71e71a2-d180-4f3f-a20f-c2b3f15329e5', 'String', 'jsonType.label'),
('c71e71a2-d180-4f3f-a20f-c2b3f15329e5', 'picture', 'user.attribute'),
('c71e71a2-d180-4f3f-a20f-c2b3f15329e5', 'true', 'userinfo.token.claim'),
('cd00bd4b-346c-4f3e-832b-f64c90decc74', 'true', 'access.token.claim'),
('cd00bd4b-346c-4f3e-832b-f64c90decc74', 'middle_name', 'claim.name'),
('cd00bd4b-346c-4f3e-832b-f64c90decc74', 'true', 'id.token.claim'),
('cd00bd4b-346c-4f3e-832b-f64c90decc74', 'String', 'jsonType.label'),
('cd00bd4b-346c-4f3e-832b-f64c90decc74', 'middleName', 'user.attribute'),
('cd00bd4b-346c-4f3e-832b-f64c90decc74', 'true', 'userinfo.token.claim'),
('d477440c-a128-4fa0-831a-d2c8512ffe7d', 'true', 'access.token.claim'),
('d477440c-a128-4fa0-831a-d2c8512ffe7d', 'email_verified', 'claim.name'),
('d477440c-a128-4fa0-831a-d2c8512ffe7d', 'true', 'id.token.claim'),
('d477440c-a128-4fa0-831a-d2c8512ffe7d', 'boolean', 'jsonType.label'),
('d477440c-a128-4fa0-831a-d2c8512ffe7d', 'emailVerified', 'user.attribute'),
('d477440c-a128-4fa0-831a-d2c8512ffe7d', 'true', 'userinfo.token.claim'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'true', 'access.token.claim'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'true', 'id.token.claim'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'country', 'user.attribute.country'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'formatted', 'user.attribute.formatted'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'locality', 'user.attribute.locality'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'postal_code', 'user.attribute.postal_code'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'region', 'user.attribute.region'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'street', 'user.attribute.street'),
('ded8d0d1-c517-4b02-8c32-d547f0d17b87', 'true', 'userinfo.token.claim'),
('e28a5640-4c95-4e5b-be23-0d2ba34f4001', 'true', 'access.token.claim'),
('e28a5640-4c95-4e5b-be23-0d2ba34f4001', 'zoneinfo', 'claim.name'),
('e28a5640-4c95-4e5b-be23-0d2ba34f4001', 'true', 'id.token.claim'),
('e28a5640-4c95-4e5b-be23-0d2ba34f4001', 'String', 'jsonType.label'),
('e28a5640-4c95-4e5b-be23-0d2ba34f4001', 'zoneinfo', 'user.attribute'),
('e28a5640-4c95-4e5b-be23-0d2ba34f4001', 'true', 'userinfo.token.claim'),
('e3119b60-cab0-4b99-97ad-b10ffa6f349a', 'true', 'access.token.claim'),
('e3119b60-cab0-4b99-97ad-b10ffa6f349a', 'gender', 'claim.name'),
('e3119b60-cab0-4b99-97ad-b10ffa6f349a', 'true', 'id.token.claim'),
('e3119b60-cab0-4b99-97ad-b10ffa6f349a', 'String', 'jsonType.label'),
('e3119b60-cab0-4b99-97ad-b10ffa6f349a', 'gender', 'user.attribute'),
('e3119b60-cab0-4b99-97ad-b10ffa6f349a', 'true', 'userinfo.token.claim'),
('e3dbad8b-030b-4d10-a163-4557d11be9c6', 'true', 'access.token.claim'),
('e3dbad8b-030b-4d10-a163-4557d11be9c6', 'locale', 'claim.name'),
('e3dbad8b-030b-4d10-a163-4557d11be9c6', 'true', 'id.token.claim'),
('e3dbad8b-030b-4d10-a163-4557d11be9c6', 'String', 'jsonType.label'),
('e3dbad8b-030b-4d10-a163-4557d11be9c6', 'locale', 'user.attribute'),
('e3dbad8b-030b-4d10-a163-4557d11be9c6', 'true', 'userinfo.token.claim'),
('eb331079-a2af-440d-8f83-cdcb7162c2de', 'true', 'access.token.claim'),
('eb331079-a2af-440d-8f83-cdcb7162c2de', 'nickname', 'claim.name'),
('eb331079-a2af-440d-8f83-cdcb7162c2de', 'true', 'id.token.claim'),
('eb331079-a2af-440d-8f83-cdcb7162c2de', 'String', 'jsonType.label'),
('eb331079-a2af-440d-8f83-cdcb7162c2de', 'nickname', 'user.attribute'),
('eb331079-a2af-440d-8f83-cdcb7162c2de', 'true', 'userinfo.token.claim'),
('f2b96020-c7bb-4f53-95d1-70d46b4042d6', 'true', 'access.token.claim'),
('f2b96020-c7bb-4f53-95d1-70d46b4042d6', 'locale', 'claim.name'),
('f2b96020-c7bb-4f53-95d1-70d46b4042d6', 'true', 'id.token.claim'),
('f2b96020-c7bb-4f53-95d1-70d46b4042d6', 'String', 'jsonType.label'),
('f2b96020-c7bb-4f53-95d1-70d46b4042d6', 'locale', 'user.attribute'),
('f2b96020-c7bb-4f53-95d1-70d46b4042d6', 'true', 'userinfo.token.claim'),
('fa73a25c-a0ec-4a26-8942-b95b0d5455b5', 'true', 'access.token.claim'),
('fa73a25c-a0ec-4a26-8942-b95b0d5455b5', 'true', 'id.token.claim'),
('fa73a25c-a0ec-4a26-8942-b95b0d5455b5', 'true', 'userinfo.token.claim'),
('fe488bd1-77cd-483e-bb14-0efb41cae14e', 'true', 'access.token.claim'),
('fe488bd1-77cd-483e-bb14-0efb41cae14e', 'upn', 'claim.name'),
('fe488bd1-77cd-483e-bb14-0efb41cae14e', 'true', 'id.token.claim'),
('fe488bd1-77cd-483e-bb14-0efb41cae14e', 'String', 'jsonType.label'),
('fe488bd1-77cd-483e-bb14-0efb41cae14e', 'username', 'user.attribute'),
('fe488bd1-77cd-483e-bb14-0efb41cae14e', 'true', 'userinfo.token.claim');

-- --------------------------------------------------------

--
-- Struttura della tabella `realm`
--

CREATE TABLE `realm` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT 0,
  `OTP_POLICY_WINDOW` int(11) DEFAULT 1,
  `OTP_POLICY_PERIOD` int(11) DEFAULT 30,
  `OTP_POLICY_DIGITS` int(11) DEFAULT 6,
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT 0,
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT 0,
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT 0,
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `realm`
--

INSERT INTO `realm` (`ID`, `ACCESS_CODE_LIFESPAN`, `USER_ACTION_LIFESPAN`, `ACCESS_TOKEN_LIFESPAN`, `ACCOUNT_THEME`, `ADMIN_THEME`, `EMAIL_THEME`, `ENABLED`, `EVENTS_ENABLED`, `EVENTS_EXPIRATION`, `LOGIN_THEME`, `NAME`, `NOT_BEFORE`, `PASSWORD_POLICY`, `REGISTRATION_ALLOWED`, `REMEMBER_ME`, `RESET_PASSWORD_ALLOWED`, `SOCIAL`, `SSL_REQUIRED`, `SSO_IDLE_TIMEOUT`, `SSO_MAX_LIFESPAN`, `UPDATE_PROFILE_ON_SOC_LOGIN`, `VERIFY_EMAIL`, `MASTER_ADMIN_CLIENT`, `LOGIN_LIFESPAN`, `INTERNATIONALIZATION_ENABLED`, `DEFAULT_LOCALE`, `REG_EMAIL_AS_USERNAME`, `ADMIN_EVENTS_ENABLED`, `ADMIN_EVENTS_DETAILS_ENABLED`, `EDIT_USERNAME_ALLOWED`, `OTP_POLICY_COUNTER`, `OTP_POLICY_WINDOW`, `OTP_POLICY_PERIOD`, `OTP_POLICY_DIGITS`, `OTP_POLICY_ALG`, `OTP_POLICY_TYPE`, `BROWSER_FLOW`, `REGISTRATION_FLOW`, `DIRECT_GRANT_FLOW`, `RESET_CREDENTIALS_FLOW`, `CLIENT_AUTH_FLOW`, `OFFLINE_SESSION_IDLE_TIMEOUT`, `REVOKE_REFRESH_TOKEN`, `ACCESS_TOKEN_LIFE_IMPLICIT`, `LOGIN_WITH_EMAIL_ALLOWED`, `DUPLICATE_EMAILS_ALLOWED`, `DOCKER_AUTH_FLOW`, `REFRESH_TOKEN_MAX_REUSE`, `ALLOW_USER_MANAGED_ACCESS`, `SSO_MAX_LIFESPAN_REMEMBER_ME`, `SSO_IDLE_TIMEOUT_REMEMBER_ME`, `DEFAULT_ROLE`) VALUES
('master', 60, 300, 60, NULL, NULL, NULL, b'1', b'0', 0, NULL, 'master', 0, NULL, b'0', b'0', b'0', b'0', 'EXTERNAL', 1800, 36000, b'0', b'0', '1672d599-7171-47c0-8246-d4db4d421ea9', 1800, b'0', NULL, b'0', b'0', b'0', b'0', 0, 1, 30, 6, 'HmacSHA1', 'totp', 'b5b2c689-0ef4-45b8-b0de-198fcd050582', 'd65c0316-90a9-463b-8927-961ee7883045', '96ae4141-6a82-4ea0-bb2f-a876bc380924', 'f10376dc-21f7-4fb6-b1d6-f2b1cf2e471d', '817832b3-3bd1-49e2-b308-45e6686c2c52', 2592000, b'0', 900, b'1', b'0', '88d3e3c3-7532-467d-baed-36bfe0cc8ea6', 0, b'0', 0, 0, '256af1a6-0dfd-4609-af26-3842d47b52e4'),
('yourstore', 60, 300, 300, NULL, NULL, NULL, b'1', b'0', 0, NULL, 'yourstore', 0, NULL, b'1', b'1', b'1', b'0', 'EXTERNAL', 1800, 36000, b'0', b'1', 'dec12da6-e778-472a-9558-ef50042e49d1', 1800, b'0', NULL, b'0', b'0', b'0', b'0', 0, 1, 30, 6, 'HmacSHA1', 'totp', 'ca989664-4c7c-4517-b575-9bdeb7ce065f', '1509b59c-6381-4eb8-bd23-211fbf1de267', 'ef32da8a-4a86-49ec-b7bd-3d752e4f394c', 'dea0f920-eb0f-4c13-925d-f82c93bfd848', '01844f76-fab3-45ca-880a-73b78c214dbc', 2592000, b'0', 900, b'1', b'0', '4f6bad4d-f3db-4268-8a18-4d8c659bd515', 0, b'0', 0, 0, '68b3b76e-3ca7-4e98-a442-e1da7c78db2c');

-- --------------------------------------------------------

--
-- Struttura della tabella `realm_attribute`
--

CREATE TABLE `realm_attribute` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `realm_attribute`
--

INSERT INTO `realm_attribute` (`NAME`, `REALM_ID`, `VALUE`) VALUES
('actionTokenGeneratedByAdminLifespan', 'yourstore', '43200'),
('actionTokenGeneratedByUserLifespan', 'yourstore', '300'),
('bruteForceProtected', 'master', 'false'),
('bruteForceProtected', 'yourstore', 'false'),
('cibaAuthRequestedUserHint', 'yourstore', 'login_hint'),
('cibaBackchannelTokenDeliveryMode', 'yourstore', 'poll'),
('cibaExpiresIn', 'yourstore', '120'),
('cibaInterval', 'yourstore', '5'),
('client-policies.policies', 'yourstore', '{\"policies\":[]}'),
('client-policies.profiles', 'yourstore', '{\"profiles\":[]}'),
('clientOfflineSessionIdleTimeout', 'yourstore', '0'),
('clientOfflineSessionMaxLifespan', 'yourstore', '0'),
('clientSessionIdleTimeout', 'yourstore', '0'),
('clientSessionMaxLifespan', 'yourstore', '0'),
('defaultSignatureAlgorithm', 'master', 'RS256'),
('defaultSignatureAlgorithm', 'yourstore', 'RS256'),
('displayName', 'master', 'Keycloak'),
('displayNameHtml', 'master', '<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),
('failureFactor', 'master', '30'),
('failureFactor', 'yourstore', '30'),
('maxDeltaTimeSeconds', 'master', '43200'),
('maxDeltaTimeSeconds', 'yourstore', '43200'),
('maxFailureWaitSeconds', 'master', '900'),
('maxFailureWaitSeconds', 'yourstore', '900'),
('minimumQuickLoginWaitSeconds', 'master', '60'),
('minimumQuickLoginWaitSeconds', 'yourstore', '60'),
('oauth2DeviceCodeLifespan', 'yourstore', '600'),
('oauth2DevicePollingInterval', 'yourstore', '5'),
('offlineSessionMaxLifespan', 'master', '5184000'),
('offlineSessionMaxLifespan', 'yourstore', '5184000'),
('offlineSessionMaxLifespanEnabled', 'master', 'false'),
('offlineSessionMaxLifespanEnabled', 'yourstore', 'false'),
('permanentLockout', 'master', 'false'),
('permanentLockout', 'yourstore', 'false'),
('quickLoginCheckMilliSeconds', 'master', '1000'),
('quickLoginCheckMilliSeconds', 'yourstore', '1000'),
('waitIncrementSeconds', 'master', '60'),
('waitIncrementSeconds', 'yourstore', '60'),
('webAuthnPolicyAttestationConveyancePreference', 'yourstore', 'not specified'),
('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'yourstore', 'not specified'),
('webAuthnPolicyAuthenticatorAttachment', 'yourstore', 'not specified'),
('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'yourstore', 'not specified'),
('webAuthnPolicyAvoidSameAuthenticatorRegister', 'yourstore', 'false'),
('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'yourstore', 'false'),
('webAuthnPolicyCreateTimeout', 'yourstore', '0'),
('webAuthnPolicyCreateTimeoutPasswordless', 'yourstore', '0'),
('webAuthnPolicyRequireResidentKey', 'yourstore', 'not specified'),
('webAuthnPolicyRequireResidentKeyPasswordless', 'yourstore', 'not specified'),
('webAuthnPolicyRpEntityName', 'yourstore', 'keycloak'),
('webAuthnPolicyRpEntityNamePasswordless', 'yourstore', 'keycloak'),
('webAuthnPolicyRpId', 'yourstore', ''),
('webAuthnPolicyRpIdPasswordless', 'yourstore', ''),
('webAuthnPolicySignatureAlgorithms', 'yourstore', 'ES256'),
('webAuthnPolicySignatureAlgorithmsPasswordless', 'yourstore', 'ES256'),
('webAuthnPolicyUserVerificationRequirement', 'yourstore', 'not specified'),
('webAuthnPolicyUserVerificationRequirementPasswordless', 'yourstore', 'not specified'),
('_browser_header.contentSecurityPolicy', 'master', 'frame-src \'self\'; frame-ancestors \'self\' :; object-src \'none\';'),
('_browser_header.contentSecurityPolicy', 'yourstore', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicyReportOnly', 'master', ''),
('_browser_header.contentSecurityPolicyReportOnly', 'yourstore', ''),
('_browser_header.strictTransportSecurity', 'master', 'max-age=31536000; includeSubDomains'),
('_browser_header.strictTransportSecurity', 'yourstore', 'max-age=31536000; includeSubDomains'),
('_browser_header.xContentTypeOptions', 'master', 'nosniff'),
('_browser_header.xContentTypeOptions', 'yourstore', 'nosniff'),
('_browser_header.xFrameOptions', 'master', 'SAMEORIGIN'),
('_browser_header.xFrameOptions', 'yourstore', 'SAMEORIGIN'),
('_browser_header.xRobotsTag', 'master', 'none'),
('_browser_header.xRobotsTag', 'yourstore', 'none'),
('_browser_header.xXSSProtection', 'master', '1; mode=block'),
('_browser_header.xXSSProtection', 'yourstore', '1; mode=block');

-- --------------------------------------------------------

--
-- Struttura della tabella `realm_default_groups`
--

CREATE TABLE `realm_default_groups` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `realm_default_groups`
--

INSERT INTO `realm_default_groups` (`REALM_ID`, `GROUP_ID`) VALUES
('yourstore', 'cfb65df7-9c94-439f-a2af-99e832d502d3');

-- --------------------------------------------------------

--
-- Struttura della tabella `realm_enabled_event_types`
--

CREATE TABLE `realm_enabled_event_types` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `realm_events_listeners`
--

CREATE TABLE `realm_events_listeners` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `realm_events_listeners`
--

INSERT INTO `realm_events_listeners` (`REALM_ID`, `VALUE`) VALUES
('master', 'jboss-logging'),
('yourstore', 'jboss-logging');

-- --------------------------------------------------------

--
-- Struttura della tabella `realm_localizations`
--

CREATE TABLE `realm_localizations` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `realm_required_credential`
--

CREATE TABLE `realm_required_credential` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `realm_required_credential`
--

INSERT INTO `realm_required_credential` (`TYPE`, `FORM_LABEL`, `INPUT`, `SECRET`, `REALM_ID`) VALUES
('password', 'password', b'1', b'1', 'master'),
('password', 'password', b'1', b'1', 'yourstore');

-- --------------------------------------------------------

--
-- Struttura della tabella `realm_smtp_config`
--

CREATE TABLE `realm_smtp_config` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `realm_supported_locales`
--

CREATE TABLE `realm_supported_locales` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `redirect_uris`
--

CREATE TABLE `redirect_uris` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `redirect_uris`
--

INSERT INTO `redirect_uris` (`CLIENT_ID`, `VALUE`) VALUES
('7c4498bd-7460-4485-b217-092e9f6dc10e', '/admin/master/console/*'),
('89560863-f6a8-4a15-b726-f6ac6110a9ad', '/realms/yourstore/account/*'),
('8c0b103b-23e7-44b1-a722-6713674c3640', '/realms/master/account/*'),
('9de1f167-7240-4fe6-84de-2a871e589279', '/realms/yourstore/account/*'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', '/admin/yourstore/console/*'),
('f53b632f-7ada-4083-9f6d-3a25ae4161d7', '/realms/master/account/*'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', ':/*');

-- --------------------------------------------------------

--
-- Struttura della tabella `required_action_config`
--

CREATE TABLE `required_action_config` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `required_action_provider`
--

CREATE TABLE `required_action_provider` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `required_action_provider`
--

INSERT INTO `required_action_provider` (`ID`, `ALIAS`, `NAME`, `REALM_ID`, `ENABLED`, `DEFAULT_ACTION`, `PROVIDER_ID`, `PRIORITY`) VALUES
('05a612d9-7a94-47a7-b44a-46eb45c97e3a', 'delete_account', 'Delete Account', 'yourstore', b'0', b'0', 'delete_account', 60),
('0c660542-af77-4470-aafa-cfe112c7a8da', 'CONFIGURE_TOTP', 'Configure OTP', 'master', b'1', b'0', 'CONFIGURE_TOTP', 10),
('1f71630a-f4b6-4d9f-acef-5f59f69f86e1', 'delete_account', 'Delete Account', 'master', b'0', b'0', 'delete_account', 60),
('25992d66-bce3-45a1-bb51-3a5f88d33cdb', 'UPDATE_PASSWORD', 'Update Password', 'master', b'1', b'0', 'UPDATE_PASSWORD', 30),
('43145dbb-d015-497e-8f10-ad634c0ed619', 'update_user_locale', 'Update User Locale', 'master', b'1', b'0', 'update_user_locale', 1000),
('490c1408-82ed-456c-a403-f3f22bcb7ec0', 'terms_and_conditions', 'Terms and Conditions', 'yourstore', b'0', b'0', 'terms_and_conditions', 20),
('4a6693fb-f533-4315-b26a-33fc7c94e1fa', 'UPDATE_PROFILE', 'Update Profile', 'yourstore', b'1', b'0', 'UPDATE_PROFILE', 40),
('4d13ed1d-fbd4-406f-a844-a6653aed0818', 'UPDATE_PASSWORD', 'Update Password', 'yourstore', b'1', b'0', 'UPDATE_PASSWORD', 30),
('78749412-3737-496c-bcc1-a53b3be40b44', 'CONFIGURE_TOTP', 'Configure OTP', 'yourstore', b'1', b'0', 'CONFIGURE_TOTP', 10),
('8eca1d8d-26f2-4967-a8a0-4f2d1a1f8721', 'terms_and_conditions', 'Terms and Conditions', 'master', b'0', b'0', 'terms_and_conditions', 20),
('c37b304c-aa55-4f06-a2cd-f99b20c8074e', 'UPDATE_PROFILE', 'Update Profile', 'master', b'1', b'0', 'UPDATE_PROFILE', 40),
('dea76ef7-54d3-451c-b0a3-369f0aeefb7b', 'VERIFY_EMAIL', 'Verify Email', 'yourstore', b'1', b'0', 'VERIFY_EMAIL', 50),
('e77a3408-4196-4ac5-8bc3-8a7f4864a940', 'VERIFY_EMAIL', 'Verify Email', 'master', b'1', b'0', 'VERIFY_EMAIL', 50),
('ee925724-2940-48a3-ae7a-67cb2c57fe3a', 'update_user_locale', 'Update User Locale', 'yourstore', b'1', b'0', 'update_user_locale', 1000);

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_attribute`
--

CREATE TABLE `resource_attribute` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_policy`
--

CREATE TABLE `resource_policy` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_scope`
--

CREATE TABLE `resource_scope` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_server`
--

CREATE TABLE `resource_server` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_server_perm_ticket`
--

CREATE TABLE `resource_server_perm_ticket` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_server_policy`
--

CREATE TABLE `resource_server_policy` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_server_resource`
--

CREATE TABLE `resource_server_resource` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_server_scope`
--

CREATE TABLE `resource_server_scope` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `resource_uris`
--

CREATE TABLE `resource_uris` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `role_attribute`
--

CREATE TABLE `role_attribute` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `scope_mapping`
--

CREATE TABLE `scope_mapping` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `scope_mapping`
--

INSERT INTO `scope_mapping` (`CLIENT_ID`, `ROLE_ID`) VALUES
('8c0b103b-23e7-44b1-a722-6713674c3640', '780fe7ea-42a6-4862-a1c4-96e9b7476298'),
('9de1f167-7240-4fe6-84de-2a871e589279', 'e1691421-5819-4920-a638-5e2edce2579c');

-- --------------------------------------------------------

--
-- Struttura della tabella `scope_policy`
--

CREATE TABLE `scope_policy` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `username_login_failure`
--

CREATE TABLE `username_login_failure` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_attribute`
--

CREATE TABLE `user_attribute` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_consent`
--

CREATE TABLE `user_consent` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_consent_client_scope`
--

CREATE TABLE `user_consent_client_scope` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_entity`
--

CREATE TABLE `user_entity` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `user_entity`
--

INSERT INTO `user_entity` (`ID`, `EMAIL`, `EMAIL_CONSTRAINT`, `EMAIL_VERIFIED`, `ENABLED`, `FEDERATION_LINK`, `FIRST_NAME`, `LAST_NAME`, `REALM_ID`, `USERNAME`, `CREATED_TIMESTAMP`, `SERVICE_ACCOUNT_CLIENT_LINK`, `NOT_BEFORE`) VALUES
('c69f7d82-c1f1-46d0-9b02-bd9ae3a4d9dc', NULL, '07bde0e3-d334-4f04-b328-4b9b22efede8', b'0', b'1', NULL, NULL, NULL, 'master', 'admin', 1627290862048, NULL, 0),
('c94e0471-b8d4-42e0-b57e-08f9a817384b', NULL, 'ef228d39-ab3c-4167-b313-be391827c61e', b'0', b'1', NULL, 'Vittorio', 'Niespolo', 'yourstore', 'admin', 1627290913834, NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_federation_config`
--

CREATE TABLE `user_federation_config` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_federation_mapper`
--

CREATE TABLE `user_federation_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_federation_mapper_config`
--

CREATE TABLE `user_federation_mapper_config` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_federation_provider`
--

CREATE TABLE `user_federation_provider` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_group_membership`
--

CREATE TABLE `user_group_membership` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `user_group_membership`
--

INSERT INTO `user_group_membership` (`GROUP_ID`, `USER_ID`) VALUES
('a0e054dc-ff85-4c6a-8c09-56c651ce1d2a', 'c94e0471-b8d4-42e0-b57e-08f9a817384b');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_required_action`
--

CREATE TABLE `user_required_action` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_role_mapping`
--

CREATE TABLE `user_role_mapping` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `user_role_mapping`
--

INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES
('256af1a6-0dfd-4609-af26-3842d47b52e4', 'c69f7d82-c1f1-46d0-9b02-bd9ae3a4d9dc'),
('40e8bc42-615a-4305-959b-a4156435ba16', 'c69f7d82-c1f1-46d0-9b02-bd9ae3a4d9dc'),
('68b3b76e-3ca7-4e98-a442-e1da7c78db2c', 'c94e0471-b8d4-42e0-b57e-08f9a817384b');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_session`
--

CREATE TABLE `user_session` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_session_note`
--

CREATE TABLE `user_session_note` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `web_origins`
--

CREATE TABLE `web_origins` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `web_origins`
--

INSERT INTO `web_origins` (`CLIENT_ID`, `VALUE`) VALUES
('7c4498bd-7460-4485-b217-092e9f6dc10e', '+'),
('bcf9ad29-2102-42ea-be8d-2e5d97ea835d', '+'),
('f6b6fbc2-3e0f-428e-9a62-801be616f121', '+');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `admin_event_entity`
--
ALTER TABLE `admin_event_entity`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `associated_policy`
--
ALTER TABLE `associated_policy`
  ADD PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  ADD KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`);

--
-- Indici per le tabelle `authentication_execution`
--
ALTER TABLE `authentication_execution`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  ADD KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`);

--
-- Indici per le tabelle `authentication_flow`
--
ALTER TABLE `authentication_flow`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `authenticator_config`
--
ALTER TABLE `authenticator_config`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `authenticator_config_entry`
--
ALTER TABLE `authenticator_config_entry`
  ADD PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`);

--
-- Indici per le tabelle `broker_link`
--
ALTER TABLE `broker_link`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`);

--
-- Indici per le tabelle `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  ADD KEY `IDX_CLIENT_ID` (`CLIENT_ID`);

--
-- Indici per le tabelle `client_attributes`
--
ALTER TABLE `client_attributes`
  ADD PRIMARY KEY (`CLIENT_ID`,`NAME`),
  ADD KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255));

--
-- Indici per le tabelle `client_auth_flow_bindings`
--
ALTER TABLE `client_auth_flow_bindings`
  ADD PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`);

--
-- Indici per le tabelle `client_initial_access`
--
ALTER TABLE `client_initial_access`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `client_node_registrations`
--
ALTER TABLE `client_node_registrations`
  ADD PRIMARY KEY (`CLIENT_ID`,`NAME`);

--
-- Indici per le tabelle `client_scope`
--
ALTER TABLE `client_scope`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  ADD KEY `IDX_REALM_CLSCOPE` (`REALM_ID`);

--
-- Indici per le tabelle `client_scope_attributes`
--
ALTER TABLE `client_scope_attributes`
  ADD PRIMARY KEY (`SCOPE_ID`,`NAME`),
  ADD KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`);

--
-- Indici per le tabelle `client_scope_client`
--
ALTER TABLE `client_scope_client`
  ADD PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  ADD KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  ADD KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`);

--
-- Indici per le tabelle `client_scope_role_mapping`
--
ALTER TABLE `client_scope_role_mapping`
  ADD PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  ADD KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  ADD KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`);

--
-- Indici per le tabelle `client_session`
--
ALTER TABLE `client_session`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`);

--
-- Indici per le tabelle `client_session_auth_status`
--
ALTER TABLE `client_session_auth_status`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`);

--
-- Indici per le tabelle `client_session_note`
--
ALTER TABLE `client_session_note`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`NAME`);

--
-- Indici per le tabelle `client_session_prot_mapper`
--
ALTER TABLE `client_session_prot_mapper`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`);

--
-- Indici per le tabelle `client_session_role`
--
ALTER TABLE `client_session_role`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`);

--
-- Indici per le tabelle `client_user_session_note`
--
ALTER TABLE `client_user_session_note`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`NAME`);

--
-- Indici per le tabelle `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  ADD KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`);

--
-- Indici per le tabelle `component_config`
--
ALTER TABLE `component_config`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`);

--
-- Indici per le tabelle `composite_role`
--
ALTER TABLE `composite_role`
  ADD PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  ADD KEY `IDX_COMPOSITE` (`COMPOSITE`),
  ADD KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`);

--
-- Indici per le tabelle `credential`
--
ALTER TABLE `credential`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USER_CREDENTIAL` (`USER_ID`);

--
-- Indici per le tabelle `databasechangeloglock`
--
ALTER TABLE `databasechangeloglock`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `default_client_scope`
--
ALTER TABLE `default_client_scope`
  ADD PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  ADD KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  ADD KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`);

--
-- Indici per le tabelle `event_entity`
--
ALTER TABLE `event_entity`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`);

--
-- Indici per le tabelle `federated_identity`
--
ALTER TABLE `federated_identity`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  ADD KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  ADD KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`);

--
-- Indici per le tabelle `federated_user`
--
ALTER TABLE `federated_user`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `fed_user_attribute`
--
ALTER TABLE `fed_user_attribute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`);

--
-- Indici per le tabelle `fed_user_consent`
--
ALTER TABLE `fed_user_consent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  ADD KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  ADD KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`);

--
-- Indici per le tabelle `fed_user_consent_cl_scope`
--
ALTER TABLE `fed_user_consent_cl_scope`
  ADD PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`);

--
-- Indici per le tabelle `fed_user_credential`
--
ALTER TABLE `fed_user_credential`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  ADD KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`);

--
-- Indici per le tabelle `fed_user_group_membership`
--
ALTER TABLE `fed_user_group_membership`
  ADD PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  ADD KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  ADD KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`);

--
-- Indici per le tabelle `fed_user_required_action`
--
ALTER TABLE `fed_user_required_action`
  ADD PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  ADD KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  ADD KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`);

--
-- Indici per le tabelle `fed_user_role_mapping`
--
ALTER TABLE `fed_user_role_mapping`
  ADD PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  ADD KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  ADD KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`);

--
-- Indici per le tabelle `group_attribute`
--
ALTER TABLE `group_attribute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`);

--
-- Indici per le tabelle `group_role_mapping`
--
ALTER TABLE `group_role_mapping`
  ADD PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  ADD KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`);

--
-- Indici per le tabelle `identity_provider`
--
ALTER TABLE `identity_provider`
  ADD PRIMARY KEY (`INTERNAL_ID`),
  ADD UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  ADD KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `identity_provider_config`
--
ALTER TABLE `identity_provider_config`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`);

--
-- Indici per le tabelle `identity_provider_mapper`
--
ALTER TABLE `identity_provider_mapper`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `idp_mapper_config`
--
ALTER TABLE `idp_mapper_config`
  ADD PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`);

--
-- Indici per le tabelle `keycloak_group`
--
ALTER TABLE `keycloak_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`);

--
-- Indici per le tabelle `keycloak_role`
--
ALTER TABLE `keycloak_role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  ADD KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  ADD KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`);

--
-- Indici per le tabelle `migration_model`
--
ALTER TABLE `migration_model`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`);

--
-- Indici per le tabelle `offline_client_session`
--
ALTER TABLE `offline_client_session`
  ADD PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  ADD KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  ADD KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`);

--
-- Indici per le tabelle `offline_user_session`
--
ALTER TABLE `offline_user_session`
  ADD PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  ADD KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  ADD KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  ADD KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  ADD KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`);

--
-- Indici per le tabelle `policy_config`
--
ALTER TABLE `policy_config`
  ADD PRIMARY KEY (`POLICY_ID`,`NAME`);

--
-- Indici per le tabelle `protocol_mapper`
--
ALTER TABLE `protocol_mapper`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  ADD KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`);

--
-- Indici per le tabelle `protocol_mapper_config`
--
ALTER TABLE `protocol_mapper_config`
  ADD PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`);

--
-- Indici per le tabelle `realm`
--
ALTER TABLE `realm`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  ADD KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`);

--
-- Indici per le tabelle `realm_attribute`
--
ALTER TABLE `realm_attribute`
  ADD PRIMARY KEY (`NAME`,`REALM_ID`),
  ADD KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `realm_default_groups`
--
ALTER TABLE `realm_default_groups`
  ADD PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  ADD UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  ADD KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `realm_enabled_event_types`
--
ALTER TABLE `realm_enabled_event_types`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `realm_events_listeners`
--
ALTER TABLE `realm_events_listeners`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `realm_localizations`
--
ALTER TABLE `realm_localizations`
  ADD PRIMARY KEY (`REALM_ID`,`LOCALE`);

--
-- Indici per le tabelle `realm_required_credential`
--
ALTER TABLE `realm_required_credential`
  ADD PRIMARY KEY (`REALM_ID`,`TYPE`);

--
-- Indici per le tabelle `realm_smtp_config`
--
ALTER TABLE `realm_smtp_config`
  ADD PRIMARY KEY (`REALM_ID`,`NAME`);

--
-- Indici per le tabelle `realm_supported_locales`
--
ALTER TABLE `realm_supported_locales`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `redirect_uris`
--
ALTER TABLE `redirect_uris`
  ADD PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  ADD KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`);

--
-- Indici per le tabelle `required_action_config`
--
ALTER TABLE `required_action_config`
  ADD PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`);

--
-- Indici per le tabelle `required_action_provider`
--
ALTER TABLE `required_action_provider`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `resource_attribute`
--
ALTER TABLE `resource_attribute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`);

--
-- Indici per le tabelle `resource_policy`
--
ALTER TABLE `resource_policy`
  ADD PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  ADD KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`);

--
-- Indici per le tabelle `resource_scope`
--
ALTER TABLE `resource_scope`
  ADD PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  ADD KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`);

--
-- Indici per le tabelle `resource_server`
--
ALTER TABLE `resource_server`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `resource_server_perm_ticket`
--
ALTER TABLE `resource_server_perm_ticket`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  ADD KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`);

--
-- Indici per le tabelle `resource_server_policy`
--
ALTER TABLE `resource_server_policy`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`);

--
-- Indici per le tabelle `resource_server_resource`
--
ALTER TABLE `resource_server_resource`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`);

--
-- Indici per le tabelle `resource_server_scope`
--
ALTER TABLE `resource_server_scope`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`);

--
-- Indici per le tabelle `resource_uris`
--
ALTER TABLE `resource_uris`
  ADD PRIMARY KEY (`RESOURCE_ID`,`VALUE`);

--
-- Indici per le tabelle `role_attribute`
--
ALTER TABLE `role_attribute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`);

--
-- Indici per le tabelle `scope_mapping`
--
ALTER TABLE `scope_mapping`
  ADD PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  ADD KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`);

--
-- Indici per le tabelle `scope_policy`
--
ALTER TABLE `scope_policy`
  ADD PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  ADD KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`);

--
-- Indici per le tabelle `username_login_failure`
--
ALTER TABLE `username_login_failure`
  ADD PRIMARY KEY (`REALM_ID`,`USERNAME`);

--
-- Indici per le tabelle `user_attribute`
--
ALTER TABLE `user_attribute`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  ADD KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`);

--
-- Indici per le tabelle `user_consent`
--
ALTER TABLE `user_consent`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  ADD KEY `IDX_USER_CONSENT` (`USER_ID`);

--
-- Indici per le tabelle `user_consent_client_scope`
--
ALTER TABLE `user_consent_client_scope`
  ADD PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  ADD KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`);

--
-- Indici per le tabelle `user_entity`
--
ALTER TABLE `user_entity`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  ADD UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  ADD KEY `IDX_USER_EMAIL` (`EMAIL`);

--
-- Indici per le tabelle `user_federation_config`
--
ALTER TABLE `user_federation_config`
  ADD PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`);

--
-- Indici per le tabelle `user_federation_mapper`
--
ALTER TABLE `user_federation_mapper`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  ADD KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `user_federation_mapper_config`
--
ALTER TABLE `user_federation_mapper_config`
  ADD PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`);

--
-- Indici per le tabelle `user_federation_provider`
--
ALTER TABLE `user_federation_provider`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`);

--
-- Indici per le tabelle `user_group_membership`
--
ALTER TABLE `user_group_membership`
  ADD PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  ADD KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`);

--
-- Indici per le tabelle `user_required_action`
--
ALTER TABLE `user_required_action`
  ADD PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  ADD KEY `IDX_USER_REQACTIONS` (`USER_ID`);

--
-- Indici per le tabelle `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  ADD KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`);

--
-- Indici per le tabelle `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `user_session_note`
--
ALTER TABLE `user_session_note`
  ADD PRIMARY KEY (`USER_SESSION`,`NAME`);

--
-- Indici per le tabelle `web_origins`
--
ALTER TABLE `web_origins`
  ADD PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  ADD KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `associated_policy`
--
ALTER TABLE `associated_policy`
  ADD CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  ADD CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Limiti per la tabella `authentication_execution`
--
ALTER TABLE `authentication_execution`
  ADD CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `authentication_flow` (`ID`),
  ADD CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `authentication_flow`
--
ALTER TABLE `authentication_flow`
  ADD CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `authenticator_config`
--
ALTER TABLE `authenticator_config`
  ADD CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `client_attributes`
--
ALTER TABLE `client_attributes`
  ADD CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limiti per la tabella `client_initial_access`
--
ALTER TABLE `client_initial_access`
  ADD CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `client_node_registrations`
--
ALTER TABLE `client_node_registrations`
  ADD CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limiti per la tabella `client_scope_attributes`
--
ALTER TABLE `client_scope_attributes`
  ADD CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Limiti per la tabella `client_scope_role_mapping`
--
ALTER TABLE `client_scope_role_mapping`
  ADD CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Limiti per la tabella `client_session`
--
ALTER TABLE `client_session`
  ADD CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `user_session` (`ID`);

--
-- Limiti per la tabella `client_session_auth_status`
--
ALTER TABLE `client_session_auth_status`
  ADD CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limiti per la tabella `client_session_note`
--
ALTER TABLE `client_session_note`
  ADD CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limiti per la tabella `client_session_prot_mapper`
--
ALTER TABLE `client_session_prot_mapper`
  ADD CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limiti per la tabella `client_session_role`
--
ALTER TABLE `client_session_role`
  ADD CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limiti per la tabella `client_user_session_note`
--
ALTER TABLE `client_user_session_note`
  ADD CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limiti per la tabella `component`
--
ALTER TABLE `component`
  ADD CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `component_config`
--
ALTER TABLE `component_config`
  ADD CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`ID`);

--
-- Limiti per la tabella `composite_role`
--
ALTER TABLE `composite_role`
  ADD CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `keycloak_role` (`ID`),
  ADD CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `keycloak_role` (`ID`);

--
-- Limiti per la tabella `credential`
--
ALTER TABLE `credential`
  ADD CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limiti per la tabella `default_client_scope`
--
ALTER TABLE `default_client_scope`
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `federated_identity`
--
ALTER TABLE `federated_identity`
  ADD CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limiti per la tabella `group_attribute`
--
ALTER TABLE `group_attribute`
  ADD CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`);

--
-- Limiti per la tabella `group_role_mapping`
--
ALTER TABLE `group_role_mapping`
  ADD CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`);

--
-- Limiti per la tabella `identity_provider`
--
ALTER TABLE `identity_provider`
  ADD CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `identity_provider_config`
--
ALTER TABLE `identity_provider_config`
  ADD CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`);

--
-- Limiti per la tabella `identity_provider_mapper`
--
ALTER TABLE `identity_provider_mapper`
  ADD CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `idp_mapper_config`
--
ALTER TABLE `idp_mapper_config`
  ADD CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `identity_provider_mapper` (`ID`);

--
-- Limiti per la tabella `keycloak_role`
--
ALTER TABLE `keycloak_role`
  ADD CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `policy_config`
--
ALTER TABLE `policy_config`
  ADD CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Limiti per la tabella `protocol_mapper`
--
ALTER TABLE `protocol_mapper`
  ADD CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `client_scope` (`ID`),
  ADD CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limiti per la tabella `protocol_mapper_config`
--
ALTER TABLE `protocol_mapper_config`
  ADD CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `protocol_mapper` (`ID`);

--
-- Limiti per la tabella `realm_attribute`
--
ALTER TABLE `realm_attribute`
  ADD CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `realm_default_groups`
--
ALTER TABLE `realm_default_groups`
  ADD CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `realm_enabled_event_types`
--
ALTER TABLE `realm_enabled_event_types`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `realm_events_listeners`
--
ALTER TABLE `realm_events_listeners`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `realm_required_credential`
--
ALTER TABLE `realm_required_credential`
  ADD CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `realm_smtp_config`
--
ALTER TABLE `realm_smtp_config`
  ADD CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `realm_supported_locales`
--
ALTER TABLE `realm_supported_locales`
  ADD CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `redirect_uris`
--
ALTER TABLE `redirect_uris`
  ADD CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limiti per la tabella `required_action_provider`
--
ALTER TABLE `required_action_provider`
  ADD CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `resource_attribute`
--
ALTER TABLE `resource_attribute`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`);

--
-- Limiti per la tabella `resource_policy`
--
ALTER TABLE `resource_policy`
  ADD CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Limiti per la tabella `resource_scope`
--
ALTER TABLE `resource_scope`
  ADD CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`);

--
-- Limiti per la tabella `resource_server_perm_ticket`
--
ALTER TABLE `resource_server_perm_ticket`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`),
  ADD CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Limiti per la tabella `resource_server_policy`
--
ALTER TABLE `resource_server_policy`
  ADD CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Limiti per la tabella `resource_server_resource`
--
ALTER TABLE `resource_server_resource`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Limiti per la tabella `resource_server_scope`
--
ALTER TABLE `resource_server_scope`
  ADD CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Limiti per la tabella `resource_uris`
--
ALTER TABLE `resource_uris`
  ADD CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`);

--
-- Limiti per la tabella `role_attribute`
--
ALTER TABLE `role_attribute`
  ADD CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`);

--
-- Limiti per la tabella `scope_mapping`
--
ALTER TABLE `scope_mapping`
  ADD CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limiti per la tabella `scope_policy`
--
ALTER TABLE `scope_policy`
  ADD CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  ADD CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`);

--
-- Limiti per la tabella `user_attribute`
--
ALTER TABLE `user_attribute`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limiti per la tabella `user_consent`
--
ALTER TABLE `user_consent`
  ADD CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limiti per la tabella `user_consent_client_scope`
--
ALTER TABLE `user_consent_client_scope`
  ADD CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`);

--
-- Limiti per la tabella `user_federation_config`
--
ALTER TABLE `user_federation_config`
  ADD CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`);

--
-- Limiti per la tabella `user_federation_mapper`
--
ALTER TABLE `user_federation_mapper`
  ADD CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`),
  ADD CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `user_federation_mapper_config`
--
ALTER TABLE `user_federation_mapper_config`
  ADD CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `user_federation_mapper` (`ID`);

--
-- Limiti per la tabella `user_federation_provider`
--
ALTER TABLE `user_federation_provider`
  ADD CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limiti per la tabella `user_group_membership`
--
ALTER TABLE `user_group_membership`
  ADD CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limiti per la tabella `user_required_action`
--
ALTER TABLE `user_required_action`
  ADD CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limiti per la tabella `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limiti per la tabella `user_session_note`
--
ALTER TABLE `user_session_note`
  ADD CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `user_session` (`ID`);

--
-- Limiti per la tabella `web_origins`
--
ALTER TABLE `web_origins`
  ADD CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

