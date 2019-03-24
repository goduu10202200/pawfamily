/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50717
Source Host           : 140.135.113.148:3306
Source Database       : pawfamily

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-17 20:22:52
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `no` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `subject` varchar(30) DEFAULT NULL,
  `content` text,
  `putdate` date DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guestbook
-- ----------------------------
INSERT INTO guestbook VALUES ('1', '123', '123', '123', '132', '2016-06-10', '12');
INSERT INTO guestbook VALUES ('2', '1', '1', '1', '1', '2016-12-16', '12');
INSERT INTO guestbook VALUES ('3', 'f', '', '', '', '2016-12-16', 'null');
INSERT INTO guestbook VALUES ('4', 'ds', 'sdf', 'sdf', 'dsf', '2016-12-16', 'null');
INSERT INTO guestbook VALUES ('5', 'dsf', 'sdf', 'sdf', 'dsf', '2016-12-16', 'null');
INSERT INTO guestbook VALUES ('6', 'jkl', '', '', '', '2016-12-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('7', '2', '', '', '', '2016-12-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('8', 'jh', '', '', '', '2016-12-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('9', 'j', '', '', '', '2016-12-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('10', '45', '', '', '', '2016-12-16', '123');
INSERT INTO guestbook VALUES ('11', 'dsf', '', '', '', '2016-12-16', '123');
INSERT INTO guestbook VALUES ('12', '65', '', '', '', '2016-12-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('13', 'd', '', '', '', '2016-12-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('14', 'ghj', '', '', '', '2016-12-16', 'null');
INSERT INTO guestbook VALUES ('15', '2', '', '', '', '2016-12-17', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('16', '2', '', '', '', '2016-12-17', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('17', 'a', '', '', '', '2016-12-17', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('18', '1', '', '', '', '2016-12-17', 'null');
INSERT INTO guestbook VALUES ('19', '4', '', '', '', '2016-12-17', 'null');
INSERT INTO guestbook VALUES ('20', 'u', '', '', '', '2016-12-17', 'null');
INSERT INTO guestbook VALUES ('21', 'fg', '', '', '', '2016-12-18', 'null');
INSERT INTO guestbook VALUES ('22', 'a', 'b', 'c', 'd', '2016-12-18', '220.135.208.221');
INSERT INTO guestbook VALUES ('23', 'bbb', '', '', '', '2016-12-22', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('24', '莊亞琦', null, null, '嗨', '2017-06-15', null);
INSERT INTO guestbook VALUES ('25', '余佩珊', null, null, '恭喜錄取祥順股份有限公司', '2017-06-16', null);
INSERT INTO guestbook VALUES ('26', 'A nai', null, null, ' 網頁讚讚  萌萌噠~', '2017-06-16', null);
INSERT INTO guestbook VALUES ('27', '莊亞琦', null, null, ' 請輸入內容', '2017-06-17', null);
INSERT INTO guestbook VALUES ('28', '莊亞琦', null, null, '嗨', '2017-06-17', null);

-- ----------------------------
-- Table structure for `heart`
-- ----------------------------
DROP TABLE IF EXISTS `heart`;
CREATE TABLE `heart` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `id` text NOT NULL,
  `product_id` text NOT NULL,
  `product_name` text NOT NULL,
  `product_price` text NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of heart
-- ----------------------------
INSERT INTO heart VALUES ('45', '7', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '999');
INSERT INTO heart VALUES ('50', 'tyy', '14', '西莎餐盒小羊肉 100g', '50');
INSERT INTO heart VALUES ('53', 'tyy', '35', '粉色蒙古屋寵物窩', '3000');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `no` int(4) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `pwd` text,
  `name` text,
  `mail` text,
  `phone` text,
  `address` text,
  `lucky` double(11,1) DEFAULT NULL,
  `putdate` date DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO member VALUES ('1', 'aa', 'aa', 'aa', 'aa', '111', null, null, '2016-12-05');
INSERT INTO member VALUES ('3', 'a1', '1', '555555', '1', '1', null, null, '2016-05-31');
INSERT INTO member VALUES ('15', 'a1', '1', '555555', '1', '1', null, null, '2016-12-22');
INSERT INTO member VALUES ('16', 'a7', '7', '7', '7', '7', 'dsfg', '0.7', '2017-06-08');
INSERT INTO member VALUES ('17', 'a4', '8', '8', '8@8', '8', null, null, '2017-06-08');
INSERT INTO member VALUES ('18', 'a8', '8', '8', '8', '8', null, null, '2017-06-08');
INSERT INTO member VALUES ('19', 'a8', '8', '8', '8@8', '8', null, null, '2017-06-08');
INSERT INTO member VALUES ('20', 'a7', '7', '7', '7', '7', 'dsfg', '0.0', '2017-06-08');
INSERT INTO member VALUES ('21', 'a9', '99', '9', '9@9', '9', null, null, '2017-06-08');
INSERT INTO member VALUES ('22', 'a77', '77', '77', '77@77', '77', null, null, '2017-06-08');
INSERT INTO member VALUES ('23', 'a3', '3', '3', '3@3', '3', null, null, '2017-06-10');
INSERT INTO member VALUES ('25', 'tyy', 'iii', 'ryh', 'y@ghs', '09454', null, null, '2017-06-15');
INSERT INTO member VALUES ('26', 't2', 't2t2', 'sdf', 'sdfsdf@d', '123', null, null, '2017-06-15');
INSERT INTO member VALUES ('27', 'tyhy', 'sff', 'sf', 'sdf@ssdfsfd', '234', null, null, '2017-06-16');
INSERT INTO member VALUES ('28', 'tyy', 'sdf', 'fd', 'fsd@sdf', '234', null, null, '2017-06-16');
INSERT INTO member VALUES ('116', 'df', 'sdf', 'sdf', 'sf@sd', '244', 'sdff', null, '2017-06-16');
INSERT INTO member VALUES ('118', 'tyy', 'jkl', 'jkl', 'jkl@jkl', '234', 'sdfsf', null, '2017-06-16');
INSERT INTO member VALUES ('119', 'tty', '1', '1', '1@1', '1', 'd', null, '2017-06-16');
INSERT INTO member VALUES ('120', 'tyy', '1', '1', '1@1', '1', '1', null, '2017-06-16');
INSERT INTO member VALUES ('122', 'df', 'd', 'd', 'd@d', '3', 'd', null, '2017-06-16');
INSERT INTO member VALUES ('123', 'aaa', '123', 'sf', 'sdf@jkl', '094456', '我', '1.0', '2017-06-16');
INSERT INTO member VALUES ('124', 'anai', '860312', '阿乃', 'abcdefg@gmail.com', '0912-385-941', 'Taiwan 亞琦家', null, '2017-06-16');
INSERT INTO member VALUES ('125', 't1', 't1', 'tt', 't1@t', '123', 'tt', null, '2017-06-17');
INSERT INTO member VALUES ('128', 'cyim0617', '123', '裝', 'tyy@gmil.com', '095455', '桃園', null, '2017-06-17');

-- ----------------------------
-- Table structure for `order_form`
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `id` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `receiver_name` text NOT NULL,
  `buyer_phone` text NOT NULL,
  `receiver_addr` text NOT NULL,
  `total` text NOT NULL,
  `pay_way` text NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `orderAK` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_form
-- ----------------------------
INSERT INTO order_form VALUES ('111', '7', 'ㄎ', '415', 'ㄎ', '3996', '全家取貨付款', 'A4672', '2017-06-11');
INSERT INTO order_form VALUES ('112', '7', 'AA', '2165156', 'AA', '3996', '宅配貨到付款', 'A3829', '2017-06-11');
INSERT INTO order_form VALUES ('113', '7', 'sd', '234', 'sdf', '3996', '全家取貨付款', 'A19636', '2017-06-11');
INSERT INTO order_form VALUES ('114', '7', 'd', '435', 'dfg', '21978', '7-11取貨付款', 'A1373', '2017-06-12');
INSERT INTO order_form VALUES ('115', 'tyy', 'sdfsf', '2343423', 'sdfsdfsd', '50', '7-11取貨付款', 'A179', '2017-06-15');
INSERT INTO order_form VALUES ('116', 'tyy', 'fhfd', '09424', 'kfrgkf', '2950', '全家取貨付款', 'A3264', '2017-06-15');
INSERT INTO order_form VALUES ('117', 't2', 'sdf', '234', 'sdf', '15000', '全家取貨付款', 'A13425', '2017-06-15');
INSERT INTO order_form VALUES ('118', 'tyy', 'sdf', '34', 'fsd', '200', '全家取貨付款', 'A3372', '2017-06-15');
INSERT INTO order_form VALUES ('121', 'a7', 'sdf', '234', 'sf', '200', '宅配貨到付款', 'A1597', '2017-06-16');
INSERT INTO order_form VALUES ('122', 'a7', 'fdg', '34', 'df', '3000', '7-11取貨付款', 'A19075', '2017-06-16');
INSERT INTO order_form VALUES ('124', 'aaa', 'sdf', '1234', 'dfsf', '12250', '全家取貨付款', 'A16816', '2017-06-16');
INSERT INTO order_form VALUES ('126', 'ggg', '裝', '098', '陶', '150', '7-11取貨付款', 'A1428', '2017-06-17');

-- ----------------------------
-- Table structure for `order_form_product`
-- ----------------------------
DROP TABLE IF EXISTS `order_form_product`;
CREATE TABLE `order_form_product` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` text NOT NULL,
  `product_name` text NOT NULL,
  `product_amount` text NOT NULL,
  `product_total` text NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `id` varchar(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `orderFK` (`order_id`),
  CONSTRAINT `orderFK` FOREIGN KEY (`order_id`) REFERENCES `order_form` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_form_product
-- ----------------------------
INSERT INTO order_form_product VALUES ('231', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '4', '3996', 'A4672', '7', '2017-06-11');
INSERT INTO order_form_product VALUES ('232', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '3', '2997', 'A3829', '7', '2017-06-11');
INSERT INTO order_form_product VALUES ('233', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '1', '999', 'A3829', '7', '2017-06-11');
INSERT INTO order_form_product VALUES ('234', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '4', '3996', 'A19636', '7', '2017-06-11');
INSERT INTO order_form_product VALUES ('235', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '3', '2997', 'A1373', '7', '2017-06-12');
INSERT INTO order_form_product VALUES ('236', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '5', '4995', 'A1373', '7', '2017-06-12');
INSERT INTO order_form_product VALUES ('237', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '5', '4995', 'A1373', '7', '2017-06-12');
INSERT INTO order_form_product VALUES ('238', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '1', '999', 'A1373', '7', '2017-06-12');
INSERT INTO order_form_product VALUES ('239', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '4', '3996', 'A1373', '7', '2017-06-12');
INSERT INTO order_form_product VALUES ('240', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '3', '2997', 'A1373', '7', '2017-06-12');
INSERT INTO order_form_product VALUES ('241', '1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '1', '999', 'A1373', '7', '2017-06-12');
INSERT INTO order_form_product VALUES ('242', '11', '西莎餐盒雞肉 100g', '1', '50', 'A179', 'tyy', '2017-06-15');
INSERT INTO order_form_product VALUES ('243', '31', '鄉村木別墅', '1', '2800', 'A3264', 'tyy', '2017-06-15');
INSERT INTO order_form_product VALUES ('244', '13', '西莎餐盒野菜牛肉 100g', '3', '150', 'A3264', 'tyy', '2017-06-15');
INSERT INTO order_form_product VALUES ('245', '32', '童話粉彩貓屋', '5', '15000', 'A13425', 't2', '2017-06-15');
INSERT INTO order_form_product VALUES ('246', '11', '西莎餐盒雞肉 100g', '4', '200', 'A3372', 'tyy', '2017-06-15');
INSERT INTO order_form_product VALUES ('249', '11', '西莎餐盒雞肉 100g', '4', '200', 'A1597', 'a7', '2017-06-16');
INSERT INTO order_form_product VALUES ('250', '32', '童話粉彩貓屋', '1', '3000', 'A19075', 'a7', '2017-06-16');
INSERT INTO order_form_product VALUES ('254', '13', '西莎餐盒野菜牛肉 100g', '5', '250', 'A16816', 'aaa', '2017-06-16');
INSERT INTO order_form_product VALUES ('255', '32', '童話粉彩貓屋', '4', '12000', 'A16816', 'aaa', '2017-06-16');
INSERT INTO order_form_product VALUES ('257', '11', '西莎餐盒雞肉 100g', '3', '150', 'A1428', 'ggg', '2017-06-17');

-- ----------------------------
-- Table structure for `paw_goods`
-- ----------------------------
DROP TABLE IF EXISTS `paw_goods`;
CREATE TABLE `paw_goods` (
  `product_id` int(11) NOT NULL,
  `class_id` varchar(11) NOT NULL,
  `product_name` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_stock` int(10) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paw_goods
-- ----------------------------
INSERT INTO paw_goods VALUES ('1', 'D1', '原野優越農場-低敏無穀犬(火雞肉+鮭魚+蘋果)', '999', '887');
INSERT INTO paw_goods VALUES ('2', 'D1', '原野優越-野生魚低敏無穀犬(鮭魚+鯡魚+蘋果)', '999', '1000');
INSERT INTO paw_goods VALUES ('3', 'D1', '原野優越-海洋精華成犬(鮭魚+鯡魚+紅薯配方)', '999', '1000');
INSERT INTO paw_goods VALUES ('4', 'D1', '烘焙客Oven-Baked-羊肉+糙米成犬配方', '999', '1000');
INSERT INTO paw_goods VALUES ('5', 'D1', '烘焙客Oven-Baked-成犬深海魚配方', '999', '1000');
INSERT INTO paw_goods VALUES ('6', 'D1', '烘焙客Oven-Baked-雞肉成犬配方', '999', '1000');
INSERT INTO paw_goods VALUES ('7', 'D1', 'GO-WDJ推薦羊肉蔬果營養配方(強健活力成幼犬)', '999', '1000');
INSERT INTO paw_goods VALUES ('8', 'D1', 'GO-WDJ推薦雞肉鮭魚無穀(結實抗敏全犬)', '999', '1000');
INSERT INTO paw_goods VALUES ('9', 'D1', 'GO-WDJ推薦雞肉蔬果(新鮮活力成幼犬)', '999', '1000');
INSERT INTO paw_goods VALUES ('10', 'D1', 'GO-WDJ推薦低致敏鹿肉無穀(抗敏亮毛配方)', '999', '1000');
INSERT INTO paw_goods VALUES ('11', 'D2', '西莎餐盒雞肉 100g', '50', '872');
INSERT INTO paw_goods VALUES ('12', 'D2', '西莎餐盒牛肉 100g', '50', '895');
INSERT INTO paw_goods VALUES ('13', 'D2', '西莎餐盒野菜牛肉 100g', '50', '885');
INSERT INTO paw_goods VALUES ('14', 'D2', '西莎餐盒小羊肉 100g', '50', '895');
INSERT INTO paw_goods VALUES ('15', 'D2', 'CoCo機能狗罐(鮮嫩雞肉+起司)80g', '40', '900');
INSERT INTO paw_goods VALUES ('16', 'D2', 'CoCo機能狗罐(羊肉+雞肉+起司)80g', '40', '900');
INSERT INTO paw_goods VALUES ('17', 'D2', 'CoCo機能狗罐(牛肉+雞肉+起司)80g', '40', '900');
INSERT INTO paw_goods VALUES ('18', 'D2', '貴族餐盒(鮮雞肉)100g', '40', '900');
INSERT INTO paw_goods VALUES ('19', 'D2', '貴族餐盒(小羊肉)100g', '40', '900');
INSERT INTO paw_goods VALUES ('20', 'D2', '貴族餐盒(小牛肉)100g', '40', '900');
INSERT INTO paw_goods VALUES ('21', 'C1', 'CHEWIES 12吋牛奶打結骨(1入)', '200', '800');
INSERT INTO paw_goods VALUES ('22', 'C1', '潔齒大師DR.TOOTH-六角潔牙棒140g(亮白潔淨)', '150', '800');
INSERT INTO paw_goods VALUES ('23', 'C1', '日本MU起司條50g', '150', '800');
INSERT INTO paw_goods VALUES ('24', 'C1', '日本MU高鈣起司球40g', '150', '800');
INSERT INTO paw_goods VALUES ('25', 'C1', '活力零食-起司雞肉條200g', '150', '800');
INSERT INTO paw_goods VALUES ('26', 'C1', '活力零食-雞胸肉片130g', '150', '800');
INSERT INTO paw_goods VALUES ('27', 'C1', 'KOTA PET烘焙村-牛肉塊 120g', '150', '800');
INSERT INTO paw_goods VALUES ('28', 'C1', '日本MU沙丁魚小150g', '150', '800');
INSERT INTO paw_goods VALUES ('29', 'C1', 'BISCAL犬用消臭餅乾', '150', '800');
INSERT INTO paw_goods VALUES ('30', 'C1', 'CocoTherapy 初榨椰子油 (8oz)', '150', '800');
INSERT INTO paw_goods VALUES ('31', 'C2', '鄉村木別墅', '2800', '685');
INSERT INTO paw_goods VALUES ('32', 'C2', '童話粉彩貓屋', '3000', '688');
INSERT INTO paw_goods VALUES ('33', 'C2', 'Diamond鑽石型寵物窩', '3000', '694');
INSERT INTO paw_goods VALUES ('34', 'C2', 'Stripe Yellow寵物手工帳篷', '3000', '700');
INSERT INTO paw_goods VALUES ('35', 'C2', '粉色蒙古屋寵物窩', '3000', '700');
INSERT INTO paw_goods VALUES ('36', 'C2', '綠色幾何圖寵物窩', '3000', '700');
INSERT INTO paw_goods VALUES ('37', 'C3', 'My Territory - Pet Bed寵物床墊', '2500', '700');
INSERT INTO paw_goods VALUES ('38', 'C3', 'Ordinary Foam寵物床墊', '2500', '700');
INSERT INTO paw_goods VALUES ('39', 'C3', '寵物好夢墊 (L)', '2500', '700');
INSERT INTO paw_goods VALUES ('40', 'C3', '貓籃子睡墊', '2500', '700');
INSERT INTO paw_goods VALUES ('41', 'C3', '方型吊床(含床墊)', '2500', '700');
INSERT INTO paw_goods VALUES ('42', 'C3', '方方窩(含床墊)', '2500', '700');
INSERT INTO paw_goods VALUES ('43', 'C4', 'BoxKitty貓傢俱 大笨鐘組合貓屋', '3000', '600');
INSERT INTO paw_goods VALUES ('44', 'C4', '【喵的移動城堡】三層貓屋組合玩具', '3000', '600');
INSERT INTO paw_goods VALUES ('45', 'C4', 'WOODEN CUBE原木組合跳箱窩', '3000', '600');
INSERT INTO paw_goods VALUES ('46', 'C4', '貓抓板梯形玩具', '3000', '600');
INSERT INTO paw_goods VALUES ('47', 'C4', '幸福豪宅貓跳台', '3000', '600');
INSERT INTO paw_goods VALUES ('48', 'C4', '幸福迴廊貓跳台', '3000', '600');
INSERT INTO paw_goods VALUES ('49', 'C5', '啾啾耐咬球', '400', '500');
INSERT INTO paw_goods VALUES ('50', 'C5', '毛線編織球', '300', '500');
INSERT INTO paw_goods VALUES ('51', 'C5', '帆布繩結啃咬狗玩具', '300', '500');
INSERT INTO paw_goods VALUES ('52', 'C5', '骨頭玩偶狗玩具', '300', '500');
INSERT INTO paw_goods VALUES ('53', 'C5', '棉繩骨一體成型玩具', '300', '500');
INSERT INTO paw_goods VALUES ('54', 'C5', '益智磨牙橡膠玩具', '300', '500');
INSERT INTO paw_goods VALUES ('55', 'C6', '彩色格紋寵物碗', '500', '600');
INSERT INTO paw_goods VALUES ('56', 'C6', '彩色條紋寵物碗', '500', '600');
INSERT INTO paw_goods VALUES ('57', 'C6', '抗菌食物不撒出寵物碗', '500', '600');
INSERT INTO paw_goods VALUES ('58', 'C6', '防蟻陶瓷寵物碗', '500', '600');
INSERT INTO paw_goods VALUES ('59', 'C6', '防蟻寵物食碗', '500', '600');
INSERT INTO paw_goods VALUES ('60', 'C6', '韋斯 [W&S]典雅陶瓷餵食碗', '500', '600');
INSERT INTO paw_goods VALUES ('61', 'C7', '可調式寵物餐桌', '600', '600');
INSERT INTO paw_goods VALUES ('62', 'C7', '大口餐架(雙碗)', '600', '600');
INSERT INTO paw_goods VALUES ('63', 'C7', '原木寵物托高碗架 (胡桃木色，含瓷碗)', '600', '600');
INSERT INTO paw_goods VALUES ('64', 'C7', '原木寵物托高碗架(中大型適用)', '600', '600');
INSERT INTO paw_goods VALUES ('65', 'C7', '時空膠囊碗(湖水綠)', '600', '600');
INSERT INTO paw_goods VALUES ('66', 'C7', '中型寵物碗架', '600', '600');
INSERT INTO paw_goods VALUES ('67', 'D4', '客製化刺繡寵物項圈', '500', '700');
INSERT INTO paw_goods VALUES ('68', 'D4', '寵物狗狗項圈(尺寸XL)', '500', '700');
INSERT INTO paw_goods VALUES ('69', 'D4', '夢幻水琴鈴愛心天使手工寵物項圈', '500', '700');
INSERT INTO paw_goods VALUES ('70', 'D4', '寵物項圈鈴鐺掛飾', '30', '700');
INSERT INTO paw_goods VALUES ('71', 'D3', 'ACTION!!開賣啦~~寵物客製化吊牌', '500', '700');
INSERT INTO paw_goods VALUES ('72', 'D3', '客製化黃銅寵物吊牌', '500', '700');
INSERT INTO paw_goods VALUES ('73', 'D5', 'For Dear毛小孩的漂泊三角領巾', '400', '700');
INSERT INTO paw_goods VALUES ('74', 'D5', '寶藍緣字花圖寵物三角領巾', '400', '700');
INSERT INTO paw_goods VALUES ('75', 'D6', '手作貓咪狗狗領結項圈(波士頓梗)', '399', '800');
INSERT INTO paw_goods VALUES ('76', 'D6', '手作貓咪狗狗領結項圈(彩色小魚兒)', '399', '800');
INSERT INTO paw_goods VALUES ('77', 'D6', '手作貓咪狗狗領結項圈(熱帶香蕉)', '399', '800');
INSERT INTO paw_goods VALUES ('78', 'D6', '寵物領片紅花-XS號', '399', '800');
INSERT INTO paw_goods VALUES ('79', 'D7', '歐洲品牌瘋狂爪子飛輪伸縮牽繩L號', '650', '900');
INSERT INTO paw_goods VALUES ('80', 'D7', '功能加強款牽繩(暖橘)', '650', '900');
INSERT INTO paw_goods VALUES ('81', 'D7', '金屬雕花圓牌皮革長牽繩', '650', '900');
INSERT INTO paw_goods VALUES ('82', 'D7', '安全PLUS系列胸背牽繩', '700', '900');
INSERT INTO paw_goods VALUES ('83', 'D8', '河童龜殼寵物包包', '1200', '900');
INSERT INTO paw_goods VALUES ('84', 'D8', '小西瓜寵物背包', '1200', '900');

-- ----------------------------
-- Table structure for `paw_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `paw_goods_class`;
CREATE TABLE `paw_goods_class` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` varchar(11) DEFAULT NULL,
  `product_class` text NOT NULL,
  PRIMARY KEY (`no`),
  KEY `goodsAK2` (`class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paw_goods_class
-- ----------------------------
INSERT INTO paw_goods_class VALUES ('1', 'B0', '食物');
INSERT INTO paw_goods_class VALUES ('2', 'B1', '寵物窩');
INSERT INTO paw_goods_class VALUES ('3', 'B2', '玩具');
INSERT INTO paw_goods_class VALUES ('4', 'B3', '寵物碗');
INSERT INTO paw_goods_class VALUES ('5', 'B4', '客製化');

-- ----------------------------
-- Table structure for `paw_goods_class_feature`
-- ----------------------------
DROP TABLE IF EXISTS `paw_goods_class_feature`;
CREATE TABLE `paw_goods_class_feature` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` varchar(11) NOT NULL,
  `feature_class` text NOT NULL,
  `class_id` varchar(11) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `goodsAK3` (`feature_id`) USING BTREE,
  KEY `goodsAK2` (`class_id`),
  CONSTRAINT `orderFK2` FOREIGN KEY (`class_id`) REFERENCES `paw_goods_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paw_goods_class_feature
-- ----------------------------
INSERT INTO paw_goods_class_feature VALUES ('1', 'C0', '主食', 'B0');
INSERT INTO paw_goods_class_feature VALUES ('2', 'C1', '點心', 'B0');
INSERT INTO paw_goods_class_feature VALUES ('3', 'C2', '寵物窩', 'B1');
INSERT INTO paw_goods_class_feature VALUES ('4', 'C3', '寵物床墊', 'B1');
INSERT INTO paw_goods_class_feature VALUES ('5', 'C4', '大玩具', 'B2');
INSERT INTO paw_goods_class_feature VALUES ('6', 'C5', '小玩具', 'B2');
INSERT INTO paw_goods_class_feature VALUES ('7', 'C6', '寵物碗', 'B3');
INSERT INTO paw_goods_class_feature VALUES ('8', 'C7', '碗架', 'B3');
INSERT INTO paw_goods_class_feature VALUES ('9', 'C8', '頸部飾品', 'B4');
INSERT INTO paw_goods_class_feature VALUES ('10', 'C9', '小物', 'B4');

-- ----------------------------
-- Table structure for `paw_goods_class_feature_2`
-- ----------------------------
DROP TABLE IF EXISTS `paw_goods_class_feature_2`;
CREATE TABLE `paw_goods_class_feature_2` (
  `feature2_id` varchar(11) NOT NULL,
  `feature2_class` text NOT NULL,
  `feature_id` varchar(11) NOT NULL,
  PRIMARY KEY (`feature2_id`),
  KEY `orderFK3` (`feature_id`),
  CONSTRAINT `orderFK3` FOREIGN KEY (`feature_id`) REFERENCES `paw_goods_class_feature` (`feature_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paw_goods_class_feature_2
-- ----------------------------
INSERT INTO paw_goods_class_feature_2 VALUES ('D1', '飼料', 'C0');
INSERT INTO paw_goods_class_feature_2 VALUES ('D2', '罐頭', 'C0');
INSERT INTO paw_goods_class_feature_2 VALUES ('D3', '吊牌', 'C8');
INSERT INTO paw_goods_class_feature_2 VALUES ('D4', '項圈', 'C8');
INSERT INTO paw_goods_class_feature_2 VALUES ('D5', '領巾', 'C8');
INSERT INTO paw_goods_class_feature_2 VALUES ('D6', '蝴蝶結', 'C9');
INSERT INTO paw_goods_class_feature_2 VALUES ('D7', '牽繩', 'C9');
INSERT INTO paw_goods_class_feature_2 VALUES ('D8', '寵物包', 'C9');

-- ----------------------------
-- Table structure for `shoppingcar`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `product_id` text NOT NULL,
  `product_name` text NOT NULL,
  `product_amount` text NOT NULL,
  `product_price` text NOT NULL,
  `product_total` text NOT NULL,
  `shoppingcar_id` text NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
