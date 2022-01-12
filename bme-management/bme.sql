/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : bme

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-01-11 15:56:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` char(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `permission_level` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('2019111093', '张剑', '0225', '0');

-- ----------------------------
-- Table structure for t_journal
-- ----------------------------
DROP TABLE IF EXISTS `t_journal`;
CREATE TABLE `t_journal` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `impact_factor` float unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_journal
-- ----------------------------
INSERT INTO `t_journal` VALUES ('1', '生物医学工程学杂志', ' 四川省生物医学工程学会', null);
INSERT INTO `t_journal` VALUES ('2', 'Medical Image Analysis\r\nMedical Image Analysis', null, '8.545');
INSERT INTO `t_journal` VALUES ('3', 'Physics in Medicine and Biology\r\nPhysici in Medicine and Biology', 'IOP', '3.609');

-- ----------------------------
-- Table structure for t_members
-- ----------------------------
DROP TABLE IF EXISTS `t_members`;
CREATE TABLE `t_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `director_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `executor_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `archivist_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `conceptualization_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `methodology_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `investigation_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `writing_original_draft_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `writing_review_editing_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `visualization_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `software_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2019111094 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_members
-- ----------------------------
INSERT INTO `t_members` VALUES ('20050301', 'T2001006', 'S2005010002', 'T2004007', 'S2005010002', 'S2011036025', 'S2005010002', 'S2005010002', 'T2001006', 'S2018002034', 'S2018002034');
INSERT INTO `t_members` VALUES ('20130809', 'T2019009', 'S2020010025', 'T2018007', 'S2018002034', 'S2018002034', 'S2019111001', 'S2020010025', '', 'S2018002034', 'S2018002034');
INSERT INTO `t_members` VALUES ('20190506', 'T2014009', 'S2011100300', 'T2009001', 'S2011100300', 'S2011036025', 'S2011100300', 'S2015020401', 'T2005004', 'S2011036025', 'S2011036025');
INSERT INTO `t_members` VALUES ('20190605', 'T2014009', 'S2016023033', 'T2015024', '', '', 'S2016023033', '', '', '', '');
INSERT INTO `t_members` VALUES ('20200303', 'T2019001', 'S2020010025', 'T2018022', 'S2015020401', 'S2015020401', 'S2020010025', 'S2016023033', '', 'S2016021033', 'S2016021033');
INSERT INTO `t_members` VALUES ('20201001', 'T2006023', 'S2018110336', 'T2015024', 'S2016023033', 'S2011100300', 'S2016023033', 'S2011100300', 'T2015024', 'S2015020401', 'S2016021033');

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `proposal_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `file_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state` enum('Ended','Processing','Suspended','NotStarted') DEFAULT NULL,
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `jid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2019240217 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('20050301', 'Progressive changes in the major salivary gland after radioiodine therapy for differentiated thyroid cancer: a single-center retrospective ultrasound cohort study.', '2005-03-03 16:00:00', null, 'Ended', 'This study aimed to determine the prevalence of radioiodine-induced salivary gland damage by evaluating progressive changes in salivary glands using ultrasound. Four hundred forty-six patients with differentiated thyroid carcinoma who underwent total or near-total thyroidectomy and postoperative radioiodine therapy were retrospectively reviewed. From the first to the fifth follow-up visits, the positive rate of major salivary gland changes on ultrasound gradually increased from 2.0% to 33.0% (P<0.001) and possibly stabilized at the fifth visit (approximately 36 months). The first positive result was detected at an average of 20.78±8.72 months. Only 21 of the 161 positive cases eventually achieved negative ultrasound results (Fisher\'s test, P<0.001), and the 21 cases simply showed a coarse echotexure. In conclusion, ultrasound changes appeared late, and most of these changes were not reversed.', '1');
INSERT INTO `t_project` VALUES ('20130809', '超声造影联合血清学在卵巢癌早期筛查中的应用研究', '2013-07-06 16:00:00', null, 'Ended', '目的探讨超声造影指标联合血清学糖类抗原125（CA125）、癌胚抗原（CEA）、人附睾分泌蛋白4（HE4）在卵巢癌早期筛查中的应用价值。方法选取卵巢占位性病变患者105例,均行超声造影检查和血清CA125、CEA、HE4检查,分析超声造影联合血清CA125、CEA、HE4对卵巢癌的诊断效能。结果相比良性组,卵巢恶性肿瘤组的RT、TTP值更低,PI、TIC-AUC、CA125、CEA、HE4值更高（P<0.05）。对卵巢良/恶性肿瘤的诊断,超声造影各指标（RT、PI、TTP）的ROC-AUC分别为0.736、0.720、0.733。造影综合（联合）的诊断效能高于超声造影各指标的单独应用。血清学指标（CA125、CEA、HE4）诊断卵巢恶性肿瘤的ROC-AUC分别为0.715、0.713、0.777。血清综合（联合）的诊断效能高于血清各指标的单独应用。造影综合和血清综合联合应用的诊断灵敏度为0.932%。结论超声造影联合血清CA125、CEA、HE4对卵巢癌有较高的灵敏度,适用于卵巢癌的早期筛查', '2');
INSERT INTO `t_project` VALUES ('20190506', 'Advancements in the Application of Ultrasound Elastography in the Cervix.', '2018-12-31 16:00:00', null, 'Processing', 'Ultrasound elastography is a modern imaging technique that has developed rapidly in recent years. It enables objective measurement of tissue stiffness, a physical property intuitive to the human sense of touch. This novel technology has become a hotspot and plays a major role in scientific research and academic practice. Presently, ultrasound elastography has been used in the identification of benign and malignant tumors in superficial organs, such as breast and thyroid, providing clinically accurate diagnosis and treatment. The method has also been widely used for the liver, kidney, prostate, lymph nodes, blood vessels, skin and muscle system. In the application of cervical lesions, ultrasound elastography can distinguish normal cervix from abnormal cervix and differentiate benign from malignant lesions.', '2');
INSERT INTO `t_project` VALUES ('20190605', '基于深度学习多特征融合的手势分割识别算法', '2019-10-08 16:00:00', null, 'Processing', '', null);
INSERT INTO `t_project` VALUES ('20200303', '超声造影、弹性成像联合多层螺旋CT鉴别诊断甲状腺良恶性结节的价值', '2020-05-04 16:00:00', null, 'NotStarted', '目的探讨超声造影（CEUS）、弹性成像（UE）及多层螺旋CT（MSCT）联合应用鉴别诊断甲状腺良恶性结节的价值。', null);
INSERT INTO `t_project` VALUES ('20201001', '基于深度学习的区块链蜜罐陷阱合约检测', '2020-11-03 16:00:00', null, 'Suspended', '', null);

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `id` char(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` tinyint NOT NULL,
  `id_number` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('S2005010002', '刘德华', '1', '422802199708078397', '生物医学工程学院', '影像医学与核医学');
INSERT INTO `t_student` VALUES ('S2011036025', '王一博', '1', '360102199003075974', '第二临床学院', '医学影像技术');
INSERT INTO `t_student` VALUES ('S2011100300', '迪丽热巴', '0', '650102199103075348', '生物医学工程学院', '电子信息');
INSERT INTO `t_student` VALUES ('S2015020401', '黄子韬', '1', '422802199708078397', '第一临床学院', '骨科');
INSERT INTO `t_student` VALUES ('S2016021033', '宋茜', '2', '310106199003071566', '生物医学工程学院', '妇产科学');
INSERT INTO `t_student` VALUES ('S2016023033', '易烊千玺', '1', '500103200303079393', '生物医学工程学院', '生物医学工程');
INSERT INTO `t_student` VALUES ('S2018002034', '鹿晗', '1', '330702199309073573', '生物医学工程学院', '');
INSERT INTO `t_student` VALUES ('S2018110336', '张译', '1', '33070219930907877X', '生物医学工程学院', '生物医学工程');
INSERT INTO `t_student` VALUES ('S2019111001', '陈伟霆', '1', '110101198503070611', '生物医学工程学院', '生物医学工程');
INSERT INTO `t_student` VALUES ('S2020010025', '刘诗诗', '2', '610103199803079349', '基础医学院', '基础医学');
INSERT INTO `t_student` VALUES ('S2020010087', '张艺兴', '1', '330702199309071658', '第一临床学院', '麻醉学');
INSERT INTO `t_student` VALUES ('S2021056003', '张小斐', '2', '610103199803070264', '医学信息学院', '医学信息管理');
INSERT INTO `t_student` VALUES ('S2021111056', '佟丽娅', '2', '650102199103075444', '感染性疾病分子生物学重点实验室', '临床检验诊断学');

-- ----------------------------
-- Table structure for t_supervisor
-- ----------------------------
DROP TABLE IF EXISTS `t_supervisor`;
CREATE TABLE `t_supervisor` (
  `id` char(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` tinyint NOT NULL,
  `id_number` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of t_supervisor
-- ----------------------------
INSERT INTO `t_supervisor` VALUES ('T2001006', 'JamesBond', '1', '', '生物医学工程学院');
INSERT INTO `t_supervisor` VALUES ('T2004007', '周迅', '2', '320104198807115725', '生物医学工程学院');
INSERT INTO `t_supervisor` VALUES ('T2005004', '徐峥', '1', '440103196203075074', '生物医学工程学院');
INSERT INTO `t_supervisor` VALUES ('T2006023', '吴彦祖', '1', '110101197303077953', '生物医学工程学院');
INSERT INTO `t_supervisor` VALUES ('T2009001', '周星驰', '1', '440103196203075437', '生物医学工程学院');
INSERT INTO `t_supervisor` VALUES ('T2014009', '唐嫣', '2', '320104198807115725', '中医药学院');
INSERT INTO `t_supervisor` VALUES ('T2015024', '张艺谋', '1', '110101196707172178', '检验医学院');
INSERT INTO `t_supervisor` VALUES ('T2018007', '刘涛', '2', '320104197207113543', '生物医学工程学院');
INSERT INTO `t_supervisor` VALUES ('T2018022', '梅艳芳', '2', '110101199003077205', '生物医学工程学院');
INSERT INTO `t_supervisor` VALUES ('T2019001', '蔡徐坤', '0', '31010619900307912X', '第一临床学院');
INSERT INTO `t_supervisor` VALUES ('T2019009', '戚薇', '2', '320104198807113543', '生物医学工程学院');
INSERT INTO `t_supervisor` VALUES ('T2021003', 'Angelababy', '2', '310112199003074828', '基础医学院');
