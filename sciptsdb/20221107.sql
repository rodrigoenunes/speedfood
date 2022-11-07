CREATE DATABASE  IF NOT EXISTS `speedfood` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `speedfood`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: speedfood
-- ------------------------------------------------------
-- Server version	5.7.29-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `com_grupos`
--

DROP TABLE IF EXISTS `com_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_grupos` (
  `GrupoID` int(11) NOT NULL,
  `GrupoNome` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`GrupoID`),
  UNIQUE KEY `com_grupoproduto_id_UNIQUE` (`GrupoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_grupos`
--

LOCK TABLES `com_grupos` WRITE;
/*!40000 ALTER TABLE `com_grupos` DISABLE KEYS */;
INSERT INTO `com_grupos` VALUES (1,'LANCHES'),(2,'BEBIDAS'),(3,'Extras'),(4,'Exclusões / Excessões');
/*!40000 ALTER TABLE `com_grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_itens`
--

DROP TABLE IF EXISTS `com_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_itens` (
  `Grupo` varchar(1) NOT NULL,
  `Codigo` int(3) NOT NULL,
  `Descricao` varchar(80) DEFAULT NULL,
  `DescrCompleta` mediumtext,
  `Tamanho` varchar(12) DEFAULT NULL,
  `Preco` decimal(9,2) DEFAULT NULL,
  `NCM` varchar(8) DEFAULT NULL,
  `CFOP` int(11) DEFAULT NULL,
  `CSOSN` int(11) DEFAULT NULL,
  `CST` int(11) DEFAULT NULL,
  `CST_IPI` int(11) DEFAULT NULL,
  `CST_PIS` int(11) DEFAULT NULL,
  `CST_COFINS` int(11) DEFAULT NULL,
  `PcReduz` decimal(8,5) DEFAULT '0.00000' COMMENT '% de redução na base de cálculo do ICMS',
  `AliqICMS` decimal(5,2) DEFAULT NULL,
  `Imagem` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`Grupo`,`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_itens`
--

LOCK TABLES `com_itens` WRITE;
/*!40000 ALTER TABLE `com_itens` DISABLE KEYS */;
INSERT INTO `com_itens` VALUES ('1',1,'Strogonoff de carne','Pão, uma salsicha, molho de tomate e mostarda','Unico',25.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Lache_Bebida.bmp'),('1',2,'Frango ao molho 4 queijos','','Unico',19.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\speedfood\\vcl\\Win32\\Debug\\ImgFundo.bmp'),('1',3,'Carne ao molho barbecue','Pão, salsicha, strogonoff, queijo, mostrada e maionese','Unico',21.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('1',4,'Frango com chedar','',NULL,20.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('1',5,'Carne ao molho madeira','',NULL,17.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('1',6,'Strogonoff de frango','',NULL,19.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('1',7,'Italiano (Salame e queijo)','',NULL,16.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('1',8,'Cachorro simples','',NULL,14.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('1',9,'Cachorro duplo','',NULL,16.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('1',10,'Calabresa','',NULL,18.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('1',11,'Calabresa duplo','',NULL,20.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL),('2',1,'Maionese','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL),('2',2,'Batata palha','',NULL,2.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL),('2',3,'Queijo ralado - parmesão 30g','',NULL,2.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL),('4',1,'Coca-cola KS','',NULL,5.00,'22021000',5102,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Coca-cola KS.bmp'),('4',2,'Coca-cola lata 350 ml','',NULL,6.00,'22021000',5102,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Coca-cola Lata.bmp'),('4',3,'Coca-cola 600 ml','',NULL,7.00,'22021000',5102,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Coca-cola 600.bmp');
/*!40000 ALTER TABLE `com_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_lctcaixa`
--

DROP TABLE IF EXISTS `com_lctcaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_lctcaixa` (
  `SeqCaixa` int(11) NOT NULL COMMENT 'Sequencia correspondente ao registro de caixa',
  `DtHrLcto` datetime NOT NULL COMMENT 'Data/Hora do lancto (DDMMAA HrMiSeMs)',
  `Operacao` int(11) DEFAULT NULL COMMENT '0-Informação de saldo inicial\n1-Suprimento (+)\n2-Entrada/Recebimento $ (+)\n3-Pagamento (-)\n4-Sangira (-) ',
  `Valor` decimal(15,2) DEFAULT NULL,
  `MeioPgt` int(11) DEFAULT NULL COMMENT '1-R$  2-C.Créd  3-C.Déb  4-Pix\\n5-Outros',
  `NrCartao` varchar(45) DEFAULT NULL COMMENT 'Nro do cartão ou documento se\nforma <> de 1 (R$) - Opcional',
  `Saldo` decimal(15,2) DEFAULT NULL COMMENT 'Saldo corrente\n',
  `Historico` varchar(120) DEFAULT NULL COMMENT 'Histórico do lançamento / comentário',
  PRIMARY KEY (`SeqCaixa`,`DtHrLcto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_lctcaixa`
--

LOCK TABLES `com_lctcaixa` WRITE;
/*!40000 ALTER TABLE `com_lctcaixa` DISABLE KEYS */;
INSERT INTO `com_lctcaixa` VALUES (1,'2022-11-05 18:36:17',1,50.00,1,NULL,50.00,'Saldo inicial');
/*!40000 ALTER TABLE `com_lctcaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_pedido`
--

DROP TABLE IF EXISTS `com_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_pedido` (
  `Numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Data` datetime DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `Valor` decimal(15,2) DEFAULT NULL,
  `NrNFCe` int(11) DEFAULT NULL,
  `SrNFCe` int(11) DEFAULT NULL,
  `FormaPgto` int(11) DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  KEY `DataX` (`Data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_pedido`
--

LOCK TABLES `com_pedido` WRITE;
/*!40000 ALTER TABLE `com_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_pedidoitem`
--

DROP TABLE IF EXISTS `com_pedidoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_pedidoitem` (
  `Numero` int(11) NOT NULL,
  `NrLcto` int(11) NOT NULL,
  `TpProd` varchar(1) DEFAULT NULL,
  `CodProd` int(11) DEFAULT NULL,
  `Observacao` varchar(1024) DEFAULT NULL,
  `Quant` int(11) DEFAULT NULL,
  `VlrUnitario` decimal(15,2) DEFAULT NULL,
  `Extras` char(12) DEFAULT NULL,
  `VlrExtra1` decimal(15,2) DEFAULT NULL,
  `VlrExtra2` decimal(15,2) DEFAULT NULL,
  `VlrExtra3` decimal(15,2) DEFAULT NULL,
  `VlrExtra4` decimal(15,2) DEFAULT NULL,
  `VlrExtra5` decimal(15,2) DEFAULT NULL,
  `VlrExtra6` decimal(15,2) DEFAULT NULL,
  `VlrExtra7` decimal(15,2) DEFAULT NULL,
  `VlrExtra8` decimal(15,2) DEFAULT NULL,
  `VlrExtra9` decimal(15,2) DEFAULT NULL,
  `VlrExtra10` decimal(15,2) DEFAULT NULL,
  `VlrExtra11` decimal(15,2) DEFAULT NULL,
  `VlrExtra12` decimal(15,2) DEFAULT NULL,
  `VlrTotal` decimal(15,2) DEFAULT NULL,
  `Excecoes` char(12) DEFAULT NULL,
  `TxtExtra` varchar(1024) DEFAULT NULL,
  `TxtExcecoes` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Numero`,`NrLcto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_pedidoitem`
--

LOCK TABLES `com_pedidoitem` WRITE;
/*!40000 ALTER TABLE `com_pedidoitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_pedidoitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_regcaixa`
--

DROP TABLE IF EXISTS `com_regcaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_regcaixa` (
  `Sequencia` int(11) NOT NULL,
  `DtHrInicio` datetime DEFAULT NULL,
  `DtHrFim` datetime DEFAULT NULL,
  `SaldoInicial` decimal(15,2) DEFAULT NULL,
  `E_Dinheiro` decimal(15,2) DEFAULT NULL,
  `E_CartaoCredito` decimal(15,2) DEFAULT NULL,
  `E_CartaoDebito` decimal(15,2) DEFAULT NULL,
  `E_PIX` decimal(15,2) DEFAULT NULL,
  `E_Outros` decimal(15,2) DEFAULT NULL,
  `E_Suprimento` decimal(15,2) DEFAULT NULL,
  `S_Saidas` decimal(15,2) DEFAULT NULL,
  `S_Sangria` decimal(15,2) DEFAULT NULL,
  `SaldoFinal` decimal(15,2) DEFAULT NULL,
  `Qtd_Dinheiro` int(11) DEFAULT NULL,
  `Qtd_CartaoCredito` int(11) DEFAULT NULL,
  `Qtd_CartaoDebito` int(11) DEFAULT NULL,
  `Qtd_PIX` int(11) DEFAULT NULL,
  `Qtd_Outros` int(11) DEFAULT NULL,
  `Qtd_Suprimento` int(11) DEFAULT NULL,
  `Qtd_Saidas` int(11) DEFAULT NULL,
  `Qtd_Sangria` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sequencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Registro de totalização do caixa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_regcaixa`
--

LOCK TABLES `com_regcaixa` WRITE;
/*!40000 ALTER TABLE `com_regcaixa` DISABLE KEYS */;
INSERT INTO `com_regcaixa` VALUES (1,'2022-11-05 18:36:08','2022-11-06 12:00:00',100.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,100.00,0,0,0,0,0,0,0,0),(2,'2022-11-06 16:09:23','2022-11-07 16:09:22',50.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,50.00,0,0,0,0,0,0,0,0),(3,'2022-11-07 16:13:53','2022-11-08 16:13:52',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `com_regcaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_pessoa`
--

DROP TABLE IF EXISTS `sis_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sis_pessoa` (
  `id` int(10) unsigned NOT NULL,
  `nome` varchar(120) NOT NULL,
  `fantasia` varchar(120) DEFAULT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `IE` varchar(20) DEFAULT NULL,
  `logradouro` varchar(120) DEFAULT NULL,
  `nro` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `igbecidade` varchar(8) DEFAULT NULL COMMENT 'UFNNNNNN',
  `cep` varchar(8) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `whatsapp` varchar(14) DEFAULT NULL,
  `CSC_Homolog` varchar(45) DEFAULT NULL,
  `CSC_Producao` varchar(45) DEFAULT NULL,
  `NSCertificado` varchar(45) DEFAULT NULL,
  `NrNFCe` int(11) DEFAULT NULL,
  `SerieNFCe` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sis_pessoa_id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_pessoa`
--

LOCK TABLES `sis_pessoa` WRITE;
/*!40000 ALTER TABLE `sis_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'speedfood'
--

--
-- Dumping routines for database 'speedfood'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-07 16:35:02
