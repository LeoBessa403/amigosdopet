-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Máquina: cpmy0025.servidorwebfacil.com
-- Data de Criação: 10-Maio-2015 às 11:28
-- Versão do servidor: 5.1.66-community-log
-- versão do PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `amigosdo_net`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_auditoria`
--

CREATE TABLE IF NOT EXISTS `tb_auditoria` (
  `id_auditoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tabela` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realizado` datetime DEFAULT NULL,
  `operacao` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_anterior` text COLLATE utf8_unicode_ci,
  `item_atual` text COLLATE utf8_unicode_ci,
  `id_user` int(10) unsigned DEFAULT NULL,
  `id_item` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=85 ;

--
-- Extraindo dados da tabela `tb_auditoria`
--

INSERT INTO `tb_auditoria` (`id_auditoria`, `tabela`, `realizado`, `operacao`, `item_anterior`, `item_atual`, `id_user`, `id_item`) VALUES
(1, 'tb_procedimento', '2015-05-06 23:37:24', 'U', 'id_procedimento==13;/id_categoria==10;/nome==VACINA TRIPLICE FELINA (ANIMAIS ATÉ 12 MESES);/carencia==60;/periodicidade==21;/codigo==B.02.06', 'nome==VACINA TRIPLICE FELINA (ANIMAIS ATÉ 12 MESES);/carencia==60;/periodicidade==21;/codigo==B.02.06;/id_categoria==10', 1, 13),
(2, 'tb_procedimento', '2015-05-10 10:41:17', 'U', 'id_procedimento==10;/id_categoria==10;/nome==VACINA PNEUMODOG / BRONCHIGUARD - REFORÃ‡O ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.03.01', 'nome==VACINA PNEUMODOG / BRONCHIGUARD - REFORÇO ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.03.01;/id_categoria==10', 1, 10),
(3, 'tb_procedimento', '2015-05-10 10:41:33', 'U', 'id_procedimento==12;/id_categoria==10;/nome==VACINA QUADRUPLA FELINA - REFORÃ‡O ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.04.01', 'nome==VACINA QUADRUPLA FELINA - REFORÃÇO ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.04.01;/id_categoria==10', 1, 12),
(4, 'tb_procedimento', '2015-05-10 10:41:45', 'U', 'id_procedimento==12;/id_categoria==10;/nome==VACINA QUADRUPLA FELINA - REFORÃÇO ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.04.01', 'nome==VACINA QUADRUPLA FELINA - REFORÇO ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.04.01;/id_categoria==10', 1, 12),
(5, 'tb_procedimento', '2015-05-10 10:41:59', 'U', 'id_procedimento==15;/id_categoria==10;/nome==VACINA TRIPLICE FELINA - REFORÃ‡O ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.06.02', 'nome==VACINA TRIPLICE FELINA - REFORÇO ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.06.02;/id_categoria==10', 1, 15),
(6, 'tb_procedimento', '2015-05-10 10:42:17', 'U', 'id_procedimento==17;/id_categoria==10;/nome==VACINA DECTUPLA - REFORÃ‡O ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.07.01', 'nome==VACINA DECTUPLA - REFORÇO ANUAL;/carencia==60;/periodicidade==360;/codigo==B.02.07.01;/id_categoria==10', 1, 17),
(7, 'tb_procedimento', '2015-05-10 10:42:32', 'U', 'id_procedimento==22;/id_categoria==10;/nome==VACINA CONTRA LEISHMANIOSE - REFORÃ‡O ANUAL;/carencia==120;/periodicidade==360;/codigo==B.02.10.01', 'nome==VACINA CONTRA LEISHMANIOSE - REFORÇO ANUAL;/carencia==120;/periodicidade==360;/codigo==B.02.10.01;/id_categoria==10', 1, 22),
(8, 'tb_procedimento', '2015-05-10 10:43:01', 'U', 'id_procedimento==23;/id_categoria==11;/nome==AMPUTAÃ‡ÃƒO DE ERGOT ACIMA DE 60 DIAS (PATOLOGICA POR ANIMAL);/carencia==150;/periodicidade==365;/codigo==C.03.06', 'nome==AMPUTAÇÃO DE ERGOT ACIMA DE 60 DIAS (PATOLOGICA POR ANIMAL);/carencia==150;/periodicidade==365;/codigo==C.03.06;/id_categoria==11', 1, 23),
(9, 'tb_procedimento', '2015-05-10 10:43:25', 'U', 'id_procedimento==29;/id_categoria==12;/nome==CORREÃ‡ÃƒO DE HERNIA INGUINAL (UNILATERAL);/carencia==120;/periodicidade==120;/codigo==D.04.02', 'nome==CORREÇÃO DE HERNIA INGUINAL (UNILATERAL);/carencia==120;/periodicidade==120;/codigo==D.04.02;/id_categoria==12', 1, 29),
(10, 'tb_procedimento', '2015-05-10 10:43:42', 'U', 'id_procedimento==30;/id_categoria==12;/nome==CORREÃ‡ÃƒO DE HERNIA INGUINAL (BILATERAL);/carencia==180;/periodicidade==120;/codigo==D.04.03', 'nome==CORREÇÃO DE HERNIA INGUINAL (BILATERAL);/carencia==180;/periodicidade==120;/codigo==D.04.03;/id_categoria==12', 1, 30),
(11, 'tb_procedimento', '2015-05-10 10:43:54', 'U', 'id_procedimento==31;/id_categoria==12;/nome==CORREÃ‡ÃƒO DE HERNIA PERINEAL (UNILATERAL);/carencia==120;/periodicidade==120;/codigo==D.04.04', 'nome==CORREÇÃO DE HERNIA PERINEAL (UNILATERAL);/carencia==120;/periodicidade==120;/codigo==D.04.04;/id_categoria==12', 1, 31),
(12, 'tb_procedimento', '2015-05-10 10:44:44', 'U', 'id_procedimento==32;/id_categoria==12;/nome==CORREÃ‡ÃƒO DE HERNIA PERINEAL (BILATERAL);/carencia==180;/periodicidade==120;/codigo==D.04.05', 'nome==CORREÇÃO DE HERNIA PERINEAL (BILATERAL);/carencia==180;/periodicidade==120;/codigo==D.04.05;/id_categoria==12', 1, 32),
(13, 'tb_procedimento', '2015-05-10 10:44:57', 'U', 'id_procedimento==33;/id_categoria==12;/nome==CORREÃ‡ÃƒO DE HERNIA UMBILICAL;/carencia==120;/periodicidade==120;/codigo==D.04.06', 'nome==CORREÇÃO DE HERNIA UMBILICAL;/carencia==120;/periodicidade==120;/codigo==D.04.06;/id_categoria==12', 1, 33),
(14, 'tb_procedimento', '2015-05-10 10:45:11', 'U', 'id_procedimento==34;/id_categoria==12;/nome==CORREÃ‡ÃƒO DE HERNIA ESCROTAL (UNILATERAL);/carencia==120;/periodicidade==120;/codigo==D.04.07', 'nome==CORREÇÃO DE HERNIA ESCROTAL (UNILATERAL);/carencia==120;/periodicidade==120;/codigo==D.04.07;/id_categoria==12', 1, 34),
(15, 'tb_procedimento', '2015-05-10 10:45:22', 'U', 'id_procedimento==35;/id_categoria==12;/nome==CORREÃ‡ÃƒO DE HERNIA ESCROTAL (BILATERAL);/carencia==120;/periodicidade==120;/codigo==D.04.08', 'nome==CORREÇÃO DE HERNIA ESCROTAL (BILATERAL);/carencia==120;/periodicidade==120;/codigo==D.04.08;/id_categoria==12', 1, 35),
(16, 'tb_procedimento', '2015-05-10 10:48:04', 'U', 'id_procedimento==39;/id_categoria==13;/nome==FLUIDOTERAPIA / SOROTERAPIA (INCLUSO FLUIDOS E MATERIAIS NECESSÃRIOS, ASSIM COMO TAXA DE APLICAÃ‡ÃƒO POR ESTA VIA);/carencia==90;/periodicidade==1;/codigo==E.05.07', 'nome==FLUIDOTERAPIA / SOROTERAPIA (INCLUSO FLUIDOS E MATERIAIS NECESSÁRIOS, ASSIM COMO TAXA DE APLICAÇÃO POR ESTA VIA);/carencia==90;/periodicidade==1;/codigo==E.05.07;/id_categoria==13', 1, 39),
(17, 'tb_procedimento', '2015-05-10 10:49:04', 'U', 'id_procedimento==40;/id_categoria==13;/nome==OXIGENIOTERAPIA (INCLUSO OXIGÃŠNIO E MATERIAIS NECESSÃRIOS, ASSIM COMO TAXA DE APLICAÃ‡ÃƒO POR ESTA VIA LIMITADO A 4 METROS CUBICOS POR SESSÃƒO);/carencia==90;/periodicidade==1;/codigo==E.05.09', 'nome==OXIGENIOTERAPIA (INCLUSO OXIGÊNIO E MATERIAIS NECESSÁRIOS, ASSIM COMO TAXA DE APLICAÇÃO POR ESTA VIA LIMITADO A 4 METROS CÚBICOS POR SESSÃO);/carencia==90;/periodicidade==1;/codigo==E.05.09;/id_categoria==13', 1, 40),
(18, 'tb_procedimento', '2015-05-10 10:50:34', 'U', 'id_procedimento==41;/id_categoria==13;/nome==TRANSFUSÃƒO DE SANGUE C/ COLETA (INCLUSO MATERIAL DA COLETA A TRANSFUSÃƒO);/carencia==90;/periodicidade==30;/codigo==E.05.10', 'nome==TRANSFUSÃO DE SANGUE C/ COLETA (INCLUSO MATERIAL DA COLETA A TRANSFUSÃO);/carencia==90;/periodicidade==30;/codigo==E.05.10;/id_categoria==13', 1, 41),
(19, 'tb_procedimento', '2015-05-10 10:50:59', 'U', 'id_procedimento==42;/id_categoria==13;/nome==TAXA DE ANESTESIA GERAL (INCLUSO APLICAÃ‡ÃƒO, MATERIAL E MEDICAMENTO ANESTESICO);/carencia==120;/periodicidade==60;/codigo==E.05.11.01', 'nome==TAXA DE ANESTESIA GERAL (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO ANESTÉSICO);/carencia==120;/periodicidade==60;/codigo==E.05.11.01;/id_categoria==13', 1, 42),
(20, 'tb_procedimento', '2015-05-10 10:51:52', 'U', 'id_procedimento==43;/id_categoria==13;/nome==TAXA DE ANESTESIA GERAL INALATORIA (INCLUSO APLICAÃ‡ÃƒO, MATERIAL E MEDICAMENTO ANESTESICO);/carencia==120;/periodicidade==60;/codigo==E.05.11.02', 'nome==TAXA DE ANESTESIA GERAL INALATÓRIA (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO ANESTÉSICO);/carencia==120;/periodicidade==60;/codigo==E.05.11.02;/id_categoria==13', 1, 43),
(21, 'tb_procedimento', '2015-05-10 10:52:54', 'U', 'id_procedimento==45;/id_categoria==13;/nome==TAXA INTERNAÃ‡ÃƒO NOITE-PERNOITE (INCLUSO MANEJO E ADMINISTRAÃ‡ÃƒO DE MEDICAMENTOS POR TODAS AS  VIAS) OBS.: MEDICAMENTOS COBERTOS PELO AMIGOS DO PET ;/carencia==90;/periodicidade==1;/codigo==E.05.11.04', 'nome==TAXA INTERNAÇÃO NOITE-PERNOITE (INCLUSO MANEJO E ADMINISTRAÇÃO DE MEDICAMENTOS POR TODAS AS  VIAS) OBS.: MEDICAMENTOS COBERTOS PELO AMIGOS DO PET ;/carencia==90;/periodicidade==1;/codigo==E.05.11.04;/id_categoria==13', 1, 45),
(22, 'tb_procedimento', '2015-05-10 10:53:22', 'U', 'id_procedimento==44;/id_categoria==13;/nome==TAXA ANESTESIA LOCAL (INCLUSO APLICAÃ‡ÃƒO, MATERIAL E MEDICAMENTO ANESTESICO);/carencia==30;/periodicidade==30;/codigo==E.05.11.03', 'nome==TAXA ANESTESIA LOCAL (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO ANESTÉSICO);/carencia==30;/periodicidade==30;/codigo==E.05.11.03;/id_categoria==13', 1, 44),
(23, 'tb_procedimento', '2015-05-10 11:02:55', 'U', 'id_procedimento==46;/id_categoria==13;/nome==TAXA INTERNAÃ‡ÃƒO DIA (INCLUSO MANEJO E ADMINISTRAÃ‡ÃƒO DE MEDICAMENTOS POR TODASAS VIAS) OBS.: MEDICAMENTOS COBERTOS PELO AMIGOS DO PET SERÃƒO ;/carencia==90;/periodicidade==1;/codigo==E.05.11.05', 'nome==TAXA INTERNAÇÃO DIA (INCLUSO MANEJO E ADMINISTRAÇÃO DE MEDICAMENTOS POR TODAS AS VIAS) OBS.: MEDICAMENTOS COBERTOS PELO AMIGOS DO PET SERÃO ;/carencia==90;/periodicidade==1;/codigo==E.05.11.05;/id_categoria==13', 1, 46),
(24, 'tb_procedimento', '2015-05-10 11:03:34', 'U', 'id_procedimento==47;/id_categoria==10;/nome==TAXA DE SEDAÃ‡ÃƒO CANINO (INCLUSO APLICAÃ‡ÃƒO, MATERIAL E MEDICAMENTO SEDATIVO);/carencia==90;/periodicidade==30;/codigo==E.05.11.06', 'nome==TAXA DE SEDAÇÃO CANINO (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO SEDATIVO);/carencia==90;/periodicidade==30;/codigo==E.05.11.06;/id_categoria==10', 1, 47),
(25, 'tb_procedimento', '2015-05-10 11:03:59', 'U', 'id_procedimento==48;/id_categoria==13;/nome==TAXA DE SEDAÃ‡ÃƒO FELINA (INCLUSO APLICAÃ‡ÃƒO, MATERIAL E MEDICAMENTO SEDATIVO);/carencia==90;/periodicidade==30;/codigo==E.05.11.07', 'nome==TAXA DE SEDAÇÃO FELINA (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO SEDATIVO);/carencia==90;/periodicidade==30;/codigo==E.05.11.07;/id_categoria==13', 1, 48),
(26, 'tb_procedimento', '2015-05-10 11:04:28', 'U', 'id_procedimento==49;/id_categoria==13;/nome==TAXA DE SEDAÃ‡ÃƒO FELINA (INCLUSO APLICAÃ‡ÃƒO, MATERIAL E MEDICAMENTO SEDATIVO);/carencia==90;/periodicidade==30;/codigo==E.05.11.07', 'nome==TAXA DE SEDAÇÃO FELINA (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO SEDATIVO);/carencia==90;/periodicidade==30;/codigo==E.05.11.07;/id_categoria==13', 1, 49),
(27, 'tb_procedimento', '2015-05-10 11:04:49', 'U', 'id_procedimento==61;/id_categoria==15;/nome==CORREÃ‡ÃƒO DE FISTULA ANAL (CIRURGIA);/carencia==120;/periodicidade==365;/codigo==G.07.01', 'nome==CORREÇÃO DE FISTULA ANAL (CIRURGIA);/carencia==120;/periodicidade==365;/codigo==G.07.01;/id_categoria==15', 1, 61),
(28, 'tb_procedimento', '2015-05-10 11:05:15', 'U', 'id_procedimento==66;/id_categoria==15;/nome==REDUÃ‡ÃƒO DE PROLAPSO RETAL (CIRURGICO);/carencia==120;/periodicidade==120;/codigo==G.07.12', 'nome==REDUÇÃO DE PROLAPSO RETAL (CIRÚRGICO);/carencia==120;/periodicidade==120;/codigo==G.07.12;/id_categoria==15', 1, 66),
(29, 'tb_procedimento', '2015-05-10 11:05:46', 'U', 'id_procedimento==70;/id_categoria==15;/nome==REDUÃ‡ÃƒO DE EVISCERAÃ‡ÃƒO / EVENTRAÃ‡ÃƒO;/carencia==120;/periodicidade==120;/codigo==G.07.19', 'nome==REDUÇÃO DE EVISCERAÇÃO / EVENTRAÇÃO;/carencia==120;/periodicidade==120;/codigo==G.07.19;/id_categoria==15', 1, 70),
(30, 'tb_procedimento', '2015-05-10 11:06:03', 'U', 'id_procedimento==71;/id_categoria==15;/nome==AMPUUTAÃ‡ÃƒO PARCIAL DA LINGUA;/carencia==120;/periodicidade==120;/codigo==G.07.21', 'nome==AMPUUTAÇÃO PARCIAL DA LINGUA;/carencia==120;/periodicidade==120;/codigo==G.07.21;/id_categoria==15', 1, 71),
(31, 'tb_procedimento', '2015-05-10 11:06:24', 'U', 'id_procedimento==76;/id_categoria==17;/nome==ASSISTÃŠNCIA AO PARTO;/carencia==150;/periodicidade==365;/codigo==I.09.02', 'nome==ASSISTÊNCIA AO PARTO;/carencia==150;/periodicidade==365;/codigo==I.09.02;/id_categoria==17', 1, 76),
(32, 'tb_procedimento', '2015-05-10 11:06:45', 'U', 'id_procedimento==81;/id_categoria==17;/nome==OVARIOHISTERECTOMIA CANINO - CASTRAÃ‡ÃƒO;/carencia==180;/periodicidade==0;/codigo==I.09.11', 'nome==OVARIOHISTERECTOMIA CANINO - CASTRAÇÃO;/carencia==180;/periodicidade==0;/codigo==I.09.11;/id_categoria==17', 1, 81),
(33, 'tb_procedimento', '2015-05-10 11:07:00', 'U', 'id_procedimento==82;/id_categoria==17;/nome==OVARIOHISTERECTOMIA FELINO - CASTRAÃ‡ÃƒO;/carencia==180;/periodicidade==0;/codigo==I.09.12', 'nome==OVARIOHISTERECTOMIA FELINO - CASTRAÇÃO;/carencia==180;/periodicidade==0;/codigo==I.09.12;/id_categoria==17', 1, 82),
(34, 'tb_procedimento', '2015-05-10 11:07:26', 'U', 'id_procedimento==85;/id_categoria==17;/nome==REDUÃ‡ÃƒO DE PROLAPSO UTERINO - CIRUGICO INCLUSO CASTRAÃ‡ÃƒO;/carencia==180;/periodicidade==30;/codigo==I.09.15', 'nome==REDUÇÃO DE PROLAPSO UTERINO - CIRUGICO INCLUSO CASTRAÇÃO;/carencia==180;/periodicidade==30;/codigo==I.09.15;/id_categoria==17', 1, 85),
(35, 'tb_procedimento', '2015-05-10 11:07:46', 'U', 'id_procedimento==86;/id_categoria==17;/nome==REDUÃ‡ÃƒO HIPERPLASIA DO ASSOALHO VAGINAL - CIRURGICO;/carencia==180;/periodicidade==30;/codigo==I.09.16', 'nome==REDUÇÃO HIPERPLASIA DO ASSOALHO VAGINAL - CIRURGICO;/carencia==180;/periodicidade==30;/codigo==I.09.16;/id_categoria==17', 1, 86),
(36, 'tb_procedimento', '2015-05-10 11:08:07', 'U', 'id_procedimento==87;/id_categoria==19;/nome==IMOBILIZAÃ‡ÃƒO SIMPLES (INCLUSO MATERIAL);/carencia==60;/periodicidade==30;/codigo==J.10.07', 'nome==IMOBILIZAÇÃO SIMPLES (INCLUSO MATERIAL);/carencia==60;/periodicidade==30;/codigo==J.10.07;/id_categoria==19', 1, 87),
(37, 'tb_procedimento', '2015-05-10 11:08:27', 'U', 'id_procedimento==88;/id_categoria==20;/nome==EVISCERAÃ‡ÃƒO OU ENUCLEAÃ‡ÃƒO DO GLOBO OCULAR;/carencia==180;/periodicidade==30;/codigo==K.11.07', 'nome==EVISCERAÇÃO OU ENUCLEAÇÃO DO GLOBO OCULAR;/carencia==180;/periodicidade==30;/codigo==K.11.07;/id_categoria==20', 1, 88),
(38, 'tb_procedimento', '2015-05-10 11:09:04', 'U', 'id_procedimento==89;/id_categoria==20;/nome==EXCISÃƒO DA GLANDULA DA 3Âª PALPEBRA;/carencia==180;/periodicidade==30;/codigo==K.11.08', 'nome==EXCISÃO DA GLANDULA DA 3ª PALPEBRA;/carencia==180;/periodicidade==30;/codigo==K.11.08;/id_categoria==20', 1, 89),
(39, 'tb_procedimento', '2015-05-10 11:09:27', 'U', 'id_procedimento==91;/id_categoria==20;/nome==REPOSIÃ‡ÃƒO DE GLOBO OCULAR;/carencia==120;/periodicidade==30;/codigo==K.11.12', 'nome==REPOSIÇÃO DE GLOBO OCULAR;/carencia==120;/periodicidade==30;/codigo==K.11.12;/id_categoria==20', 1, 91),
(40, 'tb_procedimento', '2015-05-10 11:10:12', 'U', 'id_procedimento==197;/id_categoria==25;/nome==LEISHMANIOSE CANINA - METODO ELISA + IFI - DILUIÃ‡ÃƒO TOTAL;/carencia==60;/periodicidade==90;/codigo==P.50.20.4', 'nome==LEISHMANIOSE CANINA - METODO ELISA + IFI - DILUIÇÃO TOTAL;/carencia==60;/periodicidade==90;/codigo==P.50.20.4;/id_categoria==25', 1, 197),
(41, 'tb_procedimento', '2015-05-10 11:10:38', 'U', 'id_procedimento==156;/id_categoria==25;/nome==LEPTOSPIROSE - MICROAQLUTINAÃ‡ÃƒO;/carencia==60;/periodicidade==60;/codigo==P.50.10.5', 'nome==LEPTOSPIROSE - MICROAQLUTINAÇÃO;/carencia==60;/periodicidade==60;/codigo==P.50.10.5;/id_categoria==25', 1, 156),
(42, 'tb_procedimento', '2015-05-10 11:11:35', 'U', 'id_procedimento==125;/id_categoria==25;/nome==CINOMOSE - PESQ. CORPUSCULO INCLUSÃƒO;/carencia==60;/periodicidade==30;/codigo==P.50.27', 'nome==CINOMOSE - PESQ. CORPUSCULO INCLUSÃO;/carencia==60;/periodicidade==30;/codigo==P.50.27;/id_categoria==25', 1, 125),
(43, 'tb_procedimento', '2015-05-10 11:12:07', 'U', 'id_procedimento==104;/id_categoria==21;/nome==REMOÃ‡ÃƒO DE DERMATOBIOSE (POR BENEFICIARIO);/carencia==120;/periodicidade==30;/codigo==L.12.09', 'nome==REMOÇÃO DE DERMATOBIOSE (POR BENEFICIÁRIO);/carencia==120;/periodicidade==30;/codigo==L.12.09;/id_categoria==21', 1, 104),
(44, 'tb_procedimento', '2015-05-10 11:12:27', 'U', 'id_procedimento==105;/id_categoria==21;/nome==REMOÃ‡ÃƒO DE MIIASE;/carencia==120;/periodicidade==30;/codigo==L.12.11', 'nome==REMOÇÃO DE MIIASE;/carencia==120;/periodicidade==30;/codigo==L.12.11;/id_categoria==21', 1, 105),
(45, 'tb_procedimento', '2015-05-10 11:12:48', 'U', 'id_procedimento==98;/id_categoria==21;/nome==RECONSTITUIÃ‡ÃƒO PELE (Traumatico-A PARTIR de 20 Pontos);/carencia==180;/periodicidade==30;/codigo==L.12.03', 'nome==RECONSTITUIÇÃO PELE (Traumático-A PARTIR de 20 Pontos);/carencia==180;/periodicidade==30;/codigo==L.12.03;/id_categoria==21', 1, 98),
(46, 'tb_procedimento', '2015-05-10 11:13:14', 'U', 'id_procedimento==106;/id_categoria==21;/nome==REMOÃ‡ÃƒO TUMOR EXTERNO;/carencia==120;/periodicidade==120;/codigo==L.12.12', 'nome==REMOÇÃO TUMOR EXTERNO;/carencia==120;/periodicidade==120;/codigo==L.12.12;/id_categoria==21', 1, 106),
(47, 'tb_procedimento', '2015-05-10 11:13:31', 'U', 'id_procedimento==94;/id_categoria==20;/nome==RESSECÃ‡ÃƒO DO CANAL AUDITIVO UNILATERAL;/carencia==120;/periodicidade==30;/codigo==K.11.18', 'nome==RESSECÇÃO DO CANAL AUDITIVO UNILATERAL;/carencia==120;/periodicidade==30;/codigo==K.11.18;/id_categoria==20', 1, 94),
(48, 'tb_procedimento', '2015-05-10 11:14:12', 'U', 'id_procedimento==97;/id_categoria==21;/nome==RECONSTITUIÃ‡ÃƒO PELE (Traumatico-AtÃ© 20 Pontos);/carencia==120;/periodicidade==30;/codigo==L.12.02', 'nome==RECONSTITUIÇÃO PELE (Traumático-Até 20 Pontos);/carencia==120;/periodicidade==30;/codigo==L.12.02;/id_categoria==21', 1, 97),
(49, 'tb_procedimento', '2015-05-10 11:15:47', 'U', 'id_procedimento==138;/id_categoria==25;/nome==PERFIL GLICOSE 3 DETERMINAÃ‡Ã•ES;/carencia==90;/periodicidade==30;/codigo==P.50.52', 'nome==PERFIL GLICOSE 3 DETERMINAÇÕES;/carencia==90;/periodicidade==30;/codigo==P.50.52;/id_categoria==25', 1, 138),
(50, 'tb_categoria', '2015-05-10 11:16:37', 'U', 'id_categoria==11;/nome==CIRURGIAS PLASTICAS', 'nome==CIRURGIAS PLÁSTICAS', 1, 11),
(51, 'tb_categoria', '2015-05-10 11:16:50', 'U', 'id_categoria==24;/nome==OUTROS SERVIÃ‡OS ', 'nome==OUTROS SERVIÇOS ', 1, 24),
(52, 'tb_categoria', '2015-05-10 11:17:09', 'U', 'id_categoria==23;/nome==PROCEDIMENTOS DE DIAGNÃ“STICOS ', 'nome==PROCEDIMENTOS DE DIAGNÓSTICOS ', 1, 23),
(53, 'tb_categoria', '2015-05-10 11:17:56', 'U', 'id_categoria==14;/nome==PROCEDIMENTOS GÃŠNITO - URINÃRIOS  ', 'nome==PROCEDIMENTOS GÊNITO - URINÁRIOS  ', 1, 14),
(54, 'tb_categoria', '2015-05-10 11:18:44', 'U', 'id_categoria==13;/nome==PROCEDIMENTOS MEDICO -VETERINARIO', 'nome==PROCEDIMENTOS MÉDICO -VETERINÁRIO', 1, 13),
(55, 'tb_categoria', '2015-05-10 11:19:03', 'U', 'id_categoria==17;/nome==PROCEDIMENTOS OBSTÃ‰TRICOS', 'nome==PROCEDIMENTOS OBSTÉTRICOS', 1, 17),
(56, 'tb_categoria', '2015-05-10 11:19:33', 'U', 'id_categoria==20;/nome==PROCEDIMENTOS NOS Ã“RGÃƒOS DO SENTIDO', 'nome==PROCEDIMENTOS NOS ÕRGÃOS DO SENTIDO', 1, 20),
(57, 'tb_credenciado', '2015-05-10 11:20:42', 'U', 'id_credenciado==2;/id_regiao==1;/id_pessoa==2;/cadastro==2014-08-04 15:52:15;/observacao==;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta;/id_veterinario==', 'observacao==;/id_pessoa==2;/id_regiao==1;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta', 1, 2),
(58, 'tb_pessoa', '2015-05-10 11:20:42', 'U', 'id_pessoa==2;/nome_razao==CaoKia;/cpf_cnpj==16.895.665/0001-40;/tipo_pessoa==J;/cliente==', 'nome_razao==CaoKia;/cpf_cnpj==16.895.665/0001-40;/tipo_pessoa==J;/cliente==', 1, 2),
(59, 'tb_dados', '2015-05-10 11:20:42', 'U', 'id_dados==2;/id_pessoa==2;/tel1==(82) 3021-0004;/tel2==;/tel3==;/email==imperio_animal@hotmail.com;/site==;/tel0800==', 'tel1==(82) 3021-0004;/tel2==;/tel3==;/email==imperio_animal@hotmail.com;/site==;/tel0800==;/id_pessoa==2', 1, 2),
(60, 'tb_endereco', '2015-05-10 11:20:42', 'U', 'id_endereco==2;/id_pessoa==2;/endereco==Av. prof. Sandoval arroxelas ;/complemento==NÂº 142;/cep==57.035-230;/bairro==Ponta Verde;/cidade==MaceiÃ³;/estado==AL', 'endereco==Av. prof. Sandoval arroxelas ;/complemento==Nº 142;/cep==57.035-230;/bairro==Ponta Verde;/cidade==Maceió;/id_pessoa==2;/estado==1', 1, 2),
(61, 'tb_credenciado', '2015-05-10 11:21:08', 'U', 'id_credenciado==4;/id_regiao==1;/id_pessoa==4;/cadastro==2014-08-06 16:29:45;/observacao==;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta;/id_veterinario==', 'observacao==;/id_pessoa==4;/id_regiao==1;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta', 1, 4),
(62, 'tb_pessoa', '2015-05-10 11:21:08', 'U', 'id_pessoa==4;/nome_razao==cliniKao;/cpf_cnpj==;/tipo_pessoa==J;/cliente==', 'nome_razao==cliniKao;/cpf_cnpj==;/tipo_pessoa==J;/cliente==', 1, 4),
(63, 'tb_dados', '2015-05-10 11:21:08', 'U', 'id_dados==4;/id_pessoa==4;/tel1==(82) 4141-1323;/tel2==;/tel3==;/email==;/site==;/tel0800==', 'tel1==(82) 4141-1323;/tel2==;/tel3==;/email==;/site==;/tel0800==;/id_pessoa==4', 1, 4),
(64, 'tb_endereco', '2015-05-10 11:21:08', 'U', 'id_endereco==4;/id_pessoa==4;/endereco==Av. Durval de Goes Monteiro ;/complemento==NÂº 422;/cep==;/bairro== Gruta de Lourdes;/cidade==Maceio;/estado==AL', 'endereco==Av. Durval de Goes Monteiro ;/complemento==Nº 422;/cep==;/bairro== Gruta de Lourdes;/cidade==Maceió;/id_pessoa==4;/estado==1', 1, 4),
(65, 'tb_credenciado', '2015-05-10 11:21:30', 'U', 'id_credenciado==1;/id_regiao==1;/id_pessoa==1;/cadastro==2014-07-25 16:39:05;/observacao==;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta;/id_veterinario==', 'observacao==;/id_pessoa==1;/id_regiao==1;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta', 1, 1),
(66, 'tb_pessoa', '2015-05-10 11:21:30', 'U', 'id_pessoa==1;/nome_razao==Focinhos e Patinhas;/cpf_cnpj==;/tipo_pessoa==J;/cliente==', 'nome_razao==Focinhos e Patinhas;/cpf_cnpj==;/tipo_pessoa==J;/cliente==', 1, 1),
(67, 'tb_dados', '2015-05-10 11:21:30', 'U', 'id_dados==1;/id_pessoa==1;/tel1==(82) 3327-4758;/tel2==;/tel3==;/email==victorafelix@hotmail.com;/site==;/tel0800==', 'tel1==(82) 3327-4758;/tel2==;/tel3==;/email==victorafelix@hotmail.com;/site==;/tel0800==;/id_pessoa==1', 1, 1),
(68, 'tb_endereco', '2015-05-10 11:21:30', 'U', 'id_endereco==1;/id_pessoa==1;/endereco==Rua Santa CecÃ­lia, 235;/complemento==;/cep==57.025-030;/bairro==POÃ‡O;/cidade==MaceiÃ³;/estado==AL', 'endereco==Rua Santa Cecí­lia, 235;/complemento==;/cep==57.025-030;/bairro==POÃ‡O;/cidade==Maceió;/id_pessoa==1;/estado==1', 1, 1),
(69, 'tb_plano', '2015-05-10 11:21:55', 'U', 'id_plano==1;/id_regiao==1;/nome==AMIGO BRONZE;/preco==49.9', 'nome==AMIGO BRONZE;/preco==49.90;/id_regiao==1;/id_plano==1', 1, 1),
(70, 'tb_pessoa', '2015-05-10 11:23:08', 'U', 'id_pessoa==8;/nome_razao==ALINE MARIA CAVALCANTE DA SILVA;/cpf_cnpj==077.035.914-08;/tipo_pessoa==F;/cliente==C', 'nome_razao==ALINE MARIA CAVALCANTE DA SILVA;/cpf_cnpj==077.035.914-08;/tipo_pessoa==F;/cliente==C', 1, 8),
(71, 'tb_dados', '2015-05-10 11:23:08', 'U', 'id_dados==8;/id_pessoa==8;/tel1==(82) 8882-1234;/tel2==;/tel3==;/email==alinemariacavalcante@hotmail.com;/site==amigosdopet.net;/tel0800==', 'tel1==(82) 8882-1234;/tel2==;/tel3==;/email==alinemariacavalcante@hotmail.com;/site==amigosdopet.net;/tel0800==;/id_pessoa==8', 1, 8),
(72, 'tb_endereco', '2015-05-10 11:23:08', 'U', 'id_endereco==8;/id_pessoa==8;/endereco==AVENIDA DONA CONSTANÃ‡A;/complemento==397;/cep==57.025-355;/bairro==POÃ‡O;/cidade==MACEIO;/estado==AL', 'endereco==AVENIDA DONA CONSTANÇA;/complemento==397;/cep==57.025-355;/bairro==POÇO;/cidade==MACEIO;/id_pessoa==8;/estado==AL', 1, 8),
(73, 'tb_pessoa', '2015-05-10 11:23:30', 'U', 'id_pessoa==7;/nome_razao==LUCIANA RENATA DA SILVA ROCHA;/cpf_cnpj==040.581.874-25;/tipo_pessoa==F;/cliente==C', 'nome_razao==LUCIANA RENATA DA SILVA ROCHA;/cpf_cnpj==040.581.874-25;/tipo_pessoa==F;/cliente==C', 1, 7),
(74, 'tb_dados', '2015-05-10 11:23:30', 'U', 'id_dados==7;/id_pessoa==7;/tel1==(82) 8801-9836;/tel2==;/tel3==;/email==financeiro@amigosdopet.net;/site==amigosdopet.net;/tel0800==', 'tel1==(82) 8801-9836;/tel2==;/tel3==;/email==financeiro@amigosdopet.net;/site==amigosdopet.net;/tel0800==;/id_pessoa==7', 1, 7),
(75, 'tb_endereco', '2015-05-10 11:23:31', 'U', 'id_endereco==7;/id_pessoa==7;/endereco==AVENIDA DONA CONSTANÃ‡A;/complemento==1050;/cep==57.035-220;/bairro==POÃ‡O;/cidade==MACEIO;/estado==AL', 'endereco==AVENIDA DONA CONSTANÇA;/complemento==1050;/cep==57.035-220;/bairro==POÇO;/cidade==MACEIÓ;/id_pessoa==7;/estado==AL', 1, 7),
(76, 'tb_pessoa', '2015-05-10 11:23:45', 'U', 'id_pessoa==8;/nome_razao==ALINE MARIA CAVALCANTE DA SILVA;/cpf_cnpj==077.035.914-08;/tipo_pessoa==F;/cliente==C', 'nome_razao==ALINE MARIA CAVALCANTE DA SILVA;/cpf_cnpj==077.035.914-08;/tipo_pessoa==F;/cliente==C', 1, 8),
(77, 'tb_dados', '2015-05-10 11:23:45', 'U', 'id_dados==8;/id_pessoa==8;/tel1==(82) 8882-1234;/tel2==;/tel3==;/email==alinemariacavalcante@hotmail.com;/site==amigosdopet.net;/tel0800==', 'tel1==(82) 8882-1234;/tel2==;/tel3==;/email==alinemariacavalcante@hotmail.com;/site==amigosdopet.net;/tel0800==;/id_pessoa==8', 1, 8),
(78, 'tb_endereco', '2015-05-10 11:23:45', 'U', 'id_endereco==8;/id_pessoa==8;/endereco==AVENIDA DONA CONSTANÇA;/complemento==397;/cep==57.025-355;/bairro==POÇO;/cidade==MACEIO;/estado==AL', 'endereco==AVENIDA DONA CONSTANÇA;/complemento==397;/cep==57.025-355;/bairro==POÇO;/cidade==MACEIÓ;/id_pessoa==8;/estado==AL', 1, 8),
(79, 'tb_pessoa', '2015-05-10 11:23:58', 'U', 'id_pessoa==10;/nome_razao==ROSA MARIA LIRA DOS ANJOS;/cpf_cnpj==287.292.184-20;/tipo_pessoa==F;/cliente==C', 'nome_razao==ROSA MARIA LIRA DOS ANJOS;/cpf_cnpj==287.292.184-20;/tipo_pessoa==F;/cliente==C', 1, 10),
(80, 'tb_dados', '2015-05-10 11:23:58', 'U', 'id_dados==10;/id_pessoa==10;/tel1==(82) 9982-4660;/tel2==;/tel3==;/email==rosadosanjos58@gmail.com;/site==amigosdopet.net;/tel0800==', 'tel1==(82) 9982-4660;/tel2==;/tel3==;/email==rosadosanjos58@gmail.com;/site==amigosdopet.net;/tel0800==;/id_pessoa==10', 1, 10),
(81, 'tb_endereco', '2015-05-10 11:23:58', 'U', 'id_endereco==10;/id_pessoa==10;/endereco==RUA JOAO DANTAS BARRETO;/complemento==421;/cep==57.052-484;/bairro==GRUTA DE LOURDES;/cidade==MACEIO;/estado==AL', 'endereco==RUA JOAO DANTAS BARRETO;/complemento==421;/cep==57.052-484;/bairro==GRUTA DE LOURDES;/cidade==MACEIÓ;/id_pessoa==10;/estado==AL', 1, 10),
(82, 'tb_pessoa', '2015-05-10 11:24:11', 'U', 'id_pessoa==9;/nome_razao==SONIA MARIA ACIOLI DE BARROS;/cpf_cnpj==228.680.464-87;/tipo_pessoa==F;/cliente==C', 'nome_razao==SONIA MARIA ACIOLI DE BARROS;/cpf_cnpj==228.680.464-87;/tipo_pessoa==F;/cliente==C', 1, 9),
(83, 'tb_dados', '2015-05-10 11:24:11', 'U', 'id_dados==9;/id_pessoa==9;/tel1==(82) 8847-7708;/tel2==;/tel3==;/email==sonia-barros@hotmail.com;/site==amigosdopet.net;/tel0800==', 'tel1==(82) 8847-7708;/tel2==;/tel3==;/email==sonia-barros@hotmail.com;/site==amigosdopet.net;/tel0800==;/id_pessoa==9', 1, 9),
(84, 'tb_endereco', '2015-05-10 11:24:11', 'U', 'id_endereco==9;/id_pessoa==9;/endereco==RUA PRIMEIRO DE MAIO;/complemento==128;/cep==57.010-369;/bairro==PRADO;/cidade==MACEIO;/estado==AL', 'endereco==RUA PRIMEIRO DE MAIO;/complemento==128;/cep==57.010-369;/bairro==PRADO;/cidade==MACEIÓ;/id_pessoa==9;/estado==AL', 1, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categoria`
--

