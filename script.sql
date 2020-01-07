-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: myshop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (8,'Qu&#7847;n áo Th&#7875; Thao'),(9,'Qu&#7847;n áo công s&#7903;'),(10,'Qu&#7847;n Kaki'),(11,'Qu&#7847;n Kaki');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custommers`
--

DROP TABLE IF EXISTS `custommers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `custommers` (
  `customer_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `customer_email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `customer_fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_adress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_username`),
  UNIQUE KEY `customer_email` (`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custommers`
--

LOCK TABLES `custommers` WRITE;
/*!40000 ALTER TABLE `custommers` DISABLE KEYS */;
INSERT INTO `custommers` VALUES ('Hoang','12345','hoang@gmail.com','Phan Huu Hoang','Quy Nhon','09127373712');
/*!40000 ALTER TABLE `custommers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdetails` (
  `orderdetail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `orderdetail_price` decimal(10,0) NOT NULL,
  `orderdetail_quantity` int(11) NOT NULL,
  PRIMARY KEY (`orderdetail_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_amount` decimal(10,0) NOT NULL,
  `order_status` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_number` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_username` (`customer_username`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `custommers` (`customer_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `product_detail` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name` (`product_name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (14,8,'Áo AC Milan 2019  2020','Áo AC Milan 2019','Ao-ac-milan-san-nha-1-1-600x600.jpg',150000,'<p><strong>&Aacute;o AC Milan 2019 &ndash; 2020</strong>&nbsp;m&ugrave;a gi&#7843;i m&#7899;i n&#259;m sau &#273;&atilde; &#273;&#432;&#7907;c h&atilde;ng th&#7875; thao Puma gi&#7899;i thi&#7879;u v&#7899;i ng&#432;&#7901;i h&acirc;m m&#7897; Rossoneri v&agrave;o cu&#7889;i m&ugrave;a gi&#7843;i v&#7915;a qua. V&#7899;i thi&#7871;t k&#7871; &#273;&#417;n gi&#7843;n nh&#432;ng mang &#273;&#7853;m n&eacute;t th&#7875; thao h&#417;n.</p>\r\n\r\n<p><img alt=\"Áo ac milan sân nhà\" src=\"https://www.sporter.vn/wp-content/uploads/2017/06/Ao-ac-milan-san-nha-0.jpg\" style=\"height:620px; width:900px\" /></p>\r\n\r\n<h2>Chi ti&#7871;t &aacute;o AC Milan 2019 &ndash; 2020 s&#7885;c &#273;&#7887; &#273;en s&acirc;n nh&agrave;:</h2>\r\n\r\n<p>N&#259;m nay thi&#7871;t k&#7871; c&#7911;a &aacute;o b&oacute;ng &#273;&aacute; s&acirc;n nh&agrave; AC Milan &#273;&atilde; &#273;&#432;&#7907;c &#273;&#417;n gi&#7843;n v&agrave; n&#259;ng &#273;&#7897;ng, th&#7875; thao h&#417;n v&#7899;i m&ugrave;a gi&#7843;i 2018 &ndash; 2019 tr&#432;&#7899;c &#273;&oacute;. C&aacute;c &#273;&#432;&#7901;ng s&#7885;c &#273;&#7887; v&agrave; &#273;en &#273;&#432;&#7907;c thi&#7871;t k&#7871; nh&#7887; h&#417;n, mang &#273;&#7853;m n&eacute;t truy&#7873;n th&#7889;ng l&acirc;u &#273;&#7901;i tr&ecirc;n c&aacute;c &aacute;o &#273;&#7845;u s&acirc;n nh&agrave; t&#7915; tr&#432;&#7899;c &#273;&#7871;n nay c&#7911;a n&#7919;a &#273;&#7887; th&agrave;nh Milan.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Áo ac milan sân nhà\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/Ao-ac-milan-san-nha-1-400x400.jpg\" style=\"height:400px; width:400px\" /><img alt=\"Áo milan sân nhà\" src=\"https://www.sporter.vn/wp-content/uploads/2017/06/Ao-ac-milan-san-nha-1-1-400x400.jpg\" style=\"height:400px; width:400px\" /></p>\r\n\r\n<p>B&ecirc;n d&#432;&#7899;i c&#7893; &aacute;o &#273;&#7845;u &#273;&#432;&#7907;c in m&#7897;t bi&#7875;u t&#432;&#7907;ng Con qu&#7929; &#273;&#7887; nh&#7887; b&ecirc;n d&#432;&#7899;i, t&#7841;o n&ecirc;n &#273;i&#7875;m nh&#7845;n cho m&#7851;u &aacute;o n&#7857;m nay.</p>\r\n\r\n<p><img alt=\"Áo ac milan sân nhà\" src=\"https://www.sporter.vn/wp-content/uploads/2017/06/Ao-ac-milan-san-nha-3-400x400.jpg\" style=\"height:400px; width:400px\" /><img alt=\"Áo ac milan sân nhà\" src=\"https://www.sporter.vn/wp-content/uploads/2017/06/Ao-ac-milan-san-nha-4-400x400.jpg\" style=\"height:400px; width:400px\" /></p>\r\n\r\n<h2>H&igrave;nh &#7843;nh &aacute;o &#273;&#7845;u AC Milan s&acirc;n nh&agrave; m&ugrave;a gi&#7843;i 2019 &ndash; 2020:</h2>\r\n\r\n<p><img alt=\"Áo ac milan sân nhà\" src=\"https://www.sporter.vn/wp-content/uploads/2017/06/Ao-ac-milan-san-nha-5-800x800.jpg\" style=\"height:800px; width:800px\" /></p>\r\n\r\n<h2>Video gi&#7899;i thi&#7879;u &aacute;o b&oacute;ng &#273;&aacute; AC Milan s&acirc;n nh&agrave; m&ugrave;a gi&#7843;i 2019 &ndash; 2020:</h2>\r\n\r\n<p><iframe frameborder=\"0\" height=\"574\" src=\"https://www.youtube.com/embed/85KHlyG3Y_0?feature=oembed\" width=\"1020\"></iframe></p>\r\n\r\n<h2>&Aacute;o b&oacute;ng &#273;&aacute; AC Milan s&acirc;n nh&agrave; 2019 &ndash; 2020 h&agrave;ng Th&aacute;i Lan F1:</h2>\r\n\r\n<p><strong>Gi&aacute; th&#7883; tr&#432;&#7901;ng: 220.000&#273;/1 &aacute;o &ndash; 290.000&#273;/ 1 b&#7897;.</strong><br />\r\n<strong>Gi&aacute; t&#7841;i Sporter.vn: 195.000&#273;/ 1 &aacute;o &ndash; 260.000&#273;/ 1 b&#7897;.<br />\r\n&#272;&#7863;t t&#7915; 10 b&#7897; tr&#7903; l&ecirc;n ch&#7881; c&ograve;n 250.000&#273;/ 1 b&#7897;</strong></p>\r\n\r\n<p><strong>Phi&ecirc;n b&#7843;n bodyfit s&#7869; c&oacute; gi&aacute; cao h&#417;n &#273;&ocirc;i ch&uacute;t so v&#7899;i phi&ecirc;n b&#7843;n th&ocirc;ng th&#432;&#7901;ng.</strong></p>\r\n\r\n<p>&ndash; &#272;&acirc;y l&agrave; m&#7851;u &aacute;o &#273;&#7845;u &#273;&#7865;p nh&#7845;t v&agrave; g&#7847;n gi&#7889;ng nh&#7845;t so v&#7899;i &aacute;o ch&iacute;nh h&atilde;ng, gi&#7889;ng t&#7899;i 99%, th&#432;&#7901;ng &#273;&#432;&#7901;ng g&#7885;i l&agrave; &aacute;o F1. &#272;&acirc;y l&agrave; m&#7851;u &aacute;o &#273;&#432;&#7907;c may b&#7857;ng v&#7843;i Th&aacute;i Lan ch&#7845;t l&#432;&#7907;ng cao c&#7845;p gi&#7889;ng h&#7879;t v&#7843;i ch&iacute;nh h&atilde;ng.<br />\r\n&ndash; &#431;u &#273;i&#7875;m: &#272;&#7865;p gi&#7889;ng h&#7879;t h&agrave;ng ch&iacute;nh h&atilde;ng, n&#7871;u kh&ocirc;ng r&agrave;nh s&#7869; r&#7845;t kh&oacute; ph&acirc;n bi&#7879;t &#273;&acirc;u l&agrave; &aacute;o ch&iacute;nh h&atilde;ng, &#273;&acirc;u l&agrave;&nbsp;<strong><a href=\"https://www.sporter.vn/ao-bong-da-thai-lan/\">&aacute;o b&oacute;ng &#273;&aacute; Th&aacute;i Lan</a></strong>&nbsp;F1. Ch&#7845;t l&#432;&#7907;ng cao, m&#7863;c m&aacute;t m&#7867; v&agrave; d&#7877; ch&#7883;u, tho&#7843;i m&aacute;i khi m&#7863;c. R&#7867; h&#417;n r&#7845;t nhi&#7873;u so v&#7899;i h&agrave;ng ch&iacute;nh h&atilde;ng.<br />\r\n&ndash; Nh&#432;&#7907;c &#273;i&#7875;m: Gi&aacute; cao h&#417;n c&aacute;c m&#7851;u kh&aacute;c kh&aacute; nhi&#7873;u.</p>\r\n\r\n<h2>&Aacute;o b&oacute;ng &#273;&aacute; AC Milan s&acirc;n nh&agrave; 2019 &ndash; 2020 h&agrave;ng Vi&#7879;t Nam:</h2>\r\n\r\n<p><strong>Gi&aacute; th&#7883; tr&#432;&#7901;ng: 100.000&#273;/1 b&#7897;.</strong><br />\r\n<strong>Gi&aacute; t&#7841;i Sporter.vn: 90.000&#273; 1 b&#7897;.<br />\r\n&#272;&#7863;t t&#7915; 10 b&#7897; tr&#7903; l&ecirc;n ch&#7881; c&ograve;n 85.000&#273;/ 1 b&#7897;</strong></p>\r\n\r\n<p>&ndash; &#272;&acirc;y l&agrave; m&#7851;u qu&#7847;n &aacute;o c&acirc;u l&#7841;c b&#7897; &#273;ang &#273;&#432;&#7907;c b&aacute;n nhi&#7873;u nh&#7845;t tr&ecirc;n th&#7883; tr&#432;&#7901;ng, th&#432;&#7901;ng &#273;&#432;&#7907;c may b&#7857;ng v&#7843;i thun l&#7841;nh. &#272;&acirc;y l&agrave; h&agrave;ng ph&#7893; th&ocirc;ng nh&#7845;t hi&#7879;n nay.<br />\r\n&ndash; &#431;u &#273;i&#7875;m: Gi&aacute; r&#7867;, m&#7863;c c&#361;ng kh&aacute; b&#7873;n.<br />\r\n&ndash; Nh&#432;&#7907;c &#273;i&#7875;m: M&#7863;c n&oacute;ng v&agrave; th&#7845;m h&uacute;t m&#7891; h&ocirc;i kh&ocirc;ng t&#7889;t l&#7855;m. Ch&#7881; gi&#7889;ng kho&#7843;ng 90% so v&#7899;i h&agrave;ng ch&iacute;nh h&atilde;ng.</p>\r\n\r\n<p><strong>&ldquo;C&aacute;c s&#7843;n ph&#7849;m Vi&#7879;t Nam s&#7869; kh&ocirc;ng c&oacute; logo t&#7915; nh&agrave; s&#7843;n xu&#7845;t v&agrave; &#273;&#432;&#7907;c may &#273;&#417;n gi&#7843;n h&#417;n nh&#432;ng v&#7851;n gi&#7889;ng 95% &aacute;o ch&iacute;nh h&atilde;ng&rdquo;</strong></p>\r\n'),(15,8,'Áo AC Milan sân khách 2019  2020','Áo AC Milan','Ao-ac-san-khach-1-1.jpg',160000,'<p><img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2017/06/Ao-ac-san-khach-0.jpg\" style=\"height:593px; width:1000px\" /></p>\r\n\r\n<h2>Chi ti&#7871;t &aacute;o AC Milan s&acirc;n kh&aacute;ch 2019 &ndash; 2020</h2>\r\n\r\n<p><img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/Ao-ac-milan-san-khach-1-400x400.jpg\" style=\"height:400px; width:400px\" />&nbsp;<img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2017/06/Ao-ac-san-khach-1-1-400x400.jpg\" style=\"height:400px; width:400px\" /></p>\r\n\r\n<h2>H&igrave;nh &#7843;nh &aacute;o &#273;&#7845;u AC Milan s&acirc;n kh&aacute;ch 2019 &ndash; 2020</h2>\r\n\r\n<p><img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2019/07/Ao-ac-milan-san-khach-5.jpg\" style=\"height:1160px; width:800px\" /><img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2019/07/Ao-ac-milan-san-khach-6.jpg\" style=\"height:1160px; width:800px\" /><img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2019/07/Ao-ac-milan-san-khach-7.jpg\" style=\"height:1160px; width:800px\" /><img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2019/07/Ao-ac-milan-san-khach-3.jpg\" style=\"height:1160px; width:800px\" /><img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2019/07/Ao-ac-milan-san-khach-8.jpg\" style=\"height:1160px; width:800px\" /><img alt=\"Áo ac milan sân khách\" src=\"https://www.sporter.vn/wp-content/uploads/2019/07/Ao-ac-milan-san-khach-4.jpg\" style=\"height:1160px; width:800px\" /></p>\r\n\r\n<h2>Video gi&#7899;i thi&#7879;u &aacute;o b&oacute;ng &#273;&aacute; AC Milan s&acirc;n kh&aacute;ch m&ugrave;a gi&#7843;i 2019 &ndash; 2020</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>B&#7841;n c&oacute; th&#7875; &#273;&#7863;t c&aacute;c m&#7851;u qu&#7847;n &aacute;o b&oacute;ng &#273;&aacute; t&#7841;i&nbsp;<strong><a href=\"https://www.sporter.vn/\">Sporter.vn</a></strong>&nbsp;v&#7899;i gi&aacute; lu&ocirc;n m&#7873;m nh&#7845;t, ch&uacute;ng t&ocirc;i chuy&ecirc;n cung c&#7845;p c&aacute;c m&#7851;u qu&#7847;n &aacute;o thi &#273;&#7845;u b&oacute;ng &#273;&aacute; CLB &nbsp;m&ugrave;a 2019 &ndash; 2020 m&#7899;i nh&#7845;t v&#7899;i c&aacute;c lo&#7841;i sau:</p>\r\n\r\n<h2>&Aacute;o AC Milan s&acirc;n kh&aacute;ch 2019 &ndash; 2020 h&agrave;ng Th&aacute;i Lan F1:</h2>\r\n\r\n<p><strong>Gi&aacute; th&#7883; tr&#432;&#7901;ng: 220.000&#273;/1 &aacute;o &ndash; 290.000&#273;/ 1 b&#7897;.</strong><br />\r\n<strong>Gi&aacute; t&#7841;i Sporter.vn: 195.000&#273;/ 1 &aacute;o &ndash; 260.000&#273;/ 1 b&#7897;.<br />\r\n&#272;&#7863;t t&#7915; 10 b&#7897; tr&#7903; l&ecirc;n ch&#7881; c&ograve;n 250.000&#273;/ 1 b&#7897;</strong></p>\r\n\r\n<p><strong>Phi&ecirc;n b&#7843;n bodyfit s&#7869; c&oacute; gi&aacute; cao h&#417;n &#273;&ocirc;i ch&uacute;t so v&#7899;i phi&ecirc;n b&#7843;n th&ocirc;ng th&#432;&#7901;ng.</strong></p>\r\n\r\n<p>&ndash; &#272;&acirc;y l&agrave; m&#7851;u &aacute;o &#273;&#7845;u &#273;&#7865;p nh&#7845;t v&agrave; g&#7847;n gi&#7889;ng nh&#7845;t so v&#7899;i &aacute;o ch&iacute;nh h&atilde;ng, gi&#7889;ng t&#7899;i 99%, th&#432;&#7901;ng &#273;&#432;&#7901;ng g&#7885;i l&agrave; &aacute;o F1 . &#272;&acirc;y l&agrave; m&#7851;u &aacute;o &#273;&#432;&#7907;c may b&#7857;ng v&#7843;i Th&aacute;i Lan ch&#7845;t l&#432;&#7907;ng cao c&#7845;p gi&#7889;ng h&#7879;t v&#7843;i ch&iacute;nh h&atilde;ng.<br />\r\n&ndash; &#431;u &#273;i&#7875;m: &#272;&#7865;p gi&#7889;ng h&#7879;t h&agrave;ng ch&iacute;nh h&atilde;ng, n&#7871;u kh&ocirc;ng r&agrave;nh s&#7869; r&#7845;t kh&oacute; ph&acirc;n bi&#7879;t &#273;&acirc;u l&agrave; &aacute;o ch&iacute;nh h&atilde;ng, &#273;&acirc;u l&agrave;&nbsp;<strong><a href=\"https://www.sporter.vn/ao-bong-da-thai-lan/\">&aacute;o b&oacute;ng &#273;&aacute; Th&aacute;i Lan</a></strong>&nbsp;F1. Ch&#7845;t l&#432;&#7907;ng cao, m&#7863;c m&aacute;t m&#7867; v&agrave; d&#7877; ch&#7883;u, tho&#7843;i m&aacute;i khi m&#7863;c. R&#7867; h&#417;n r&#7845;t nhi&#7873;u so v&#7899;i h&agrave;ng ch&iacute;nh h&atilde;ng.<br />\r\n&ndash; Nh&#432;&#7907;c &#273;i&#7875;m: Gi&aacute; cao h&#417;n c&aacute;c m&#7851;u kh&aacute;c kh&aacute; nhi&#7873;u.</p>\r\n\r\n<h2>&Aacute;o AC Milan s&acirc;n kh&aacute;ch 2019 &ndash; 2020 h&agrave;ng Vi&#7879;t Nam:</h2>\r\n\r\n<p><strong>Gi&aacute; th&#7883; tr&#432;&#7901;ng: 100.000&#273;/1 b&#7897;.</strong><br />\r\n<strong>Gi&aacute; t&#7841;i Sporter.vn: 90.000&#273; 1 b&#7897;.<br />\r\n&#272;&#7863;t t&#7915; 10 b&#7897; tr&#7903; l&ecirc;n ch&#7881; c&ograve;n 85.000&#273;/ 1 b&#7897;</strong></p>\r\n\r\n<p>&ndash; &#272;&acirc;y l&agrave; m&#7851;u qu&#7847;n &aacute;o c&acirc;u l&#7841;c b&#7897; &#273;ang &#273;&#432;&#7907;c b&aacute;n nhi&#7873;u nh&#7845;t tr&ecirc;n th&#7883; tr&#432;&#7901;ng, th&#432;&#7901;ng &#273;&#432;&#7907;c may b&#7857;ng v&#7843;i thun l&#7841;nh. &#272;&acirc;y l&agrave; h&agrave;ng ph&#7893; th&ocirc;ng nh&#7845;t hi&#7879;n nay.<br />\r\n&ndash; &#431;u &#273;i&#7875;m: Gi&aacute; r&#7867;, m&#7863;c c&#361;ng kh&aacute; b&#7873;n.<br />\r\n&ndash; Nh&#432;&#7907;c &#273;i&#7875;m: M&#7863;c n&oacute;ng v&agrave; th&#7845;m h&uacute;t m&#7891; h&ocirc;i kh&ocirc;ng t&#7889;t l&#7855;m. Ch&#7881; gi&#7889;ng kho&#7843;ng 90% so v&#7899;i h&agrave;ng ch&iacute;nh h&atilde;ng.</p>\r\n\r\n<p><strong>&ldquo;C&aacute;c s&#7843;n ph&#7849;m Vi&#7879;t Nam s&#7869; kh&ocirc;ng c&oacute; logo t&#7915; nh&agrave; s&#7843;n xu&#7845;t v&agrave; &#273;&#432;&#7907;c may &#273;&#417;n gi&#7843;n h&#417;n nh&#432;ng v&#7851;n gi&#7889;ng 95% &aacute;o ch&iacute;nh h&atilde;ng&rdquo;</strong></p>\r\n'),(16,9,'360s Streacker Training Tank h&#7891;ng','360s Streacker Training','Ao-tanktop-Streacker-hong-600x600.jpg',200000,'<p>Chi&#7871;c &aacute;o tank top th&#7875; thao&nbsp;<strong>360s Streacker Training</strong>&nbsp;m&agrave;u h&#7891;ng d&ugrave;ng &#273;&#7875; m&#7863;c ngo&agrave;i khi t&#7853;p luy&#7879;n, &#273;&acirc;y l&agrave; m&#7897;t s&#7843;n ph&#7849;m &#273;&#432;&#7907;c r&#7845;t nhi&#7873;u ch&#7883; em ch&#7885;n l&#7921;a b&#7903;i n&oacute; c&oacute; th&#7875; gi&uacute;p ch&#7883; em th&ecirc;m ph&#7847;n t&#7921; tin m&#7895;i khi &#273;&#7871;n ph&ograve;ng t&#7853;p. N&oacute; th&#432;&#7901;ng &#273;&#432;&#7907;c m&#7863;c b&ecirc;n ngo&agrave;i m&#7897;t chi&#7871;c&nbsp;<a href=\"https://www.sporter.vn/ao-bras/\"><strong>&aacute;o bra</strong></a>&nbsp;th&#7875; thao.</p>\r\n\r\n<p><img alt=\"áo tank top gym yoga n&#7919; 360s streacker màu h&#7891;ng\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/Ao-tanktop-Streacker-hong-1.jpg\" style=\"height:1125px; width:750px\" />&nbsp;<img alt=\"áo tank top gym yoga n&#7919; 360s streacker màu h&#7891;ng\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/Ao-tanktop-Streacker-hong-2.jpg\" style=\"height:1125px; width:750px\" />&nbsp;<img alt=\"áo tank top gym yoga n&#7919; 360s streacker màu h&#7891;ng\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/Ao-tanktop-Streacker-hong-3.jpg\" style=\"height:1125px; width:750px\" /></p>\r\n\r\n<p>&#272;&acirc;y l&agrave; s&#7843;n ph&#7849;m c&oacute; form r&#7897;ng, v&#7915;a d&#7877; v&#7853;n &#273;&#7897;ng v&#7915;a tho&aacute;ng m&aacute;t. C&aacute;c ch&#7883; em c&#7847;n tr&aacute;nh ch&#7885;n nh&#7919;ng chi&#7871;c &aacute;o qu&aacute; ch&#7853;t, &ocirc;m s&aacute;t s&#7869; g&acirc;y s&#7921; c&#7843;m tr&#7903; khi ho&#7841;t &#273;&#7897;ng c&#361;ng nh&#432; l&#7897; c&aacute;c nh&#432;&#7907;c &#273;i&#7875;m c&#417; th&#7875; ho&#7863;c ch&#7895; nh&#7841;y c&#7843;m l&uacute;c h&#259;ng say ch&#417;i th&#7875; thao.</p>\r\n\r\n<p><img alt=\"áo tank top gym yoga n&#7919; 360s streacker màu h&#7891;ng\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-hong-5.jpg\" style=\"height:825px; width:750px\" />&nbsp;<img alt=\"áo tank top gym yoga n&#7919; 360s streacker màu h&#7891;ng\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-hong-6.jpg\" style=\"height:825px; width:750px\" /></p>\r\n\r\n<p>Chi&#7871;c &aacute;o &#273;&#432;&#7907;c s&#7843;n xu&#7845;t t&#7915; ch&#7845;t li&#7879;u cotton r&#7845;t m&aacute;t m&#7867; k&#7871;t h&#7907;p v&#7899;i s&#7907;i d&atilde;n spandex &#273;&#7875; t&#7841;o n&ecirc;n m&#7897;t chi&#7871;c &aacute;o m&#7863;c ngo&agrave;i ho&agrave;n h&#7843;o.</p>\r\n\r\n<p><img alt=\"áo tank top gym yoga n&#7919; 360s streacker màu h&#7891;ng\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-hong-7.jpg\" style=\"height:500px; width:750px\" /></p>\r\n\r\n<p>S&#7843;n ph&#7849;m c&oacute; 3 m&agrave;u &#273;en, t&iacute;m v&agrave; h&#7891;ng v&#7899;i thi&#7871;t k&#7871;&nbsp;n&#259;ng &#273;&#7897;ng, th&#7875; thao, h&#432;&#7899;ng &#273;&#7871;n phong c&aacute;ch tr&#7867; trung, ph&ugrave; h&#7907;p v&#7899;i xu h&#432;&#7899;ng th&#7901;i trang hi&#7879;n nay.</p>\r\n'),(17,8,'360s Streacker Training Tank &#273;en','360s Streacker Training Black','streacker-den-1-600x600.jpg',150000,'<p>Chi&#7871;c &aacute;o tank top th&#7875; thao 360s Streacker Training m&agrave;u &#273;en d&ugrave;ng &#273;&#7875; m&#7863;c ngo&agrave;i khi t&#7853;p luy&#7879;n, &#273;&acirc;y l&agrave; m&#7897;t s&#7843;n ph&#7849;m &#273;&#432;&#7907;c r&#7845;t nhi&#7873;u ch&#7883; em ch&#7885;n l&#7921;a b&#7903;i n&oacute; c&oacute; th&#7875; gi&uacute;p ch&#7883; em th&ecirc;m ph&#7847;n t&#7921; tin m&#7895;i khi &#273;&#7871;n ph&ograve;ng t&#7853;p. N&oacute; th&#432;&#7901;ng &#273;&#432;&#7907;c m&#7863;c b&ecirc;n ngo&agrave;i m&#7897;t chi&#7871;c&nbsp;<a href=\"https://www.sporter.vn/ao-bras/\"><strong>&aacute;o bra</strong></a>&nbsp;th&#7875; thao.</p>\r\n\r\n<p><img alt=\"áo tank top th&#7875; thao 360s streacker màu &#273;en\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-den-2.jpg\" style=\"height:1125px; width:750px\" />&nbsp;<img alt=\"áo tank top th&#7875; thao 360s streacker màu &#273;en\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-den-3.jpg\" style=\"height:1125px; width:750px\" />&nbsp;<img alt=\"áo tank top th&#7875; thao 360s streacker màu &#273;en\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-den-4.jpg\" style=\"height:1125px; width:750px\" /></p>\r\n\r\n<p>&#272;&acirc;y l&agrave; s&#7843;n ph&#7849;m c&oacute; form r&#7897;ng, v&#7915;a d&#7877; v&#7853;n &#273;&#7897;ng v&#7915;a tho&aacute;ng m&aacute;t. C&aacute;c ch&#7883; em c&#7847;n tr&aacute;nh ch&#7885;n nh&#7919;ng chi&#7871;c &aacute;o qu&aacute; ch&#7853;t, &ocirc;m s&aacute;t s&#7869; g&acirc;y s&#7921; c&#7843;m tr&#7903; khi ho&#7841;t &#273;&#7897;ng c&#361;ng nh&#432; l&#7897; c&aacute;c nh&#432;&#7907;c &#273;i&#7875;m c&#417; th&#7875; ho&#7863;c ch&#7895; nh&#7841;y c&#7843;m l&uacute;c h&#259;ng say ch&#417;i th&#7875; thao.</p>\r\n\r\n<p><img alt=\"áo tank top th&#7875; thao 360s streacker màu &#273;en\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-den-5.jpg\" style=\"height:1125px; width:750px\" />&nbsp;<img alt=\"áo tank top th&#7875; thao 360s streacker màu &#273;en\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-den-6.jpg\" style=\"height:825px; width:750px\" />&nbsp;<img alt=\"áo tank top th&#7875; thao 360s streacker màu &#273;en\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-den-8.jpg\" style=\"height:500px; width:750px\" />&nbsp;<img alt=\"áo tank top th&#7875; thao 360s streacker màu &#273;en\" src=\"https://www.sporter.vn/wp-content/uploads/2018/07/streacker-den-9.jpg\" style=\"height:500px; width:750px\" /></p>\r\n\r\n<p>S&#7843;n ph&#7849;m c&oacute; 3 m&agrave;u &#273;en, t&iacute;m v&agrave; h&#7891;ng v&#7899;i thi&#7871;t k&#7871;&nbsp;n&#259;ng &#273;&#7897;ng, th&#7875; thao, h&#432;&#7899;ng &#273;&#7871;n phong c&aacute;ch tr&#7867; trung, ph&ugrave; h&#7907;p v&#7899;i xu h&#432;&#7899;ng th&#7901;i trang hi&#7879;n nay.</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<p>&nbsp;</p>\r\n');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_role` int(11) NOT NULL,
  `user_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','damin',1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-09 22:39:04
