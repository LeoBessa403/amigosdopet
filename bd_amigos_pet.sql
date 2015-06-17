-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.27
-- Versão do PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `bd_amigos_pet`
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=178 ;

--
-- Extraindo dados da tabela `tb_auditoria`
--

INSERT INTO `tb_auditoria` (`id_auditoria`, `tabela`, `realizado`, `operacao`, `item_anterior`, `item_atual`, `id_user`, `id_item`) VALUES
(1, 'tb_raca', '2015-05-10 11:54:15', 'I', '', 'raca==Bulldog', 1, 1),
(2, 'tb_raca', '2015-05-10 11:54:24', 'I', '', 'raca==Bull Terrier', 1, 2),
(3, 'tb_raca', '2015-05-10 11:54:38', 'I', '', 'raca==Chihuahua', 1, 3),
(4, 'tb_raca', '2015-05-10 11:54:45', 'I', '', 'raca==Boxer', 1, 4),
(5, 'tb_raca', '2015-05-10 11:54:54', 'I', '', 'raca==Dogue Alemão', 1, 5),
(6, 'tb_raca', '2015-05-10 11:55:00', 'I', '', 'raca==Dobermann', 1, 6),
(7, 'tb_raca', '2015-05-10 11:55:07', 'I', '', 'raca==Fila Brasileiro', 1, 7),
(8, 'tb_raca', '2015-05-10 11:55:12', 'I', '', 'raca==Labrador', 1, 8),
(9, 'tb_raca', '2015-05-10 11:55:22', 'I', '', 'raca==Perdigueiro', 1, 9),
(10, 'tb_raca', '2015-05-10 11:55:26', 'I', '', 'raca==Poodle', 1, 10),
(11, 'tb_raca', '2015-05-10 11:55:30', 'I', '', 'raca==Pequinês', 1, 11),
(12, 'tb_raca', '2015-05-10 11:55:36', 'I', '', 'raca==Pastor Alemão', 1, 12),
(13, 'tb_raca', '2015-05-10 11:55:41', 'I', '', 'raca==São Bernardo', 1, 13),
(14, 'tb_raca', '2015-05-10 11:55:48', 'I', '', 'raca==Shih Tzu', 1, 14),
(15, 'tb_raca', '2015-05-10 11:55:55', 'I', '', 'raca==Yorkshire Terrier', 1, 15),
(16, 'tb_cliente', '2015-05-10 11:57:26', 'I', '', 'nome==Mel;/cor==Marrom;/especie==Cachorro;/porte==PQ;/altura==0,45;/sexo==F;/peso==05;/id_raca==14;/nascimento==08/2007;/chip==102030;/cadastro==2015-05-10 11:57:25', 1, 1),
(17, 'tb_cliente', '2015-05-10 11:57:28', 'U', 'id_cliente==1;/id_raca==14;/nome==Mel;/cor==Marrom;/chip==102030;/carterinha==;/porte==PQ;/especie==Cachorro;/sexo==F;/nascimento==08/2007;/peso==5;/altura==0,45;/cadastro==2015-05-10 11:57:25', 'carterinha==2015050101', 1, 1),
(18, 'tb_foto', '2015-05-10 11:57:28', 'I', '', 'id_cliente==1;/caminho==cliente/1/mel-554f71d8111ed.jpg', 1, 1),
(19, 'tb_foto', '2015-05-10 11:57:28', 'I', '', 'id_cliente==1;/caminho==cliente/1/mel-554f71d82265b.jpg', 1, 2),
(20, 'tb_foto', '2015-05-10 11:57:28', 'I', '', 'id_cliente==1;/caminho==cliente/1/mel-554f71d825591.jpg', 1, 3),
(21, 'tb_foto', '2015-05-10 11:57:28', 'I', '', 'id_cliente==1;/caminho==cliente/1/mel-554f71d828936.jpg', 1, 4),
(22, 'tb_cliente', '2015-05-10 12:14:36', 'I', '', 'nome==Mel;/cor==Marrom,Preto;/especie==Cachorro;/porte==PQ;/altura==0,45;/sexo==F;/peso==;/id_raca==14;/nascimento==08/2007;/chip==102030;/id_pessoa==1;/cadastro==2015-05-10 12:14:34', 1, NULL),
(23, 'tb_cliente', '2015-05-10 12:21:38', 'U', 'id_cliente==1;/id_raca==14;/nome==Mel;/cor==Marrom;/chip==102030;/carterinha==2015050101;/porte==PQ;/especie==Cachorro;/sexo==F;/nascimento==08/2007;/peso==5;/altura==0,45;/cadastro==2015-05-10 11:57:25', 'nome==Mel;/cor==Marrom,Preto;/especie==Cachorro;/porte==PQ;/altura==0,45;/sexo==F;/peso==;/id_raca==14;/nascimento==08/2007;/chip==102030', 1, 1),
(24, 'tb_cliente', '2015-05-10 12:28:25', 'U', 'id_cliente==1;/id_raca==14;/nome==Mel;/cor==Marrom,Preto;/chip==102030;/carterinha==2015050101;/porte==PQ;/especie==Cachorro;/sexo==F;/nascimento==08/2007;/peso==0;/altura==0,45;/cadastro==2015-05-10 11:57:25', 'nome==Mel;/cor==Branco;/especie==Cachorro;/porte==PQ;/altura==0,45;/sexo==F;/peso==;/id_raca==14;/nascimento==08/2007;/chip==102030', 1, 1),
(25, 'tb_cliente', '2015-05-10 12:32:54', 'U', 'id_cliente==1;/id_raca==14;/nome==Mel;/cor==Branco;/chip==102030;/carterinha==2015050101;/porte==PQ;/especie==Cachorro;/sexo==F;/nascimento==08/2007;/peso==0;/altura==0,45;/cadastro==2015-05-10 11:57:25', 'nome==Mel;/cor==Marrom,Preto;/especie==Cachorro;/porte==PQ;/altura==0,45;/sexo==F;/peso==;/id_raca==14;/nascimento==08/2007;/chip==102030', 1, 1),
(26, 'tb_procedimento', '2015-05-25 19:27:20', 'I', '', 'nome==teste novo;/carencia==55;/periodicidade==10;/codigo==f.10.10;/id_categoria==14', 1, 200),
(27, 'tb_plano', '2015-05-25 19:32:36', 'I', '', 'nome==AMIGO BRONZE;/preco==49.90;/id_regiao==2', 1, 4),
(28, 'tb_plano', '2015-05-25 19:33:09', 'D', 'id_plano==4;/id_regiao==2;/nome==AMIGO BRONZE;/preco==49.9', '', 1, 4),
(29, 'tb_procedimento_plano', '2015-05-25 19:34:02', 'I', '', 'id_plano==1;/id_procedimento==4;/quantidade==10', 1, 0),
(30, 'tb_procedimento_plano', '2015-05-25 19:34:02', 'I', '', 'id_plano==1;/id_procedimento==10;/quantidade==1', 1, 0),
(31, 'tb_procedimento_plano', '2015-05-25 19:34:02', 'I', '', 'id_plano==1;/id_procedimento==12;/quantidade==5', 1, 0),
(32, 'tb_procedimento_plano', '2015-05-25 19:34:02', 'I', '', 'id_plano==1;/id_procedimento==18;/quantidade==10', 1, 0),
(33, 'tb_procedimento_plano', '2015-05-25 19:34:37', 'U', 'id_plano==1;/id_procedimento==4;/quantidade==10', 'quantidade==8', 1, 1),
(34, 'tb_procedimento_plano', '2015-05-25 19:34:37', 'I', '', 'id_plano==1;/id_procedimento==5;/quantidade==9', 1, 0),
(35, 'tb_procedimento_plano', '2015-05-25 19:34:37', 'U', 'id_plano==1;/id_procedimento==10;/quantidade==1', 'quantidade==1', 1, 1),
(36, 'tb_procedimento_plano', '2015-05-25 19:34:38', 'U', 'id_plano==1;/id_procedimento==12;/quantidade==5', 'quantidade==5', 1, 1),
(37, 'tb_procedimento_plano', '2015-05-25 19:34:38', 'U', 'id_plano==1;/id_procedimento==18;/quantidade==10', 'quantidade==10', 1, 1),
(38, 'tb_pessoa', '2015-05-25 19:40:20', 'I', '', 'nome_razao==TESTE;/cpf_cnpj==012.777.721-00;/tipo_pessoa==F;/cliente==', 1, 12),
(39, 'tb_credenciado', '2015-05-25 19:40:20', 'I', '', 'observacao==;/id_pessoa==12;/id_regiao==2;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sábado;/cadastro==2015-05-25 19:40:20', 1, 5),
(40, 'tb_dados', '2015-05-25 19:40:20', 'I', '', 'tel1==(54) 3543-4543;/tel2==;/tel3==;/email==email@email.com;/site==;/tel0800==;/id_pessoa==12', 1, 12),
(41, 'tb_endereco', '2015-05-25 19:40:20', 'I', '', 'endereco==endereço;/complemento==complemento;/cep==32.105-616;/bairro==samambaia;/cidade==brasilia;/id_pessoa==12;/estado==2', 1, 12),
(42, 'tb_procedimento_credenciado', '2015-05-25 19:46:37', 'I', '', 'id_credenciado==5;/id_procedimento==5;/preco_apagar==10.00', 1, 0),
(43, 'tb_procedimento_credenciado', '2015-05-25 19:46:37', 'I', '', 'id_credenciado==5;/id_procedimento==16;/preco_apagar==0.51', 1, 0),
(44, 'tb_pessoa', '2015-05-25 19:47:19', 'I', '', 'nome_razao==TESTE vet;/cpf_cnpj==123.456.789-09;/tipo_pessoa==F;/cliente==', 1, 13),
(45, 'tb_veterinario', '2015-05-25 19:47:19', 'I', '', 'observacao==;/id_pessoa==13;/id_regiao==2;/crmv==;/cadastro==2015-05-25 19:47:19', 1, 2),
(46, 'tb_dados', '2015-05-25 19:47:19', 'I', '', 'tel1==(64) 6465-4964;/tel2==;/tel3==;/email==;/site==;/tel0800==;/id_pessoa==13', 1, 13),
(47, 'tb_endereco', '2015-05-25 19:47:19', 'I', '', 'endereco==endereço;/complemento==complemento;/cep==65.465-464;/bairro==samambaia;/cidade==brasilia;/id_pessoa==13;/estado==DF', 1, 13),
(48, 'tb_pessoa', '2015-05-25 19:50:03', 'I', '', 'nome_razao==TESTE Res;/cpf_cnpj==123.456.789-09;/tipo_pessoa==F;/cliente==C', 1, 14),
(49, 'tb_dados', '2015-05-25 19:50:03', 'I', '', 'tel1==(54) 6546-5464;/tel2==;/tel3==;/email==;/site==;/tel0800==;/id_pessoa==14', 1, 14),
(50, 'tb_endereco', '2015-05-25 19:50:03', 'I', '', 'endereco==endereço;/complemento==complemento;/cep==54.645-654;/bairro==samambaia;/cidade==brasilia;/id_pessoa==14;/estado==AL', 1, 14),
(51, 'tb_cliente', '2015-05-25 19:55:37', 'I', '', 'nome==cachorro novo;/cor==Branco,Marrom,Cinza;/especie==Cachorro;/porte==GD;/altura==1,65;/sexo==F;/peso==99;/id_raca==13;/nascimento==07/1800;/chip==que bosta;/cadastro==2015-05-25 19:55:35', 1, 2),
(52, 'tb_cliente', '2015-05-25 19:55:37', 'U', 'id_cliente==2;/id_raca==13;/nome==cachorro novo;/cor==Branco,Marrom,Cinza;/chip==que bosta;/carterinha==;/porte==GD;/especie==Cachorro;/sexo==F;/nascimento==07/1800;/peso==99;/altura==1,65;/cadastro==2015-05-25 19:55:35', 'carterinha==2015050102', 1, 2),
(53, 'tb_foto', '2015-05-25 19:55:37', 'I', '', 'id_cliente==2;/caminho==cliente/2/cachorro-novo-5563a86961b20.jpg', 1, 5),
(54, 'tb_foto', '2015-05-25 19:55:37', 'I', '', 'id_cliente==2;/caminho==cliente/2/cachorro-novo-5563a8697bd1d.jpg', 1, 6),
(55, 'tb_foto', '2015-05-25 19:55:37', 'I', '', 'id_cliente==2;/caminho==cliente/2/cachorro-novo-5563a8697ee3a.jpg', 1, 7),
(56, 'tb_foto', '2015-05-25 19:55:37', 'I', '', 'id_cliente==2;/caminho==cliente/2/cachorro-novo-5563a8698222a.jpg', 1, 8),
(57, 'tb_procedimento', '2015-05-25 20:10:13', 'D', 'id_procedimento==4;/id_categoria==9;/nome==CONSULTA FORA DO EXPEDIENTE CLINIO GERAL;/carencia==30;/periodicidade==30;/codigo==A.01.04', '', 1, 4),
(58, 'tb_credenciado', '2015-05-25 22:32:18', 'U', 'id_credenciado==1;/id_regiao==1;/id_pessoa==1;/cadastro==2014-07-25 16:39:05;/observacao==;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta;/id_veterinario==', 'id_veterinario==2', 1, 1),
(59, 'tb_cliente', '2015-05-28 13:01:32', 'I', '', 'nome==;/especie==Cachorro;/porte==;/altura==;/sexo==;/peso==;/id_raca==;/nascimento==;/chip==;/cadastro==2015-05-28 13:01:30', 1, 3),
(60, 'tb_cliente', '2015-05-28 13:01:34', 'U', 'id_cliente==3;/id_raca==0;/nome==;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==;/nascimento==;/peso==0;/altura==;/cadastro==2015-05-28 13:01:30', 'carterinha==2015050103', 1, 3),
(61, 'tb_foto', '2015-05-28 13:01:34', 'I', '', 'id_cliente==3;/caminho==cliente/3/', 1, 9),
(62, 'tb_cliente', '2015-05-28 13:03:51', 'I', '', 'nome==;/especie==Cachorro;/porte==;/altura==;/sexo==;/peso==;/id_raca==;/nascimento==;/chip==;/cadastro==2015-05-28 13:03:50', 1, 4),
(63, 'tb_cliente', '2015-05-28 13:03:52', 'U', 'id_cliente==4;/id_raca==0;/nome==;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==;/nascimento==;/peso==0;/altura==;/cadastro==2015-05-28 13:03:50', 'carterinha==2015050104', 1, 4),
(64, 'tb_foto', '2015-05-28 13:03:52', 'I', '', 'id_cliente==4;/caminho==cliente/4/', 1, 10),
(65, 'tb_cliente', '2015-05-28 13:04:15', 'I', '', 'nome==;/especie==Cachorro;/porte==;/altura==;/sexo==;/peso==;/id_raca==;/nascimento==;/chip==;/cadastro==2015-05-28 13:04:14', 1, 5),
(66, 'tb_cliente', '2015-05-28 13:04:16', 'U', 'id_cliente==5;/id_raca==0;/nome==;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==;/nascimento==;/peso==0;/altura==;/cadastro==2015-05-28 13:04:14', 'carterinha==2015050105', 1, 5),
(67, 'tb_foto', '2015-05-28 13:04:16', 'I', '', 'id_cliente==5;/caminho==cliente/5/', 1, 11),
(68, 'tb_credenciado', '2015-05-30 19:18:28', 'U', 'id_credenciado==2;/id_regiao==1;/id_pessoa==2;/cadastro==2014-08-04 15:52:15;/observacao==;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta;/id_veterinario==', 'id_veterinario==2', 1, 2),
(69, 'tb_credenciado', '2015-05-30 19:19:22', 'U', 'id_credenciado==4;/id_regiao==1;/id_pessoa==4;/cadastro==2014-08-06 16:29:45;/observacao==;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta;/id_veterinario==', 'id_veterinario==2', 1, 4),
(70, 'tb_cliente', '2015-05-30 21:01:27', 'U', 'id_cliente==2;/id_raca==13;/nome==cachorro novo;/cor==Branco,Marrom,Cinza;/chip==que bosta;/carterinha==2015050102;/porte==GD;/especie==Cachorro;/sexo==F;/nascimento==07/1800;/peso==99;/altura==1,65;/cadastro==2015-05-25 19:55:35', 'nome==cachorro novo;/cor==Branco,Marrom,Cinza;/especie==Cachorro;/porte==GD;/altura==1,65;/sexo==F;/peso==99;/id_raca==13;/nascimento==01/05/2013;/chip==que bosta', 1, 2),
(71, 'tb_cliente', '2015-05-31 16:24:37', 'I', '', 'nome==Teste de cliente;/cor==Marrom;/especie==Cachorro;/porte==PQ;/altura==;/sexo==M;/peso==;/id_raca==;/nascimento==14/05/2014;/chip==;/cadastro==2015-05-31 16:24:35', 1, 6),
(72, 'tb_cliente', '2015-05-31 16:24:40', 'U', 'id_cliente==6;/id_raca==0;/nome==Teste de cliente;/cor==Marrom;/chip==;/carterinha==;/porte==PQ;/especie==Cachorro;/sexo==M;/nascimento==14/05/20;/peso==0;/altura==;/cadastro==2015-05-31 16:24:35', 'carterinha==2015050106', 1, 6),
(73, 'tb_foto', '2015-05-31 16:24:40', 'I', '', 'id_cliente==6;/caminho==cliente/6/teste-de-cliente-556b5ff82ab6b.jpg', 1, 12),
(74, 'tb_foto', '2015-05-31 16:24:40', 'I', '', 'id_cliente==6;/caminho==cliente/6/teste-de-cliente-556b5ff8908ad.jpg', 1, 13),
(75, 'tb_cliente', '2015-05-31 17:11:13', 'I', '', 'nome==AMIGO BRONZE;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==3;/nascimento==06/05/2015;/chip==;/cadastro==2015-05-31 17:11:11', 1, 7),
(76, 'tb_cliente', '2015-05-31 17:11:13', 'U', 'id_cliente==7;/id_raca==3;/nome==AMIGO BRONZE;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==06/05/20;/peso==0;/altura==;/cadastro==2015-05-31 17:11:11', 'carterinha==2015050107', 1, 7),
(77, 'tb_foto', '2015-05-31 17:11:13', 'I', '', 'id_cliente==7;/caminho==cliente/7/', 1, 14),
(78, 'tb_cliente', '2015-05-31 17:23:46', 'I', '', 'nome==wert;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==1;/nascimento==05/05/2015;/chip==;/cadastro==2015-05-31 17:23:45', 1, 8),
(79, 'tb_cliente', '2015-05-31 17:23:49', 'U', 'id_cliente==8;/id_raca==1;/nome==wert;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==05/05/20;/peso==0;/altura==;/cadastro==2015-05-31 17:23:45', 'carterinha==2015050108', 1, 8),
(80, 'tb_cliente', '2015-05-31 17:24:36', 'I', '', 'nome==wert;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==1;/nascimento==05/05/2015;/chip==;/cadastro==2015-05-31 17:24:35', 1, 9),
(81, 'tb_cliente', '2015-05-31 17:24:36', 'U', 'id_cliente==9;/id_raca==1;/nome==wert;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==05/05/20;/peso==0;/altura==;/cadastro==2015-05-31 17:24:35', 'carterinha==2015050109', 1, 9),
(82, 'tb_foto', '2015-05-31 17:24:36', 'I', '', 'id_cliente==9;/caminho==cliente/9/', 1, 15),
(83, 'tb_cliente', '2015-05-31 17:25:29', 'I', '', 'nome==htrh;/cor==Marrom;/especie==Gato;/porte==;/altura==;/sexo==M;/peso==;/id_raca==6;/nascimento==08/05/2015;/chip==;/cadastro==2015-05-31 17:25:28', 1, 10),
(84, 'tb_cliente', '2015-05-31 17:25:29', 'U', 'id_cliente==10;/id_raca==6;/nome==htrh;/cor==Marrom;/chip==;/carterinha==;/porte==;/especie==Gato;/sexo==M;/nascimento==08/05/20;/peso==0;/altura==;/cadastro==2015-05-31 17:25:28', 'carterinha==2015050110', 1, 10),
(85, 'tb_cliente', '2015-05-31 17:28:54', 'D', 'id_cliente==8;/id_raca==1;/nome==wert;/cor==;/chip==;/carterinha==2015050108;/porte==;/especie==Cachorro;/sexo==M;/nascimento==05/05/20;/peso==0;/altura==;/cadastro==2015-05-31 17:23:45', '', 1, 8),
(86, 'tb_cliente', '2015-05-31 17:29:02', 'D', 'id_cliente==9;/id_raca==1;/nome==wert;/cor==;/chip==;/carterinha==2015050109;/porte==;/especie==Cachorro;/sexo==M;/nascimento==05/05/20;/peso==0;/altura==;/cadastro==2015-05-31 17:24:35', '', 1, 9),
(87, 'tb_cliente', '2015-06-08 19:30:56', 'I', '', 'nome==Teste de cliente;/cor==Marrom,Cinza;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==9;/nascimento==09/06/2015;/chip==trhthtyh;/cadastro==2015-06-08 19:30:55', 1, 11),
(88, 'tb_cliente', '2015-06-08 19:30:57', 'U', 'id_cliente==11;/id_raca==9;/id_pessoa==;/nome==Teste de cliente;/cor==Marrom,Cinza;/chip==trhthtyh;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==09/06/20;/peso==0;/altura==;/cadastro==2015-06-08 19:30:55', 'carterinha==2015060111', 1, 11),
(89, 'tb_pessoa', '2015-06-08 19:51:22', 'I', '', 'nome_razao==TESTE vet 2;/cpf_cnpj==;/tipo_pessoa==F;/cliente==', 1, 15),
(90, 'tb_veterinario', '2015-06-08 19:51:22', 'I', '', 'observacao==;/id_pessoa==15;/id_regiao==2;/crmv==;/cadastro==2015-06-08 19:51:22', 1, 3),
(91, 'tb_dados', '2015-06-08 19:51:22', 'I', '', 'tel1==(56) 6556-5656;/tel2==;/tel3==;/email==;/site==;/tel0800==;/id_pessoa==15', 1, 15),
(92, 'tb_endereco', '2015-06-08 19:51:22', 'I', '', 'endereco==;/complemento==;/cep==;/bairro==;/cidade==;/id_pessoa==15;/estado==DF', 1, 15),
(93, 'tb_credenciado', '2015-06-08 19:51:44', 'U', 'id_credenciado==4;/id_regiao==1;/id_pessoa==4;/cadastro==2014-08-06 16:29:45;/observacao==;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta;/id_veterinario==2', 'id_veterinario==3', 1, 4),
(94, 'tb_credenciado', '2015-06-09 12:42:51', 'U', 'id_credenciado==2;/id_regiao==1;/id_pessoa==2;/cadastro==2014-08-04 15:52:15;/observacao==;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta;/id_veterinario==2', 'observacao==;/id_pessoa==2;/id_regiao==1;/horario_abertura==08:00;/horario_fechamento==18:00;/funcionamento_de==Segunda;/funcionamento_ate==Sexta', 1, 2),
(95, 'tb_pessoa', '2015-06-09 12:42:52', 'U', 'id_pessoa==2;/nome_razao==CaoKia;/cpf_cnpj==16.895.665/0001-40;/tipo_pessoa==J;/cliente==', 'nome_razao==CaoKia;/cpf_cnpj==16.895.665/0001-40;/tipo_pessoa==J;/cliente==', 1, 2),
(96, 'tb_dados', '2015-06-09 12:42:52', 'U', 'id_dados==2;/id_pessoa==2;/tel1==(82) 3021-0004;/tel2==;/tel3==;/email==imperio_animal@hotmail.com;/site==;/tel0800==', 'tel1==(82) 3021-0004;/tel2==;/tel3==;/email==imperio_animal@hotmail.com;/site==;/tel0800==;/id_pessoa==2', 1, 2),
(97, 'tb_endereco', '2015-06-09 12:42:52', 'U', 'id_endereco==2;/id_pessoa==2;/endereco==Av. prof. Sandoval arroxelas ;/complemento==Nº 142;/cep==57.035-230;/bairro==Ponta Verde;/cidade==Maceió;/estado==1', 'endereco==Av. prof. Sandoval arroxelas ;/complemento==Nº 142;/cep==57.035-230;/bairro==Ponta Verde;/cidade==Maceió;/id_pessoa==2;/estado==1', 1, 2),
(98, 'tb_pessoa', '2015-06-09 12:51:04', 'I', '', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/id_veterinario==3', 1, NULL),
(99, 'tb_credenciado', '2015-06-09 12:51:05', 'I', '', 'observacao==;/id_pessoa==;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/cadastro==2015-06-09 12:51:04', 1, NULL),
(100, 'tb_pessoa', '2015-06-09 12:53:58', 'I', '', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/id_veterinario==2', 1, NULL),
(101, 'tb_credenciado', '2015-06-09 12:53:58', 'I', '', 'observacao==;/id_pessoa==;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/cadastro==2015-06-09 12:53:58', 1, NULL),
(102, 'tb_pessoa', '2015-06-09 12:54:47', 'I', '', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/id_veterinario==3', 1, NULL),
(103, 'tb_credenciado', '2015-06-09 12:54:47', 'I', '', 'observacao==;/id_pessoa==;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==Quarta;/funcionamento_ate==Sábado;/cadastro==2015-06-09 12:54:47', 1, NULL),
(104, 'tb_pessoa', '2015-06-09 12:57:06', 'I', '', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/id_veterinario==2', 1, NULL),
(105, 'tb_credenciado', '2015-06-09 12:57:06', 'I', '', 'observacao==;/id_pessoa==;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/cadastro==2015-06-09 12:57:06', 1, NULL),
(106, 'tb_pessoa', '2015-06-09 12:57:51', 'I', '', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/id_veterinario==2', 1, NULL),
(107, 'tb_credenciado', '2015-06-09 12:57:51', 'I', '', 'observacao==;/id_pessoa==;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/cadastro==2015-06-09 12:57:51', 1, NULL),
(108, 'tb_pessoa', '2015-06-09 12:58:12', 'I', '', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/id_veterinario==2', 1, NULL),
(109, 'tb_credenciado', '2015-06-09 12:58:12', 'I', '', 'observacao==;/id_pessoa==;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/cadastro==2015-06-09 12:58:12', 1, NULL),
(110, 'tb_pessoa', '2015-06-09 12:58:53', 'I', '', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/id_veterinario==2', 1, NULL),
(111, 'tb_pessoa', '2015-06-09 12:59:41', 'I', '', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==', 1, 16),
(112, 'tb_credenciado', '2015-06-09 12:59:41', 'I', '', 'observacao==;/id_pessoa==16;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/id_veterinario==2;/cadastro==2015-06-09 12:59:41', 1, 6),
(113, 'tb_dados', '2015-06-09 12:59:41', 'I', '', 'tel1==(65) 4654-6546;/tel2==;/tel3==;/email==;/site==;/tel0800==;/id_pessoa==16', 1, 16),
(114, 'tb_endereco', '2015-06-09 12:59:41', 'I', '', 'endereco==;/complemento==;/cep==;/bairro==;/cidade==;/id_pessoa==16;/estado==1', 1, 16),
(115, 'tb_credenciado', '2015-06-09 13:00:07', 'U', 'id_credenciado==6;/id_regiao==1;/id_pessoa==16;/cadastro==2015-06-09 12:59:41;/observacao==;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/id_veterinario==2', 'observacao==;/id_pessoa==16;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/id_veterinario==3', 1, 6),
(116, 'tb_pessoa', '2015-06-09 13:00:07', 'U', 'id_pessoa==16;/nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==', 'nome_razao==novo credenciado;/cpf_cnpj==;/tipo_pessoa==J;/cliente==', 1, 16),
(117, 'tb_dados', '2015-06-09 13:00:07', 'U', 'id_dados==16;/id_pessoa==16;/tel1==(65) 4654-6546;/tel2==;/tel3==;/email==;/site==;/tel0800==', 'tel1==(65) 4654-6546;/tel2==;/tel3==;/email==;/site==;/tel0800==;/id_pessoa==16', 1, 16),
(118, 'tb_endereco', '2015-06-09 13:00:08', 'U', 'id_endereco==16;/id_pessoa==16;/endereco==;/complemento==;/cep==;/bairro==;/cidade==;/estado==1', 'endereco==;/complemento==;/cep==;/bairro==;/cidade==;/id_pessoa==16;/estado==1', 1, 16),
(119, 'tb_cliente', '2015-06-09 13:16:18', 'I', '', 'nome==novo teste;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==5;/nascimento==10/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:16:17', 1, 12),
(120, 'tb_cliente', '2015-06-09 13:16:19', 'U', 'id_cliente==12;/id_raca==5;/id_pessoa==9;/nome==novo teste;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==10/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:16:17', 'carterinha==2015060112', 1, 12),
(121, 'tb_cliente', '2015-06-09 13:16:43', 'U', 'id_cliente==12;/id_raca==5;/id_pessoa==9;/nome==novo teste;/cor==;/chip==;/carterinha==2015060112;/porte==;/especie==Cachorro;/sexo==M;/nascimento==10/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:16:17', 'nome==novo teste;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==0;/id_raca==5;/nascimento==10/06/2015;/chip==;/id_pessoa==7', 1, 12),
(122, 'tb_cliente', '2015-06-09 13:40:07', 'I', '', 'nome==Teste de cliente;/cor==Marrom;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==2;/nascimento==11/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:40:06', 1, 1),
(123, 'tb_cliente', '2015-06-09 13:40:07', 'U', 'id_cliente==1;/id_raca==2;/id_pessoa==9;/nome==Teste de cliente;/cor==Marrom;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==11/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:40:06', 'carterinha==2015060101', 1, 1),
(124, 'tb_cliente', '2015-06-09 13:42:12', 'D', 'id_cliente==1;/id_raca==2;/id_pessoa==9;/nome==Teste de cliente;/cor==Marrom;/chip==;/carterinha==2015060101;/porte==;/especie==Cachorro;/sexo==M;/nascimento==11/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:40:06', '', 1, 1),
(125, 'tb_cliente', '2015-06-09 13:43:04', 'I', '', 'nome==Teste de cliente;/cor==Marrom;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==5;/nascimento==24/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:43:03', 1, 2),
(126, 'tb_cliente', '2015-06-09 13:43:04', 'U', 'id_cliente==2;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==Marrom;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==24/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:43:03', 'carterinha==2015060102', 1, 2),
(127, 'tb_cliente', '2015-06-09 13:45:21', 'I', '', 'nome==Teste de cliente;/cor==Branco;/especie==Cachorro;/porte==;/altura==;/sexo==F;/peso==;/id_raca==5;/nascimento==02/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:45:20', 1, 3),
(128, 'tb_cliente', '2015-06-09 13:45:21', 'U', 'id_cliente==3;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==Branco;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==F;/nascimento==02/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:45:20', 'carterinha==2015060103', 1, 3),
(129, 'tb_cliente', '2015-06-09 13:45:46', 'I', '', 'nome==Teste de cliente;/cor==Branco;/especie==Cachorro;/porte==;/altura==;/sexo==F;/peso==;/id_raca==5;/nascimento==02/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:45:45', 1, 4),
(130, 'tb_cliente', '2015-06-09 13:45:46', 'U', 'id_cliente==4;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==Branco;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==F;/nascimento==02/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:45:45', 'carterinha==2015060104', 1, 4),
(131, 'tb_cliente', '2015-06-09 13:46:06', 'I', '', 'nome==Teste de cliente;/cor==Branco;/especie==Cachorro;/porte==;/altura==;/sexo==F;/peso==;/id_raca==5;/nascimento==02/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:46:05', 1, 5),
(132, 'tb_cliente', '2015-06-09 13:46:06', 'U', 'id_cliente==5;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==Branco;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==F;/nascimento==02/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:46:05', 'carterinha==2015060105', 1, 5),
(133, 'tb_foto', '2015-06-09 13:46:06', 'I', '', 'id_cliente==5;/caminho==cliente/5/teste-de-cliente-5577184eaaaaa.jpg', 1, 1),
(134, 'tb_foto', '2015-06-09 13:46:06', 'I', '', 'id_cliente==5;/caminho==cliente/5/teste-de-cliente-5577184ebfe17.jpg', 1, 2),
(135, 'tb_cliente', '2015-06-09 13:48:05', 'I', '', 'nome==AMIGO BRONZE;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==1;/nascimento==03/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:48:04', 1, 6),
(136, 'tb_cliente', '2015-06-09 13:48:05', 'U', 'id_cliente==6;/id_raca==1;/id_pessoa==9;/nome==AMIGO BRONZE;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==03/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:48:04', 'carterinha==2015060106', 1, 6),
(137, 'tb_foto', '2015-06-09 13:48:05', 'I', '', 'id_cliente==6;/caminho==cliente/6/', 1, 3),
(138, 'tb_cliente', '2015-06-09 13:49:35', 'I', '', 'nome==novo teste ouro;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==3;/nascimento==01/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:49:34', 1, 7),
(139, 'tb_cliente', '2015-06-09 13:49:35', 'U', 'id_cliente==7;/id_raca==3;/id_pessoa==9;/nome==novo teste ouro;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==01/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:49:34', 'carterinha==2015060107', 1, 7),
(140, 'tb_foto', '2015-06-09 13:49:35', 'I', '', 'id_cliente==7;/caminho==cliente/7/', 1, 4),
(141, 'tb_cliente', '2015-06-09 13:50:05', 'I', '', 'nome==novo teste ouro;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==3;/nascimento==01/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:50:04', 1, 8),
(142, 'tb_cliente', '2015-06-09 13:50:06', 'U', 'id_cliente==8;/id_raca==3;/id_pessoa==9;/nome==novo teste ouro;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==01/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:50:04', 'carterinha==2015060108', 1, 8),
(143, 'tb_cliente', '2015-06-09 13:55:19', 'I', '', 'nome==Teste de cliente;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==5;/nascimento==10/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:55:18', 1, 9),
(144, 'tb_cliente', '2015-06-09 13:55:20', 'U', 'id_cliente==9;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==10/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:55:18', 'carterinha==2015060109', 1, 9),
(145, 'tb_cliente', '2015-06-09 13:55:47', 'I', '', 'nome==Teste de cliente;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==5;/nascimento==10/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:55:46', 1, 10),
(146, 'tb_cliente', '2015-06-09 13:55:47', 'U', 'id_cliente==10;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==10/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:55:46', 'carterinha==2015060110', 1, 10),
(147, 'tb_cliente', '2015-06-09 13:56:17', 'I', '', 'nome==Teste de cliente;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==5;/nascimento==10/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:56:16', 1, 11),
(148, 'tb_cliente', '2015-06-09 13:56:17', 'U', 'id_cliente==11;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==10/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:56:16', 'carterinha==2015060111', 1, 11),
(149, 'tb_cliente', '2015-06-09 13:56:48', 'I', '', 'nome==Teste de cliente;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==5;/nascimento==10/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:56:47', 1, 12),
(150, 'tb_cliente', '2015-06-09 13:56:48', 'U', 'id_cliente==12;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==10/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:56:47', 'carterinha==2015060112', 1, 12),
(151, 'tb_cliente', '2015-06-09 13:57:12', 'I', '', 'nome==Teste de cliente;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==5;/nascimento==10/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:57:11', 1, 13),
(152, 'tb_cliente', '2015-06-09 13:57:12', 'U', 'id_cliente==13;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==10/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:57:11', 'carterinha==2015060113', 1, 13),
(153, 'tb_cliente', '2015-06-09 13:57:38', 'I', '', 'nome==Teste de cliente;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==5;/nascimento==10/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:57:37', 1, 14),
(154, 'tb_cliente', '2015-06-09 13:57:39', 'U', 'id_cliente==14;/id_raca==5;/id_pessoa==9;/nome==Teste de cliente;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==10/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:57:37', 'carterinha==2015060114', 1, 14),
(155, 'tb_cliente', '2015-06-09 13:59:34', 'I', '', 'nome==Teste de cliente;/especie==Cachorro;/porte==;/altura==;/sexo==F;/peso==;/id_raca==2;/nascimento==04/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 13:59:33', 1, 1),
(156, 'tb_cliente', '2015-06-09 13:59:34', 'U', 'id_cliente==1;/id_raca==2;/id_pessoa==9;/nome==Teste de cliente;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==F;/nascimento==04/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 13:59:33', 'carterinha==2015060101', 1, 1),
(157, 'tb_cliente', '2015-06-09 14:00:19', 'I', '', 'nome==AMIGO BRONZE;/cor==Marrom;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==2;/nascimento==03/06/2015;/chip==;/id_pessoa==7;/cadastro==2015-06-09 14:00:18', 1, 2),
(158, 'tb_cliente', '2015-06-09 14:00:19', 'U', 'id_cliente==2;/id_raca==2;/id_pessoa==7;/nome==AMIGO BRONZE;/cor==Marrom;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==03/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 14:00:18', 'carterinha==2015060102', 1, 2),
(159, 'tb_foto', '2015-06-09 14:00:19', 'I', '', 'id_cliente==2;/caminho==cliente/2/amigo-bronze-55771ba36a826.jpg', 1, 1),
(160, 'tb_foto', '2015-06-09 14:00:19', 'I', '', 'id_cliente==2;/caminho==cliente/2/amigo-bronze-55771ba36dcef.jpg', 1, 2),
(161, 'tb_foto', '2015-06-09 14:00:19', 'I', '', 'id_cliente==2;/caminho==cliente/2/amigo-bronze-55771ba371200.jpg', 1, 3),
(162, 'tb_cliente', '2015-06-09 14:08:58', 'I', '', 'nome==Teste de cliente;/cor==Marrom;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==1;/nascimento==01/06/2015;/chip==;/id_pessoa==14;/cadastro==2015-06-09 14:08:57', 1, 1),
(163, 'tb_cliente', '2015-06-09 14:08:58', 'U', 'id_cliente==1;/id_pessoa==14;/id_raca==1;/nome==Teste de cliente;/cor==Marrom;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==01/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 14:08:57', 'carterinha==2015060101', 1, 1),
(164, 'tb_cliente', '2015-06-09 14:13:28', 'I', '', 'nome==AMIGO BRONZE;/especie==Cachorro;/porte==;/altura==;/sexo==F;/peso==;/id_raca==1;/nascimento==02/06/2015;/chip==;/id_pessoa==9;/cadastro==2015-06-09 14:13:27', 1, 2),
(165, 'tb_cliente', '2015-06-09 14:13:28', 'U', 'id_cliente==2;/id_pessoa==9;/id_raca==1;/nome==AMIGO BRONZE;/cor==;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==F;/nascimento==02/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 14:13:27', 'carterinha==2015060102', 1, 2),
(166, 'tb_foto', '2015-06-09 14:13:28', 'I', '', 'id_cliente==2;/caminho==cliente/2/amigo-bronze-55771eb87014a.jpg', 1, 1),
(167, 'tb_foto', '2015-06-09 14:13:28', 'I', '', 'id_cliente==2;/caminho==cliente/2/amigo-bronze-55771eb873935.jpg', 1, 2),
(168, 'tb_cliente', '2015-06-09 14:14:09', 'I', '', 'nome==Teste de cliente;/cor==Preto;/especie==Cachorro;/porte==;/altura==;/sexo==M;/peso==;/id_raca==2;/nascimento==04/06/2015;/chip==;/id_pessoa==14;/cadastro==2015-06-09 14:14:08', 1, 3),
(169, 'tb_cliente', '2015-06-09 14:14:10', 'U', 'id_cliente==3;/id_pessoa==14;/id_raca==2;/nome==Teste de cliente;/cor==Preto;/chip==;/carterinha==;/porte==;/especie==Cachorro;/sexo==M;/nascimento==04/06/2015;/peso==0;/altura==;/cadastro==2015-06-09 14:14:08', 'carterinha==2015060103', 1, 3),
(170, 'tb_pessoa', '2015-06-09 20:32:35', 'I', '', 'nome_razao==novo credenciado 2;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/fantasia==Fantasia 22', 1, 17),
(171, 'tb_credenciado', '2015-06-09 20:32:35', 'I', '', 'observacao==;/id_pessoa==17;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/id_veterinario==;/cadastro==2015-06-09 20:32:35', 1, 7),
(172, 'tb_dados', '2015-06-09 20:32:35', 'I', '', 'tel1==(45) 6465-4646;/tel2==;/tel3==;/email==;/site==;/tel0800==;/id_pessoa==17', 1, 17),
(173, 'tb_endereco', '2015-06-09 20:32:35', 'I', '', 'endereco==;/complemento==;/cep==;/bairro==;/cidade==;/id_pessoa==17;/estado==1', 1, 17),
(174, 'tb_credenciado', '2015-06-09 20:41:58', 'U', 'id_credenciado==7;/id_regiao==1;/id_pessoa==17;/cadastro==2015-06-09 20:32:35;/observacao==;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/id_veterinario==0', 'observacao==;/id_pessoa==17;/id_regiao==1;/horario_abertura==;/horario_fechamento==;/funcionamento_de==;/funcionamento_ate==;/id_veterinario==2', 1, 7),
(175, 'tb_pessoa', '2015-06-09 20:41:58', 'U', 'id_pessoa==17;/nome_razao==novo credenciado 2;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/fantasia==Fantasia 22', 'nome_razao==novo credenciado 2;/cpf_cnpj==;/tipo_pessoa==J;/cliente==;/fantasia==Fantasia 22', 1, 17),
(176, 'tb_dados', '2015-06-09 20:41:58', 'U', 'id_dados==17;/id_pessoa==17;/tel1==(45) 6465-4646;/tel2==;/tel3==;/email==;/site==;/tel0800==', 'tel1==(45) 6465-4646;/tel2==;/tel3==;/email==;/site==;/tel0800==;/id_pessoa==17', 1, 17),
(177, 'tb_endereco', '2015-06-09 20:41:58', 'U', 'id_endereco==17;/id_pessoa==17;/endereco==;/complemento==;/cep==;/bairro==;/cidade==;/estado==1', 'endereco==;/complemento==;/cep==;/bairro==;/cidade==;/id_pessoa==17;/estado==1', 1, 17);

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
  `id_pessoa` int(10) unsigned DEFAULT NULL,
  `id_raca` int(10) unsigned NOT NULL,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carterinha` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `porte` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `especie` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nascimento` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peso` int(10) unsigned DEFAULT NULL,
  `altura` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `tb_animal_FKIndex1` (`id_raca`),
  KEY `tb_cliente_FKIndex2` (`id_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`id_cliente`, `id_pessoa`, `id_raca`, `nome`, `cor`, `chip`, `carterinha`, `porte`, `especie`, `sexo`, `nascimento`, `peso`, `altura`, `cadastro`) VALUES
(1, 14, 1, 'Teste de cliente', 'Marrom', '', '2015060101', '', 'Cachorro', 'M', '01/06/2015', 0, '', '2015-06-09 14:08:57'),
(2, 9, 1, 'AMIGO BRONZE', NULL, '', '2015060102', '', 'Cachorro', 'F', '02/06/2015', 0, '', '2015-06-09 14:13:27'),
(3, 14, 2, 'Teste de cliente', 'Preto', '', '2015060103', '', 'Cachorro', 'M', '04/06/2015', 0, '', '2015-06-09 14:14:08');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `tb_credenciado`
--

INSERT INTO `tb_credenciado` (`id_credenciado`, `id_regiao`, `id_pessoa`, `cadastro`, `observacao`, `horario_abertura`, `horario_fechamento`, `funcionamento_de`, `funcionamento_ate`, `id_veterinario`) VALUES
(1, 1, 1, '2014-07-25 16:39:05', '', '08:00', '18:00', 'Segunda', 'Sexta', 2),
(2, 1, 2, '2014-08-04 15:52:15', '', '08:00', '18:00', 'Segunda', 'Sexta', 2),
(4, 1, 4, '2014-08-06 16:29:45', '', '08:00', '18:00', 'Segunda', 'Sexta', 3),
(5, 2, 12, '2015-05-25 19:40:20', '', '08:00', '18:00', 'Segunda', 'Sábado', NULL),
(6, 1, 16, '2015-06-09 12:59:41', '', '', '', '', '', 3),
(7, 1, 17, '2015-06-09 20:32:35', '', '', '', '', '', 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

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
(10, 10, '(82) 9982-4660', '', '', 'rosadosanjos58@gmail.com', 'amigosdopet.net', ''),
(12, 12, '(54) 3543-4543', '', '', 'email@email.com', '', ''),
(13, 13, '(64) 6465-4964', '', '', '', '', ''),
(14, 14, '(54) 6546-5464', '', '', '', '', ''),
(15, 15, '(56) 6556-5656', '', '', '', '', ''),
(16, 16, '(65) 4654-6546', '', '', '', '', ''),
(17, 17, '(45) 6465-4646', '', '', '', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

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
(10, 10, 'RUA JOAO DANTAS BARRETO', '421', '57.052-484', 'GRUTA DE LOURDES', 'MACEIÓ', 'AL'),
(12, 12, 'endereço', 'complemento', '32.105-616', 'samambaia', 'brasilia', '2'),
(13, 13, 'endereço', 'complemento', '65.465-464', 'samambaia', 'brasilia', 'DF'),
(14, 14, 'endereço', 'complemento', '54.645-654', 'samambaia', 'brasilia', 'AL'),
(15, 15, '', '', '', '', '', 'DF'),
(16, 16, '', '', '', '', '', '1'),
(17, 17, '', '', '', '', '', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_foto`
--

CREATE TABLE IF NOT EXISTS `tb_foto` (
  `id_foto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` int(10) unsigned NOT NULL,
  `caminho` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_foto`),
  KEY `tb_foto_FKIndex1` (`id_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tb_foto`
--

INSERT INTO `tb_foto` (`id_foto`, `id_cliente`, `caminho`) VALUES
(1, 2, 'cliente/2/amigo-bronze-55771eb87014a.jpg'),
(2, 2, 'cliente/2/amigo-bronze-55771eb873935.jpg');

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
  `fantasia` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `tb_pessoa`
--

INSERT INTO `tb_pessoa` (`id_pessoa`, `nome_razao`, `cpf_cnpj`, `tipo_pessoa`, `cliente`, `fantasia`) VALUES
(1, 'Focinhos e Patinhas', '', 'J', '', ''),
(2, 'CaoKia', '16.895.665/0001-40', 'J', '', ''),
(4, 'cliniKao', '', 'J', '', ''),
(7, 'LUCIANA RENATA DA SILVA ROCHA', '040.581.874-25', 'F', 'C', ''),
(8, 'ALINE MARIA CAVALCANTE DA SILVA', '077.035.914-08', 'F', 'C', ''),
(9, 'SONIA MARIA ACIOLI DE BARROS', '228.680.464-87', 'F', 'C', ''),
(10, 'ROSA MARIA LIRA DOS ANJOS', '287.292.184-20', 'F', 'C', ''),
(12, 'TESTE', '012.777.721-00', 'F', '', ''),
(13, 'TESTE vet', '123.456.789-09', 'F', '', ''),
(14, 'TESTE Res', '123.456.789-09', 'F', 'C', ''),
(15, 'TESTE vet 2', '', 'F', '', ''),
(16, 'novo credenciado', '', 'J', '', ''),
(17, 'novo credenciado 2', '', 'J', '', 'Fantasia 22');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=201 ;

--
-- Extraindo dados da tabela `tb_procedimento`
--

INSERT INTO `tb_procedimento` (`id_procedimento`, `id_categoria`, `nome`, `carencia`, `periodicidade`, `codigo`) VALUES
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
(199, 25, 'LEUCEMIA E IMUNODEFICIENCIA FELINA', '45', '365', 'P.50.27.1'),
(200, 14, 'teste novo', '55', '10', 'f.10.10');

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
(4, 92, 500),
(5, 5, 10),
(5, 16, 0.51);

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

--
-- Extraindo dados da tabela `tb_procedimento_plano`
--

INSERT INTO `tb_procedimento_plano` (`id_plano`, `id_procedimento`, `quantidade`) VALUES
(1, 4, 8),
(1, 10, 1),
(1, 12, 5),
(1, 18, 10),
(1, 5, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_raca`
--

CREATE TABLE IF NOT EXISTS `tb_raca` (
  `id_raca` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `raca` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_raca`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `tb_raca`
--

INSERT INTO `tb_raca` (`id_raca`, `raca`) VALUES
(1, 'Bulldog'),
(2, 'Bull Terrier'),
(3, 'Chihuahua'),
(4, 'Boxer'),
(5, 'Dogue Alemão'),
(6, 'Dobermann'),
(7, 'Fila Brasileiro'),
(8, 'Labrador'),
(9, 'Perdigueiro'),
(10, 'Poodle'),
(11, 'Pequinês'),
(12, 'Pastor Alemão'),
(13, 'São Bernardo'),
(14, 'Shih Tzu'),
(15, 'Yorkshire Terrier');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tb_veterinario`
--

INSERT INTO `tb_veterinario` (`id_veterinario`, `id_regiao`, `id_pessoa`, `cadastro`, `observacao`, `crmv`) VALUES
(2, 2, 13, '2015-05-25 19:47:19', '', ''),
(3, 2, 15, '2015-06-08 19:51:22', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
