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
-- Table structure for table `com_itens`
--

DROP TABLE IF EXISTS `com_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_itens` (
  `Grupo` int(11) NOT NULL COMMENT 'Grupo: 1-Lanches, 2-Extras (no máximo 24 ocorrencias), 3-Bebidas, 4-Diversos\n',
  `Codigo` int(11) NOT NULL COMMENT 'Código do produto - sequencial dentro dos grupos',
  `Descricao` varchar(80) DEFAULT NULL COMMENT 'Descrição do produto',
  `DescrCompleta` varchar(1024) DEFAULT NULL COMMENT 'Descrição completa',
  `Tamanho` varchar(12) DEFAULT NULL COMMENT 'Tamanho, se houver',
  `Unidade` varchar(5) DEFAULT 'UN' COMMENT 'Unidade de medida',
  `Preco` decimal(15,2) DEFAULT NULL COMMENT 'Preço unitário',
  `NCM` varchar(8) DEFAULT NULL,
  `CFOP` int(11) DEFAULT NULL,
  `CSOSN` int(11) DEFAULT NULL,
  `CST` int(11) DEFAULT NULL,
  `CST_IPI` int(11) DEFAULT NULL,
  `CST_PIS` int(11) DEFAULT NULL,
  `CST_COFINS` int(11) DEFAULT NULL,
  `PcReduz` decimal(8,5) DEFAULT '0.00000' COMMENT '% de redução na base de cálculo do ICMS',
  `AliqICMS` decimal(5,2) DEFAULT NULL,
  `Imagem` varchar(120) DEFAULT NULL COMMENT 'Arquivo contendo a imagem (BMP ou JPEG)',
  `CodBarras` varchar(25) DEFAULT NULL,
  `MinMax` tinyint(1) DEFAULT NULL COMMENT 'Permite acrescentar ou diminuir (+ ou -) no pedido, somente para EXTRAS (tp=3)\n(Boolean)',
  `Maximo` int(11) DEFAULT '1' COMMENT 'Máximo permitido (1) (Somente para EXTRAS)',
  `Minimo` int(11) DEFAULT '0' COMMENT 'Mínimo permitido (0) Somente para EXTRAS\n',
  PRIMARY KEY (`Grupo`,`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_itens`
--

LOCK TABLES `com_itens` WRITE;
/*!40000 ALTER TABLE `com_itens` DISABLE KEYS */;
INSERT INTO `com_itens` VALUES (1,1,'Strogonoff de carne','Pão, uma salsicha, molho de tomate e mostarda','Unico',NULL,25.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Lache_Bebida.bmp',NULL,NULL,NULL,NULL),(1,2,'Frango ao molho      4 queijos','','Unico',NULL,19.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Hotdog1.bmp',NULL,NULL,NULL,NULL),(1,3,'Carne ao molho       barbecue','Pão, salsicha, strogonoff, queijo, mostrada e maionese','Unico',NULL,21.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,'',NULL,NULL,NULL,NULL),(1,4,'Frango com chedar','',NULL,NULL,20.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL,NULL,NULL,NULL,NULL),(1,5,'Carne ao molho       madeira','',NULL,NULL,17.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL,NULL,NULL,NULL,NULL),(1,6,'Strogonoff de frango','',NULL,NULL,19.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL,NULL,NULL,NULL,NULL),(1,7,'Italiano                      (Salame e queijo)','',NULL,NULL,16.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,'',NULL,NULL,NULL,NULL),(1,8,'Cachorro simples','',NULL,NULL,14.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\CachorroQuente01.bmp',NULL,NULL,NULL,NULL),(1,9,'Cachorro duplo','',NULL,NULL,16.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,'',NULL,NULL,NULL,NULL),(1,10,'Calabresa','',NULL,NULL,18.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL,NULL,NULL,NULL,NULL),(1,11,'Calabresa duplo','',NULL,NULL,20.00,'21069090',5101,102,90,99,99,99,0.00000,0.00,NULL,NULL,NULL,NULL,NULL),(2,2,'Mostarda Amarela','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,'Katchup','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,4,'Molho de tomate','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,5,'Queijo','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,6,'Molho de queijo','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,7,'Ervilha','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,8,'Milho','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,9,'Batata palha','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,10,'Queijo ralado - parmesão 30g','',NULL,NULL,1.50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,11,'Queijo Cheddar','',NULL,NULL,1.50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,12,'Salsicha','',NULL,NULL,2.50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,13,'Linguiça calabresa','',NULL,NULL,2.50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,14,'14-14-14-14','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,15,'quinze','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,16,'Dezesseis','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,19,'19-19-19','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,20,'vinte','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,22,'vinte e dois','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(2,23,'Vinte e tres','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,'Coca-cola KS','',NULL,NULL,5.00,'22021000',5102,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Coca-cola KS.bmp',NULL,NULL,NULL,NULL),(3,2,'Coca-cola lata 350 ml','',NULL,NULL,6.00,'22021000',5102,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Coca-cola Lata.bmp',NULL,NULL,NULL,NULL),(3,3,'Coca-cola 600 ml','',NULL,NULL,7.00,'22021000',5102,102,90,99,99,99,0.00000,0.00,'C:\\Projetos\\Imagens\\Coca-cola 600.bmp',NULL,NULL,NULL,NULL),(4,1,'Chocolates','',NULL,'UN',8.00,'22021000',5102,102,90,99,99,99,0.00000,0.00,NULL,NULL,NULL,1,0);
/*!40000 ALTER TABLE `com_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_lctcaixa`
--

DROP TABLE IF EXISTS `com_lctcaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_lctcaixa` (
  `Turno` int(11) NOT NULL COMMENT 'Sequencia correspondente ao registro de caixa',
  `Sequencia` int(11) NOT NULL,
  `Operacao` int(11) DEFAULT NULL COMMENT '0-Informação de saldo inicial  1-Recebimento(+)  2-Suprimento(+)  3-Pagamento(-)  4-Sangira(-) ',
  `Valor` decimal(15,2) DEFAULT NULL,
  `MeioPgt` int(11) DEFAULT NULL COMMENT '1-R$  2-C.Créd  3-C.Déb  4-Pix\\n5-Outros',
  `Saldo` decimal(15,2) DEFAULT NULL COMMENT 'Saldo corrente\n',
  `Historico` varchar(120) DEFAULT NULL COMMENT 'Histórico do lançamento / comentário',
  `PgtReais` decimal(15,2) DEFAULT NULL,
  `PgtCDeb` decimal(15,2) DEFAULT NULL,
  `PgtCCred` decimal(15,2) DEFAULT NULL,
  `PgtPIX` decimal(15,2) DEFAULT NULL,
  `PgtOutros` decimal(15,2) DEFAULT NULL,
  `NroPedido` int(11) DEFAULT NULL,
  `DtHrLcto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Turno`,`Sequencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_lctcaixa`
--

LOCK TABLES `com_lctcaixa` WRITE;
/*!40000 ALTER TABLE `com_lctcaixa` DISABLE KEYS */;
INSERT INTO `com_lctcaixa` VALUES (1,0,0,0.00,0,0.00,'Saldo inicial',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,0,0.00,0,0.00,'Saldo inicial',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,0,0,0.00,0,0.00,'Saldo inicial',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,0,0,123.45,0,123.45,'Saldo inicial',NULL,NULL,NULL,NULL,NULL,NULL,'24/11/2022 08:24:33'),(4,1,1,51.50,0,432.45,'Pedido: 1',51.50,0.00,0.00,0.00,0.00,1,'24/11/2022 08:26:15'),(4,2,1,26.00,0,330.95,'Pedido: 2',26.00,0.00,0.00,0.00,0.00,2,'24/11/2022 08:26:40'),(4,3,1,55.00,3,472.95,'Pedido: 3',0.00,0.00,0.00,55.00,0.00,3,'24/11/2022 13:42:56'),(4,4,1,17.00,0,375.95,'Pedido: 4',17.00,0.00,0.00,0.00,0.00,4,'24/11/2022 13:43:11'),(5,0,0,0.00,0,0.00,'Saldo inicial',NULL,NULL,NULL,NULL,NULL,NULL,'25/11/2022 09:03:53'),(5,1,1,19.00,0,38.00,'Pedido: 5',19.00,0.00,0.00,0.00,0.00,5,'25/11/2022 09:34:13');
/*!40000 ALTER TABLE `com_lctcaixa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`speedfood`@`%`*/ /*!50003 TRIGGER `speedfood`.`com_lctcaixa_BEFORE_INSERT` BEFORE INSERT ON `com_lctcaixa` FOR EACH ROW
BEGIN
 SET NEW.DtHrLcto = Now();  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `com_pedido`
--

DROP TABLE IF EXISTS `com_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_pedido` (
  `Numero` int(11) unsigned NOT NULL,
  `Data` datetime DEFAULT NULL,
  `CPF_CNPJ` varchar(14) DEFAULT NULL,
  `Lanctos` int(11) DEFAULT NULL,
  `Valor` decimal(15,2) DEFAULT NULL,
  `NrNFCe` int(11) DEFAULT NULL,
  `SrNFCe` int(11) DEFAULT NULL,
  `MeioPagto` int(11) DEFAULT NULL,
  `VlrReais` decimal(15,2) DEFAULT NULL,
  `VlrCDeb` decimal(15,2) DEFAULT NULL,
  `VlrCCred` decimal(15,2) DEFAULT NULL,
  `VlrPIX` decimal(15,2) DEFAULT NULL,
  `VlrOutros` decimal(15,2) DEFAULT NULL,
  `ArqXML` longtext,
  `EtqImpressas` tinyint(4) DEFAULT NULL COMMENT 'Etiquetas impressas ?  Yes/No',
  `NomeCliente` varchar(45) DEFAULT NULL,
  `VlrRecebido` decimal(15,2) DEFAULT NULL,
  `VlrTroco` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  KEY `DataX` (`Data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_pedido`
--

LOCK TABLES `com_pedido` WRITE;
/*!40000 ALTER TABLE `com_pedido` DISABLE KEYS */;
INSERT INTO `com_pedido` VALUES (1,'2022-11-24 08:26:03',NULL,3,51.50,NULL,NULL,0,51.50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2022-11-24 08:26:39',NULL,2,26.00,NULL,NULL,0,26.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'2022-11-24 13:42:50',NULL,3,55.00,NULL,NULL,3,NULL,NULL,NULL,55.00,NULL,NULL,NULL,NULL,NULL,NULL),(4,'2022-11-24 13:43:10',NULL,1,17.00,NULL,NULL,0,17.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'2022-11-25 09:34:11',NULL,1,19.00,NULL,NULL,0,19.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `com_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_pedidoitem`
--

DROP TABLE IF EXISTS `com_pedidoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_pedidoitem` (
  `Numero` int(11) NOT NULL COMMENT 'Numero do pedido',
  `NrLcto` int(11) NOT NULL COMMENT 'Nro do lançamento no pedido',
  `TpProd` int(11) DEFAULT NULL COMMENT 'Tipo de produto (1,2,3 ou 4)',
  `CodProd` int(11) DEFAULT NULL COMMENT 'Código do produto',
  `Quant` int(11) DEFAULT NULL,
  `VlrUnitario` decimal(15,2) DEFAULT NULL,
  `Cod01` int(11) DEFAULT NULL COMMENT 'Codigo de EXTRA a ser cobrado, no máximo 3 por pedido',
  `Vlr01` decimal(15,2) DEFAULT NULL COMMENT 'Valor extra a ser cobrado (max. 3 valores)',
  `Cod02` int(11) DEFAULT NULL,
  `Vlr02` decimal(15,2) DEFAULT NULL,
  `Cod03` int(11) DEFAULT NULL,
  `Vlr03` decimal(15,2) DEFAULT NULL,
  `VlrTotal` decimal(15,2) DEFAULT NULL,
  `Extras` char(24) DEFAULT NULL COMMENT 'Indicador de extras.  Tam FIXO 24. 0-Não considerado, 1-Adicionar, 2-Excluir\n',
  `TxtExtras` varchar(1024) DEFAULT NULL,
  `TxtExclus` varchar(1024) DEFAULT NULL,
  `Observacao` varchar(1024) DEFAULT NULL,
  `EtqImpressa` tinyint(4) DEFAULT NULL COMMENT 'Etiqueta impressa Yes/No',
  PRIMARY KEY (`Numero`,`NrLcto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_pedidoitem`
--

LOCK TABLES `com_pedidoitem` WRITE;
/*!40000 ALTER TABLE `com_pedidoitem` DISABLE KEYS */;
INSERT INTO `com_pedidoitem` VALUES (1,1,1,5,NULL,17.00,0,0.00,0,0.00,0,0.00,17.00,'000000000000000000000000','','','',NULL),(1,2,1,10,NULL,18.00,13,2.50,0,0.00,0,0.00,20.50,'000000000000100000000000','Linguiça calabresa(1X2,50)','','',NULL),(1,3,3,3,NULL,7.00,0,0.00,0,0.00,0,0.00,14.00,'000000000000000000000000','','','',NULL),(2,1,1,6,NULL,19.00,0,0.00,0,0.00,0,0.00,19.00,'000000000000000000000000','','','',NULL),(2,2,3,3,NULL,7.00,0,0.00,0,0.00,0,0.00,7.00,'000000000000000000000000','','','',NULL),(3,1,1,7,NULL,16.00,0,0.00,0,0.00,0,0.00,16.00,'000000000000000000000000','','','',NULL),(3,2,1,10,NULL,18.00,10,3.00,0,0.00,0,0.00,21.00,'000001000200000000000000','Molho de queijo(1); Queijo ralado - parmesão 30g(2X1,50)','','',NULL),(3,3,3,2,NULL,6.00,0,0.00,0,0.00,0,0.00,18.00,'000000000000000000000000','','','',NULL),(4,1,1,5,NULL,17.00,0,0.00,0,0.00,0,0.00,17.00,'000000000000000000000000','','','',NULL),(5,1,1,2,NULL,19.00,0,0.00,0,0.00,0,0.00,19.00,'000000000000000000000000','','','',NULL);
/*!40000 ALTER TABLE `com_pedidoitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_regcaixa`
--

DROP TABLE IF EXISTS `com_regcaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_regcaixa` (
  `Turno` int(11) NOT NULL,
  `DtHrInicio` datetime DEFAULT NULL,
  `DtHrFim` datetime DEFAULT NULL,
  `SaldoInicial` decimal(15,2) DEFAULT NULL,
  `E_Dinheiro` decimal(15,2) DEFAULT NULL,
  `E_CartaoDebito` decimal(15,2) DEFAULT NULL,
  `E_CartaoCredito` decimal(15,2) DEFAULT NULL,
  `E_PIX` decimal(15,2) DEFAULT NULL,
  `E_Outros` decimal(15,2) DEFAULT NULL,
  `E_Suprimento` decimal(15,2) DEFAULT NULL,
  `S_Saidas` decimal(15,2) DEFAULT NULL,
  `S_Sangria` decimal(15,2) DEFAULT NULL,
  `SaldoFinal` decimal(15,2) DEFAULT NULL,
  `Qtd_Dinheiro` int(11) DEFAULT NULL,
  `Qtd_CartaoDebito` int(11) DEFAULT NULL,
  `Qtd_CartaoCredito` int(11) DEFAULT NULL,
  `Qtd_PIX` int(11) DEFAULT NULL,
  `Qtd_Outros` int(11) DEFAULT NULL,
  `Qtd_Suprimento` int(11) DEFAULT NULL,
  `Qtd_Saidas` int(11) DEFAULT NULL,
  `Qtd_Sangria` int(11) DEFAULT NULL,
  `Qtd_Misto` int(11) DEFAULT NULL,
  PRIMARY KEY (`Turno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Registro de totalização do caixa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_regcaixa`
--

LOCK TABLES `com_regcaixa` WRITE;
/*!40000 ALTER TABLE `com_regcaixa` DISABLE KEYS */;
INSERT INTO `com_regcaixa` VALUES (1,'2022-11-23 12:00:00','2022-11-23 14:00:00',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,0,0),(2,'2022-11-23 20:31:33','2022-11-23 20:40:00',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,0,0),(3,'2022-11-23 20:41:07','2022-11-23 20:45:06',0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'2022-11-24 08:22:41','2022-11-25 08:22:40',123.45,94.50,0.00,0.00,55.00,0.00,0.00,0.00,0.00,272.95,3,0,0,1,0,0,0,0,0),(5,'2022-11-25 09:03:49','2022-11-26 09:03:48',0.00,19.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,19.00,1,0,0,0,0,0,0,0,0);
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

-- Dump completed on 2022-11-28 16:50:27