CREATE TABLE IF NOT EXISTS `tb_categoria` (
  `id_categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Extraindo dados da tabela `tb_categoria`
--

INSERT INTO `tb_categoria` (`id_categoria`, `nome`) VALUES
(9, 'CONSULTAS'),
(10, 'IMUNOPROFILAXIA'),
(11, 'CIRURGIAS PLÁSTICAS'),
(12, 'HERNIAS '),
(13, 'PROCEDIMENTOS MÉDICO -VETERINÁRIO'),
(14, 'PROCEDIMENTOS GÊNITO - URINÁRIOS  '),
(15, 'PROCEDIMENTOS NO APARELHO DIGESTIVO '),
(16, 'PROCEDIMENTOS EM RADIOLOGIA'),
(17, 'PROCEDIMENTOS OBSTÉTRICOS'),
(19, 'PROCEDIMENTOS NO SISTEMA LOCOMOTOR'),
(20, 'PROCEDIMENTOS NOS ÕRGÃOS DO SENTIDO'),
(21, 'PROCEDIMENTOS NO SISTEMA TEGUMENTAR '),
(22, 'EXAMES ESPECIAIS '),
(23, 'PROCEDIMENTOS DE DIAGNÓSTICOS '),
(24, 'OUTROS SERVIÇOS '),
(25, 'EXAMES LABORATORIAIS ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE IF NOT EXISTS `tb_cliente` (
  `id_cliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_raca` int(10) unsigned NOT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carterinha` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `porte` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `especie` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nascimento` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peso` int(10) unsigned DEFAULT NULL,
  `altura` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `tb_animal_FKIndex1` (`id_raca`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_credenciado`
--

CREATE TABLE IF NOT EXISTS `tb_credenciado` (
  `id_credenciado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_regiao` int(10) unsigned NOT NULL,
  `id_pessoa` int(10) unsigned NOT NULL,
  `cadastro` datetime DEFAULT NULL,
  `observacao` text,
  `horario_abertura` varchar(5) DEFAULT NULL,
  `horario_fechamento` varchar(5) DEFAULT NULL,
  `funcionamento_de` varchar(10) DEFAULT NULL,
  `funcionamento_ate` varchar(10) DEFAULT NULL,
  `id_veterinario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_credenciado`),
  KEY `tb_credenciado_FKIndex1` (`id_pessoa`),
  KEY `tb_credenciado_FKIndex2` (`id_regiao`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tb_credenciado`
--

INSERT INTO `tb_credenciado` (`id_credenciado`, `id_regiao`, `id_pessoa`, `cadastro`, `observacao`, `horario_abertura`, `horario_fechamento`, `funcionamento_de`, `funcionamento_ate`, `id_veterinario`) VALUES
(1, 1, 1, '2014-07-25 16:39:05', '', '08:00', '18:00', 'Segunda', 'Sexta', NULL),
(2, 1, 2, '2014-08-04 15:52:15', '', '08:00', '18:00', 'Segunda', 'Sexta', NULL),
(4, 1, 4, '2014-08-06 16:29:45', '', '08:00', '18:00', 'Segunda', 'Sexta', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dados`
--

CREATE TABLE IF NOT EXISTS `tb_dados` (
  `id_dados` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(10) unsigned NOT NULL,
  `tel1` varchar(15) DEFAULT NULL,
  `tel2` varchar(15) DEFAULT NULL,
  `tel3` varchar(15) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `site` varchar(150) DEFAULT NULL,
  `tel0800` varchar(15) NOT NULL,
  PRIMARY KEY (`id_dados`),
  KEY `tb_dados_FKIndex1` (`id_pessoa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `tb_dados`
--

INSERT INTO `tb_dados` (`id_dados`, `id_pessoa`, `tel1`, `tel2`, `tel3`, `email`, `site`, `tel0800`) VALUES
(1, 1, '(82) 3327-4758', '', '', 'victorafelix@hotmail.com', '', ''),
(2, 2, '(82) 3021-0004', '', '', 'imperio_animal@hotmail.com', '', ''),
(4, 4, '(82) 4141-1323', '', '', '', '', ''),
(7, 7, '(82) 8801-9836', '', '', 'financeiro@amigosdopet.net', 'amigosdopet.net', ''),
(8, 8, '(82) 8882-1234', '', '', 'alinemariacavalcante@hotmail.com', 'amigosdopet.net', ''),
(9, 9, '(82) 8847-7708', '', '', 'sonia-barros@hotmail.com', 'amigosdopet.net', ''),
(10, 10, '(82) 9982-4660', '', '', 'rosadosanjos58@gmail.com', 'amigosdopet.net', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco`
--

CREATE TABLE IF NOT EXISTS `tb_endereco` (
  `id_endereco` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(10) unsigned NOT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `bairro` varchar(70) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `tb_endereco_FKIndex1` (`id_pessoa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `tb_endereco`
--

INSERT INTO `tb_endereco` (`id_endereco`, `id_pessoa`, `endereco`, `complemento`, `cep`, `bairro`, `cidade`, `estado`) VALUES
(1, 1, 'Rua Santa Cecí­lia, 235', '', '57.025-030', 'POÃ‡O', 'Maceió', '1'),
(2, 2, 'Av. prof. Sandoval arroxelas ', 'Nº 142', '57.035-230', 'Ponta Verde', 'Maceió', '1'),
(4, 4, 'Av. Durval de Goes Monteiro ', 'Nº 422', '', ' Gruta de Lourdes', 'Maceió', '1'),
(7, 7, 'AVENIDA DONA CONSTANÇA', '1050', '57.035-220', 'POÇO', 'MACEIÓ', 'AL'),
(8, 8, 'AVENIDA DONA CONSTANÇA', '397', '57.025-355', 'POÇO', 'MACEIÓ', 'AL'),
(9, 9, 'RUA PRIMEIRO DE MAIO', '128', '57.010-369', 'PRADO', 'MACEIÓ', 'AL'),
(10, 10, 'RUA JOAO DANTAS BARRETO', '421', '57.052-484', 'GRUTA DE LOURDES', 'MACEIÓ', 'AL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_foto`
--

CREATE TABLE IF NOT EXISTS `tb_foto` (
  `id_foto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_animal` int(10) unsigned NOT NULL,
  `caminho` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_foto`),
  KEY `tb_foto_FKIndex1` (`id_animal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pessoa`
--

CREATE TABLE IF NOT EXISTS `tb_pessoa` (
  `id_pessoa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_razao` varchar(200) DEFAULT NULL,
  `cpf_cnpj` varchar(18) DEFAULT NULL,
  `tipo_pessoa` varchar(1) DEFAULT NULL,
  `cliente` varchar(1) NOT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `tb_pessoa`
--

INSERT INTO `tb_pessoa` (`id_pessoa`, `nome_razao`, `cpf_cnpj`, `tipo_pessoa`, `cliente`) VALUES
(1, 'Focinhos e Patinhas', '', 'J', ''),
(2, 'CaoKia', '16.895.665/0001-40', 'J', ''),
(4, 'cliniKao', '', 'J', ''),
(7, 'LUCIANA RENATA DA SILVA ROCHA', '040.581.874-25', 'F', 'C'),
(8, 'ALINE MARIA CAVALCANTE DA SILVA', '077.035.914-08', 'F', 'C'),
(9, 'SONIA MARIA ACIOLI DE BARROS', '228.680.464-87', 'F', 'C'),
(10, 'ROSA MARIA LIRA DOS ANJOS', '287.292.184-20', 'F', 'C');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_plano`
--

CREATE TABLE IF NOT EXISTS `tb_plano` (
  `id_plano` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_regiao` int(10) unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`id_plano`),
  KEY `tb_plano_FKIndex1` (`id_regiao`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tb_plano`
--

INSERT INTO `tb_plano` (`id_plano`, `id_regiao`, `nome`, `preco`) VALUES
(1, 1, 'AMIGO BRONZE', 49.9),
(2, 1, 'AMIGO SILVER', 85.9),
(3, 1, 'AMIGO GOLD', 135.9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_procedimento`
--

CREATE TABLE IF NOT EXISTS `tb_procedimento` (
  `id_procedimento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_categoria` int(10) unsigned NOT NULL,
  `nome` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carencia` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periodicidade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_procedimento`),
  KEY `tb_procedimento_FKIndex1` (`id_categoria`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=200 ;

--
-- Extraindo dados da tabela `tb_procedimento`
--

INSERT INTO `tb_procedimento` (`id_procedimento`, `id_categoria`, `nome`, `carencia`, `periodicidade`, `codigo`) VALUES
(4, 9, 'CONSULTA FORA DO EXPEDIENTE CLINIO GERAL', '30', '30', 'A.01.04'),
(5, 10, 'VACINA ANTI-RABICA', '60', '360', 'B.02.01'),
(9, 10, 'VACINA PNEUMODOG / BRONCHIGUARD - PRIMA DOSE', '60', '21', 'B.02.03'),
(10, 10, 'VACINA PNEUMODOG / BRONCHIGUARD - REFORÇO ANUAL', '60', '360', 'B.02.03.01'),
(11, 10, 'VACINA QUADRUPLA FELINA - PRIMA DOSE', '60', '21', 'B.02.04'),
(12, 10, 'VACINA QUADRUPLA FELINA - REFORÇO ANUAL', '60', '360', 'B.02.04.01'),
(13, 10, 'VACINA TRIPLICE FELINA (ANIMAIS ATÉ 12 MESES)', '60', '21', 'B.02.06'),
(14, 10, 'VACINA TRIPLICE FELINA (ANIMAIS ACIMA DE 12 MESE)', '60', '21', 'B.02.06.01'),
(15, 10, 'VACINA TRIPLICE FELINA - REFORÇO ANUAL', '60', '360', 'B.02.06.02'),
(16, 10, 'VACINA DECTUPLA - PRIMA DOSE', '60', '21', 'B.02.07'),
(17, 10, 'VACINA DECTUPLA - REFORÇO ANUAL', '60', '360', 'B.02.07.01'),
(18, 10, 'VACINA OCTUPLA - PRIMA DOSE', '60', '21', 'B.02.08'),
(19, 10, 'VACINA OCTUPLA - REFORARO ANUAL', '60', '360', 'B.02.08.01'),
(20, 10, 'VACINA BRONCHI SHIELD II', '60', '360', 'B.02.09'),
(21, 10, 'VACINA CONTRA LEISHMANIOSE - PRIMA DOSE', '120', '21', 'B.02.10'),
(22, 10, 'VACINA CONTRA LEISHMANIOSE - REFORÇO ANUAL', '120', '360', 'B.02.10.01'),
(23, 11, 'AMPUTAÇÃO DE ERGOT ACIMA DE 60 DIAS (PATOLOGICA POR ANIMAL)', '150', '365', 'C.03.06'),
(24, 11, 'CAUDECTOMIA ACIMA DE 60 DIAS (PATOLOGICA)', '150', '365', 'C.03.15'),
(25, 11, 'CONCHECTOMIA PATOLOGICA', '120', '120', 'C.03.16'),
(26, 11, 'BLEFAROPLASTIA UNINOCULAR', '180', '30', 'C.03.18'),
(27, 11, 'BLEFAROPLASTIA BINOCULAR', '180', '0', 'C.03.19'),
(28, 11, 'QUEILOPLASTIA (FENDA PALATINA)', '120', '120', 'C.03.21'),
(29, 12, 'CORREÇÃO DE HERNIA INGUINAL (UNILATERAL)', '120', '120', 'D.04.02'),
(30, 12, 'CORREÇÃO DE HERNIA INGUINAL (BILATERAL)', '180', '120', 'D.04.03'),
(31, 12, 'CORREÇÃO DE HERNIA PERINEAL (UNILATERAL)', '120', '120', 'D.04.04'),
(32, 12, 'CORREÇÃO DE HERNIA PERINEAL (BILATERAL)', '180', '120', 'D.04.05'),
(33, 12, 'CORREÇÃO DE HERNIA UMBILICAL', '120', '120', 'D.04.06'),
(34, 12, 'CORREÇÃO DE HERNIA ESCROTAL (UNILATERAL)', '120', '120', 'D.04.07'),
(35, 12, 'CORREÇÃO DE HERNIA ESCROTAL (BILATERAL)', '120', '120', 'D.04.08'),
(36, 13, 'MICROCHIPAGEM', '0', '0', 'E.05.01'),
(37, 13, 'CURATIVO SIMPLES (INCLUSO MATERIAL)', '60', '1', 'E.05.03'),
(38, 13, 'CURATIVO CONCHECTOMIA PATOLOGICA', '120', '1', 'E.05.04'),
(39, 13, 'FLUIDOTERAPIA / SOROTERAPIA (INCLUSO FLUIDOS E MATERIAIS NECESSÁRIOS, ASSIM COMO TAXA DE APLICAÇÃO POR ESTA VIA)', '90', '1', 'E.05.07'),
(40, 13, 'OXIGENIOTERAPIA (INCLUSO OXIGÊNIO E MATERIAIS NECESSÁRIOS, ASSIM COMO TAXA DE APLICAÇÃO POR ESTA VIA LIMITADO A 4 METROS CÚBICOS POR SESSÃO)', '90', '1', 'E.05.09'),
(41, 13, 'TRANSFUSÃO DE SANGUE C/ COLETA (INCLUSO MATERIAL DA COLETA A TRANSFUSÃO)', '90', '30', 'E.05.10'),
(42, 13, 'TAXA DE ANESTESIA GERAL (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO ANESTÉSICO)', '120', '60', 'E.05.11.01'),
(43, 13, 'TAXA DE ANESTESIA GERAL INALATÓRIA (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO ANESTÉSICO)', '120', '60', 'E.05.11.02'),
(44, 13, 'TAXA ANESTESIA LOCAL (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO ANESTÉSICO)', '30', '30', 'E.05.11.03'),
(45, 13, 'TAXA INTERNAÇÃO NOITE-PERNOITE (INCLUSO MANEJO E ADMINISTRAÇÃO DE MEDICAMENTOS POR TODAS AS  VIAS) OBS.: MEDICAMENTOS COBERTOS PELO AMIGOS DO PET ', '90', '1', 'E.05.11.04'),
(46, 13, 'TAXA INTERNAÇÃO DIA (INCLUSO MANEJO E ADMINISTRAÇÃO DE MEDICAMENTOS POR TODAS AS VIAS) OBS.: MEDICAMENTOS COBERTOS PELO AMIGOS DO PET SERÃO ', '90', '1', 'E.05.11.05'),
(47, 10, 'TAXA DE SEDAÇÃO CANINO (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO SEDATIVO)', '90', '30', 'E.05.11.06'),
(48, 13, 'TAXA DE SEDAÇÃO FELINA (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO SEDATIVO)', '90', '30', 'E.05.11.07'),
(49, 13, 'TAXA DE SEDAÇÃO FELINA (INCLUSO APLICAÇÃO, MATERIAL E MEDICAMENTO SEDATIVO)', '90', '30', 'E.05.11.07'),
(50, 13, 'TAXA DE COLETA DE MATERIAL', '30', '0', 'E.05.11.08'),
(51, 14, 'CISTOTOMIA', '120', '365', 'F.06.01'),
(52, 14, 'EXERESE DE T.V.T. EM FEMEA', '120', '365', 'F.06.02'),
(53, 14, 'EXERESE DE T.V.T. MACHO', '120', '365', 'F.06.03'),
(54, 14, 'ORQUIECTOMIA TEST. CRIPTORQ ABDOMINAL', '180', '0', 'F.06.06'),
(55, 14, 'ORQUIECTOMIA TEST. CRIPTORQ INGUINAL', '120', '0', 'F.06.07'),
(56, 14, 'ORQUIECTOMIA TEST. NORMAL CANINO', '120', '0', 'F.06.08'),
(57, 14, 'ORQUIECTOMIA TEST. NORMAL FELINO', '120', '0', 'F.06.09'),
(58, 14, 'SUTURA PANIANA (EM CASOS DE TRAUMATISMOS)', '120', '365', 'F.06.12'),
(59, 14, 'URETROSTOMIA', '120', '0', 'F.06.14'),
(60, 14, 'URETROTOMIA', '120', '120', 'F.06.15'),
(61, 15, 'CORREÇÃO DE FISTULA ANAL (CIRURGIA)', '120', '365', 'G.07.01'),
(62, 15, 'ENTERECTOMIA', '180', '365', 'G.07.02'),
(63, 15, 'ENTEROTOMIA', '120', '365', 'G.07.03'),
(64, 15, 'ESOFAGOTOMIA CERVICAL', '180', '365', 'G.07.04'),
(65, 15, 'GASTROTOMIA', '120', '365', 'G.07.11'),
(66, 15, 'REDUÇÃO DE PROLAPSO RETAL (CIRÚRGICO)', '120', '120', 'G.07.12'),
(67, 15, 'SIALOADENECTOMIA', '120', '180', 'G.07.13'),
(68, 15, 'TARTARECTOMIA (Limpeza de calculo dental)', '180', '365', 'G.07.14'),
(69, 15, 'EXERESE CIRURGICA DE PAPILOMAS ORAL', '120', '120', 'G.07.18'),
(70, 15, 'REDUÇÃO DE EVISCERAÇÃO / EVENTRAÇÃO', '120', '120', 'G.07.19'),
(71, 15, 'AMPUUTAÇÃO PARCIAL DA LINGUA', '120', '120', 'G.07.21'),
(72, 16, 'RADIOGRAFIA 13X18', '120', '0', 'H.08.03'),
(73, 16, 'RADIOGRAFIA 18X24', '120', '0', 'H.08.04'),
(74, 16, 'RADIOGRAFIA 24X30', '120', '0', 'H.08.05'),
(75, 16, 'RADIOGRAFIA 30X40', '120', '0', 'H.08.06'),
(76, 17, 'ASSISTÊNCIA AO PARTO', '150', '365', 'I.09.02'),
(77, 17, 'CESARIANA CANINO', '180', '365', 'I.09.03'),
(78, 17, 'CESARIANA FELINO', '180', '365', 'I.09.04'),
(79, 17, 'CESARIANA C/ OVARIOHISTERECTOMIA CANINO', '180', '0', 'I.09.05'),
(80, 17, 'CESARIANA C/ OVARIOHISTERECTOMIA FELINO', '180', '0', 'I.09.06'),
(81, 17, 'OVARIOHISTERECTOMIA CANINO - CASTRAÇÃO', '180', '0', 'I.09.11'),
(82, 17, 'OVARIOHISTERECTOMIA FELINO - CASTRAÇÃO', '180', '0', 'I.09.12'),
(83, 17, 'OVARIOHISTECTOMIA CANINO - PIOMETRA', '180', '0', 'I.09.13'),
(84, 17, 'OVARIOHISTECTOMIA FELINO - PIOMETRA', '180', '0', 'I.09.14'),
(85, 17, 'REDUÇÃO DE PROLAPSO UTERINO - CIRUGICO INCLUSO CASTRAÇÃO', '180', '30', 'I.09.15'),
(86, 17, 'REDUÇÃO HIPERPLASIA DO ASSOALHO VAGINAL - CIRURGICO', '180', '30', 'I.09.16'),
(87, 19, 'IMOBILIZAÇÃO SIMPLES (INCLUSO MATERIAL)', '60', '30', 'J.10.07'),
(88, 20, 'EVISCERAÇÃO OU ENUCLEAÇÃO DO GLOBO OCULAR', '180', '30', 'K.11.07'),
(89, 20, 'EXCISÃO DA GLANDULA DA 3ª PALPEBRA', '180', '30', 'K.11.08'),
(90, 20, 'FLAP DE 3 PALPEBRA OU CONJUNTIVAL', '120', '30', 'K.11.10'),
(91, 20, 'REPOSIÇÃO DE GLOBO OCULAR', '120', '30', 'K.11.12'),
(92, 20, 'DRENAGEM DE OTOHEMATOMA', '120', '90', 'K.11.15'),
(93, 20, 'LIMPEZA DO CANAL AUDITIVO PATOLOGICO / OTITE', '60', '2', 'K.11.17'),
(94, 20, 'RESSECÇÃO DO CANAL AUDITIVO UNILATERAL', '120', '30', 'K.11.18'),
(95, 20, 'TESTE DE SCHIRMMER', '90', '90', 'K.11.39'),
(96, 21, 'MASTECTOMIA REGIONAL', '180', '30', 'L.12.01'),
(97, 21, 'RECONSTITUIÇÃO PELE (Traumático-Até 20 Pontos)', '120', '30', 'L.12.02'),
(98, 21, 'RECONSTITUIÇÃO PELE (Traumático-A PARTIR de 20 Pontos)', '180', '30', 'L.12.03'),
(99, 21, 'DRENAGEM DE ABCESSO', '90', '30', 'L.12.04'),
(100, 21, 'MASTECTOMIA RADICAL BILATERAL', '180', '30', 'L.12.05'),
(101, 21, 'MASTECTOMIA DE TUMOR MAMARIO SIMPLES', '180', '30', 'L.12.06'),
(102, 21, 'MASTECTOMIA RADICAL UNILATERAL', '180', '30', 'L.12.07'),
(103, 21, 'ONIECTOMIA PATOLOGICA', '180', '30', 'L.12.08'),
(104, 21, 'REMOÇÃO DE DERMATOBIOSE (POR BENEFICIÁRIO)', '120', '30', 'L.12.09'),
(105, 21, 'REMOÇÃO DE MIIASE', '120', '30', 'L.12.11'),
(106, 21, 'REMOÇÃO TUMOR EXTERNO', '120', '120', 'L.12.12'),
(107, 21, 'RETIRADA DE LESOES VERRUCOSAS / PAPILOMAS', '180', '365', 'L.12.13'),
(108, 22, 'ELETROCARDIOGRAMA', '90', '30', 'M.13.01'),
(109, 22, 'ECOCARDIOGRAMA', '90', '365', 'M.13.02'),
(110, 22, 'ULTRA-SOM', '90', '30', 'M.13.04'),
(111, 23, 'PARACENTESE ABDOMINAL', '90', '30', 'N.14.03'),
(112, 23, 'LAPAROTOMIA EXPLORATORIA', '180', '30', 'N.14.09'),
(113, 24, 'ESPLENECTOMIA', '180', '0', 'O.15.01'),
(114, 25, 'ACIDO URICO', '30', '30', 'P.50.03'),
(115, 25, 'ACTH-HORMONIO CORTICOTROFICO', '60', '30', 'P.50.04'),
(116, 25, 'AMILASE', '30', '60', 'P.50.05'),
(117, 25, 'ALBUMINA', '0', '30', 'P.50.06'),
(118, 25, 'ANALISE LIQUOR', '60', '30', 'P.50.07'),
(119, 25, 'ANALISE DE CALCULO URINARIO', '60', '30', 'P.50.08'),
(120, 25, 'ALDOLASE', '60', '30', 'P.50.09'),
(121, 25, 'BILIRRUBINAS (DIRETA, INDIRETA E TOTAL)', '60', '30', 'P.50.14'),
(122, 25, 'BIOPSIA SIMPLES / HISTOPATOLOGIA', '90', '30', 'P.50.15'),
(123, 25, 'CALCIO', '60', '30', 'P.50.21'),
(124, 25, 'CALCIO IONICO', '60', '30', 'P.50.22'),
(125, 25, 'CINOMOSE - PESQ. CORPUSCULO INCLUSÃO', '60', '30', 'P.50.27'),
(126, 25, 'CINOMOSE ', '90', '30', 'P.50.28'),
(127, 25, 'BACTERIOSCOPIA(GRAM)', '60', '30', 'P.50.32'),
(128, 25, 'CITOLOGIAS PATOLOGICA', '90', '30', 'P.50.33'),
(129, 25, 'CK OU CPK CREATINOFOSFOQUINASE', '60', '30', 'P.50.34'),
(130, 25, 'CLORO (CLORETO)', '60', '30', 'P.50.35'),
(131, 25, 'COLESTEROL TOTAL E FRACIONADO', '60', '30', 'P.50.36'),
(132, 25, 'COLESTEROL TOTAL', '60', '30', 'P.50.37'),
(133, 25, 'CREATININA / CLEARENCE', '60', '30', 'P.50.43'),
(134, 25, 'CORTISOL BASAL', '60', '30', 'P.50.44'),
(135, 25, 'CREATININA  ', '30', '30', 'P.50.45'),
(136, 25, 'CULTURA C/ ANTIBIOGRAMA COMBINADO (AEROBIOS + ANAEROBIOS)', '60', '60', 'P.50.48'),
(137, 25, 'CULTURA PARA FUNGOS', '30', '60', 'P.50.51'),
(138, 25, 'PERFIL GLICOSE 3 DETERMINAÇÕES', '90', '30', 'P.50.52'),
(139, 25, 'DOSAGEM DE DIGOXINA', '90', '30', 'P.50.58'),
(140, 25, 'DOSAGEM DE FENOBARBITAL', '90', '30', 'P.50.60'),
(141, 25, 'ELETROFORESE DE PROTEINAS', '90', '30', 'P.50.64'),
(142, 25, 'ERLICHIA', '90', '180', 'P.50.67'),
(143, 25, 'EXAME PARASITOLOGICO DE FEZES', '30', '30', 'P.50.72'),
(144, 25, 'EXAME PARASITOLOGICO DE FEZES - MIF', '30', '30', 'P.50.73'),
(145, 25, 'FERRO SERICO', '30', '30', 'P.50.78'),
(146, 22, 'FIBRINOGENIO', '90', '60', 'P.50.79'),
(147, 25, 'FOSFATASE ALCALINA', '60', '30', 'P.50.81'),
(148, 25, 'FOSFORO', '60', '30', 'P.50.82'),
(149, 25, 'FRUTOSAMINA', '90', '60', 'P.50.83'),
(150, 25, 'GAMA GT', '90', '30', 'P.50.85'),
(151, 25, 'GLICOSE / GLICEMIA', '60', '30', 'P.50.86'),
(152, 25, 'HEMOGRAMA COMPLETO', '30', '30', 'P.50.91'),
(153, 25, 'LDH (DEHIDROGENASE LATICA)', '90', '30', 'P.50.10.0'),
(154, 25, 'LEISHMANIOSE METODO ELISA + IFI', '60', '30', 'P.50.10.1'),
(155, 25, 'LEISHMANIOSE METODO IMUNOHISTOQUIMICA', '90', '60', 'P.50.10.3'),
(156, 25, 'LEPTOSPIROSE - MICROAQLUTINAÇÃO', '60', '60', 'P.50.10.5'),
(157, 25, 'LIPIDEOS TOTAIS', '60', '60', 'P.50.10.9'),
(158, 25, 'MIELOGRAMA', '90', '365', 'P.50.10.9'),
(159, 25, 'PARATORMONIO', '90', '30', 'P.50.11.8'),
(160, 25, 'PARVOVIROSE', '90', '30', 'P.50.12.1'),
(161, 25, 'PERFIL BIOQUIMICO: (TGP-ALT), ALCALINA, PROTEINAS TOTAIS E ', '90', '30', 'P.50.12.5'),
(162, 25, 'PERFIL ELETROLITICO: (SODIO, POTASSIO, CLORETOS, CALCIO)', '90', '30', 'P.50.12.7'),
(163, 25, 'PERFIL GERIATRICO I: ( HEMOGRAMA, URINA ROTINA, GLICOSE, UREIA, CREATININA)', '90', '30', 'P.50.12.8'),
(164, 25, 'PERFIL GERIATRICO II: (HEMOGRAMA, URINA ROTINA, GLICOSE, UREIA, CREATININA, T4)', '90', '30', 'P.50.12.9'),
(165, 25, 'PERFIL HEPATICO: PROTEINASTOTAIS E FRACOES, TGP-ALT, LIPIDES TOTAIS, FOSFATASE', '90', '30', 'P.50.13.0'),
(166, 25, 'PERFIL OSSEO: (CALCIO, FOSFATASE ALCALINA, FOSFORO)', '90', '30', 'P.50.13.5'),
(167, 25, 'PERFIL PANCREATICO (AMILASE, LIPASE, CREATININA)', '90', '30', 'P.50.13.7'),
(168, 25, 'PERFIL RENAL: (UREIA, CREATININA)', '30', '30', 'P.50.14.3'),
(169, 25, 'PERFIL TIREOIDIANO (T4TOTAL; T4 LIVRE; TSH)-METODO QUIMIOLUMINESCENCIA', '90', '60', 'P.50.14.6'),
(170, 25, 'CHECK UP 1 (HEMOGRAMA COMPLETO, TGP, CREATININA)', '30', '30', 'P.50.14.7'),
(171, 25, 'CHECK UP 2 (HEMOGRAMA COMPLETO, TGP, UREIA)', '30', '30', 'P.50.14.8'),
(172, 25, 'HEMOGRAMA + PESQ DE HEMATOZOARIO', '60', '60', 'P.50.15.0'),
(173, 25, 'LEISHMANIA SP (CITOLOGIA)', '90', '30', 'P.50.15.4'),
(174, 25, 'PESQUISA DE HEMATOZOARIOS', '30', '30', 'P.50.15.5'),
(175, 25, 'PESQUISA DE MYCOPLASMA HAEMOFELIS HAEMOCANIS (HAEMOBARTONELLA)', '90', '30', 'P.50.15.6'),
(176, 25, 'PESQUISA DE SARNA E FUNGO + BACTERIOSCOPIA', '90', '30', 'P.50.15.7'),
(177, 25, 'PESQUISA DE SANGUE E OCULTO', '90', '30', 'P.50.15.8'),
(178, 25, 'PESQUISA DIRETA P/ FUNGOS E SARNA (RASPADO DE PELE)', '60', '30', 'P.50.15.9'),
(179, 25, 'PIF', '90', '365', 'P.50.16.0'),
(180, 25, 'POTASSIO', '60', '30', 'P.50.16.2'),
(181, 25, 'PROTEINAS TOTAIS E FRACOES', '60', '30', 'P.50.16.4'),
(182, 25, 'SODIO', '60', '30', 'P.50.17.2'),
(183, 25, 'T3 TOTAL-METODO QUIMIOLUMINESCENCIA', '90', '30', 'P.50.17.3'),
(184, 25, 'T4 LIVRE-QUIMIOLUMINESCENCIA', '90', '30', 'P.50.17.5'),
(185, 25, 'T4 TOTAL-QUIMIOLUMINESCENCIA', '90', '30', 'P.50.17.5'),
(186, 25, 'TGO AST', '90', '30', 'P.50.17.9'),
(187, 25, 'TGP ALT', '90', '30', 'P.50.18.0'),
(188, 25, 'TOXOPLASMOSE FELINA', '90', '365', 'P.50.18.1'),
(189, 25, 'TOXOPLASMOSE CANINA', '90', '365', 'P.50.18.3'),
(190, 25, 'TRIGLICERIDEOS', '60', '30', 'P.50.18.5'),
(191, 25, 'TSH - HORMONIO ESTIMULANTE DA TIREOIDE-METODO RIE', '90', '30', 'P.50.18.6'),
(192, 25, 'UREIA', '30', '30', 'P.50.18.7'),
(193, 25, 'URINA ROTINA (EAS)', '30', '30', 'P.50.18.8'),
(194, 25, 'UROCULTURA', '60', '30', 'P.50.18.9'),
(195, 25, 'LEISHMANIOSE CANINA METODO PCR', '120', '365', 'P.50.19.1'),
(196, 25, 'TESTE DE SUPRESAO C/ DEXAMETASONIA (ALTA OU BAIXA DOSE)', '120', '90', 'P.50.20.0'),
(197, 25, 'LEISHMANIOSE CANINA - METODO ELISA + IFI - DILUIÇÃO TOTAL', '60', '90', 'P.50.20.4'),
(198, 25, 'PESQUISA DE GIARDIA (METODO ELISA)', '30', '15', 'P.50.26.7'),
(199, 25, 'LEUCEMIA E IMUNODEFICIENCIA FELINA', '45', '365', 'P.50.27.1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_procedimento_credenciado`
--

CREATE TABLE IF NOT EXISTS `tb_procedimento_credenciado` (
  `id_credenciado` int(10) unsigned NOT NULL,
  `id_procedimento` int(10) unsigned NOT NULL,
  `preco_apagar` float DEFAULT NULL,
  PRIMARY KEY (`id_credenciado`,`id_procedimento`),
  KEY `tb_procedimento_has_tb_credenciado_FKIndex2` (`id_credenciado`),
  KEY `tb_procedimento_credenciado_FKIndex2` (`id_procedimento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_procedimento_credenciado`
--

INSERT INTO `tb_procedimento_credenciado` (`id_credenciado`, `id_procedimento`, `preco_apagar`) VALUES
(4, 76, 100),
(4, 92, 500);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_procedimento_plano`
--

CREATE TABLE IF NOT EXISTS `tb_procedimento_plano` (
  `id_plano` int(10) unsigned NOT NULL,
  `id_procedimento` int(10) unsigned NOT NULL,
  `quantidade` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_plano`,`id_procedimento`),
  KEY `tb_procedimento_has_tb_plano_FKIndex2` (`id_plano`),
  KEY `tb_procedimento_plano_FKIndex2` (`id_procedimento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_raca`
--

CREATE TABLE IF NOT EXISTS `tb_raca` (
  `id_raca` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `raca` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_raca`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_regiao`
--

CREATE TABLE IF NOT EXISTS `tb_regiao` (
  `id_regiao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_regiao`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tb_regiao`
--

INSERT INTO `tb_regiao` (`id_regiao`, `nome`, `uf`) VALUES
(1, 'Maceió', 'AL'),
(2, 'Brasília', 'DF');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `perfil` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tb_user`
--

INSERT INTO `tb_user` (`id`, `nome`, `login`, `senha`, `code`, `perfil`) VALUES
(1, 'Leonardo M C Bessa', 'leobessa', '123456', '123456', 'administrador, todo_acesso'),
(2, 'Administrador Amigos do Pet', 'amigosdopet', 'pet12345', 'pet12345', 'administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veterinario`
--

CREATE TABLE IF NOT EXISTS `tb_veterinario` (
  `id_veterinario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_regiao` int(10) unsigned NOT NULL,
  `id_pessoa` int(10) unsigned NOT NULL,
  `cadastro` datetime DEFAULT NULL,
  `observacao` text,
  `crmv` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`),
  KEY `tb_veterinario_FKIndex1` (`id_pessoa`),
  KEY `tb_veterinario_FKIndex2` (`id_regiao`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
