-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: mcaep
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement` (
  `id` varchar(45) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `team` varchar(200) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `note` varchar(3000) DEFAULT NULL,
  `experiment` varchar(45) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_achievement_admin1_idx` (`issuer`),
  KEY `fk_achievement_experiment1_idx` (`experiment`),
  CONSTRAINT `fk_achievement_admin1` FOREIGN KEY (`issuer`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_achievement_experiment1` FOREIGN KEY (`experiment`) REFERENCES `experiment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
INSERT INTO `achievement` VALUES ('2b5ef864ed6beca449283f86a40504f3bc12d8','234','432','1','<p>3333</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-02-16 14:22:31'),('e32e2e','王天山发了999个SCI','王天山','1','天山万岁！','1','1','2015-09-06 01:00:00'),('uygyug','成果一','王小山，王小小山，王小小小山，王小小小小山，王小小小小小山','1','<p>写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码写代码</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-06 00:00:00');
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `id` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `classification` varchar(45) DEFAULT NULL,
  `note` varchar(6000) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_announcement_issuer_idx` (`issuer`),
  KEY `fk_announcement_organization_idx` (`organization`),
  CONSTRAINT `fk_announcement_issuer` FOREIGN KEY (`issuer`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_announcement_organization` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES ('1','标题要长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长！','平台公告','<p>标题要长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长~~~~~~~~~~~~~</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08 00:00:00','1'),('16','法律11','法律法规','<p style=\"text-align:center\"><span style=\"color:#A52A2A\">天文台我惹他</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"height:80px; width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center\">35345</td>\r\n			<td style=\"text-align:center\">345345</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">345345</td>\r\n			<td style=\"text-align:center\">345345</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align:center\">345345</td>\r\n			<td style=\"text-align:center\">345345</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:center\">uiyiyuiyui</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"resources/images/files/image/animal_1.jpg\" style=\"height:80px; width:80px\" /></p>\r\n\r\n<p style=\"text-align:center\">士大夫士大夫</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-06 00:00:00','1'),('17','蚂蚁绕着手机转-蚁磨坊ant mill','平台公告','<p style=\"text-align:center\"><!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7 screen-scroll\"> <![endif]--><!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8 screen-scroll\"> <![endif]--><!--[if IE 8]>         <html class=\"no-js lt-ie9 screen-scroll\"> <![endif]--></p>\r\n\r\n<div class=\"container\">\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<div class=\"header\">\r\n<h1 style=\"text-align:center\">蚂蚁绕着手机转，难道是在朝圣么？</h1>\r\n</div>\r\n\r\n<div class=\"article\" id=\"contentMain\">\r\n<div class=\"content\" id=\"articleContent\">\r\n<div>\r\n<p style=\"text-align:center\">这视频有可能是假的，至少得克萨斯奥斯汀的昆虫学教授Alex Wild是这么认为的&hellip;&hellip;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"http://3.im.guokr.com/HI8gZ04YNa3bkfTRw6MtSBFT_tOSlmqvF11wrhDIO9aFAwAAmgIAAFBO.png?imageView2/1/w/480/h/354\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"http://1.im.guokr.com/Lj-TeFa1pWk5sK9DsetFU6PFlTgLP8qkuIbK_2g5jWSvAQAAegIAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align:center\">原视频 <a href=\"https://www.youtube.com/watch?v=GFX7mRl7xDs\">https://www.youtube.com/watch?v=GFX7mRl7xDs</a></p>\r\n\r\n<p style=\"text-align:center\">有一个非常不利的因素是，这个视频的上传者<a href=\"https://www.youtube.com/user/ViralVideoLab\">ViralVideoLab</a> 做过很多别的看起来非常可疑的视频&hellip;&hellip;</p>\r\n\r\n<p style=\"text-align:center\">但假如暂时不考虑造假的可能的话：</p>\r\n\r\n<p style=\"text-align:center\">手机的磁场、声音和振动理论上有可能会影响到蚂蚁；</p>\r\n\r\n<p style=\"text-align:center\">或者，不需要这些，<strong>蚂蚁自己也会转圈。</strong></p>\r\n\r\n<p style=\"text-align:center\">这种现象被称为&ldquo;蚁磨坊&rdquo;（ant mill），会在某些品种蚂蚁上发生。原因和转圈毛毛虫有点类似：蚂蚁行进的途中会留下外激素，给别的蚂蚁指路。如果不幸一小群蚂蚁迷路了，自己走到了自己留下的激素路径上，就有可能开始绕圈。</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"http://3.im.guokr.com/q2byLvS0GjfWhvHP1yF7UNb6XFMa6cYFx3GNbfsYrdW4AQAAMAEAAEdJ.gif\" /></p>\r\n\r\n<p style=\"text-align:center\">图中是 <em>Labidus praedator。</em></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"http://2.im.guokr.com/sKcJMHfp_NOYWsBGArnWdIR5_8oJSfccU56_G3ynT0a4AQAAXQEAAEdJ.gif\" /></p>\r\n\r\n<p style=\"text-align:center\">这是一个计算机模拟图。说实话，一开始那个和这个模拟图很像呀&hellip;&hellip;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08 00:00:00',NULL),('18','法律2','法律法规','<p>&nbsp;&nbsp; &nbsp;properties&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\r\n字段名：&nbsp;&nbsp; &nbsp;id&nbsp;&nbsp; &nbsp;property_name&nbsp;&nbsp; &nbsp;chinese_name&nbsp;&nbsp; &nbsp;data_type&nbsp;&nbsp; &nbsp;hypotaxis_id&nbsp;&nbsp; &nbsp;explanation<br />\r\n记录1&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;customization_title&nbsp;&nbsp; &nbsp;定制动物标题&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;animal_customization&nbsp;&nbsp; &nbsp;<br />\r\n记录2&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;customization_source&nbsp;&nbsp; &nbsp;定制动物来源&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;animal_customization&nbsp;&nbsp; &nbsp;<br />\r\n记录3&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;customization_department&nbsp;&nbsp; &nbsp;服务提供单位&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;animal_customization&nbsp;&nbsp; &nbsp;<br />\r\n记录4&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;customization_link&nbsp;&nbsp; &nbsp;定制动物联系方式&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;animal_customization&nbsp;&nbsp; &nbsp;<br />\r\n记录5&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;customization_text&nbsp;&nbsp; &nbsp;定制动物正文&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;animal_customization&nbsp;&nbsp; &nbsp;<br />\r\n记录6&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;check_title&nbsp;&nbsp; &nbsp;检测服务标题&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;check&nbsp;&nbsp; &nbsp;<br />\r\n记录7&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;check_source&nbsp;&nbsp; &nbsp;检测服务来源&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;check&nbsp;&nbsp; &nbsp;<br />\r\n记录8&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;check_department&nbsp;&nbsp; &nbsp;服务提供单位&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;check&nbsp;&nbsp; &nbsp;<br />\r\n记录9&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;check_link&nbsp;&nbsp; &nbsp;检测服务联系方式&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;check&nbsp;&nbsp; &nbsp;<br />\r\n记录10&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;check_text&nbsp;&nbsp; &nbsp;检测服务正文&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;check&nbsp;&nbsp; &nbsp;<br />\r\n记录11&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;entrust_experiment_title&nbsp;&nbsp; &nbsp;委托实验标题&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;entrust_experiment&nbsp;&nbsp; &nbsp;<br />\r\n记录12&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;entrust_experiment_source&nbsp;&nbsp; &nbsp;委托实验来源&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;entrust_experiment&nbsp;&nbsp; &nbsp;<br />\r\n记录13&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;entrust_experiment_department&nbsp;&nbsp; &nbsp;服务提供单位&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;entrust_experiment&nbsp;&nbsp; &nbsp;<br />\r\n记录14&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;entrust_experiment_link&nbsp;&nbsp; &nbsp;委托实验联系方式&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;entrust_experiment&nbsp;&nbsp; &nbsp;<br />\r\n记录15&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;entrust_experiment_text&nbsp;&nbsp; &nbsp;委托实验正文&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;entrust_experiment&nbsp;&nbsp; &nbsp;<br />\r\n记录16&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;technology_title&nbsp;&nbsp; &nbsp;技术服务标题&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;technology&nbsp;&nbsp; &nbsp;<br />\r\n记录17&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;technology_source&nbsp;&nbsp; &nbsp;技术服务来源&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;technology&nbsp;&nbsp; &nbsp;<br />\r\n记录18&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;technology_department&nbsp;&nbsp; &nbsp;服务提供单位&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;technology&nbsp;&nbsp; &nbsp;<br />\r\n记录19&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;technology_link&nbsp;&nbsp; &nbsp;技术服务联系方式&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;technology&nbsp;&nbsp; &nbsp;<br />\r\n记录20&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;technology_text&nbsp;&nbsp; &nbsp;技术服务正文&nbsp;&nbsp; &nbsp;VARCHAR&nbsp;&nbsp; &nbsp;technology&nbsp;&nbsp; &nbsp;<br />\r\n&nbsp;</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-06 00:00:00','1'),('19','法律3','法律法规','<p>&nbsp;customization_title&nbsp;&nbsp; &nbsp;定制动物标题<br />\r\ncustomization_source&nbsp;&nbsp; &nbsp;定制动物来源<br />\r\ncustomization_department&nbsp;&nbsp; &nbsp;服务提供单位<br />\r\n&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>customization_title&nbsp;&nbsp; &nbsp;定制动物标题 customization_source&nbsp;&nbsp; &nbsp;定制动物来源 customization_department&nbsp;&nbsp; &nbsp;服务提供单位</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-06 00:00:00','5'),('19c364ba2b3a5624e948b8a09b0a1fce1003e5','tr6','教育培训','<p>55555</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-11 09:46:06','1'),('2','习近平:正面战场和敌后战场都为抗战作重要贡献','平台公告','<p>习近平会见连战等台湾各界代表人士&nbsp;</p>\r\n\r\n<p><br />\r\n　　新华社北京9月1日电(记者李寒芳) 1日上午，中共中央总书记习近平在人民大会堂会见前来参加中国人民抗日战争暨世界反法西斯战争胜利70周年纪念活动的连战等台湾各界代表人士。习近平强调，中国人民抗日战争胜利是近代以来中国抗击外敌入侵的第一次完全胜利，是包括台湾同胞在内的全民族团结奋斗的结果。两岸同胞要牢记历史、缅怀先烈、团结一心、维护胜利成果，携手推动两岸关系和平发展，为实现中华民族伟大复兴共同努力。</p>\r\n\r\n<p>　　习近平指出，1931年&ldquo;九一八&rdquo;事变特别是1937年全面抗战爆发后，空前的民族灾难唤起了空前的民族觉醒。在外敌入侵、民族存亡的危急关头，全国人民毅然奋起，同日本军国主义侵略者展开了殊死斗争。国共两党合作建立抗日民族统一战线，全体中华儿女不分党派、民族、阶级、地域，众志成城，同仇敌忾，用鲜血和生命捍卫国家主权和民族尊严。正面战场和敌后战场相互配合、协同作战，都为抗战胜利作出了重要贡献，涌现出一大批气壮山河的抗战英雄。历史将永远铭记为抗日战争胜利英勇献身的先烈们。</p>\r\n\r\n<p>　　习近平强调，台湾同胞始终与祖国同呼吸、共命运，台湾同胞的抗日斗争是全民族抗战的重要组成部分。在日本侵占台湾的半个世纪里，台湾同胞从未停止抗争，数十万台湾同胞为此付出了鲜血和生命。全面抗战爆发后，台湾同胞积极参加和支援大陆人民抗战，不少同胞为国捐躯。抗日战争的胜利，结束了日本对台湾50年的殖民统治，台湾回到了祖国怀抱。</p>\r\n\r\n<p>习近平表示，透过近代历史风云，两岸同胞深刻体会到，大陆和台湾是不可分割的命运共同体，我们的命运从来都是紧紧连在一起的。国家强大、民族强盛，是包括台湾同胞在内的每一个中国人生存、发展、尊严的保障。我们要铭记历史教训，弘扬抗战精神，珍爱和平，共谋发展，团结一心为实现中华民族伟大复兴而共同奋斗。</p>\r\n\r\n<p>　　习近平强调，2008年以来，国共两党、两岸双方同两岸同胞一道，在&ldquo;九二共识&rdquo;、反对&ldquo;台独&rdquo;的基础上，开辟了两岸关系和平发展道路。事实证明，这是一条有利于两岸同胞团结奋斗、实现互利双赢的正确道路。只要两岸同胞沿着这条道路坚定走下去，就一定可以抚平历史造成的心理创伤，为民族复兴凝聚起强大力量、开创出美好未来。</p>\r\n\r\n<p>　　连战表示，两岸人民同为中华民族。我们共同纪念抗战胜利，是为缅怀过去整个民族浴血抵御外侮的悲壮历史，共同策进全世界爱和平、反侵略的美好理想。我们要巩固坚持&ldquo;九二共识&rdquo;、反对&ldquo;台独&rdquo;这一两岸政治互信的基础，坚定推动互助合作、互利双赢，让台湾各界越来越多体认、投入两岸关系和平发展。</p>\r\n\r\n<p>　　中共中央政治局委员王沪宁、栗战书，国务委员杨洁篪等参加会见。(完)</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-01 00:00:00',NULL),('20','褐边绿刺蛾','平台公告','<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7 screen-scroll\"> <![endif]--><!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8 screen-scroll\"> <![endif]--><!--[if IE 8]>         <html class=\"no-js lt-ie9 screen-scroll\"> <![endif]-->\r\n<h1 style=\"text-align: center;\">褐边绿刺蛾</h1>\r\n\r\n<div class=\"container\">\r\n<div class=\"article\" id=\"contentMain\">\r\n<div class=\"article-header\">\r\n<p style=\"text-align: center;\">昨天00:00霜天蛾</p>\r\n</div>\r\n\r\n<div class=\"content\" id=\"articleContent\">\r\n<div>\r\n<p>褐边绿刺蛾 <em>Parasa consocia</em>，刺蛾科，绿刺蛾属，华北与华东地区较常见，是城市绿化植物的主要害虫之一。刺蛾科俗称洋辣子、毛辣子、凤辣子（划掉）等等，如果不慎触碰到它们的幼虫，会非常酸爽。各种辣子有鲜艳的，有灰扑扑不起眼的，也有不怎么辣的，褐边绿刺蛾就属于较鲜艳的那一类。</p>\r\n\r\n<p>褐边绿刺蛾比较小，体长17mm左右，翅展约32mm，头胸部和前翅绿色，后翅淡黄色，背部隆起，胫节和第一跗节有褐色毛丛。雄蛾触角单栉齿状，雌蛾线性，前翅基角各有一块略带放射形的褐色星状斑，外缘有一弧形浅褐色带，带内部有深褐色脉纹。</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img src=\"http://3.im.guokr.com/oqXZdY76EV3lHI7mt-y7ao8U5iV7yPrGLELQficHaGJTAQAA_gAAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align: center;\"><em>褐边绿刺蛾 图片来自<a href=\"http://www.jpmoth.org/\">www.jpmoth.org</a></em></p>\r\n\r\n<p>褐边绿刺蛾幼虫身体肥短，黄色或绿色，生满短粗的带刺毛的枝状刺，有时候会有四对枝状刺较粗大，背中线蓝色，两侧有多数黑色斑。头小，缩入前胸，从外表一般看不到，胸足小，腹足退化成吸盘状，这种形态叫蛞蝓式，往往分不清头尾。不过褐边绿刺蛾幼虫的体末端会有4个黑色的毛簇，可以分辨。</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img src=\"http://2.im.guokr.com/yKGJSlKcP_AsteIalIjVclMOKKaY7_hZKcBY9dLat2qfAQAAIwEAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align: center;\"><em>图片来自<a href=\"http://www.qyly.net/\">www.qyly.net</a> </em></p>\r\n\r\n<p>褐边绿刺蛾的毒毛具有蛋白类毒素，接触可引起难以忍受的刺痛、奇痒，伴有皮肤红肿和斑疹，症状可持续一个月左右，有人说拿肥皂水洗一洗就好， 不过我们小时候都皮实，被蛰过从来不处理，忍一忍就给忘了。</p>\r\n\r\n<p>褐边绿刺蛾食性较广泛，寄主多达32科植物。主要为蔷薇科、杨柳科、悬铃木科等等。小时候经常去玩的一个街心花园里，紫叶李和二球悬铃木是重灾区，悬铃木经常会落叶，一片落叶上往往会有两三条幼虫，小孩子都喜欢去捡叶子玩，第一次摸的时候一般都会伴着一声嚎叫，等到学乖了，就会把它们当武器，纷纷举着叶子去和别的区的孩子打仗了。</p>\r\n\r\n<p>褐边绿刺蛾一年发生两代，第一代成虫每年五六月间方出现。成虫在叶背面产下重叠排列的卵块，六月至7月间第一代幼虫孵化。初龄幼虫不取食，3龄后集中取食，啃食叶表皮，6龄后分散取食，而在整个幼虫阶段要经过8龄才会结茧进入蛹期。</p>\r\n\r\n<p>我们经常会在树枝间看到类似鸟蛋般光滑，上面还有纵纹的茧，那是黄刺蛾<em>Cnidocampa flavescens</em>的茧，而褐边绿刺蛾的茧多营在树下土层中或枯叶中，表面布满丝和黑色的毒毛，由于刺蛾科毒毛在脱离虫体很久后仍有毒性，所以误触带毒毛的茧或是幼虫蜕下的皮也会被蛰伤。如果不幸被蛰了，反正没有生命危险，你可以趁机试试老友记里推荐的水母蛰伤急救法<a href=\"http://www.guokr.com/article/437126/\">http://www.guokr.com/article/437126/</a></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img src=\"http://3.im.guokr.com/OewjGZXBmIt-j8beIBVxIU83KPKiX7vDL9yRbNvefRefAQAANwEAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align: center;\"><em>黄刺蛾的茧</em></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><img src=\"http://3.im.guokr.com/N8NAcxbAyiN78W45zMG_nN5TrFcNIcuXisGLbvr2PoOAAQAAIQEAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align: center;\"><em>褐边绿刺蛾的茧 图片均来自<a href=\"http://www.jpmoth.org/\">www.jpmoth.org</a></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>---------------------------------------- 你的蛾子在我手上 ----------------------------------------</p>\r\n\r\n<p>城市不单单属于人类，也属于潜藏在其间的数以亿计的美好生命。</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08 00:00:00',NULL),('21','345345555','平台规定','<p>涛涛涛涛涛涛涛涛涛涛他</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-06 00:00:00',NULL),('22','或自带火箭推进器：火星和土卫六上的生命，可能是啥样？','科普信息','<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7 screen-scroll\"> <![endif]--><!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8 screen-scroll\"> <![endif]--><!--[if IE 8]>         <html class=\"no-js lt-ie9 screen-scroll\"> <![endif]-->\r\n<div class=\"container\">\r\n<h1 style=\"text-align:center\">或自带火箭推进器：火星和土卫六上的生命，可能是啥样？</h1>\r\n\r\n<div class=\"down-scan\" id=\"down-scan\">\r\n<div class=\"article-header\">\r\n<p>----------------------</p>\r\n</div>\r\n\r\n<div class=\"content\" id=\"articleContent\">\r\n<div>\r\n<p><img alt=\"\" src=\"http://2.im.guokr.com/PBzgt05RcOwqrDPMsxHgykSdXN3NaboT_u5HJZwRTWyAAgAAeQIAAEpQ.jpg?imageView2/1/w/555/h/548\" style=\"height:633px; width:640px\" />年轻的火星曾经拥有足够的水，可以把全部地表淹没到140米深的水下。不过由于地势高低不同，这些水很可能汇聚成一片汪洋，占据火星几乎一半的北半球。然而，今天的火星已经是一片干旱，比地球上最干旱的沙漠还要更加干旱。要在一颗类似今天火星的行星上生存，生命需要具备什么样的能力呢？图片来源：M. Kornmesser / ESO / N. Risinger, skysurvey.org</p>\r\n\r\n<p>美国华盛顿州立大学教授德克&middot;舒尔策－马库赫（Dirk Schulze-Makuch）和他的德国同事一起，根据已知地球上最极端的生命形态，还有火星和土卫六泰坦（Titan）上的环境，描绘了那里如果存在外星生命的话，可能会是什么样子。</p>\r\n\r\n<p>地球上的生命，凭借独特的生化工具，如果再适应环境获得几项新能力的话，是可以在火星这样的类地行星上设法生存下来的。</p>\r\n\r\n<p>舒尔策－马库赫教授说，&ldquo;首先，有机体必须要找到一种方法能够从环境中获取水分，而那种环境要比地球上智利的阿塔卡马沙漠还要干旱和寒冷得多。一种可能的适应能力是，使用水和过氧化氢的混合液作为细胞内的液态，而非只是用水。&rdquo;</p>\r\n\r\n<p>&ldquo;举例来说，在我们这颗行星上，有一些被称为放屁虫（bombardier）的甲虫，就会分泌过氧化氢和其他化合物的爆炸性混合物，用于抵挡掠食者。在其他行星上，如果引力环境类似于今天的火星，与放屁虫类似的外星生命就能够喷射类似的反应物，将自己反推到高达300米的空中。&rdquo;</p>\r\n\r\n<p>过氧化氢是一种天然抗冻剂，能够帮助微生物在火星严寒的冬季存活下来。它还具有吸湿性，意味着它天然就有能力从大气中吸收水分子。</p>\r\n\r\n<p>白天，类似植物的微生物在类似火星的地表上，可以通过光合作用合成过氧化氢。</p>\r\n\r\n<p>到了夜晚，当大气里相对潮湿时，它们就能利用储存的过氧化氢从空气中汲取水分，就像阿塔卡马沙漠里的微生物群落利用盐水来汲取空气中的水分以此为生一样。</p>\r\n\r\n<p>舒尔策－马库赫教授说，&ldquo;更大更复杂的外星生命，或许类似于地球上的放屁虫，把这些微生物当成是食物和水的来源。它还能利用类似&lsquo;火箭推进&rsquo;的技术，在一个个孤立的能够维持生存的微生物群落之间迁移。&rdquo;</p>\r\n\r\n<p><img alt=\"\" src=\"http://3.im.guokr.com/vSvtRZ3mDc0WUWqG7P9T-g8YZAyFNGrZD14qRGLfe3eAAgAAhAIAAEpQ.jpg?imageView2/1/w/555/h/558\" style=\"height:644px; width:640px\" />土卫六泰坦，太阳系里除地球以外唯一表面有液态湖泊存在的星球，不过那里的湖泊里不是水，而是液态的甲烷或者乙烷。水在泰坦上会被冻得像石块一样坚硬，无法保持液态。图片来源：NASA/JPL/University of Arizona</p>\r\n\r\n<p>如果生命存在于土卫六泰坦或者宇宙中其他某颗类似于泰坦的行星上，它的细胞液就必须要用水以外的其他东西了。</p>\r\n\r\n<p>舒尔策－马库赫教授说，&ldquo;一种可能性是甲烷或者乙烷这样的液态碳氢化合物。无水基生命形式或许能够在占据泰坦很大一部分地表的液态甲烷和乙烷湖泊中生存，就像地球上的有机体生存在水中一样。&rdquo;</p>\r\n\r\n<p>这样的外星生命可能用氢来取代氧，让它跟大气中的高能乙炔反应，产生甲烷而非二氧化碳。</p>\r\n\r\n<p>在极为严寒的环境中，这些有机体的细胞可能会非常巨大，代谢速度也极其缓慢。</p>\r\n\r\n<p>缓慢的新陈代谢可能意味着，这些生命演化和衰老的速度要比地球上的生命缓慢许多，可能会极大地延长有机个体的寿命。</p>\r\n\r\n<p>舒尔策－马库赫教授说，&ldquo;在地球上，对于不同有机体采取的不同生物策略，我们也还只是触及到了皮毛。不过我们知道的东西已经很惊人了。宇宙中其他地方存在生命的可能性甚至会更加惊人。&rdquo;</p>\r\n\r\n<p>描述这些最新成果的论文，发表在最近出版的学术期刊《生命》（Life）上。</p>\r\n\r\n<h2>参考文献</h2>\r\n\r\n<ol>\r\n	<li>Dirk Schulze-Makuch&nbsp;<em>et al.</em> 2015. The Physical, Chemical and Physiological Limits of Life.&nbsp;<em>Life</em>&nbsp;5 (3), pp. 1472-1486; doi: 10.3390/life5031472</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08 00:00:00',NULL),('23','拿杯咖啡走路，为啥咖啡总会溅出来','平台公告','<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7 screen-scroll\"> <![endif]--><!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8 screen-scroll\"> <![endif]--><!--[if IE 8]>         <html class=\"no-js lt-ie9 screen-scroll\"> <![endif]-->\r\n<div class=\"container\">\r\n<h1 style=\"text-align: center;\">拿杯咖啡走路，为啥咖啡总会溅出来</h1>\r\n\r\n<div class=\"article\" id=\"contentMain\">\r\n<div class=\"article-header\">\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<div class=\"content\" id=\"articleContent\">\r\n<div>\r\n<div class=\"entry\">\r\n<p>&nbsp;</p>\r\n\r\n<p>拿杯咖啡走路，为什么咖啡会溅出来？</p>\r\n\r\n<p>数学家说这是波动方程式于几合规范下局部不稳定的模式。</p>\r\n\r\n<p>化学家表示这是黄嘌呤生物碱化合物溶液彼此挤压下的反应。</p>\r\n\r\n<p>工程师认为这是接收液面晃动feedback之control loop有bug。</p>\r\n\r\n<p>企业代表则宣示会尽快将6号塑胶杯盖换成5号杯盖。</p>\r\n\r\n<p>负责会议记录的文青写下&ldquo;在晨光中荡漾着一杯咖啡的小确幸&hellip;.&rdquo;</p>\r\n\r\n<p>抗议民众在场外举起标语&ldquo;这是咖啡的自由！要摆脱马克杯的框架！&rdquo;</p>\r\n\r\n<p>最终，国家元首做了结论：&ldquo;一杯咖啡溅出来不够喝，那要买两杯啊！&rdquo;</p>\r\n\r\n<p>以上当然是玩笑话，但拿杯咖啡走路，为什么咖啡容易溅出来呢？</p>\r\n\r\n<p>这虽然是一个普通的现象，却不是一个简单的问题。因为这个力学系统所牵涉到的两个单位是生物（持咖啡者）及流体（咖啡），生物的运动模式没有机械般的准确和稳定，而流体力学也是出了名的难搞，两者合一，创造出更多不确定的变因。</p>\r\n\r\n<p><a href=\"http://2.im.guokr.com/Qsz0VDu-YCdO2JefVFM_jBaEjCvTnF0RJgQ-DeEwajQwAgAAkQEAAEpQ.jpg?imageView2/1/w/560/h/401\"><img alt=\"from-Simon-James-560x401\" class=\"aligncenter size-full wp-image-91280\" src=\"http://2.im.guokr.com/Qsz0VDu-YCdO2JefVFM_jBaEjCvTnF0RJgQ-DeEwajQwAgAAkQEAAEpQ.jpg?imageView2/1/w/560/h/401\" /></a></p>\r\n\r\n<p>&nbsp;【Credit:Simon James】</p>\r\n\r\n<p>然而，也许是被溅出的咖啡惹毛了，加州大学圣塔巴巴拉分校机械系的Mayer及Krechetnikov决定寻找问题的答案。他们拍摄了多位实验参与者拿着装有咖啡的杯子走路的画面，依靠影像分析软件和咖啡杯上的感测器，得到了参与者和咖啡杯上下、左右、前后及斜倾的运动状态，并套用非线性单摆的力学模式来类比咖啡液面，经过实测及电脑模拟，总算摸清了这个系统的样貌。</p>\r\n\r\n<p>经实验观察到，人们拿起咖啡杯开始走路后，在跨出的第七步到第十步之间，是咖啡最容易溅出的时刻。</p>\r\n\r\n<p>这个问题当然跟咖啡杯的几何大小有关，而液体的材质及形状会影响其振荡的自然频率。用一般常见的马克杯所盛装的咖啡，其自然频率约为2.6至4.3赫兹；而人们走路的频率则约1至2.5赫兹，属同一个数量级，因此杯中咖啡的振荡易受持杯者步伐的影响。另外，咖啡杯平滑的内缘，让咖啡的振荡几乎没有阻碍。</p>\r\n\r\n<p>进一步分析，人们从静止状态起步时，通常于第一步到第四步之间是一小段加速运动，杯中咖啡就如公车上的乘客一般，会受起步加速度影响而让液面倾斜，提供后续晃动的初始势能。第四步之后，人们多半就大致匀速前进了，但每一步之间还是会有微小的速度差，这让杯中咖啡处于一个前后摇摆的加速度力场之下，更助长了咖啡要越出杯子的气焰。</p>\r\n\r\n<p>降低初始势能和减少后续摇摆是防止咖啡溢出的不二法门，然而这个实验揭露一个吊诡的现象：走路快的人，通常起步加速猛烈，造成液面初始势能大；而走路慢的人，步伐反而没有走路快的人来得稳定，不断地强化液面的晃动。所以说，不论你走得快或走得慢，都有很好的理由把咖啡溅出来。</p>\r\n\r\n<p>当然，只要人们能专注于咖啡液面晃动的情况，就可以自然而然的让自已有缓和的加速和稳健的步伐。此外，研究人员也建议使用弹性材质、或内围有环状构造的杯子，以吸收其内液体晃动的力道或增加阻力，都能有效避免咖啡溅出。</p>\r\n\r\n<p>除了防止咖啡溅出外，这个研究还有工程应用的价值。在建筑管线或大型器具时，如污水管、液压管等，此研究建立出的数学模型可模拟管柱中液体受到振动影响所产生的冲激运动（sloshing dynamics），有利于防溅设计的开发。</p>\r\n\r\n<p>但撇开工程应用之价值不谈，用如此&ldquo;高大上&rdquo;的实验架构去看这个溅出咖啡这种芝麻绿豆般的事，大有杀鸡用牛刀之感，让这两位科学家戴上了2012年搞笑诺贝尔&ldquo;流体力学奖&rdquo;的桂冠。</p>\r\n\r\n<p>再说，在咖啡杯上加个杯盖不就好了吗？</p>\r\n\r\n<h1>参考资料</h1>\r\n\r\n<ol>\r\n	<li><a href=\"http://www.improbable.com/ig/winners/#ig2012\" target=\"_blank\">2012年搞笑诺贝尔得主暨得奖内容介绍</a></li>\r\n	<li>&ldquo; <a href=\"http://www.engineering.ucsb.edu/~rkrechet-lab/files/publications/pre2012.pdf\" target=\"_blank\">Walking with coffee: Why does it spill</a> ?&quot; HC Mayer and R. Krechetnikov, PHYSICAL REVIEW E 85, 046117 (2012).</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08 00:00:00',NULL),('24','做科学家这么多年谁还没点做研究的黑历史呢','平台公告','<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7 screen-scroll\"> <![endif]--><!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8 screen-scroll\"> <![endif]--><!--[if IE 8]>         <html class=\"no-js lt-ie9 screen-scroll\"> <![endif]-->\r\n<div class=\"container\">\r\n<h1 style=\"text-align:center\">做科学家这么多年，谁还没点做研究的黑历史呢</h1>\r\n\r\n<div class=\"article\" id=\"contentMain\">\r\n<div class=\"content\" id=\"articleContent\">\r\n<div class=\"article-detail-bd\">&nbsp;\r\n<h2>普通的人类快来围观一下高智商人群的犯蠢时刻</h2>\r\n\r\n<div class=\"detail\">\r\n<p>虽然小时候的动画片里，科学家经常被塑造成整天穿着白色大褂在实验室里举着冒泡烧杯的样子。但随着我们逐渐长大，大家也开始意识到科学家并不是天生就一副头脑聪明的经营模样。应该说美剧《生活大爆炸》在纠正我们对科学家的看法上起到了很大的帮助，当然多年来现役科学家们不断地在社交网络上自黑更是功不可没。比如最近，一堆生物学家和考古学家就特别开心的参与讨论了一个名叫田野调查的失败经历（＃fieldworkfail）的话题。</p>\r\n\r\n<p>这个话题起因是一名叫 Agata Staniewicz 的布里斯托尔研究员在 Twitter 上说：&ldquo;我在给鳄鱼装无线发射器的时候不小心把我自己也黏上去了。&rdquo;</p>\r\n\r\n<p>&ldquo;我虽然没有把自己黏在鳄鱼上，但我把自己黏在了一只很凶的螃蟹上。&rdquo; 华盛顿大学讲师 P. Sean McDonald 很快就发 tweet 安慰 Agata Staniewicz 道。也不知是为了安慰 Agata 还是话题真的引发了共鸣，接下来我们就在 Twitter 上看到科学家们晒出了各种各样的奇葩经历。</p>\r\n\r\n<p><img alt=\"1\" src=\"http://1.im.guokr.com/lBgqoKFQyMH980lcMvgJf72d9ZMddh6uc24-L3EOumR6AgAAEwIAAEpQ.jpg?imageView2/1/w/634/h/531\" title=\"1\" /></p>\r\n\r\n<p>&ldquo;有一天我跟同事在追踪大鳄鱼，我很兴奋地跟同事说&lsquo;哇，这些脚印真是新鲜呀&rsquo;，结果抬头一看那条鳄鱼就在我的面前。&rdquo;同样研究鳄鱼的 Anthony J. Martin 在 Twitter 上分享道。但和其他人的经历比起来，他这段真的还好，顶多糗了点。</p>\r\n\r\n<p><img alt=\"1\" src=\"http://3.im.guokr.com/n6v0UALwNr6g6FMEQX7UtJ3Dw9X9OvPowb2G2od4dcDxAQAAzAAAAEpQ.jpg?imageView2/1/w/497/h/204\" title=\"1\" /></p>\r\n\r\n<p>Diana Sharpe 姑娘更是直接在 Twitter 上告诉大家，她坐的小船失控后她不得不在鳄鱼出没的水域里游了好一会儿泳。命大的姑娘。</p>\r\n\r\n<p><img alt=\"1\" src=\"http://www.qdaily.com/uploads/image/201508/b591662ef6b5.jpg\" title=\"1\" /></p>\r\n\r\n<p>看到姑娘的这条 tweet ， Agata Staniewicz 又追了一条，说自己曾经在调查鳄鱼的过程中沉船过，两次。Agata Staniewicz，你和 Diana Sharpe 是一个小组的吧？</p>\r\n\r\n<p>&ldquo;刚刚用我今天早些时候用来拍蜘蛛的玻璃杯喝了啤酒&hellip;&hellip;希望我之前都把蜘蛛挪出来了。&rdquo;在亚马逊雨林工作的昆虫学家和博物学家 Phil Torres 写道。噢，祝他平安。<img alt=\"1\" src=\"/uploads/image/201508/5414d105756d.jpg\" title=\"1\" /></p>\r\n\r\n<p>佐治亚水族馆海洋生物学家 Alistair Dove 博士遇到的问题则是小心翼翼地把一个价值几千美元的卫星发射器装在蝙蝠鱼身上后，才发现原来这条是他昨天装过的那一条。</p>\r\n\r\n<p><img alt=\"1\" src=\"http://2.im.guokr.com/juqK7RnaNND1yde36HEgEdrjNZrepb0fzkSw-ZF12Mp6AgAAZgIAAEpQ.jpg?imageView2/1/w/634/h/614\" title=\"1\" /></p>\r\n\r\n<p>也有命运和 Alistair Dove 完全相反的主，比如昆虫学家 Tony Gamble ，有一天他看到一只特别酷的蜘蛛就随手拍了张照然后把它放了，过了半天才意识到这只蜘蛛是个从来没发现过的新品种。</p>\r\n\r\n<p><img alt=\"1\" src=\"http://www.qdaily.com/uploads/image/201508/2870d88ce4e1.jpg\" title=\"1\" /></p>\r\n\r\n<p>考古学家 @tattoosandbones 也特别惨。&ldquo;为了鉴别是小石头还是化石，我就拿起来舔了舔。化石。但因为不小心呛到咳嗽了一下，我就把化石咽下去了。&rdquo;祝他&hellip;&hellip;通畅吧。</p>\r\n\r\n<p>Anne Hilborn 姑娘的同事用镜头记录下了她＃fieldworkfail 的整个过程：找到一些猎豹的粪便，采样，然后全撒身上了。</p>\r\n\r\n<p><img alt=\"1\" src=\"http://3.im.guokr.com/IxqC-JG5RhPX2UxNSCyxbPDzU9hmq1SZcbaoINjvKr56AgAAKgIAAEpQ.jpg?imageView2/1/w/634/h/554\" title=\"1\" /></p>\r\n\r\n<p>看到大家讨论得这么热烈，只能待在实验室里的天体物理学家&nbsp; Katie Mack 也有些坐不住了。&ldquo;我虽然没有做过田野调查，没法给大家贡献＃fieldworkfail ，&rdquo;她发 tweet 说，&ldquo;但是我曾经有一次赶上了加州理工学院的实验室火灾。完全不是我的错哦。&rdquo;</p>\r\n\r\n<p><img alt=\"1\" src=\"http://1.im.guokr.com/dIvBj6XjE_tqW7Vnwr9a4To3tSNT79MJNXQajGdkS5X0AQAA4QAAAEpQ.jpg?imageView2/1/w/500/h/225\" title=\"1\" /></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08 00:00:00',NULL),('281e7fde1d1aeb84446be488e9d6b5a7fc13e3','关于“爆头”：子弹飞进脑壳之后，发生了啥？','平台公告','<p style=\"text-align:center\"><span style=\"font-size:28px\"><strong>关于&ldquo;爆头&rdquo;：子弹飞进脑壳之后，发生了啥？</strong></span></p>\r\n\r\n<p>子弹的速度毋庸置疑，它的飞行速度可达975米/秒，其轨迹甚至肉眼都难以识别。就算你能感觉到慑人的气流或者听到子弹出膛的声音，大脑也是来不及做出任何反应的&mdash;&mdash;<strong>别说躲闪了，就连一声尖叫你都未必发得出来。</strong></p>\r\n\r\n<p>那么，子弹的杀伤力又该如何呢？在讨论这个之前，我想提另一个问题：怎样用手枪实现秒杀？</p>\r\n\r\n<p>对准敌人的心脏？错！</p>\r\n\r\n<p>正确的答案是&mdash;&mdash;瞄准他的天灵盖。</p>\r\n\r\n<p>大脑周围有8块颅骨用于保证脑部的安全，子弹擦过发梢、突破皮肤后，就接触到了由钙、磷、硅、胶原组成的脑壳。高速的子弹瞬间就能将脑壳击成碎片，离枪越近，你所受到的伤害就越大。当子弹穿透大脑后，大脑就会留下一条空腔。</p>\r\n\r\n<p>实际上我们的大脑有许多结构来保护脑部不会轻易受伤，如充当内部缓冲垫的结缔组织和纤维膜，以及具有减震作用的脑脊髓液。但这些结构在具有高能量的子弹面前就全变成了浮云：结缔组织和纤维膜被撕裂，脑脊髓液直接随着由子弹造成的空腔流出。</p>\r\n\r\n<p>由于子弹的飞行速度比组织撕裂的速度要快，因此当子弹触碰到结缔组织时，它会连拉带扯的将结缔组织拉伸一段距离直至断裂。</p>\r\n\r\n<p>当子弹飞出后，大脑就算是废了：前额皮质被损坏，从而丧失了处理信息和解决问题的能力；海马体被烧伤，学习和记忆的能力也消失了。</p>\r\n\r\n<p>其实这种死法算是痛快的了。若不幸被射中心脏，人的血压会急速下降但却不会立即死去，10-15秒后大脑才会停止运转。在那短暂的十几秒内，你可以留下遗言或者想想逝去的一生，但同时陪伴你的还有缺氧而导致的痛苦。但是对准脑门开一枪就不同了，你的大脑几乎是立即停止运作，须臾之间，你就可以步入极乐世界了。</p>\r\n\r\n<p>当然，这篇文章不是要告诉你遇到持枪的就只能坐以待毙。<strong>开枪的后坐力和开枪者的技术都直接影响瞄准的准确度。所以当看到有人拿把枪对准你的时候，可别像个木头人似地一动不动等他打唷</strong>~</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-07 15:23:07','1'),('2863398df68c7284f869fe6d597eb25e11b2d4','这个是动物所发的1','平台公告','<p>这个是动物所发的1111111111111111</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-08 09:33:28','1'),('28a0b5ad8f87c9549149a4a81bd548915c0319','tr2','教育培训','<p>121212122222</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2016-01-11 09:45:11','5'),('29bd0f53d1520e24ffc95c51b744646838a369','这个是微生物所发的1','平台公告','<p>这个是微生物所发的111111111</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-08 09:34:28','4'),('3','政法委：绝不许特赦中有权钱交易','平台公告','<p><img alt=\"8月29日，国家主席习近平签署主席特赦令，根据十二届全国人大常委会第十六次会议29日通过的全国人大常委会关于特赦部分服刑罪犯的决定，对参加过抗日战争、解放战争等四类服刑罪犯实行特赦。新华社记者 兰红光 摄\" src=\"http://n.sinaimg.cn/transform/20150901/Q3aj-fxhkafi9706094.jpg\" /></p>\r\n\r\n<p>据新华社电 日前，中央政法委召开中央政法各单位和各省（区、市）党委政法委、政法各单位负责人会议，专题部署依法做好特赦工作。</p>\r\n\r\n<p>　　8月29日，全国人大常委会表决通过了《关于特赦部分服刑罪犯的决定》。国家主席习近平签署主席特赦令，决定在纪念中国人民抗日战争暨世界反法西斯战争胜利70周年之际，对2015年1月1日前正在服刑、释放后不具有现实社会危险性的四类罪犯实行特赦。中央政法委和中央政法各单位立即行动，对依法做好特赦工作作出部署。</p>\r\n\r\n<p>　　中央政法委会议要求，各地各有关部门要认真贯彻实施全国人大常委会特赦决定和国家主席特赦令，深刻认识这次特赦的重大意义，切实增强政治责任感和历史使命感，准确把握特赦的总体考虑和适用条件，坚持严格范围、审慎稳妥、依法进行，切实做到不能错放一人，也不能漏赦一人，确保经得起法律和历史的检验。会议强调，要进一步明确特赦工作的基本要求和各部门职责任务分工，加强协调配合，尽早部署实施特赦决定的各项工作，确保依法、有序、高效完成特赦任务。要严格依法按程序办理特赦，绝不允许任何单位和个人以权谋私、权钱交易。</p>\r\n\r\n<p>　　据悉，为贯彻实施全国人大常委会特赦决定和国家主席特赦令，最高人民法院、最高人民检察院、公安部、国家安全部、司法部等五部门联合制定了实施办法，对依法做好特赦工作作出具体规定。</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-01 00:00:00',NULL),('33','9月3日阅兵通知','平台公告','<p>国务院关于中国人民抗日战争暨</p>\r\n\r\n<p>&emsp;&emsp;世界反法西斯战争胜利70周年纪念日</p>\r\n\r\n<p>&emsp;&emsp;调休放假的通知</p>\r\n\r\n<p>&emsp;&emsp;国发明电〔2015〕1号</p>\r\n\r\n<p>&emsp;&emsp;各省、自治区、直辖市人民政府，国务院各部委、各直属机构：</p>\r\n\r\n<p>&emsp;&emsp;2015年是中国人民抗日战争暨世界反法西斯战争胜利70周年。为使全国人民广泛参与中央及各地区各部门举行的纪念活动，2015年9月3日全国放假1 天。为方便公众安排假日期间生产生活，特作如下调休：9月3日至5日调休放假，共3天。其中9月3日(星期四)放假，9月4日(星期五)调休，9月6日 (星期日)上班。</p>\r\n\r\n<p>&emsp;&emsp;调休放假期间，各地区、各部门要妥善安排好值班和安全、保卫等工作，遇有重大突发事件，要按规定及时报告并妥善处置，确保有关纪念活动顺利进行。</p>\r\n\r\n<p>&emsp;&emsp;国务院</p>\r\n\r\n<p>&emsp;&emsp;2015年5月13日</p>\r\n\r\n<p>这个就是针对所有企业包括私人企业</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-01 00:00:00',NULL),('343120a361ed2884534b626df7264203798a6','tr5','教育培训','<p>4535445</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-11 09:45:59','4'),('370f5cdd6740b924e40889c36a1bd9c09bb1df','北京基因组发的01','平台公告','<p>北京基因组发的01北京基因组发的01北京基因组发的01</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-08 09:57:44','5'),('39c2c7dcc686464accbde1cd5d6fa24c40261','测试公告003','平台公告','<p>33333</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-07 14:13:29','1'),('3b0f56e1ba00c77434f898b0805a432208c28','tr30','教育培训','<p>3333</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-11 09:48:08','1'),('4','2011年度国家实验动物种子中心发展研讨会在广州召开','教育培训','<p>2011年7月20日下午，2011年度国家实验动物种子中心发展研讨会在广州召开。<br />\r\n&nbsp; &nbsp; 国家科技部条财司条件处孙增奇处长以及八个国家实验动物种子中心（国家啮齿类实验动物种子中心(北京分中心)、国家啮齿类实验动物种子中心(上海分中心)、国家遗传工程小鼠资源库、国家犬类实验动物种子中心、国家兔类实验动物种子中心、国家禽类实验动物种子中心、国家非人灵长类实验动物种子中心(苏州分中心)、国家实验动物数据资源中心。)的主管领导和专家出席了此次会议。<br />\r\n&nbsp; &nbsp; 研讨会由孙增奇处长主持，会议主要针对国家&ldquo;十二五&rdquo;实验动物发展规划以来，各实验动物种子中心运行过程中遇到的问题和困难进行了研讨；与会人员积极剖析原因、出谋划策，提出了许多有益的建议。最后，孙增奇处长对各实验动物种子中心的工作给予了充分的肯定，并指出下一步工作的重点，特别是各种子中心运行、规章制度建设、人才建设等方面提出了切实可行的指导意见。</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-02 00:00:00','1'),('5','国家自然科技资源建设重点项目简介','平台公告','<p>自然科技资源一般指经过长期演化自然形成及人为改造的、对人类社会生存与可持续发展不可或缺的、为人类社会科技与生产活动提供基础材料，并对科技创新与经济发展起支撑作用的战略物质资源。主要包括植物、动物、微生物、和人类等遗传资源，以及实验生物材料、生物标本、岩石矿物及化石标本等。&nbsp;<br />\r\n&nbsp; &nbsp; 在整合建设植物种质资源、动物种质资源和标本资源等八类自然科技资源的基础上，重点开展农作物种质资源、林木种质资源、微生物菌种资源和人类遗传资源整合建设。&nbsp;<br />\r\n一、植物种质资源建设<br />\r\n&nbsp; &nbsp; 植物种质资源指地球上所有的植物遗传多样性资源，是全部植物基因在特定地理生态空间和时间上形成的遗传载体材料的总称。重点开展农作物、林木、多年生和无性繁殖作物、热带作物、牧草植物、药用植物、野生植物等种质资源整合共享体系建设。加强植物种质资源共享条件建设，形成新型共享机制，提高保存设施的水平，实现植物种质资源实物共享。到2010年，跨部门、跨领域整合共享植物种质资源45万份，为我国食物安全、生态安全、资源安全与社会稳定提供保障。<br />\r\n二、微生物菌种资源<br />\r\n&nbsp; &nbsp; 微生物菌种资源指人工可培养的，能够保存持续利用的，有一定科学意义、具有实际或潜在应用价值的细菌、真菌、病毒、细胞及相关的信息资源。重点开展农、林、医、药、食品、兽医、海洋基础研究及教学实验用微生物等菌种资源整合共享体系建设；建立国家微生物菌种资源库和服务管理信息系统；到2010年，跨部门、跨领域整合共享微生物菌种资源10万株。<br />\r\n三、动物种质资源&nbsp;<br />\r\n&nbsp; &nbsp; 动物种质资源指地球上所有的多细胞、某些典型特征有别于植物的遗传多样性资源的总称。重点开展畜禽、水产、特种经济动物、寄生虫、经济昆虫等种质资源整合共享体系建设。到2010年，跨部门、跨领域整合共享动物种质资源500种。&nbsp;<br />\r\n四、人类遗传资源<br />\r\n&nbsp; &nbsp; 人类遗传资源是由人群常见重大疾病构成的遗传资源、特有民族构成的种族遗传资源以及长期生活在特殊自然环境且具有特定生理体质或亚健康体质的人群构成的遗传资源的总称。重点开展疾病和人种等遗传资源的整合共享体系建设。到2010年，跨部门、跨领域整合共享人类遗传资源15万份。<br />\r\n五、标本类资源整合共享体系建设&nbsp;<br />\r\n&nbsp; &nbsp; 标本资源主要包括生物标本和岩矿化石标本等。补充完善关键性信息数据，建设标本资源信息共享网络系统，实现标本资源信息共享。复制标本资源，扩大标本资源的保存数量，实物标本资源实物共享，为科学研究、教学、科普及国民经济建设提供服务。<br />\r\n&nbsp; &nbsp; 1．生物标本资源&nbsp;<br />\r\n&nbsp; &nbsp; 生物标本资源指保存在各类标本馆（室）中的各种类型的生物标本，以中科院、行业研究院和相关大学的生物标本资源为依托，重点开展动物标本、植物标本和菌物标本等资源的整合共享体系建设。到2010年，跨部门、跨领域整合共享生物标本1000万号。&nbsp;<br />\r\n&nbsp; &nbsp; 2．岩矿化石标本资源&nbsp;<br />\r\n&nbsp; &nbsp; 岩矿化石标本资源指地质工作者长期采集、整理、鉴定、研究和收藏的岩石、矿物、矿石和化石标本的总称。以地学类大学、博物馆、研究院所的地质标本、矿床模型为基础，重点开展岩矿标本、化石标本和国家紧缺与战略性矿产资源的矿床模型整合共享体系建设。到2010年，跨部门、跨领域整合共享岩矿化石标本8万件，矿床模型九类。&nbsp;<br />\r\n&nbsp; &nbsp; 3．南北极标本资源&nbsp;<br />\r\n&nbsp; &nbsp; 南北极标本资源是指整理与数字化我国20多年来国家投资在南极和北极地区所获得的各类生物标本、岩石矿物标本、冰芯和沉积物样品以及近年来在南极回收的大量陨石标本，建立包括极地生物标本库、极地雪冰样品库、极地岩矿标本库、南极陨石样品库、极地沉积物样品库和极地标本资源共享信息网的&ldquo;一网五库&rdquo;，向国内外科研人员与社会公众共享与展示珍贵的南北极标本。到2010年，跨部门、跨领域整理共享南北极标本资源1.5万件（号）。&nbsp;<br />\r\n六、实验材料整合共享体系&nbsp;<br />\r\n&nbsp; &nbsp; 实验材料指具有自然资源属性、经人工培育或制造且具有一定外部表征和内在质量的、支持和满足人类科技活动所需要的基本材料。重点开展实验动物种质资源的整合、保存与利用，全面实现实验动物种质资源共享。标准物质一般指具有一种或多种足够均匀和很好确定了的特性值，用以校准设备，评价测量方法或给材料赋值的材料或物质。扩大、完善国家基、标准物质和有证标准物质实物库、数据库，为加强工农业生产力和产品竞争力，实现公平贸易，提供技术支撑。&nbsp;<br />\r\n&nbsp; &nbsp; 1．实验动物遗传资源&nbsp;<br />\r\n&nbsp; &nbsp; 建立种源数目近200种，以7～8个国家实验动物种质资源中心及20～30个功能独特的实验动物种源单位共同形成的实验动物繁育服务体系；建成细胞株（系）近千种、容量超过5000份的国家实验细胞库；加强资源数据库和信息库的建设，形成高效、有序、安全、与国际接轨的实验材料共享服务体系。&nbsp;<br />\r\n&nbsp; &nbsp; 2．标准物质整合共享体系<br />\r\n&nbsp; &nbsp; 以国家级的标准物质权威研究机构为核心，对化学成分量、物理化学特性、工程技术特性、生物化学和生物工程测量、核科学与放射性五大类，尤其对植物、动物、微生物、人类遗传等领域内的标准物质（含标准样品、参考品、对照品等）进行建设与整合。到2010年，在国家重要测量领域内，实现跨部门、跨行业整合共享标准物质5000种，5万份。</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-02 00:00:00',NULL),('52','测试公告002','平台公告','<p>22222222</p>\r\n','1','2015-09-13 00:00:00','1'),('52dfd44e5b70a443afa14dcbe536dbba1db0','tr4','教育培训','<p>444499999999999</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-11 09:46:35','1'),('58940de5f47-5480-479f-b9aa-5363e568c36c498','模式动物','科普信息','<p>模式动物</p>\r\n\r\n<p>&nbsp;</p>\r\n<embed height=\"600\" src=\"http://localhost:8081/SpringMVCHibernate/resources/files/1122.pdf\" width=\"800\"></embed>\r\n\r\n<p><a href=\"http://localhost:8081/SpringMVCHibernate/resources/files/1122.pdf\">参考文献</a></p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-10-20 00:00:00',NULL),('6','转摘国家科技基础条件平台建设概述','平台公告','<p>&nbsp;进入21世纪，科学技术迅猛发展带来的知识革命，在世界范围内对经济和社会发展产生着深刻的影响。社会经济的发展正在经历着重大的转型，科技创新的主导作用日益显著，知识资源的占有、配置、创造和利用方式的优劣，日益成为决定国家科技竞争力强弱的关键因素。随着知识经济与全球化时代的到来，支撑全社会创新活动的科技基础条件，日益成为国家的重要战略资源，日益显示出在国际竞争中的战略地位。科技基础条件的优化与重整，正在成为国家基础设施的重要组成部分，成为国际科技创新竞争的一个新的焦点，成为各国政府最具优先权的基本任务。发达国家普遍把科技基础条件的优化与加强作为强化竞争优势的一项国策，许多发展中国家也把科技基础条件的重整与提高当作实现跨越发展的战略举措。<br />\r\n&nbsp; &nbsp; 我国的科技基础条件工作经过长期努力，具备了较好的物质基础。特别是改革开放以来，我国的科技基础条件工作取得了很大的进展，积累了一些重点领域的科学数据和文献，建立了部分区域性的观测和监测网络，收集整理了一定数量的种源和标本，拥有了一批科技基础设施等。&ldquo;九五&rdquo;以来，在资源整合方面，也进行了积极的探索。推动了大型科学仪器和科技图书文献资源的共建共享工作，设立了&ldquo;科技基础工作专项资金&rdquo;。<br />\r\n&nbsp; &nbsp; 但是，在科技竞争日益激烈的今天，我国科技基础条件还远远不能满足科技发展的需要，仍然存在着亟待解决的突出问题，无论与发达国家相比，还是与科技经济发展日益增长的需求相比，差距都很大：一是缺乏国家层面的整体规划，分散浪费，建设薄弱，布局不合理；二是财政投入总量不够，配置不当；三是管理体制与方式不适应科技创新的要求，条块分割，部门封闭，单位所有，利用率低，共享机制缺乏，相应政策法规不完善；四是评价和激励机制不合理，人才队伍不稳，专业素质下降等等。<br />\r\n&nbsp; &nbsp; 我国科技基础条件建设的滞后与薄弱，已经严重影响了我国科技创新能力和国际竞争力的提高。加强科技基础条件建设，已经成为我国科技界迫在眉睫需要解决的问题，也是全科技界一致的呼声。<br />\r\n&nbsp; &nbsp; 改革开放以来，我国的经济社会发展取得巨大成就，综合国力明显增强，为加强国家科技基础条件建设提供了坚实的物质基础。<br />\r\n&nbsp; &nbsp; 为了贯彻落实《中共中央关于完善社会主义市场经济体制若干问题的决定》中&ldquo;改革科技管理体制，加快国家创新体系建设，促进全社会科技资源高效配置和综合集成，提高科技创新能力，实现科技和经济社会发展紧密结合&rdquo;的精神，科技部会同有关部门在广泛征求科技界意见的基础上，启动了国家科技基础条件平台（以下简称平台）建设，平台建设得到了国务院领导和有关部门的支持以及科技界的广泛赞同。<br />\r\n&nbsp; &nbsp; 平台是国家创新体系的重要组成部分，是服务于全社会科技进步与技术创新的基础支撑体系，主要由大型科学仪器设备和研究实验基地、自然科技资源保存和利用体系、科学数据和文献资源共享服务网络、科技成果转化公共服务平台、网络科技环境等物质与信息保障系统，以及以共享为核心的制度体系和专业化技术人才队伍三方面组成。平台建设就是要充分运用信息、网络等现代技术，对科技基础条件资源进行的战略重组和系统优化，以促进全社会科技资源高效配置和综合利用，提高科技创新能力。<br />\r\n&nbsp; &nbsp; 平台建设近期首先制定并颁布平台建设的总体规划，完成若干重点领域和区域科技基础条件资源的整合，实施一批对推动科技创新具有重要意义、能够有效带动资源共享的试点、示范工程，初步形成以共享为核心的制度框架，构件重要科技基础条件资源信息平台。到2010年，将初步建成适应科技创新和科技发展需要的科技基础条件支撑体系，以共享机制为核心的管理制度，与平台建设和发展相适应的专业化人才队伍和研究服务机构。</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-02 00:00:00',NULL),('6c225928b478754cd682794535c73702d269','测试公告004','平台公告','<p>4444444</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-07 14:27:10','5'),('6d4d65a7557-a99f-4fd2-a814-07170b79320a1009','test01',NULL,'1111',NULL,NULL,NULL),('7','国家科技支撑计划课题通过年度考核','平台公告','<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px; text-align: start;\">&nbsp; &nbsp; 2014年11月7-8日，由赵德明教授为组长，荣瑞章研究员、李根平研究员、金玫蕾研究员和代解杰研究员为组员的专家组，对国家科技支撑计划课题&quot;实验动物质量评价方法及其标准化研究与应用&quot;（编号2013BAK11B02）实施情况进行了年度考核。</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px;\">&nbsp;</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; font-family: SimSun,Tahoma,Helvetica,Arial,sans-serif; font-size: 14px; line-height: 25px;\"><img alt=\"\" src=\"http://www.lascn.net/UploadFiles/hyxw/2014/11/201411101715375255.jpg\" style=\"border:0px none; display:inline; height:323px; margin:0px; max-width:650px; padding:0px; width:551px\" /></div>\r\n\r\n<p>&nbsp;\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px;\">专家组及课题组成员</div>\r\n</p>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px; text-align: start;\">&nbsp; &nbsp; 课题组长中科院上海生命科学研究院徐平研究员首先代表课题组，向与会专家综合汇报了课题实施两年间的研究进展，以及存在的问题和下一年度的工作重点。各协作单位的课题负责人分别就自己承担的任务汇报了年度研究进展。</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px; text-align: start;\">&nbsp;</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px;\"><img alt=\"\" src=\"http://www.lascn.net/UploadFiles/hyxw/2014/11/201411101637357788.jpg\" style=\"border:0px; display:inline; height:344px; margin:0px; max-width:650px; padding:0px; width:550px\" /></div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px;\">徐平研究员做课题研究进展综合汇报</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px; text-align: start;\">&nbsp; &nbsp; 经质疑、答辩和讨论后，专家组认为，课题组按照任务书的要求和计划进度，较好地完成了年度的研究内容并达成相应的阶段性目标。同时建议，加强课题承担单位与各子课题间的沟通和合作，进一步完善实验动物质量评估方法的技术路线，细分相关的研究、调研工作，明确任务、牵头单位和时间进度。按照任务书的要求，抓紧各项任务节点，保质保量完成课题各项指标。</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px; text-align: center;\">&nbsp;<img alt=\"\" src=\"http://www.lascn.net/UploadFiles/hyxw/2014/11/201411101638363646.jpg\" style=\"border:0px; display:inline; height:348px; margin:0px; max-width:650px; padding:0px; width:550px\" /></div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px;\">专家组与课题组讨论</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px; text-align: start;\">&nbsp; &nbsp; 项目承担单位中国食品药品检定研究院贺争鸣研究员代表项目负责人作了重要讲话，他首先感谢专家组两年中持续对项目研究进展给予跟踪、检查、评估和指导。其次，对课题组两年中取得的阶段性研究成果给予了充分肯定，同时希望课题组克服合作单位多、任务重、时间短、经费紧等困难，在最后一年中继续通力合作，围绕课题总目标和专家组所提出了问题和建议，圆满完成国家科研任务。</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px; text-align: center;\">&nbsp;<img alt=\"\" src=\"http://www.lascn.net/UploadFiles/hyxw/2014/11/201411101639238419.jpg\" style=\"border:0px; display:inline; height:367px; margin:0px; max-width:650px; padding:0px; width:550px\" /></div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px;\">贺争鸣研究员代表项目负责人作重要讲话</div>\r\n\r\n<div style=\"padding: 0px; margin: 0px; zoom: 1; font-family: SimSun, Tahoma, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 25px; text-align: start;\">&nbsp; &nbsp; 会议期间，课题组还讨论了已成稿的14项技术规范和2项标准草案，并初步确定明年上半年在北京召开实验动物质量评估方法研讨会。</div>\r\n\r\n<p>&nbsp;</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-02 00:00:00',NULL),('8','2015年度国家实验动物种子中心发展研讨会','培训通知','<p>&nbsp;为加强国家实验动物种子中心的建设，提升实验动物中心的支撑保障能力，2015年8月14日，受国家实验动物专家委员会的委托，由中国食品药品检定研究院实验动物资源研究所（国家啮齿类实验动物种子中心，北京中心）在北京组织召开了2015年度国家实验动物种子中心发展研讨会。<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 科技部基础司崔春宇副调研员、平台中心卢凡处长、程苹副研究员出席会议。国家啮齿类实验动物种子中心北京中心、国家啮齿类实验动物种子中心上海分中心、国家兔类实验动物种子中心、国家遗传工程小鼠资源库、国家禽类实验动物种子中心、国家犬类实验动物种子中心、国家非人灵长类实验动物种子心（苏州分中心)和国家实验动物数据资源中心的负责人及有关人员参加了会议。同时，会议还邀请了国家实验动物专家委员会副主任委员李根平研究员、委员荣瑞章研究员、北京大学实验动物中心主任朱德生教授莅临指导，为种子中心的建设与完善、运行管理以及可持续发展提出意见和建议。会议由崔春宇副调研员和李根平研究员主持。<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 各中心分别就2015年度本中心人员队伍建设、动物保种供种情况、基础设施情况、存在问题、未来展望等问题做了汇报，并就各个中心发展中面临的主要问题提出解决方案及建议。<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 与会专家认为，在各方面的支持下，各种子中心工作得到发展，并取得很大成绩。种子中心的工作具有明显的公益性，一方面要依靠政府在政策和经费等方面给予支持，另一方面要靠自身解决，要通过保种供种过程拓展合作，扩大服务范围。成立行业协会不仅对种子中心，对整个实验动物行业发展会起到积极的作用，有些共性的问题可以由行业协会出面沟通，共建共享。<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 科技部领导在对种子中心工作给予肯定的基础上，提出：发挥国家实验动物专家委员会的指导作用；要站在战略角度做好种子中心的设计；各种子中心之间要进一步加强合作，形成合力；在种子中心的发展上要进一步拓展思路；要明确种子中心的位置和职责等。<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; 一年一度的&quot;国家实验动物种子中心发展研讨会&quot;已进行了五年，对种子中心的发展起到了重要的推动作用。</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-02 00:00:00',NULL),('9','比赛中的博尔特如果和鸟撞上了，会有什么后果？','平台公告','<p><span style=\"font-size:22px\">根据博尔特的世界纪录成绩，取平均值换算速度后接近于10m/s，也就是36km/h</span></p>\r\n\r\n<p>我曾今有一次坐单位的车出差，在高速匝道正准备上高速的时候，一只小猫头鹰从窗缝飞进来击中了司机前胸，猫头鹰一边的翅膀骨折，领导带回家喂养后放生，司机表示胸前有一块淤青痛了2天，当时的车速大概在40km/h左右</p>\r\n\r\n<p>由此推算博尔特撞鸟的话应该不会有太大的直接损伤，鸟的话最多也就是骨折吧，其他人的情况取决于博尔特之后会不会撞在他们身上</p>\r\n\r\n<p>说博尔特摔倒后各种擦伤扭伤的滚粗，说鸟被踩死的滚粗</p>\r\n\r\n<p><span style=\"color:#FF0000\">=============昏=======鸽======线==============</span></p>\r\n\r\n<p>好吧，被吐槽答案不全了，那我就再补充一下：</p>\r\n\r\n<p>速度是相对的，二者相撞不仅应该考虑博尔特的速度，还应该考虑鸟的速度</p>\r\n\r\n<p>查了一下，鸟类中飞行速度最慢的是小丘鹬（8km/h），最快的是尖尾雨燕（极限速度352.5km/h）</p>\r\n\r\n<p>小丘鹬就不用说了，加上这点速度对总体结果的影响也不大</p>\r\n\r\n<p>但如果是尖尾雨燕的话，二者正面相撞的相对速度已经达到接近400km/h，也就是说跟飞得比较慢的子弹是一样的了，而且考虑到雨燕的喙比较尖锐，体型也较小，所以二者相撞结果应该是这样：</p>\r\n\r\n<p><img src=\"http://2.im.guokr.com/rDQRbpvsXwLR6NHoQ0wKT06jcgxciwrQq_XWoD2wFLj_AwAAigIAAEpQ.jpg?imageView2/1/w/605/h/384\" /></p>\r\n\r\n<p>或者也有可能是这样：</p>\r\n\r\n<p><img src=\"http://1.im.guokr.com/krGPiwVltaE9ovVPAvle4UQuhzVUBqbthi8a92-sK1smAgAAewEAAEpQ.jpg\" /></p>\r\n\r\n<p>其他的鸟类相撞的结果大致也在以上说的几种之间</p>\r\n\r\n<p>还需要说明的是一些体型较大的鸟类，比如信天翁（速度没查到）和鸵鸟（72km/h），他们撞击的时候因为接触面比较大，所以可以近似地看作是钝器伤害，结果大概是这样的：</p>\r\n\r\n<p><img src=\"http://2.im.guokr.com/Xyk8S45hHcGEa9cijALY2bJa4EbjMKKJZrw5MUsO5c6QAQAAyAAAAEdJ.gif\" /></p>\r\n\r\n<p><img src=\"http://2.im.guokr.com/2oN_GoS4X_l7AwR64_wA3XTiLABBHKjnkA-X9jLoXAiQAQAAyAAAAEdJ.gif\" /></p>\r\n\r\n<p><strong>配图出自物语系列-伪物语</strong></p>\r\n\r\n<p><strong>配图出自物语系列-伪物语</strong></p>\r\n\r\n<p><strong>配图出自物语系列-伪物语</strong></p>\r\n\r\n<p><strong>老是有人问，所以我要说三遍！</strong></p>\r\n\r\n<p>最后，鉴于一些比较奇葩的鸟的存在，博尔特撞鸟事件的结果也可能是这样（渣渣ps不要在意）：</p>\r\n\r\n<p><img src=\"http://1.im.guokr.com/dIfGmcazhBG9nwNyyNBnq-iGLS3Pw55ITvYypLPL1cwZAgAA8QEAAEpQ.jpg\" /></p>\r\n\r\n<p>或者这样：</p>\r\n\r\n<p><img src=\"http://2.im.guokr.com/9ZY9tMG7vitUTsE15UMlLLTKhw_0Vp349tJEwPCVvWkFAgAA_QEAAFBO.png\" /></p>\r\n\r\n<p>还有这样：</p>\r\n\r\n<p><img src=\"http://3.im.guokr.com/D8Rx1ZeKMOw3t_PBQtum1Io8HMG9JyWGFySf9HtjqG6cAgAA-gEAAEpQ.jpg?imageView2/1/w/605/h/458\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>对此，博尔特君表示：</p>\r\n\r\n<p><img src=\"http://3.im.guokr.com/D8Rx1ZeKMOw3t_PBQtum1Io8HMG9JyWGFySf9HtjqG6cAgAA-gEAAEpQ.jpg?imageView2/1/w/605/h/458\" /></p>\r\n\r\n<p><img src=\"http://3.im.guokr.com/qAP6og32u-Hc2Y5cSNlr1-nCdlrdkxUuDhPl8qMhOI8ABAAAAAMAAEpQ.jpg?imageView2/1/w/605/h/454\" /></p>\r\n\r\n<p>嗯，回答完毕，谢谢观赏！</p>\r\n\r\n<p>&nbsp;</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-02 00:00:00',NULL),('d6c578d2c3e9b04e54b76416774d4af29d114','测试公告005','平台公告','<p>5555</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-07 14:58:33','1');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '标注',
  `announcement` varchar(5) DEFAULT NULL COMMENT '公告通知',
  `experiment` varchar(5) DEFAULT NULL COMMENT '特色实验',
  `law` varchar(5) DEFAULT NULL COMMENT '法律法规',
  `experimental_animal` varchar(5) DEFAULT NULL COMMENT '实验动物',
  `characteristic_animal` varchar(5) DEFAULT NULL COMMENT '特色动物',
  `species` varchar(5) DEFAULT NULL COMMENT '物种',
  `strain` varchar(5) DEFAULT NULL COMMENT '品系',
  `characteristic_equipment` varchar(5) DEFAULT NULL COMMENT '特色设备',
  `common_equipment` varchar(5) DEFAULT NULL COMMENT '常规设备',
  `technology` varchar(5) DEFAULT NULL COMMENT '技术服务',
  `training` varchar(5) DEFAULT NULL COMMENT '教育培训',
  `user_admin` varchar(5) DEFAULT NULL,
  `authority_admin` varchar(5) DEFAULT NULL,
  `file_admin` varchar(5) DEFAULT NULL,
  `message` varchar(5) DEFAULT NULL,
  `achievement` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES ('2407c170dc37-bbd2-4991-9daa-ab8a6658aa874125','www','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE','ADE'),('99999170dc37-bbd2-4991-9daa-ab8a6658aa874125','qqq','EAD','ADE','AE','AD','AE','A','A','A','A','A','A','A','A','A','AD','AD');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autopsy_data`
--

DROP TABLE IF EXISTS `autopsy_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autopsy_data` (
  `id` varchar(45) NOT NULL,
  `strain_id` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `autopsy_classification` varchar(45) DEFAULT NULL,
  `body_height` varchar(20) DEFAULT NULL,
  `body_length` varchar(20) DEFAULT NULL,
  `tail_length` varchar(20) DEFAULT NULL,
  `length_body_proportion` varchar(20) DEFAULT NULL,
  `body_inclined_length` varchar(20) DEFAULT NULL,
  `ear_length` varchar(20) DEFAULT NULL,
  `ear_width` varchar(20) DEFAULT NULL,
  `chest_width` varchar(20) DEFAULT NULL,
  `chest_depth` varchar(20) DEFAULT NULL,
  `stem_length` varchar(20) DEFAULT NULL,
  `fore_limb_length` varchar(20) DEFAULT NULL,
  `posterior_limb_length` varchar(20) DEFAULT NULL,
  `totality_skeleton` varchar(20) DEFAULT NULL,
  `skull` varchar(20) DEFAULT NULL,
  `cervical_vertebra` varchar(20) DEFAULT NULL,
  `thoracalis_vertebra` varchar(20) DEFAULT NULL,
  `lumbalis_vertebra` varchar(20) DEFAULT NULL,
  `sacrales_vertebra` varchar(20) DEFAULT NULL,
  `coccygeal_vertebra` varchar(20) DEFAULT NULL,
  `bird_sternum_length` varchar(20) DEFAULT NULL,
  `pelvis_width` varchar(20) DEFAULT NULL,
  `tibia_length` varchar(20) DEFAULT NULL,
  `heart` varchar(20) DEFAULT NULL,
  `lung` varchar(20) DEFAULT NULL,
  `liver` varchar(20) DEFAULT NULL,
  `spleen` varchar(20) DEFAULT NULL,
  `kidney` varchar(20) DEFAULT NULL,
  `brain` varchar(20) DEFAULT NULL,
  `thyroid` varchar(20) DEFAULT NULL,
  `renicapsule` varchar(20) DEFAULT NULL,
  `oarium` varchar(20) DEFAULT NULL,
  `testicle` varchar(20) DEFAULT NULL,
  `thymus_gland` varchar(20) DEFAULT NULL,
  `bursa_of_fabricius` varchar(20) DEFAULT NULL,
  `small_intestine` varchar(20) DEFAULT NULL,
  `caecum` varchar(20) DEFAULT NULL,
  `large_intesting` varchar(20) DEFAULT NULL,
  `rectum` varchar(20) DEFAULT NULL,
  `nipple` varchar(20) DEFAULT NULL,
  `milk_tooth` varchar(20) DEFAULT NULL,
  `permanent_tooth` varchar(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_autopsy_data_strain1_idx` (`strain_id`),
  CONSTRAINT `fk_autopsy_data_strain1` FOREIGN KEY (`strain_id`) REFERENCES `strain` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autopsy_data`
--

LOCK TABLES `autopsy_data` WRITE;
/*!40000 ALTER TABLE `autopsy_data` DISABLE KEYS */;
INSERT INTO `autopsy_data` VALUES ('1',NULL,'3','3','3','body_measurement_data','3','3','3','3','3','3','3','3','3','3','3','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-28'),('10','9','未知','不分雌雄','12 只','nipple_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10',NULL,NULL,'2015-10-08'),('10bfe0e0469-cc04-4ab2-b948-be77059809b0f36','146dfc03ff9fee84ffb9f7bd6155030cb00199','4','4','4','nipple_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',NULL,NULL,'2016-01-29'),('11','13','8 周','雄','6 只','body_measurement_data','','','5.70±2.91 ','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('12','13','8 周','雄','6 只','organ_weight_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'120±60','160±80','1040±510','70±30','280±150','320±160','2.7±1.3','5.9±5.0','','','20±140','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('126b259bd497-f4d4-4299-a447-9bf764724eae7ff','146dfc03ff9fee84ffb9f7bd6155030cb00199','2','2','2','organ_weight_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','2','2','2','2','2','2','2','2','2','2','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-29'),('13','13','8 周','雄','6 只','intestinal_length_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2.79±2.30','6.16±2.99','',NULL,NULL,NULL,'2015-10-08'),('13409e49db30-d6a5-47bb-8c21-1fdefa71fd6ed92',NULL,'3','3','3','dental_formula_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3','3','2015-10-29'),('14','13','-','-','12 只','nipple_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10',NULL,NULL,'2015-10-08'),('1457b41fec2f-4249-46cc-8c0f-d1786546d660db9','146dfc03ff9fee84ffb9f7bd6155030cb00199','8','8','8','body_measurement_data','8','8','8','8','8','8','8','88','8','8','8','88',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-29'),('15','14','8 周','雄','40 只','organ_weight_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'854.2±51.7','','7920.7±273.7','659.3±36.4','','2182.7±42.6','','','','','195.3±28.2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('16','14','8 周','雌','40 只','organ_weight_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'576.9±45.2','','4359.2±25.7','405.7±25.7','','1897.3±27.4','','','','','183.9±15.2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('17','14','','','40 只','nipple_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12',NULL,NULL,'2015-10-08'),('18','14','','','40 只','skeleton_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','7个','13个','6个','4个','27-32个','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('19','15','2 月','雄','50 只','body_measurement_data','','9.86±1.27','7.27±1.64','','','','','','','','3.13±0.47','5.47±0.57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('3',NULL,'5','5','5','intestinal_length_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','5','5','5',NULL,NULL,NULL,'2015-09-28'),('4',NULL,'6','6','6','nipple_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6',NULL,NULL,'2015-09-28'),('5',NULL,'7','7','7','dental_formula_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7','7','2015-09-28'),('5e45869fc47-94df-4325-893b-e7b411203da6152a','146dfc03ff9fee84ffb9f7bd6155030cb00199','8','7','8','body_measurement_autopsy_data','7','7','7','7','7','77','7','7','7','7','7','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-29'),('61f637e26fd-4ff8-4d63-abb6-7f300f6d54821433','146dfc03ff9fee84ffb9f7bd6155030cb00199','1','1','1','skeleton_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1','1','1','1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-29'),('657983b092b-70c2-49cc-9a7f-8537a42d8c411a6','146dfc03ff9fee84ffb9f7bd6155030cb00199','6','6','6','dental_formula_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6','6','2016-01-29'),('7',NULL,'3','54','34','dental_formula_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'234','32','2015-09-28'),('8','9','','','','organ_weight_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'130±16','120±7','930±88','60±16','140±21','410±35','','3.2±0.7','','','41±12','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('9','9','8 周','不分雌雄','12 只','intestinal_length_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2.15±0.26','6.80±0.55','',NULL,NULL,NULL,'2015-10-08'),('c282479bea-7951-444a-bc81-e1b3a5e2eced219','146dfc03ff9fee84ffb9f7bd6155030cb00199','3','3','3','intestinal_length_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3','3','3','3',NULL,NULL,NULL,'2016-01-29');
/*!40000 ALTER TABLE `autopsy_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biochemical_data`
--

DROP TABLE IF EXISTS `biochemical_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biochemical_data` (
  `id` varchar(45) NOT NULL,
  `strain_id` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `biochemical_classification` varchar(45) DEFAULT NULL,
  `blood_ph` varchar(45) DEFAULT NULL,
  `blood_na` varchar(45) DEFAULT NULL,
  `blood_k` varchar(45) DEFAULT NULL,
  `blood_ca` varchar(45) DEFAULT NULL,
  `blood_mg` varchar(45) DEFAULT NULL,
  `blood_cl` varchar(45) DEFAULT NULL,
  `blood_p` varchar(45) DEFAULT NULL,
  `blood_fe` varchar(45) DEFAULT NULL,
  `total_bilirubin` varchar(45) DEFAULT NULL,
  `lithic_acid` varchar(45) DEFAULT NULL,
  `c_hdl` varchar(45) DEFAULT NULL,
  `c_ldl` varchar(45) DEFAULT NULL,
  `ast` varchar(45) DEFAULT NULL,
  `alt` varchar(45) DEFAULT NULL,
  `alp` varchar(45) DEFAULT NULL,
  `ldh` varchar(45) DEFAULT NULL,
  `cre` varchar(45) DEFAULT NULL,
  `bun` varchar(45) DEFAULT NULL,
  `tch` varchar(45) DEFAULT NULL,
  `tp` varchar(45) DEFAULT NULL,
  `alb` varchar(45) DEFAULT NULL,
  `tg` varchar(45) DEFAULT NULL,
  `glu` varchar(45) DEFAULT NULL,
  `progesterone` varchar(45) DEFAULT NULL,
  `urine_ph` varchar(45) DEFAULT NULL,
  `up` varchar(45) DEFAULT NULL,
  `ua` varchar(45) DEFAULT NULL,
  `urine_na` varchar(45) DEFAULT NULL,
  `urine_k` varchar(45) DEFAULT NULL,
  `urine_ca` varchar(45) DEFAULT NULL,
  `urine_mg` varchar(45) DEFAULT NULL,
  `urine_cl` varchar(45) DEFAULT NULL,
  `specific_weight` varchar(45) DEFAULT NULL,
  `upd` varchar(45) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_biochemical_data_strain1_idx` (`strain_id`),
  CONSTRAINT `fk_biochemical_data_strain1` FOREIGN KEY (`strain_id`) REFERENCES `strain` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biochemical_data`
--

LOCK TABLES `biochemical_data` WRITE;
/*!40000 ALTER TABLE `biochemical_data` DISABLE KEYS */;
INSERT INTO `biochemical_data` VALUES ('1',NULL,'12','21','12','urine_biochemical_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1','1','1','1','1','12323','2015-09-25'),('10','14','8 周','雌','40 只','blood_biochemical_data','','','',' 2.66±0.067823299831261','','','2.654±0.207482261624668',NULL,NULL,NULL,NULL,NULL,'','','','','25.37±1.97374432656987','7.482±0.571310384603305','1.669±0.178228941408389','5.4736±0.382796203394611','2.998±0.133566462856514','0.44±116332855777434','5.2±0.424264068711914','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('11','14','8 周','雄','40 只','blood_biochemical_data','','','','2.643±0.0880719402912411','','','3.148±0.410414424697765',NULL,NULL,NULL,NULL,NULL,'','','909±91.2201244852862','','25.04±1.49011558090119','6.67±0.588104299139769','1.863±0.16104174752046','5.7223±0.22169200356453','3.202±0.149502879942525','0.45±0.211974841274462','4.3±0.466666666666657','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('12','15','2 月','雄','50 只','blood_biochemical_data','','149.22±1.50','4.61±0.55','2.21±0.09','1.14±0.11','113.93±2.27','','43.2±10.00','1.39±0.38',NULL,'1.49±0.17','0.47±0.12','225.09±54.77','81.07±27.47','367.68±79.25','17.00±5.21','47.64±4.44','11.46±1.40','2.31±0.34','50.52±2.84','35.71±1.53',' 0.53±0.17','6.84±2.28','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('13','15','2 月','雌','50 只','blood_biochemical_data','','150.88±3.37','4.41±0.74','1.72±0.62','0.92±0.29','109.56±4.01 ','0.39±0.14','32.8±9.8','1.12±0.45',NULL,'1.18±0.27','0.39±0.14','209.22±58.75','69.24±23.58','246.28±89.23','10.81±3.8','42.81±5.86','13.42±1.83','1.67±0.75','43.43±14.89','30.03±4.55','0.49±0.16','5.65±1.98','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('137f3fb8792d-1c2e-4b63-9d7c-c652e4c42b93539','146dfc03ff9fee84ffb9f7bd6155030cb00199','5','5','5','urine_biochemical_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','5','5','5','5','5','5','5','5','5','2016-01-29'),('14','15','12 月','雌','13 只','blood_biochemical_data','','','','','','','','','',NULL,'','','','','131.85±50.87','','','15.38±3.68','','47.31±5.79','22.55±2.88','0.63±0.45','3.81±1.09','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('15','15','12 月','雄','14 只','blood_biochemical_data','','','','','','','','','',NULL,'','','','','134.00±32.85','','','14.82±3.17','','51.57±4.93','25.76±2.26','1.00±0.82','5.05±1.64','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('15407fcab422-b192-4672-8c71-8772f7b79f3421cc','146dfc03ff9fee84ffb9f7bd6155030cb00199','3','33','3','blood_biochemical_data','3','3','3','3','3','3','33','3','33',NULL,'3','333','3','3','3','3','3','333','33','3','33','3','3','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-28'),('16','15','4 月','雌','108 只','blood_biochemical_data','','','','','','','','','',NULL,'','','','','218.57±77.56','','','13.30±3.39','','40.20±10.00','26.81±2.58','1.18±0.48','3.58±1.43','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('16a65a05abaa-1498-4c3b-a384-1ceb7396c46317b2','146dfc03ff9fee84ffb9f7bd6155030cb00199','2','2','1','blood_biochemical_data','23','23','','','','','','','',NULL,'','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-28'),('17','15','4 月','雄','85 只','blood_biochemical_data','','','','','','','','','',NULL,'','','','','229.87±67.81','','','12.77±1.88','','46.83±8.81','27.70±2.11','1.17±0.41','3.84±1.58','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('18','15','3 月','雌','43 只','blood_biochemical_data','','','','','','','','','',NULL,'','','','','351.26±113.09','','','12.98±3.01','','42.33±5.01','32.43±7.74','1.19±0.52','4.72±1.85','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('19','15','3 月','雄','34 只','blood_biochemical_data','','','','','','','','','',NULL,'','','','','351.53±135.41','','','12.44±2.58','','43.68±3.00','32.50±6.50','1.26±0.47','5.58±3.21','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('20','15','2 月','雌','40 只','blood_biochemical_data','','','','','','','','','',NULL,'','','','','518.73±175.07','','','12.75±2.66','','42.30±3.98','27.33±2.71','1.45±0.42','4.55±1.46','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('21','15','2 月','雄','37 只','blood_biochemical_data','','','','','','','','','',NULL,'','','','','533.69±161.43','','','12.8±2.49','','41.75±3.06','27.50±1.95','1.44±0.28','4.53±1.10','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('2661a668e8bf-9dc0-4497-a586-b5a57660abd6c52',NULL,'6','6','6','urine_biochemical_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6','6','6','6','6','6','6','6','6','6','2015-10-29'),('3',NULL,'88','88','8','blood_biochemical_data','8','8','8','8','8','8','8',NULL,NULL,NULL,NULL,NULL,'88','8','8','8','8','8','8','8','8','8','8','88',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-25'),('5',NULL,'56','5','5','blood_biochemical_data','5','5','5','55','5','5','5',NULL,NULL,NULL,NULL,NULL,'5','5','5','5','5','5','5','5','5','5','55','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-09-28'),('6',NULL,'8','8','8','urine_biochemical_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','8','8','8','8','8','8','8','8','2015-09-28'),('7','9','8 周','不分雌雄','12 只','blood_biochemical_data','','','','','','','',NULL,NULL,NULL,NULL,NULL,'','','','','14.37±7.92','8.25±3.23','1.69±0.75','65.32±3.52','','2.78±0.54','2.22±0.89','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('8','11','4 周','不分雌雄','40 只','blood_biochemical_data','','','','','','','',NULL,NULL,NULL,NULL,NULL,'','','','','3.89±2.53','5.87±2.59','1.96±0.77','44.72±15.23','25.62±8.25','0.62±0.22','2.66±1.32','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08'),('9','12','4 周','不分雌雄','40 只','blood_biochemical_data','','','','','','','',NULL,NULL,NULL,NULL,NULL,'','','','','9.50±3.19','8.43±2.87','3.01±1.09','57.45±10.21','32.58±4.81','2.14±0.62','2.66±1.59','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08');
/*!40000 ALTER TABLE `biochemical_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristic_animal`
--

DROP TABLE IF EXISTS `characteristic_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characteristic_animal` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `species_id` varchar(45) DEFAULT NULL,
  `photo_id` varchar(45) DEFAULT NULL,
  `preparation` varchar(1000) DEFAULT NULL,
  `save_place` varchar(100) DEFAULT NULL,
  `save_info` varchar(500) DEFAULT NULL,
  `quantity` varchar(200) DEFAULT NULL,
  `note` varchar(2500) DEFAULT NULL,
  `contact_id` varchar(45) DEFAULT NULL,
  `issuer_id` varchar(45) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_characteristic_animal_species1_idx` (`species_id`),
  KEY `fk_characteristic_animal_admin1_idx` (`issuer_id`),
  KEY `fk_characteristic_animal_person1_idx` (`contact_id`),
  KEY `fk_characteristic_animal_file1_idx` (`photo_id`),
  KEY `fk_characteristic_animal_organization_idx` (`organization`),
  CONSTRAINT `fk_characteristic_animal_admin1` FOREIGN KEY (`issuer_id`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_characteristic_animal_file1` FOREIGN KEY (`photo_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_characteristic_animal_organization` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_characteristic_animal_person1` FOREIGN KEY (`contact_id`) REFERENCES `person` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_characteristic_animal_species1` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristic_animal`
--

LOCK TABLES `characteristic_animal` WRITE;
/*!40000 ALTER TABLE `characteristic_animal` DISABLE KEYS */;
INSERT INTO `characteristic_animal` VALUES ('1','eee','1',NULL,'eee','eee','eee','eee','<p>eee</p>\r\n','1','1','1','2015-09-11 00:00:00'),('146085fa18103c341fdad487b7fcce06d523c2','她她她2','4',NULL,'123','321','123','312','<p>123</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2','2016-02-15 09:04:16'),('2','AAA','1',NULL,'AAA','SSS','SSS','SSS','AAS','1','1',NULL,'2015-09-11 00:00:00');
/*!40000 ALTER TABLE `characteristic_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `id` varchar(45) NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `classification` varchar(80) DEFAULT NULL,
  `collection_id` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collection_admin1_idx` (`user_id`),
  CONSTRAINT `fk_collection_admin1` FOREIGN KEY (`user_id`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES ('105b8933c270-8ca2-43cc-b7f5-85c9b004c644193f','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','sydw','11','2015-11-19 08:57:41'),('127deb7709bf-b6b4-4b00-918e-32db1e4ae79c16b4','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','sydw','175830f30da6-d9fe-4e9d-9918-adb3d487ef1c10f2','2015-11-26 10:42:33'),('184ce99bc87f-5051-4dc5-8757-4587ace8eeb3896','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','sydw','1','2015-12-25 11:35:47'),('192ea4008efa-9783-4b61-921f-051a8054524624da','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','sydw','1','2016-01-05 09:15:52'),('1bca10a07e9d-2555-47c8-aa70-12c9c72bcdca20e2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','sydw','7','2015-11-17 10:27:04'),('211cd21ac637-424c-4b2a-90c7-c7332efe55111bb','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','jsfw','12b64e706a8e-ddcf-43d1-a32a-c8d9f4458f5c','2015-12-07 11:05:04'),('2180aafe27e5-b141-453c-b374-f03769d5a4baecd','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','sydw','10','2015-11-25 14:27:39'),('246e1a9b917a-30d5-4a22-b01a-13e07fed21f2180f','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','tsdw','1','2015-12-25 12:00:44'),('253887953bf9-dcf8-4e8e-9f1b-5a2e03e4663226d8','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','jsfw','12b64e706a8e-ddcf-43d1-a32a-c8d9f4458f5c','2015-12-25 10:59:00'),('26e66d19d160-1817-4c43-80a5-d8c32d057ce512dc','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','tsdw','2','2016-01-05 09:08:35'),('31cc6b4c294-fa35-4968-945f-b9dd82491a12242b','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','tsdw','1','2015-12-25 12:00:06'),('98383c085a5-aeb9-4674-94f4-c3273d27c15b116b','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','tsdw','1','2016-01-05 09:00:49'),('b121d60ac20-ecd2-4c67-92ad-46d50d8575442217','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','tedw','759a3a2b392-0711-4cf1-8e27-50577b407232cd8',NULL),('edae0a75dcd-18c9-4e96-b6ef-a7a55d012a0064c','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','sydw','759a3a2b392-0711-4cf1-8e27-50577b407232cd8','2015-11-17 11:12:31'),('f3628043c22-d435-4679-a977-11dc5efd51f340d','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','sydw','10','2016-01-04 09:02:19'),('f5d11795add-9382-4d18-a4fb-6231d26ac27c24f9','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','tsdw','1','2016-01-05 09:01:25'),('ffa7c170dc37-bbd2-4991-9daa-ab8a1efa801a3432','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','sydw','12b64e706a8e-ddcf-43d1-a32a-c8d9f44517b21e75','2015-11-09 15:47:29');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(100) DEFAULT NULL,
  `classification` varchar(45) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `note` varchar(3000) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_equipment_admin1_idx` (`issuer`),
  KEY `fk_equipment_organization1_idx` (`organization`),
  KEY `fk_equipment_file1_idx` (`image`),
  KEY `fk_equipment_person1_idx` (`contact`),
  CONSTRAINT `fk_equipment_admin1` FOREIGN KEY (`issuer`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_file1` FOREIGN KEY (`image`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_organization1` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_person1` FOREIGN KEY (`contact`) REFERENCES `person` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES ('1','特色上海亚荣旋转蒸发器','RE-5220','characteristic','1','1',NULL,'新颖落地式旋转蒸发器，采用大容量，大口径旋转蒸发瓶，增大蒸发面积，','1','2016-02-18 11:43:33'),('2','上海青浦沪西电子钟控自动部份收集器','BSZ-40液晶版','common','2','1',NULL,'收集试管  ','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-02-18 11:43:33'),('5','上海亚荣旋转蒸发器','RE-5220  ','common','4','2',NULL,'<p>新颖落地式旋转蒸发器，采用大容量，大口径旋转蒸发瓶，增大蒸发面积</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-08-31 00:00:00'),('6','特色上海青浦沪西电子钟控自动部份收集器  ','BSZ-40液晶版','characteristic','2','1',NULL,'<p>收集试管 &nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-08-31 00:00:00');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment`
--

DROP TABLE IF EXISTS `experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment` (
  `id` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `team` varchar(200) NOT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `equipment` varchar(45) DEFAULT NULL,
  `note` varchar(3000) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_experiment_admin1_idx` (`issuer`),
  KEY `fk_experiment_equipment1_idx` (`equipment`),
  KEY `fk_experiment_organization1_idx` (`organization`),
  CONSTRAINT `fk_experiment_admin1` FOREIGN KEY (`issuer`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_experiment_equipment1` FOREIGN KEY (`equipment`) REFERENCES `equipment` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_experiment_organization1` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment`
--

LOCK TABLES `experiment` WRITE;
/*!40000 ALTER TABLE `experiment` DISABLE KEYS */;
INSERT INTO `experiment` VALUES ('1','基因敲出','王天山','1','1','<p>天山万岁！</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-07 00:00:00'),('176a4e00de09fa049f5b836365c74c0ebbedc','克隆自己的实验','王小山','3','2','<p>2222</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-02-15 10:48:46'),('2','基因敲出2','wts','1','2','<p>1111</p>\r\n','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-07 00:00:00');
/*!40000 ALTER TABLE `experiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experimental_animal`
--

DROP TABLE IF EXISTS `experimental_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experimental_animal` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `strain_id` varchar(45) DEFAULT NULL,
  `photo_id` varchar(45) DEFAULT NULL,
  `dna_name` varchar(100) DEFAULT NULL,
  `application` varchar(200) DEFAULT NULL,
  `preparation` varchar(1000) DEFAULT NULL,
  `preparation_ref` varchar(1000) DEFAULT NULL,
  `phenotype` varchar(1000) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `save_info` varchar(500) DEFAULT NULL,
  `quantity` varchar(200) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  `contact_id` varchar(45) DEFAULT NULL,
  `issuer_id` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_experimental_animal_strain1_idx` (`strain_id`),
  KEY `fk_experimental_animal_admin1_idx` (`issuer_id`),
  KEY `fk_experimental_animal_person1_idx` (`contact_id`),
  KEY `fk_experimental_animal_file1_idx` (`photo_id`),
  KEY `fk_experimental_animal_organization_idx` (`organization`),
  CONSTRAINT `fk_experimental_animal_admin1` FOREIGN KEY (`issuer_id`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_experimental_animal_file1` FOREIGN KEY (`photo_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_experimental_animal_organization` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_experimental_animal_person1` FOREIGN KEY (`contact_id`) REFERENCES `person` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_experimental_animal_strain1` FOREIGN KEY (`strain_id`) REFERENCES `strain` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experimental_animal`
--

LOCK TABLES `experimental_animal` WRITE;
/*!40000 ALTER TABLE `experimental_animal` DISABLE KEYS */;
INSERT INTO `experimental_animal` VALUES ('1','Slac:Syrian-Wt1','15','a35c69ec545-1c42-4533-91c3-4914e7e5a7821f7e','Wt1','对肾脏和性腺发育异常的研究','全身敲除（conventional knockout）','<p>[1] Kreidberg, J. A., H. Sariola, J. M. Loring, M. Maeda, J. Pelletier, D. Housman, and R. Jaenisch. 1993. WT-1 is required for early kidney development. Cell 74:679&ndash;691.<br />\r\n[2] Kreidberg, J. A., H. Sariola, J. M. Loring, M. Maeda, J. Pelletier, D. Housman, and R. Jaenisch. 1993. WT-1 is required for early kidney development. Cell 74:679&ndash;691.<br />\r\n[3] Kreidberg, J. A., H. Sariola, J. M. Loring, M. Maeda, J. Pelletier, D. Housman, and R. Jaenisch. 1993. WT-1 is required for early kidney development. Cell 74:679&ndash;691.</p>\r\n','胚胎致死，肾脏和性腺发育异常','美国JAX Lab','中科院动物所高飞研究员课题组保种','100~150只/月','<p>资源纯交易性共享,合作研究共享,资源交换性共享。</p>\r\n\r\n<p>保温,通风换气,等级包装箱。</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-12-22 00:00:00',NULL),('11','测试实验动物05','9',NULL,'DSD','GFDG','DFGD','<p>DFGDFGFDG</p>\r\n','SFF','DFG','DG','DGFDFG','<p>DFGDGFDGF</p>\r\n\r\n<p>DFGDFGDFG</p>\r\n\r\n<p>DFGDFGDGDGF</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-09-21 00:00:00','4'),('12b64e706a8e-ddcf-43d1-a32a-c8d9f44517b21e75','test_dwsiii','15','23f187790f39-fb0d-4258-9c79-813f0acac507dae','4','4','4','<p>4</p>\r\n','4','4','4','4','<p>4</p>\r\n','1',NULL,'2015-12-10 00:00:00',NULL),('13','测试实验动物08','12',NULL,'TYUTYU','TUU','TYUTYU','<p>YTUTYUU</p>\r\n','UYYUT','YUUY','UYTU','TYU','<p>UYUTYU</p>\r\n','2',NULL,'2015-09-21 00:00:00',NULL),('135ac996cd04-56f1-405d-83a4-a038653a134015b8','3','12','a35c69ec545-1c42-4533-91c3-4914e7e5a7821f7e','3','3','3','<p>3</p>\r\n','3','3','3','3','<p>3</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-10 00:00:00',NULL),('1364e190283c-af21-4dbe-ba58-d731ece45aba18d8','aa8','14','40','q','q','q','<p>q</p>\r\n','q','q','q','q','<p>q</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('13e65eba247e-4f82-43e6-952f-40621cc0fdff7d8','shulanbaobao',NULL,NULL,'q1w2e3','q1q1q1','1q1q1q','<p style=\"text-align: center;\">qwe<span style=\"color:#B22222\">qwe</span></p>\r\n','q1w2e3','qw','ewq','ewqe','<p>eqwe</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-11-26 00:00:00',NULL),('14a36cd53575ad343c7b32726a13a8af5f2125','ttt121','12',NULL,'1','1','1','<p>121212</p>\r\n\r\n<p>121212</p>\r\n\r\n<p>121212</p>\r\n','1','1','1','1111','<p>1</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-02-03 14:45:09','1'),('15','测试实验动物10','11',NULL,'UIO','UIO','UIO','<p>OIU</p>\r\n','UIO','UIO','OIU','UIO','<p>OUIOO</p>\r\n','2',NULL,'2015-09-21 00:00:00',NULL),('15d367bad281-dc7f-4dd9-8019-e630ebcb08eff6f','a44','1','23f187790f39-fb0d-4258-9c79-813f0acac507dae','2','2','2','<p>2</p>\r\n','2','2','2','2','<p>2</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-10 00:00:00',NULL),('15d8ea7debff-28fe-403d-b105-4922d842a1c7c4a','aa4','14','40','1','1','1','<p>1</p>\r\n','1','1','1','1','<p>1</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('16','测试实验动物11','1',NULL,'GJGHJ','HHH','JJJ','<p>HHH</p>\r\n','JHGJ','JHJ','GHJGHJ','JGGJH','<p>GHJJHG</p>\r\n\r\n<p>JHGJ</p>\r\n\r\n<p>GHJJHGJHGJHGHJ</p>\r\n','2',NULL,'2015-09-21 00:00:00',NULL),('1610f115a119-3f4d-4f9e-891a-4e9c4a2cfdd71e31','aa6','15','5bfdc0e8131-9a10-4cdf-9020-f74537b7a94e45','6','6','6','<p>6</p>\r\n','6','6','6','6','<p>6</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('17','测试实验动物12','11',NULL,'WERWER','ETRERT','TERTE','<p>ERTETR</p>\r\n','RTERT','ERTRET','5456','YRTY','<p>RTYTR</p>\r\n','2',NULL,'2015-09-21 00:00:00',NULL),('175830f30da6-d9fe-4e9d-9918-adb3d487ef1c10f2','测试动物AA2','11',NULL,'ads','cscd','cdscs','<p>scdc</p>\r\n','dsa','sdcds','csdcd','csdc','<p>sdcdsc</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('178b07d9a632-3c6e-47cb-8b94-cb26d6abcacdbe4','aa9','12','56dfdbde59e-08ec-49f9-8926-6732511373b411eb','2','2','2','<p>2</p>\r\n','2','2','2','2','<p>2</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('17eae542424-bf90-44b1-94a8-f49f1ef3fdd3a21','测试动物ppppp','12','2220fa503c89-4ca6-4432-b3dd-b7e95edffc8ffc8','qweqwe','67867','678678','<p>6878u678</p>\r\n','77777778','867u6','u67u67','u67u67','<p>7u67u</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-10 00:00:00',NULL),('18','测试实验动物13','11',NULL,'WERWER','WER','WER','<p>WERR</p>\r\n','ERW','WRE','REW','WER','<p>WER</p>\r\n','1',NULL,'2015-09-21 00:00:00',NULL),('1804fae55f44-0147-4f1f-987a-3c5629b5d7bd123f','aa11','1','62401831492-91ca-4b8d-9346-2b6744fd9ac31dc4','3','3','4','<p>4</p>\r\n','3','4','4','4','<p>4</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('19','测试实验动物14','12',NULL,'RER','6Y65','5Y56Y','<p>Y56Y5Y</p>\r\n','HHH','56Y56Y','56Y56Y','Y65Y6Y','<p>56Y65Y</p>\r\n','2',NULL,'2015-09-21 00:00:00',NULL),('19102f5d72ef-b7e7-43f1-b59a-6d07c724f1b02380','测试动物AA7','9',NULL,'dfgdf','rtte','fdf','<p>t55t4</p>\r\n','dfggf','t54t','fff45','t54t45','<p>t45t45</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('19b9b0a48a26-fc55-41be-9fa6-824a6d6c9e4a1df3','测试动物AA1','1',NULL,'sss','s','sdfsd','<p>asd</p>\r\n','sss','dasd','asd','asd','<p>asdsda</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('1c16bd4ea3d8-87ff-4fcd-a72b-986619a5be7b138e','test_dws07','14',NULL,'7','7','7','<p>7</p>\r\n','7','7','7','7','<p>7</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-02 00:00:00',NULL),('1c64d9cb99b3-745f-4d3b-8323-b29e253e57a09fd','测试动物AA5','12',NULL,'y65y','gfgt','rtgrt','<p>grtggtre</p>\r\n','y56y','try','rty','gtr','<p>ytt5555</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('1f6cd5bd52f1-412c-450e-a27f-cce4928213372602','aa13','15','37','aa','a','a','<p>a</p>\r\n','a','a','a','a','<p>a</p>\r\n','4','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('1fce66755bc3-bb9c-4ea9-b678-cace14168256171f','aa1','9','7f0a2a5141a-fc56-4d78-9590-55fbbdab2bd4142c','12','2','2','<p>2</p>\r\n','2','2','2','2','<p>2</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('1fdba68ae873-6552-403c-a577-b7325ea6a09a3f9','aa2','12','38','2','222','22','<p>2</p>\r\n','2','2','2','22','<p>2</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('20','测试实验动物15','11',NULL,'RTYRTY','YRTYR','RTYTR','<p>RTYTRY</p>\r\n','YTRYTR','YRTYY','RTYRTY','TRYRTY','<p>RTYTYR</p>\r\n','1',NULL,'2015-10-19 00:00:00',NULL),('211190743704-1402-44f3-ad72-d16cf97608e8255e','aa12','12','40','ee','e','e','<p>e</p>\r\n','e','e','e','e','<p>e</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('220edaa9ce30-c865-4b22-8cef-75d9cefefa8eacd','a4',NULL,'7f0a2a5141a-fc56-4d78-9590-55fbbdab2bd4142c','q','2','2','<p>2</p>\r\n','2','2','2','2','<p>2</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-10 00:00:00',NULL),('22cce98c1ec5-b9b0-4428-be0a-78ebae5a400f1ba3','t456','1','39','456','654','6456','<p>456645</p>\r\n','654','456','5456','456','<p>4566546</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-07 00:00:00',NULL),('2323a2f25297-4e03-483c-bd28-3819994079651423','a6','14','37','ww','w','w','<p>w</p>\r\n','w','w','w','','<p>w</p>\r\n','4','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-10 00:00:00',NULL),('23727587d922-d07d-4ae3-af5f-30bf85cacaa11a6f','aa14','13','39','a','a','a','<p>a</p>\r\n','a','a','a','a','<p>a</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('24b4716f0d4-e296-4397-8a48-dcba68761c661793','测试动物AA4','15',NULL,'dsfds','dasd','fvdf','<p>bgbf</p>\r\n','r4r4','r4r4','sfdf','sfd','<p>werwe</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('25115be30a21-5308-4d61-9f48-c0e69f7044a11ee4','A1','13','37','123123','1','1','<p>1</p>\r\n','21','1','1','1','<p>1</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-10 00:00:00',NULL),('255526caa0d3-fe31-4bd3-875a-6847bb8a2cc125c1','测试动物AA3','14',NULL,'asd','dsdds','xccx','<p>xczxc</p>\r\n','asdasd','ewe3','dasda','asddas','<p>adsad</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('26ee90c50cad-9c6b-48a0-9aa1-e852c5ccf6661dbc','aa7','12','40','3','3','3','<p>3</p>\r\n','3','3','3','3','<p>3</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('3180fc2eda843f94f92880ef5f932ecd6c73b2','555','9',NULL,'5','5','5','<p>5</p>\r\n','5','5','5','5','<p>5</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-02-03 17:02:57','1'),('4','测试实验动物01','15',NULL,'WWWID','宠物','抓野生的','<p>11111111111111111111<img alt=\"sad\" src=\"http://localhost:8081/SpringMVCHibernate/resources/ckeditor/plugins/smiley/images/sad_smile.png\" style=\"height:23px; width:23px\" title=\"sad\" /></p>\r\n','毛茸茸','毛茸茸毛茸茸','毛茸茸毛茸茸','毛茸茸毛茸茸','<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7 screen-scroll\"> <![endif]--><!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8 screen-scroll\"> <![endif]--><!--[if IE 8]>         <html class=\"no-js lt-ie9 screen-scroll\"> <![endif]-->\r\n<h1 style=\"text-align:center\">褐边绿刺蛾</h1>\r\n\r\n<div class=\"container\">\r\n<div class=\"article\" id=\"contentMain\">\r\n<div class=\"article-header\">\r\n<p style=\"text-align:center\">昨天00:00霜天蛾</p>\r\n</div>\r\n\r\n<div class=\"content\" id=\"articleContent\">\r\n<div>\r\n<p>褐边绿刺蛾 <em>Parasa consocia</em>，刺蛾科，绿刺蛾属，华北与华东地区较常见，是城市绿化植物的主要害虫之一。刺蛾科俗称洋辣子、毛辣子、凤辣子（划掉）等等，如果不慎触碰到它们的幼虫，会非常酸爽。各种辣子有鲜艳的，有灰扑扑不起眼的，也有不怎么辣的，褐边绿刺蛾就属于较鲜艳的那一类。</p>\r\n\r\n<p>褐边绿刺蛾比较小，体长17mm左右，翅展约32mm，头胸部和前翅绿色，后翅淡黄色，背部隆起，胫节和第一跗节有褐色毛丛。雄蛾触角单栉齿状，雌蛾线性，前翅基角各有一块略带放射形的褐色星状斑，外缘有一弧形浅褐色带，带内部有深褐色脉纹。</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"http://3.im.guokr.com/oqXZdY76EV3lHI7mt-y7ao8U5iV7yPrGLELQficHaGJTAQAA_gAAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>褐边绿刺蛾 图片来自<a href=\"http://www.jpmoth.org/\">www.jpmoth.org</a></em></p>\r\n\r\n<p>褐边绿刺蛾幼虫身体肥短，黄色或绿色，生满短粗的带刺毛的枝状刺，有时候会有四对枝状刺较粗大，背中线蓝色，两侧有多数黑色斑。头小，缩入前胸，从外表一般看不到，胸足小，腹足退化成吸盘状，这种形态叫蛞蝓式，往往分不清头尾。不过褐边绿刺蛾幼虫的体末端会有4个黑色的毛簇，可以分辨。</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"http://2.im.guokr.com/yKGJSlKcP_AsteIalIjVclMOKKaY7_hZKcBY9dLat2qfAQAAIwEAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>图片来自<a href=\"http://www.qyly.net/\">www.qyly.net</a> </em></p>\r\n\r\n<p>褐边绿刺蛾的毒毛具有蛋白类毒素，接触可引起难以忍受的刺痛、奇痒，伴有皮肤红肿和斑疹，症状可持续一个月左右，有人说拿肥皂水洗一洗就好， 不过我们小时候都皮实，被蛰过从来不处理，忍一忍就给忘了。</p>\r\n\r\n<p>褐边绿刺蛾食性较广泛，寄主多达32科植物。主要为蔷薇科、杨柳科、悬铃木科等等。小时候经常去玩的一个街心花园里，紫叶李和二球悬铃木是重灾区，悬铃木经常会落叶，一片落叶上往往会有两三条幼虫，小孩子都喜欢去捡叶子玩，第一次摸的时候一般都会伴着一声嚎叫，等到学乖了，就会把它们当武器，纷纷举着叶子去和别的区的孩子打仗了。</p>\r\n\r\n<p>褐边绿刺蛾一年发生两代，第一代成虫每年五六月间方出现。成虫在叶背面产下重叠排列的卵块，六月至7月间第一代幼虫孵化。初龄幼虫不取食，3龄后集中取食，啃食叶表皮，6龄后分散取食，而在整个幼虫阶段要经过8龄才会结茧进入蛹期。</p>\r\n\r\n<p>我们经常会在树枝间看到类似鸟蛋般光滑，上面还有纵纹的茧，那是黄刺蛾<em>Cnidocampa flavescens</em>的茧，而褐边绿刺蛾的茧多营在树下土层中或枯叶中，表面布满丝和黑色的毒毛，由于刺蛾科毒毛在脱离虫体很久后仍有毒性，所以误触带毒毛的茧或是幼虫蜕下的皮也会被蛰伤。如果不幸被蛰了，反正没有生命危险，你可以趁机试试老友记里推荐的水母蛰伤急救法<a href=\"http://www.guokr.com/article/437126/\">http://www.guokr.com/article/437126/</a></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"http://3.im.guokr.com/OewjGZXBmIt-j8beIBVxIU83KPKiX7vDL9yRbNvefRefAQAANwEAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>黄刺蛾的茧</em></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img src=\"http://3.im.guokr.com/N8NAcxbAyiN78W45zMG_nN5TrFcNIcuXisGLbvr2PoOAAQAAIQEAAFBO.png\" /></p>\r\n\r\n<p style=\"text-align:center\"><em>褐边绿刺蛾的茧 图片均来自<a href=\"http://www.jpmoth.org/\">www.jpmoth.org</a></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>---------------------------------------- 你的蛾子在我手上 ----------------------------------------</p>\r\n\r\n<p>城市不单单属于人类，也属于潜藏在其间的数以亿计的美好生命。</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n','1',NULL,'2015-10-14 00:00:00',NULL),('5ae44e80383-8bf2-47ef-bc17-f7f079bf2fa21851','aa10','14','39','3','2','2','<p>2</p>\r\n','2','2','2','2','<p>2</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('6a68390a457-19d9-4547-9604-88e4b8c613672fd','aa8','12','56dfdbde59e-08ec-49f9-8926-6732511373b411eb','w','w','w','<p>w</p>\r\n','w','w','w','WER','<p>w</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('7','测试实验动物03','11',NULL,'wws','wedw','ede','<p>erwer</p>\r\n','ww','werwer','rrr','fg','<p>dfg</p>\r\n','2',NULL,'2015-10-14 00:00:00',NULL),('7310bb34039-54e7-4eb1-98df-373ab85cdd4a1af1','ab9','12','62401831492-91ca-4b8d-9346-2b6744fd9ac31dc4','WWWID','w','w','<p>w</p>\r\n','w','','w','w','<p>w</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('758f63d1e70-d348-4035-8761-2cb82890af511621','测试动物AA3','1','7f0a2a5141a-fc56-4d78-9590-55fbbdab2bd4142c','q','q','q','<p>q</p>\r\n','q','q','q','q','<p>q</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-10 00:00:00',NULL),('759a3a2b392-0711-4cf1-8e27-50577b407232cd8','test_dws_02','14','38','2','2','2','<p>2</p>\r\n','2','2','2','22','<p>2</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-11-02 00:00:00',NULL),('8','测试实验动物02','1',NULL,'wt2','斯蒂芬','打算','<p>范德萨</p>\r\n','斯蒂芬','try','和规范化','规范化','<p>风格化</p>\r\n','2',NULL,'2015-09-21 00:00:00',NULL),('8d45c6316ed-2ee6-469b-b8dc-b37bda7909d1443','测试动物1111','1',NULL,'213123','123123','123','<p>31231</p>\r\n','123312','123','123','123','<p>123123</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('8dc92b0f47d0104e17b8b18449810a28bc223','ttt5','15',NULL,'5','5','5','<p>5</p>\r\n','5','5','5','5','<p>5</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-02-03 17:02:00','1'),('9','测试实验动物06','1',NULL,'ad','fdfs','sdfsd','sdfsd','dfs','fds','sfsdf','fsdfd','sdfsd','1',NULL,'2015-09-21 00:00:00',NULL),('9c24fead542-c95a-4da8-a8b8-d8f3443254ee1ba7','测试动物AA8','13',NULL,'r43r3','f454','fsfsf','<p>dsfdsf</p>\r\n','fffds','fsdfsdf','sdfsf','fsdfdsdf','<p>fffffffffff</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('a5f0a673ed0-36b5-4fe0-a5c2-03c1d42067561b1a','测试动物AA10','13',NULL,'123123','vffv','cdsc','<p>66y6y</p>\r\n','3123','45456','trtr','yttry','<p>tyy666</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('b827e06bc9d-aece-4ffb-925e-4d72ae5df21926bd','234234666333',NULL,'23f187790f39-fb0d-4258-9c79-813f0acac507dae','额','','','','我','','','','','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-11-25 00:00:00',NULL),('c050473688c-d2a9-415e-8793-9b5a4aee47bf68f','测试动物AA6','13',NULL,'r4444','r4q2','r43r3','<p>rrr43</p>\r\n','frefr','r43r34','fff','dfssd','<p>234333</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-19 00:00:00',NULL),('c326d5c91dd-06d1-4bac-804c-004fa09939ea90c','ttttest',NULL,NULL,'234','234','432','<p>234</p>\r\n','432','234','234','234','<p>43234</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-11-24 00:00:00',NULL),('c5ab834acda-fe32-4d5b-af8f-0bc7950a895c15e8','aa3',NULL,'7e98542c847-658a-4c5a-a8da-92201e85a235300','2','2','22','<p>2</p>\r\n','2','2','2','2','<p>2</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('d9fc5e964a4-50f7-4844-a531-f9bc6d7f676312d1','aa5',NULL,'39','2','2','2','<p>2</p>\r\n','2','2','2','2','<p>2</p>\r\n','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','2015-12-10 00:00:00',NULL),('f625a7b1c7b-ba9d-43b3-a673-d33bfaf983e32081','A2','13','37','123123','1','1','<p>1</p>\r\n','21','1','1','1','<p>1</p>\r\n','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-12-10 00:00:00',NULL);
/*!40000 ALTER TABLE `experimental_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` varchar(45) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES ('109d98770bd6-8497-4c74-8f60-023448e9b7af78f','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('117effdbed8c-ceba-439d-9078-621ce3db7ab18bc','Capture.PNG','resources/files/images/','image/png','2016-01-08','32'),('118dd9210682-c12a-4ba1-832e-3b4161c5a944c54','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('1280c938c3f1-6783-4c5e-93d3-e7f8482dc5371a22','模式动物与人类疾病的动物模型_江虎军.pdf','resources/files/','application/pdf','2015-10-19','605'),('134a0b1b2e6-6200-4911-9700-cb959defd486354','animal_3.jpg','resources/files/','image/jpeg','2015-12-22','16'),('13624efad5c8-2c84-4101-879d-0f973f82eb6c1215','f01.jpg','resources/files/images/','image/jpeg','2016-02-05','62'),('154f774c402e-dff0-462f-a964-4af5cd1771801915','f01.jpg','resources/files/images/','image/jpeg','2016-02-05','62'),('1555153a88eb-9281-46c8-92d6-7461bb3859f4188d','animal_3.jpg','resources/files/','image/jpeg','2015-11-30','16'),('15e569bc8307-b159-4770-901d-57a090c0fa421e3d','1410397777282.jpg','resources/files/images/','image/jpeg','2016-02-05','156'),('162095f48c54-a49f-4d05-bcd5-c7a569dc043372','2007922213210904_2.jpg','resources/files/images/','image/jpeg','2016-02-03','49'),('167e22c5b543-227c-446c-a2d4-63d1b9072d033b','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('1828e6d9c99b-dffa-473e-b974-a2e4eee4e6a9161a','dws.png','resources/files/images/','image/png','2016-01-08','89'),('19738d011282-1a74-46cd-9ef1-be4ace2901751082','pic3.jpg','resources/files/images/','image/jpeg','2016-01-06','59'),('1a549de00c68-a9a4-47e7-945c-e61ef28e38dcca3','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('1ae6c8da63a4-6d2d-4b70-85e2-507c04b374daee2','1410397777282.jpg','resources/files/images/','image/jpeg','2016-01-07','156'),('1b935d972792-4a1c-4e63-a860-665b693655031c1b','image.jpg','resources/files/images/','image/jpeg','2016-02-15','1373'),('2220fa503c89-4ca6-4432-b3dd-b7e95edffc8ffc8','Capture.PNG','resources/files/','image/png','2015-11-30','32'),('2292af146b8c-a009-4174-8a7d-93a1ec94d6be1cf9','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('236cb9c274b2-2ea6-4e59-9361-5fb8971c30e81bc0','im1.jpg','resources/files/images/','image/jpeg','2015-11-11','3'),('23f187790f39-fb0d-4258-9c79-813f0acac507dae','p10.jpg','resources/files/images/','image/jpeg','2015-11-11','18'),('2423233ad5d7-9a5a-4f86-ae10-fca6b9e0f38f771','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('2466126b4244-e2ee-4f70-88e5-4e6fb885bf71594','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('260ab7fe0918-8244-45eb-a8ea-370bee76349d2099','1410397777282.jpg','resources/files/images/','image/jpeg','2016-02-05','156'),('26cf5c98a3b1-df96-43b0-b288-cf6963d24b7623a1','image2.jpg','resources/files/images/','image/jpeg','2016-01-08','40'),('2dd5ed20023-bc02-4dba-ad22-236863bfff5b1c0c','img10.jpg','resources/files/images/','image/jpeg','2015-11-11','16'),('30','blog-img5.jpg','resources/files/images/','image/jpeg',NULL,NULL),('349137a4850-f211-444d-9d97-a88130381be51746','p21.jpg','resources/files/images/','image/jpeg','2015-11-11','13'),('37','icon-02-01-on.jpg','resources/files/images/','image/jpeg',NULL,NULL),('376bbc0612-05c4-4aec-bd8b-9ee55e46b13da42','f01.jpg','resources/files/images/','image/jpeg','2016-02-05','62'),('38','icon-02-04-on.jpg','resources/files/images/','image/jpeg',NULL,'16937'),('3851bf2187c-21fb-4f42-bf8f-edd305ccbb9d210e','f01.jpg','resources/files/images/','image/jpeg','2016-01-08','62'),('39','index_technicall2.jpg','resources/files/images/','image/jpeg','2015-10-15','32'),('395d12d80e4-bb5b-46b4-8d83-676bd3c2f5ae1492','blog-img4.jpg','resources/files/images/','image/jpeg','2016-01-21','14'),('3eb66c1d952-c7eb-408b-8a83-3cf919198174105d','animal_1.jpg','resources/files/','image/jpeg','2015-12-22','15'),('40','icon-02-06-on.jpg','resources/files/images/','image/jpeg','2015-10-16','17'),('53b3cd0c3fa-7863-4c8a-9587-966065f77829175b','er.jpg','resources/files/images/','image/jpeg','2015-10-19','92'),('56dfdbde59e-08ec-49f9-8926-6732511373b411eb','icon3.png','resources/files/','image/png','2015-11-11','4'),('5bfdc0e8131-9a10-4cdf-9020-f74537b7a94e45','blog-img4.jpg','resources/files/images/','image/jpeg','2015-12-10','14'),('6093520cd63-01fd-4c69-ac6e-5d6f7f6efc419c','image2.jpg','resources/files/images/','image/jpeg','2016-01-04','40'),('62401831492-91ca-4b8d-9346-2b6744fd9ac31dc4','p19.jpg','resources/files/images/','image/jpeg','2015-11-11','10'),('7db501ae799-7ce5-4ac6-97e3-2200f6a3a14921bf','image2.jpg','resources/files/images/','image/jpeg','2016-01-07','40'),('7e98542c847-658a-4c5a-a8da-92201e85a235300','icon4.png','resources/files/','image/png','2015-11-11','4'),('7f0a2a5141a-fc56-4d78-9590-55fbbdab2bd4142c','c2cec3fdfc039245de5916728494a4c27c1e25da.jpg','resources/files/','image/jpeg','2015-10-20','1274'),('81cbb859178-b2c2-41af-9cee-66598750387b127c','map03.jpg','resources/files/images/','image/jpeg','2016-02-05','631'),('85c51a6d7c-3a2a-4be2-a6da-942b8e753f3418e7','1410397777282.jpg','resources/files/images/','image/jpeg','2016-02-05','156'),('8eb155f53b2-4db8-4095-b074-8e86818f9a231ea6','icon5.png','resources/files/','image/png','2015-11-11','4'),('922e6932ee7-427b-4851-b465-fb082bfe03431a2e','图片上传预览.html','resources/files/','text/html','2015-10-20','4'),('96389e693ef-4d54-4097-8be6-6ceafc0c7ae81b10','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('a35c69ec545-1c42-4533-91c3-4914e7e5a7821f7e','animal_1.jpg','resources/files/','image/jpeg','2015-11-30','15'),('a9a2bb04b81-e873-4708-8651-aeee99184e8e25a9','icon3.png','resources/files/','image/png','2015-11-11','4'),('aa2d1105b68-3a87-4a5c-807b-c86ae40dbd9e1201','Capture.PNG','resources/files/images/','image/png','2016-02-15','32'),('ae8453400fb-329a-4b52-98fb-7a97c8bf171e1187','f01.jpg','resources/files/images/','image/jpeg','2016-02-05','62'),('b67c340dcd3-3e76-48c3-b936-a7c1708e79a51a83','p2.jpg','resources/files/images/','image/jpeg','2015-11-11','25'),('b6ecb68ca8a-56a2-43b4-95b6-5c8e6fd9971518f3','f01.jpg','resources/files/images/','image/jpeg','2016-02-05','62'),('babf235305b-9cfd-4fab-8c08-56373694368e2283','icon7.png','resources/files/','image/png','2015-11-11','5'),('bd7091e839-1adc-4063-9568-61b0d578d1bb10c3','pic2.jpg','resources/files/','image/jpeg','2015-11-10','114'),('be77e420157-a291-42bf-8ba7-546ea894afeac37','chenzhen.jpg','resources/files/','image/jpeg','2015-10-21','6'),('bee8aa8c8c-0474-4009-981a-9d1b48dbeb754a8','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('c0d3cecdb19-4d24-4ba8-b38f-5e038e65f44c147e','f01.jpg','resources/files/images/','image/jpeg','2016-02-05','62'),('c37ca8f4969-e7e6-447d-bbd4-332866e47abb842','f01.jpg','resources/files/images/','image/jpeg','2016-02-05','62'),('ce06cecaccb-408f-4645-9753-ee3c5d93c7173cd','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('d6864d77c72-8675-4b4c-bf53-b2432365ee85923','blog-img4.jpg','resources/files/images/','image/jpeg','2016-01-20','14'),('e23610dba43-69ff-4be7-8874-ed93d460bc851236','1410397777282.jpg','resources/files/images/','image/jpeg','2016-02-05','156'),('e2d914882fb-3c71-4bc5-a72f-2d418414372a53d','icon3.png','resources/files/','image/png','2015-11-11','4'),('e9f9280627-768f-4a00-933b-e852f75e352a2550','斑马鱼_人类疾病研究的理想模式动物_全珊珊.pdf','resources/files/','application/pdf','2015-10-20','105'),('ed995eab6d-447d-4543-b26b-8c73f0cda2d138b','Capture.PNG','resources/files/images/','image/png','2016-02-05','32'),('ef70add5bfc-b366-4908-bff5-0458fc6f44301a9e','pic3.jpg','resources/files/images/','image/jpeg','2015-11-11','59'),('f29ba8b0f67-887a-467e-88aa-98e7fa00862d7f4','斑马鱼_人类疾病研究的理想模式动物_全珊珊.pdf','resources/files/','application/pdf','2015-10-20','105'),('fb711554c20-fdcf-4bec-baae-4fb38ecd7b912366','Capture.PNG','resources/files/images/','image/png','2016-02-05','32');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `function` (
  `id` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `classification` varchar(45) DEFAULT NULL,
  `note` varchar(3000) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_admin1_idx` (`issuer`),
  KEY `fk_service_person1_idx` (`contact`),
  KEY `fk_service_organization1_idx` (`organization`),
  CONSTRAINT `fk_service_admin1` FOREIGN KEY (`issuer`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_service_organization1` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_service_person1` FOREIGN KEY (`contact`) REFERENCES `person` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function`
--

LOCK TABLES `function` WRITE;
/*!40000 ALTER TABLE `function` DISABLE KEYS */;
INSERT INTO `function` VALUES ('1','委托基因敲出工作','技术支持','先给钱','1','1','1',NULL),('10','检测1检测1检测1检测1','检测服务','<p>检测1检测1检测1</p>\r\n','1','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08'),('3','基因敲出工作','检测服务','<p>先给钱&nbsp;&nbsp;&nbsp;&nbsp;先给钱&nbsp;&nbsp;&nbsp;&nbsp;先给钱&nbsp;&nbsp;&nbsp;&nbsp;先给钱&nbsp;&nbsp;&nbsp;&nbsp;先给钱&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n','1','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-08-31'),('4','实验111','委托实验','<p>实验111实验111实验111实验111</p>\r\n','3','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08'),('5','实验111实验111','委托实验','<p>实验111实验111实验111实验111</p>\r\n','6','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08'),('6','实验113','委托实验','<p>实验111实验111实验111</p>\r\n','1','2','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08'),('7','技术1','技术支持','<p>技术1技术1技术1技术1</p>\r\n','1','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08'),('8','技术2技术2技术2技术2','技术支持','<p>技术2</p>\r\n','1','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08'),('9','检测1','检测服务','<p>检测1</p>\r\n','1','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2015-09-08');
/*!40000 ALTER TABLE `function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genetic_data`
--

DROP TABLE IF EXISTS `genetic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genetic_data` (
  `id` varchar(45) NOT NULL,
  `strain_id` varchar(45) DEFAULT NULL,
  `chromosome_number` varchar(45) DEFAULT NULL,
  `standard_karyotype_id` varchar(45) DEFAULT NULL,
  `chromosome_c_image_id` varchar(45) DEFAULT NULL,
  `chromosome_g_image_id` varchar(45) DEFAULT NULL,
  `biochemical_gene_markers` varchar(500) DEFAULT NULL,
  `histocompatibility_gene` varchar(45) DEFAULT NULL,
  `frame_type` varchar(45) DEFAULT NULL,
  `coat_color_gene` varchar(45) DEFAULT NULL,
  `blood_group_gene` varchar(45) DEFAULT NULL,
  `mandibular_characteristics` varchar(45) DEFAULT NULL,
  `microsatellite` varchar(45) DEFAULT NULL,
  `animal_classification` varchar(45) DEFAULT NULL,
  `tra_name` varchar(45) DEFAULT NULL,
  `tra_background` varchar(45) DEFAULT NULL,
  `tra_insert_transgene_name` varchar(45) DEFAULT NULL,
  `tra_insertion_site` varchar(45) DEFAULT NULL,
  `tra_copy_number` varchar(45) DEFAULT NULL,
  `tra_abnormal_phenotype` varchar(45) DEFAULT NULL,
  `tra_references` varchar(500) DEFAULT NULL,
  `tar_name` varchar(45) DEFAULT NULL,
  `tar_background` varchar(45) DEFAULT NULL,
  `tar_insert_transgene_name` varchar(45) DEFAULT NULL,
  `tar_eliminating_gene_name` varchar(45) DEFAULT NULL,
  `tar_abnormal_phenotype` varchar(45) DEFAULT NULL,
  `tar_references` varchar(500) DEFAULT NULL,
  `oth_name` varchar(45) DEFAULT NULL,
  `oth_background` varchar(45) DEFAULT NULL,
  `oth_mutant_gene` varchar(45) DEFAULT NULL,
  `oth_mutant_site` varchar(45) DEFAULT NULL,
  `oth_abnormal_phenotype` varchar(45) DEFAULT NULL,
  `oth_references` varchar(500) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_genetic_datal_strain1_idx` (`strain_id`),
  CONSTRAINT `fk_genetic_datal_strain1` FOREIGN KEY (`strain_id`) REFERENCES `strain` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genetic_data`
--

LOCK TABLES `genetic_data` WRITE;
/*!40000 ALTER TABLE `genetic_data` DISABLE KEYS */;
INSERT INTO `genetic_data` VALUES ('1',NULL,'2n=44','1','1','1','','','','','','','','tra','','大大大撒','','','','','','','','','','','','','','','','','','2015-09-22'),('10','13','23','0','0','0','','','','黑色','','','','tra','C57BL/6-EGFP','C57BL/6','EGFP','','','全省性表达绿色荧光蛋白','Kato M, Yamanouchi K, Ikawa M, et al. Efficient selection of transgenic mouse embryos using EGFP as a marker gene. Mol Reprod Dev. 1999 Sep;54(1):43-8.','','','','','','','','','','','','','2015-10-08'),('1023f0594575-28d0-4c86-a8eb-a8b54195f7f8177',NULL,'1','1','1','1','1','1','1','1','1','1','1','tra','1','1','1','1','1','1','1','','','','','','','','','','','','','2015-10-29'),('11','14','2n=42','0','0','0','Akp-la,Amy-la,Es-la,Es-2a,Es-3a,Es-4b,Es-6a,Hbba','','','aa,bb,cc','','','','tra','','','','','','','','','','','','','','','','','','','','2015-10-08'),('19557a741169-3296-42cf-9e13-f8b36ff669ed1da6','11090cac4231c0e4f3fa2f34be8d310ec4a205','612','621','6','6','6','6','6','6','6','','','oth','','','','','','','','6','','','6','','','12','','','','','',NULL),('1d1a18e4258c-8ea2-4420-874f-f22b2f560b14147b',NULL,'1','1','1','1','1','1','1','1','1','1','1','tra','1','1','1','1','1','1','1','','','','','','','','','','','','','2015-10-29'),('2',NULL,'yyy','1','1','1','34234','谈谈天',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('205e30475822-80ef-4501-a8db-5adb22bc90df12b5','1ac3001580db5564abeac43ed05ef769dc8388','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','','','','','',NULL),('20d11e7eb30d-f0aa-4377-8d80-3bd25359af752695','123f1fda591afc24206aa53f9b2a205d64921e','99','88','','','1','','','','','','','tra','1','','','','','','3','','','','','','','','','','','','',NULL),('23bc0afbba6d-3926-4349-b730-b5dab833c943749','1ac3001580db5564abeac43ed05ef769dc8388','','','','','','','','','','','',NULL,'','','','','','','','','','','','','','','','','','','',NULL),('3',NULL,'88888','1','1','1','88888','88888','88888','88888','88888','88888','88888','oth','','','','','','','','','','','','','','888889','88888','88888','88888','88888','88888','2015-09-22'),('4',NULL,'424','1','1','2','gdfg','dfggf','ggg','vbcvb','vcbcvb','tretgb','cbcbcvb','tra','cvb','bcvb','bcvbvcb','cvbcb','cvbcbv','bvccb','bcvbb','','','','','','','','','','','','','2015-09-22'),('5',NULL,'1212','3','3','3','dfgdf','dfgdfg','gffdg','g5t5','gdfgdfg','5t5t','dfggfd','tar','','','','','','','','tt554t','et5te5','tete5t','e5tet','te5tte','te5t','','','','','','','2015-09-22'),('6',NULL,'2222222222','2','2','2','2222222222','2222222222','2222222222','2222222222','2222222222','2222222222','2222222222','oth','','','','','','','','2222222222','2222222222','2222222222','2222222222','2222222222','2222222222','88888','777','','','','','2015-09-22'),('7','9','','0','0','0','','','','','','','','tra','','C57BL/6J','Oct-4启动子，green fluorescence protein','','','无任何生理和生化异常。在未分化的精原细胞表达EGFP','Kazuyuki Ohbo,a,* Shosei Yoshida,b,c Masako Ohmura, et al. Identification and characterization of stem cells in prepubertal spermatogenesis in mice. Dev. Biol., 258, 209-225 (2003).','','','','','','','','','','','','','2015-10-08'),('7b5ba5fe409-d239-4d80-8997-29ec35fead4c194','198c36dad2cfb2b4e79913f0d987d69dee61e9','999','888','1','1','777','666','555','444','','','','tar','','','','','','','','2','2','2','2','2','222','','','','','','',NULL),('8','11','','0','0','0','','','','','','','','tar','','','','','','','','UCP3(Ht) K0','C57BL/6','','UCP3','线粒体能量代谢相关.','Energy Metabolism in Uncoupling Protein 3 Gene Konckout Mice. THE J.BIO.CHE.2000,275(21):16258-16266.','','','','','','','2015-10-08'),('804925c28e7-b0eb-4ec2-b29a-23ca8519e31daf7',NULL,'1','1','1','1','1','1','1','1','1','1','1','tra','1','1','1','1','1','1','1','','','','','','','','','','','','','2015-10-29'),('9','12','','0','0','0','','','','','','','','tra','STOCK Tg(rtTAhCMV)4Uh/J','',' rtTA','','','该品系表达四环素控制的反式作用蛋白，无明显表型。','Kistner A;Gossen M;Zimmermann F;Jerecic J;Ullmer C;Lubbert H;Bujard H.1996. Doxycycline-mediated quantitative and tissue-specific control of gene expression in transgeinc mice. Proc Natl Acad Sci U S A 93(20);10933-8.','','','','','','','','','','','','','2015-10-08'),('d8cdfdc5ea8-b5b9-4e51-935b-1b780dd0c7898be','146dfc03ff9fee84ffb9f7bd6155030cb00199','9','9','','','5','4','5','','','','','oth','','','','','','','','','','','','','','5','','','','5','4',NULL);
/*!40000 ALTER TABLE `genetic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` varchar(45) NOT NULL,
  `sender_id` varchar(45) DEFAULT NULL,
  `addressee_id` varchar(45) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `text` varchar(20000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_admin1_idx` (`sender_id`),
  KEY `fk_message_admin2_idx` (`addressee_id`),
  CONSTRAINT `fk_message_admin1` FOREIGN KEY (`sender_id`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_message_admin2` FOREIGN KEY (`addressee_id`) REFERENCES `u_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('10386f72280a-846e-4396-be4e-991e90a66fc822b2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','test15','<p>15</p>\r\n','2015-11-05 09:51:07',1),('11ccb7aced83-e7a4-4743-995e-a38f8a03df108b2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','test16','<p>16</p>\r\n','2015-11-05 09:51:20',1),('17e4cad09d9a-6729-439b-9401-c2c8f3a7a092be9','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','ttest1','<p>dsdad</p>\r\n','2015-11-04 16:26:10',1),('18fe49652859-be67-4f41-afd5-6ba2aa55060d22c','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','，会计，看','<p>uyui</p>\r\n','2015-11-10 10:05:04',1),('198b17b12b4-ad6c-4d5d-a6cd-8e4277b21bed1510','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','test12','<p>12</p>\r\n','2015-11-05 09:46:01',1),('1ccff13448d7-e74d-4b0d-a20c-e9d8330126032148','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','test13','<p>13</p>\r\n','2015-11-05 09:46:14',1),('2407c170dc37-bbd2-4991-9daa-ab8a1efa8000ab03','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','给管理员的通知','呵呵呵呵','2015-10-22 16:50:45',1),('2407c170dc37-bbd2-4991-9daa-ab8a1efa80098765','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','给管理员的通知2','呵呵呵呵2','2015-10-22 16:50:45',1),('2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5999','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','给USER的通知2','哈哈哈哈哈2','2015-10-22 16:50:45',1),('2407c170dc37-bbd2-4991-9daa-ab8a1efa8055a5a5','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','给USER的通知','哈哈哈哈哈','2015-10-22 16:50:45',1),('254478a78fae-6c2d-4b26-8569-b85695a085ec40b','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','test1','<p style=\"text-align: center;\">dfg<span style=\"color:#FFA500\"><strong><em><span style=\"font-family:comic sans ms,cursive\">dfgd</span></em></strong></span>gf</p>\r\n\r\n<p style=\"text-align: center;\">h<span style=\"color:#0000FF\">fgh</span>fgh</p>\r\n','2015-11-04 15:19:43',1),('25b1972a7299-02fe-45cd-9f89-ad70da0279ba15d5','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','test4','<p>ewrr43r</p>\r\n','2015-11-04 16:38:05',1),('6b6f22e14fa-7857-4258-bf33-01e76658f7a91f87','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','の2饿3','<p>324324</p>\r\n','2015-11-09 09:53:13',1),('9ab63399172-285e-4c55-b77e-8b29f0d521b511cd','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','test06','<p>ertert</p>\r\n','2015-11-04 16:40:27',1),('ad400ef0e23-6195-462f-a540-2543f9749074e27','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','test11','<p>11</p>\r\n','2015-11-05 09:45:46',1),('c771316578e-f75b-4f47-a1a4-f915fecc3fd65c2','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','test17','<p>17</p>\r\n','2015-11-05 09:51:35',1),('daffaed728b-3527-470d-b6bc-c4f05dd119ea10b8','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','test3','<p>123321</p>\r\n','2015-11-04 16:34:44',1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` varchar(45) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(200) NOT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('1','中国科学院动物研究所','北京市朝阳区北辰西路1号院5号','010-64807098'),('2','中国科学院昆明动物研究所','云南省昆明市教场东路32号','0871-65130513'),('3','中国科学院生态环境研究中心','北京市海淀区双清路18号','010-62923549,62849185'),('4','中国科学院微生物研究所','北京市朝阳区北辰西路1号院3号 ','86-10-64807462'),('5','中国科学院北京基因组研究所','北京市朝阳区北辰西路1号院104号楼','86－10－84097710'),('6','中国科学院上海生命科学研究院','上海岳阳路320号','86-21-54920000');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `rank` varchar(45) DEFAULT NULL,
  `note` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_person_organization1_idx` (`organization`),
  CONSTRAINT `fk_person_organization1` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('1','王天山','1','生态学','13693311115','tianshanroy@163.com','超级管理员','天山万岁！'),('2','王小山','2','计算机科学','15912145678','3167351735@qq.com','学生','<p style=\"text-align: center;\"><span style=\"font-size:26px\">哈哈哈</span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:14px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 啊多少卡速度球带u<span style=\"color:#FFA500\">wdhw.daw，打</span>完等等。。。阿<span style=\"background-color:#FFD700\">萨德思思思思思思思思思思思思</span></span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:14px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 阿萨大屌丝</span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:14px\">asdads</span></p>\r\n'),('37827af4dd98fae4e18ac814eeadbf6e6dba2','王大山','1','大山','ds','ds.com',NULL,'<p>大山大山大山</p>\r\n'),('4','王小山山','5','题豚4条5他','110','e32e23@sss.com',NULL,'<p>45天545题5台他</p>\r\n');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physiological_data`
--

DROP TABLE IF EXISTS `physiological_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physiological_data` (
  `id` varchar(45) NOT NULL,
  `strain_id` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `physiological_classification` varchar(45) DEFAULT NULL,
  `b_cell` varchar(45) DEFAULT NULL,
  `blood_volume` varchar(45) DEFAULT NULL,
  `plasma_volume` varchar(45) DEFAULT NULL,
  `rbc` varchar(45) DEFAULT NULL,
  `mcv` varchar(45) DEFAULT NULL,
  `mct` varchar(45) DEFAULT NULL,
  `rdw` varchar(45) DEFAULT NULL,
  `hb` varchar(45) DEFAULT NULL,
  `hct` varchar(45) DEFAULT NULL,
  `mch` varchar(45) DEFAULT NULL,
  `mchc` varchar(45) DEFAULT NULL,
  `wbc` varchar(45) DEFAULT NULL,
  `w_ne` varchar(45) DEFAULT NULL,
  `eo` varchar(45) DEFAULT NULL,
  `ba` varchar(45) DEFAULT NULL,
  `ly` varchar(45) DEFAULT NULL,
  `mo` varchar(45) DEFAULT NULL,
  `plt` varchar(45) DEFAULT NULL,
  `mpv` varchar(45) DEFAULT NULL,
  `pdw` varchar(45) DEFAULT NULL,
  `first_estrus` varchar(45) DEFAULT NULL,
  `estrus` varchar(45) DEFAULT NULL,
  `estrus_period` varchar(45) DEFAULT NULL,
  `estrus_season` varchar(45) DEFAULT NULL,
  `body_maturation` varchar(45) DEFAULT NULL,
  `gestation_period` varchar(45) DEFAULT NULL,
  `suckling_period` varchar(45) DEFAULT NULL,
  `production_index` varchar(45) DEFAULT NULL,
  `sperm_concentration` varchar(45) DEFAULT NULL,
  `sperm_survival_time` varchar(45) DEFAULT NULL,
  `ovum_size` varchar(45) DEFAULT NULL,
  `ovum_number` varchar(45) DEFAULT NULL,
  `ovulation_period` varchar(45) DEFAULT NULL,
  `fertilization_ability` varchar(45) DEFAULT NULL,
  `lay_eggs_age` varchar(45) DEFAULT NULL,
  `lay_eggs_weight` varchar(45) DEFAULT NULL,
  `egg_weight` varchar(45) DEFAULT NULL,
  `shell_thickness` varchar(45) DEFAULT NULL,
  `egg_type_index` varchar(45) DEFAULT NULL,
  `haugh_unit` varchar(45) DEFAULT NULL,
  `egg_relative_density` varchar(45) DEFAULT NULL,
  `egg_yolk_ratio` varchar(45) DEFAULT NULL,
  `fertilization_rate` varchar(45) DEFAULT NULL,
  `hatchability_of_fertile_eggs` varchar(45) DEFAULT NULL,
  `shell_color` varchar(45) DEFAULT NULL,
  `brood_stage` varchar(45) DEFAULT NULL,
  `birth_weight` varchar(45) DEFAULT NULL,
  `weaning_weight` varchar(45) DEFAULT NULL,
  `adult_weight` varchar(45) DEFAULT NULL,
  `growth_curve_url` varchar(45) DEFAULT NULL,
  `breathing_rate` varchar(45) DEFAULT NULL,
  `temperature` varchar(45) DEFAULT NULL,
  `digestive_index` varchar(45) DEFAULT NULL,
  `igg` varchar(45) DEFAULT NULL,
  `igm` varchar(45) DEFAULT NULL,
  `igd` varchar(45) DEFAULT NULL,
  `iga` varchar(45) DEFAULT NULL,
  `ige` varchar(45) DEFAULT NULL,
  `t_cell` varchar(45) DEFAULT NULL,
  `systolic_pressure` varchar(45) DEFAULT NULL,
  `diastolic_pressure` varchar(45) DEFAULT NULL,
  `heart_rate` varchar(45) DEFAULT NULL,
  `electrocardiogram_url` varchar(45) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_physiological_data_strain1_idx` (`strain_id`),
  CONSTRAINT `fk_physiological_data_strain1` FOREIGN KEY (`strain_id`) REFERENCES `strain` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physiological_data`
--

LOCK TABLES `physiological_data` WRITE;
/*!40000 ALTER TABLE `physiological_data` DISABLE KEYS */;
INSERT INTO `physiological_data` VALUES ('1',NULL,'4周','雌','90只','blood_physiological_data',NULL,'9999','9999','8.31±0.26','58.5±0.8','99','99','171.6±9.34','99','99','99','99','99','99','99','99','99','99','99','99',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-09-24'),('14',NULL,'2','2','2','grow_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','2','2','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-09-28'),('143cf614212b-f0c3-4cec-982f-191a17e6cb0326d0','146dfc03ff9fee84ffb9f7bd6155030cb00199','3','3','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-28'),('15',NULL,'7','7','7','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7','1','1','1','1','1','1','1','1','1','1','1','1','11','1','1','1','1','1','1','1','1','1','1','1','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-09-28'),('16',NULL,'44','44','55','grow_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'677','46','2','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-09-28'),('17','9','未知','雌','6只','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'42','24','4','','42','19-21','19-21','7-9','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('1735b5ff1162-8e36-41e8-872c-a9c72dd1539d625','146dfc03ff9fee84ffb9f7bd6155030cb00199','7','7','7','immune_physiological_data','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7','7','7','7','7','7',NULL,NULL,NULL,NULL,'2016-01-27'),('18','9','8 周','不分雌雄','12 只','blood_physiological_data',NULL,'','','10.40±0.14','46.80±0.42','','13.08±0.61','','0.49±0.01','15.78±0.38','333.83±3.13','8.17±1.43','11.60±2.18','0.20±0.18','0.16±0.07','83.63±3.83','2.70±1.38','632.33±219.65','6.17±0.31','21.93±2.55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('19','11','4 周','不分雌雄','40 只','blood_physiological_data',NULL,'','','10.40±0.46','54.18±1.05','','16.5±0.83','15.73±0.57','56.33±2.14','15.13±0.44','27.94±0.57','4.56±2.72','15.73±4.60','0.24±0.11','0.38±0.47','79.09±6.56','4.08±1.46','584.33±125.03','3.96±0.51','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('1968c8262b30-995b-4ba0-bedc-4b8da6d3fa1413f0','146dfc03ff9fee84ffb9f7bd6155030cb00199','5','5','5','temperature_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-27'),('1a1896ef0e40-49fb-49ef-ae81-f198dfcdc74724cc',NULL,'99777777','7','7','blood_physiological_data',NULL,'7','7','7','7','7','7','7','7','7','7','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-29'),('1ddae11611cf-d83a-4306-a4d6-e9613c270256383','146dfc03ff9fee84ffb9f7bd6155030cb00199','3','3','3','grow_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3','3','3','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-27'),('1e761750acd7-43a5-49d8-8abe-8a85317d620f161a',NULL,'444','3','4343','blood_physiological_data',NULL,'5,5','5,5','5','5','','','','','','','','5','5','','','','5','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-25'),('1ea5ad577eed-364e-4172-b463-10102c1f5253752','146dfc03ff9fee84ffb9f7bd6155030cb00199','8','8','8','cardiovascular_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','8',NULL,'2016-01-27'),('2',NULL,'4周','雄','40只','blood_physiological_data',NULL,'9999','99','8.35±0.33','59.0±1.7','99','99','99','99','99','99','99','99','99','99','99','99','99','99','99',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-09-24'),('20','12','4 周','不分雌雄','40 只','blood_physiological_data',NULL,'','','10.56±0.47','48.02±3.30','','17.67±0.99','15.94±0.68','50.64±3.22','14.98±0.46','31.19±1.22','7.04±1.38','40.77±3.11','0.53±0.30','0.36±0.42','55.01±4.63','2.97±1.37','798.25±120.00','4.62±0.30','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('21','13','-','雌','6 只','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','19-21','20-22','6-9','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('2189d15fdb6a-e5ae-4ade-bd78-8f24d18727cd1afd','146dfc03ff9fee84ffb9f7bd6155030cb00199','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-28'),('22','13','8 周','不分雌雄','12 只','blood_physiological_data',NULL,'','','10.32±0.44 ','39.24±0.40','','','167.60±5.37','40.50±2.11','16.26±0.32','415.00±9.49','13.24±4.36','','','','','','161.40±83.35','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('22789ad45dea-96e0-432b-a878-a50013dd9610256b',NULL,'1','1','1','blood_physiological_data',NULL,'1,',',','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-25'),('22de4e773808-9aee-4e23-b05b-f77ec994051359a','146dfc03ff9fee84ffb9f7bd6155030cb00199','6','6','6','digestive_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-27'),('23','14','8 周','雄','40 只','blood_physiological_data',NULL,'','','8.212±0.451880023408378','57.21±0.486369772453485','','28.61±0.593389510449333','15.12±0.80387948239909','0.47±0.0187170100579182','18.41±0.237814119756496','32.19±0.530094331227967','8.21±2.33116565977909','24.9±2.35796522451036','','','67.26±4.8956667087793','6.4±3.43947670438397','74.3±29.6499953157201','7.26666666666667±0.32145502536644','10.7666666666667±1.56950098226582',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('24','14','8 周','雌','40 只','blood_physiological_data',NULL,'','','8.934±0.130656462186522','55.75±0.554276304944169','','28.53±0.58509258526591','15.98±0.225092573548469','0.4981±0.00833266663999787','17.9±0.169967317119534','32.08±0.147572957474437','10.09±1.67825968060833','','','','72.34±3.83034666258235','','124.1±50.7355890869516','7.53333333333333±0.321455025366418','11.5±0.360555127546432',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('241db3adbc46-f3df-41d1-a87e-748c4aee1876f00',NULL,'6','456','456','grow_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'456','456','456','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-29'),('24c7906f432-1ca9-4fec-9264-b4fc5c4b2609404','11090cac4231c0e4f3fa2f34be8d310ec4a205','3','3','3','breathe_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-27'),('25','14','','雄','40 只','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','80-90','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('26','14','','雌','40 只','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'50-80','6-8','4-5','全年','80-90','18-22','20-25','6.5-8.5','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('27','15','4 月','雄','85 只','blood_physiological_data',NULL,'','','9.18±0.94','56.09±3.91','','17.16±1.31','','51.72±5.51','14.07±0.73','','6.07±3.67','','0.49±0.39','0.12±0.17','65.75±14.33','5.40±2.55','758.32±159.70','4.95±0.42','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('28','15','4 月','雌','104 只','blood_physiological_data',NULL,'','','9.22±0.89','53.82±3.28','','16.82±0.83','','49.44±4.99','13.62±0.68','','5.52±2.93','','0.43±0.27','0.13±0.14','67.97±12.82','4.79±2.71','676.55±127.39','5.12±0.44','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('29','15','2 月','雄','50 只','blood_physiological_data',NULL,'','','7.48±1.53','57.35±2.12','','15.67±0.53','10.67±1.67','43.79±6.48','13.97±2.12','24.86±0.85','1.58±0.67','30.97±13.95','1.12±0.82','0.32±0.36','60.04±15.84','5.50±3.68','741.06±221.29','5.09±0.58','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('3',NULL,'12月','不分性别','1150只','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2121','121','1','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('30','15','2 月','雌','50 只','blood_physiological_data',NULL,'','','7.66±1.06','55.55±2.26','','16.02±0.69','10.67±1.67','42.60±6.23','13.90±0.69','25.04±0.95','2.24±0.77','31.99±15.37','0.82±0.75','0.22±0.30','62.55±14.71','4.42±2.38','757.39±221.69','5.29±0.24','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('31','15','12 月','雌','12 只','blood_physiological_data',NULL,'','','8.43±0.97','59.37±6.44','','18.60±2.91','','50.62±7.41','13.94±0.72','','4.66±1.89','','0.42±0.25','0.12±0.11','45.87±12.48','6.98±4.78','879.69±324.08','5.18±0.29','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('32','15','12 月','雄','12 只','blood_physiological_data',NULL,'','','8.83±0.82','59.72±4.89','','17.31±2.09','','52.77±5.38','13.86±1.08','','3.51±1.43','','0.60±0.49','0.15±0.17','60.00±11.92','5.01±2.31','771.15±203.88','5.05±0.28','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('33','15','3 月','雌','50 只','blood_physiological_data',NULL,'','','8.65±1.67','53.44±3.77','','16.92±0.83','','45.92±9.98','13.25±0.69','','4.22±2.18','','0.84±1.23','0.31±0.50','69.57±12.74','5.04±3.13','697.41±169.86','5.14±0.39','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('34','15','3 月','雄','36 只','blood_physiological_data',NULL,'','','9.15±0.95','56.53±3.94','','17.09±1.05','','51.63±5.71','13.98±0.60','','6.30±3.36','','0.59±0.58','0.11±0.12','60.35±14.90','3.14±1.30','821.78±140.72','5.03±0.27','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('35','15','2 月','雌','36 只','blood_physiological_data',NULL,'','','8.68±1.18','61.53±4.11','','16.17±0.93','','53.92±8.39','14.86±0.57','','4.90±1.78','','0.36±0.23','0.08±0.07','64.14±12.44','4.25±1.86','772.23±154.83','5.06±0.49','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('36','15','2 月','雄','36 只','blood_physiological_data',NULL,'','','8.73±1.11 ','61.69±5.03','','16.20±0.60','','54.22±8.45','15.15±0.75','','5.98±2.96','','0.24±0.21','0.05±0.02','66.15±13.22','3.66±1.74','820.16±176.02','5.10±0.38','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('37','15','','雄','50 只','grow_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3.19±0.33','15.87±2.03','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('38','15','','雌','20 只','grow_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3.74±0.62','15.95±2.24','','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('39','15','','雌','20 只','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','26.9±10.0','4.42±1.40','全年多发情动物','','','25','8.5±2.4','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-10-08'),('4',NULL,'7','7','7','',NULL,'7','7','7','7','7','7','7','7','7','7','7','7','7','7','7','7','1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-09-25'),('41','1','2','2','2','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'231','313','1231','23123','123123','1313','','3123','','','','','','','','','11','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-29'),('4e1e838ab03-6934-4cf4-8abb-596dd2e4634e10e4','146dfc03ff9fee84ffb9f7bd6155030cb00199','2','2','2','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-27'),('7',NULL,'1','1','1','reproduction_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1','1','1','1','1','1','1','1','1','11','1','1','1','1','1','11','1','1','1','1','1','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-09-25'),('72ea0bd229c-8757-46aa-bc7e-8403f50cf6782385',NULL,'7','5','6','cardiovascular_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'657','675','675','567','2015-10-29'),('8',NULL,'1','1','1','grow_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','2015-09-25'),('874b5f463-e278-4ae9-a18c-04491631c2dc25e','146dfc03ff9fee84ffb9f7bd6155030cb00199','11','11','11','blood_physiological_data',NULL,'1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-27'),('cfb3b2114f-afbc-474a-9bf9-8e591efa37bc2052','146dfc03ff9fee84ffb9f7bd6155030cb00199','4','4','4','breathe_physiological_data',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-27'),('d7b184728c1-1133-4179-9e44-9d3f1b2c23a0547',NULL,'4555','4','4','blood_physiological_data',NULL,'4','4','4','4','4','4','4','4','4','4','4','4','4','4','4','4','4','4','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-29'),('deb2ffd8f62-5fa2-4452-b397-2f527c961f4313b7',NULL,'99777777888','7','7','blood_physiological_data',NULL,'7','7','7','7','7','7','7','7','7','7','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-29'),('f8c79e5249f-da4c-40bb-9ef8-db0aa0be8336a9f',NULL,'8','8','8','blood_physiological_data',NULL,'8,',',','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-25');
/*!40000 ALTER TABLE `physiological_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `id` varchar(45) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phylum_ch` varchar(45) DEFAULT NULL,
  `phylum_en` varchar(45) DEFAULT NULL,
  `class_ch` varchar(45) DEFAULT NULL,
  `class_en` varchar(45) DEFAULT NULL,
  `order_ch` varchar(45) DEFAULT NULL,
  `order_en` varchar(45) DEFAULT NULL,
  `family_ch` varchar(45) DEFAULT NULL,
  `family_en` varchar(45) DEFAULT NULL,
  `genus_ch` varchar(45) DEFAULT NULL,
  `genus_en` varchar(45) DEFAULT NULL,
  `species_ch` varchar(45) DEFAULT NULL,
  `species_en` varchar(45) DEFAULT NULL,
  `note` varchar(2500) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_species_issuer_idx` (`issuer`),
  KEY `fk_species_organization_idx` (`organization`),
  CONSTRAINT `fk_species_issuer` FOREIGN KEY (`issuer`) REFERENCES `u_user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_species_organization` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES ('1','金丝熊','脊索动物门','Chordata','哺乳纲','Mammals','啮齿目','Rodentia','仓鼠科','Circetidae','仓鼠属','Cricetulus','金丝熊','Mesocricetus auratus','9999000','2015-09-11 00:00:00','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('3','长爪沙鼠','脊索动物门','Chordata','哺乳纲','Mammals','啮齿目','Rodentia','鼠科','Muridae','沙鼠属','Meriones','长爪沙鼠','Meiiones Unguiculataus','000','2015-09-11 00:00:00','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('33d2db96d4a2f894f4bace7908c6bbcd3cd9f','test1222','啊啊啊','AAA','不不不','BBB','擦擦擦','CCC','对对对','DDD','呃呃呃','EEE','烦烦烦','FFF','阿比吃德芙ADCDEF','2016-01-11 12:55:46','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5'),('4','小鼠','脊索动物门','Chordata','哺乳纲','Mammals','啮齿目','Rodentia','鼠科','Muridae','鼠属','Mus','家鼠','Mus musculus','常说的小鼠就是这种~','2015-09-11 00:00:00','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('5','Rattus norvegicus大鼠','脊索动物门','Chordata','哺乳纲','Mammalia','啮齿目','Rodentia','鼠科','Muridae','家鼠属','Rattus','褐家鼠','Rattus norvegicus','褐家鼠 R. norvegicus','2015-09-11 00:00:00','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strain`
--

DROP TABLE IF EXISTS `strain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strain` (
  `id` varchar(45) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `species_id` varchar(45) DEFAULT NULL,
  `cultivation_year` varchar(20) DEFAULT NULL,
  `introduce_year` varchar(20) DEFAULT NULL,
  `cultivationer` varchar(100) DEFAULT NULL,
  `hereditary_feature` varchar(45) DEFAULT NULL,
  `microbiological_grade` varchar(45) DEFAULT NULL,
  `germplasm_resources` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_strain_species1_idx` (`species_id`),
  KEY `fk_strain_issuer_idx` (`issuer`),
  KEY `fk_strain_organization_idx` (`organization`),
  CONSTRAINT `fk_strain_issuer` FOREIGN KEY (`issuer`) REFERENCES `u_user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_strain_organization` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strain`
--

LOCK TABLES `strain` WRITE;
/*!40000 ALTER TABLE `strain` DISABLE KEYS */;
INSERT INTO `strain` VALUES ('1','Slac','3','1930年','2002年','Aharoni and Abler，Hebrew University','远交群','SPF级','日本CLEA','2015-10-19 00:00:00','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('11','UCP3(Ht) KO','3','','','','近交系','SPF级','','2015-10-16 00:00:00',NULL,'2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('11090cac4231c0e4f3fa2f34be8d310ec4a205','888','33d2db96d4a2f894f4bace7908c6bbcd3cd9f','676','67','67','67','67','67','2016-01-14 11:57:02','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5'),('12','Stock TgN(rtTAhCMV)4Uh/J','5','1988','1989','Jfinal.uii','近交系','SPF级','USA','2015-10-16 00:00:00','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('123f1fda591afc24206aa53f9b2a205d64921e','test151','3','33','33','33','33','33','33','2016-01-15 10:55:09','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5'),('127b2d502b5d38f429ea21be5fb60880aa9208','ttttrtt','33d2db96d4a2f894f4bace7908c6bbcd3cd9f','rtr','rt','rt','ert','tre','et','2016-01-21 11:16:08','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5'),('13','C57BL/6-EGFP','4','2001年','','日本RIKEN研究所','近交系','SPF级','日本RIKEN研究所','2015-10-16 00:00:00',NULL,'2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('14','F344/Jcl','5','1920年','2001年','美国哥仑比亚大学肿瘤研究所Curtis','远交群','SPF级','日本CLEA','2015-10-08 00:00:00',NULL,'2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('146dfc03ff9fee84ffb9f7bd6155030cb00199','yyy','3','rty','rty','rty','rty','rty','rty','2016-01-12 16:59:00','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5'),('15','Z:ZCLA','3','1978年','1978年','浙江省医学科学院 浙江省实验动物中心','其他','普通级,清洁级','内蒙古，野生','2015-10-09 00:00:00','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('198c36dad2cfb2b4e79913f0d987d69dee61e9','9899','4','999','888','999','898','989','89','2016-01-14 10:43:09','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5'),('1ac3001580db5564abeac43ed05ef769dc8388','9909','4','888','888','888','888','888','888','2016-01-14 10:40:42','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5'),('3baa0d7819ee7014a51bb28589bf63aa626e','ttest','1','213','312','123','312','123','312','2016-02-03 09:50:58','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('3da1a16700bfedc4a3394d9172d7e14386b1cc','ooo','4','99','99','99','99','99','99','2016-01-14 10:05:11','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5'),('9','B6-TgN(GOFGFP)11Imeg','4','','','','','SPF级','TheJacksonLaboratory美国','2015-10-16 00:00:00',NULL,'2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521'),('c8ad44543d113449feacf1f26ce84737c9251','对对对','5','234','234','234','234','234','234','2016-01-14 09:51:43','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5');
/*!40000 ALTER TABLE `strain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
  `id` varchar(45) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  `abstract_text` varchar(200) DEFAULT NULL,
  `cycle` varchar(20) DEFAULT NULL,
  `price_public` varchar(45) DEFAULT NULL,
  `price_private` varchar(45) DEFAULT NULL,
  `note` varchar(8000) DEFAULT NULL,
  `contact` varchar(1000) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `issuer` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_technology_organization1_idx` (`organization`),
  CONSTRAINT `fk_technology_organization1` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES ('12b64e706a8e-ddcf-43d1-a32a-c8d9f4458f5c','假孕受体种公鼠','ICR','配假孕受体鼠用结扎公鼠','2周','40元/次','20元/次','<p>假孕受体种公鼠采用XXXXX技术将YYYY处理后进行ZZZZ。。。。。</p>\r\n','wts:13568826374333','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-22 00:00:00'),('12b64e706a8e-ddcf-43d1-a32a-c8d9f4458f8d','种公鼠','ICR、C57','配种用可育种公鼠','2周','40元/次','20元/次','zhelishi萨达速度','wts:13568826374333','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-30 00:00:00'),('31a61bb81766b454968b02c8b3123513d8522a','test3','uuu','iii','9','99','88','<p>868678</p>\r\n','9999','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2016-01-11 10:18:03'),('338ba9c32c4eb4a425ea7b5b90563bff47238','test2','qqq','ttt','2','222','111','<p>67657657</p>\r\n','8888','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2016-01-11 10:17:12'),('842808e10482bb46a7813edefbdd535a6a3b0','TEST14','QQQQ','TTTT','1D','999','888','<p>99999</p>\r\n','10086','4','2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','2016-01-11 10:15:52'),('aaa64e706a8e-ddcf-43d1-a32a-c8d9f4458f8d','胚胎冻存保种','品系不限','收集发育至2-细胞小鼠胚胎200枚，液氮冻存、保种，免费保存二年，二年后，每年收取800元的维持费用','1周','4000元/品系','2000元/品系','234324324','wts:13568826374333','1','2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','2015-11-30 00:00:00');
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_power`
--

DROP TABLE IF EXISTS `u_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `pid` varchar(45) DEFAULT NULL COMMENT '上级id',
  `level` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_power`
--

LOCK TABLES `u_power` WRITE;
/*!40000 ALTER TABLE `u_power` DISABLE KEYS */;
INSERT INTO `u_power` VALUES (1,'动态公告管理','动态公告管理','DTGGGL','动态公告管理','0',0),(2,'公告通知管理','公告通知管理','gggggg','公告通知管理','1',2),(3,'特色实验管理','WDED','TSSS','特色实验管理','1',0),(4,'添加','234','324324','234','2',0),(5,'平台资源','324','432','234','0',0),(6,'动物资源管理','是的','阿萨德','是的','5',0),(7,'432','234','324','234','2',0);
/*!40000 ALTER TABLE `u_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_role`
--

DROP TABLE IF EXISTS `u_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_role` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_role`
--

LOCK TABLES `u_role` WRITE;
/*!40000 ALTER TABLE `u_role` DISABLE KEYS */;
INSERT INTO `u_role` VALUES ('0','暂无角色','role_none'),('2f21522e02de0724c84b754c3ec39d1d01a302','超级管理员','admin_super'),('7c1d112676171b44f4bfd8ce171fe2e7251cc','成员单位一级管理员','amdin_first'),('fd2a3c963ad52945f9976b9ae8b9f998c73d6','成员单位二级管理员','admin_secoed');
/*!40000 ALTER TABLE `u_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_role_power`
--

DROP TABLE IF EXISTS `u_role_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_role_power` (
  `id` varchar(45) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `power` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_role_idx` (`role`),
  KEY `fk_power_idx` (`power`),
  CONSTRAINT `fk_power` FOREIGN KEY (`power`) REFERENCES `u_power` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `u_role` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_role_power`
--

LOCK TABLES `u_role_power` WRITE;
/*!40000 ALTER TABLE `u_role_power` DISABLE KEYS */;
INSERT INTO `u_role_power` VALUES ('1','0',1),('2','0',2),('3','2f21522e02de0724c84b754c3ec39d1d01a302',1),('4','2f21522e02de0724c84b754c3ec39d1d01a302',2),('5','2f21522e02de0724c84b754c3ec39d1d01a302',4);
/*!40000 ALTER TABLE `u_role_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_user`
--

DROP TABLE IF EXISTS `u_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_user` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `authority` varchar(45) DEFAULT NULL,
  `enable` varchar(45) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `photo_id` varchar(45) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `authority_id` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_organization_idx` (`organization`),
  KEY `fk_admin_file1_idx` (`photo_id`),
  KEY `fk_admin_authority_idx` (`authority_id`),
  KEY `fk_admin_role_idx` (`role`),
  CONSTRAINT `fk_admin_authority_id` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_admin_file1` FOREIGN KEY (`photo_id`) REFERENCES `file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_admin_organization` FOREIGN KEY (`organization`) REFERENCES `organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_admin_role` FOREIGN KEY (`role`) REFERENCES `u_role` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_user`
--

LOCK TABLES `u_user` WRITE;
/*!40000 ALTER TABLE `u_user` DISABLE KEYS */;
INSERT INTO `u_user` VALUES ('1','wts','天山','wts','SUPER','1','1','ianshanroy@163.com','我是超级管理员！啊哈哈哈哈~','2015-10-28 15:34:20','be77e420157-a291-42bf-8ba7-546ea894afeac37','1990-01-01 00:00:00','10086',NULL,'2f21522e02de0724c84b754c3ec39d1d01a302'),('2407c170dc37-bbd2-4991-9daa-ab8a1efa80181521','qqq','小天山','qqq','ADMIN','1','1','99999@IOZ.com','ADMINNNNNNNNN','2016-02-05 10:04:41','13624efad5c8-2c84-4101-879d-0f973f82eb6c1215','2015-11-09 15:47:29','999999','99999170dc37-bbd2-4991-9daa-ab8a6658aa874125','2f21522e02de0724c84b754c3ec39d1d01a302'),('2407c170dc37-bbd2-4991-9daa-ab8a1efa801818c5','www','大神','www','SUPER','1','1','9999@99.com','OMG','2016-02-19 15:56:16','1b935d972792-4a1c-4e63-a860-665b693655031c1b','1990-01-01 00:00:00','9999999','2407c170dc37-bbd2-4991-9daa-ab8a6658aa874125','2f21522e02de0724c84b754c3ec39d1d01a302'),('2407c170dc37-bbd2-4991-9daa-ab8a1efa801a5aac','ooo','学生1','ooo','USER','1','2','ooo','3333333\r\n','2016-01-06 10:24:17','19738d011282-1a74-46cd-9ef1-be4ace2901751082','1990-01-01 00:00:00','10086',NULL,'2f21522e02de0724c84b754c3ec39d1d01a302'),('2407c170dc37-bbd2-4991-9daa-ab8a1efa83776472','ppp','ppp','ppp','ADMIN','1','5','123','123','2015-12-10 13:37:59','5bfdc0e8131-9a10-4cdf-9020-f74537b7a94e45','2015-11-11 15:05:53','1234567890',NULL,'2f21522e02de0724c84b754c3ec39d1d01a302'),('47f6617aea5-4db1-4ec4-bd69-741e5d3e64d1739','jjj','222222','jjj','USER','1','4','jjj@jjj.jjj','2222222','2015-11-11 15:51:03','349137a4850-f211-444d-9d97-a88130381be51746','2015-11-11 15:05:53','1234567890',NULL,'0');
/*!40000 ALTER TABLE `u_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-28 10:12:51
