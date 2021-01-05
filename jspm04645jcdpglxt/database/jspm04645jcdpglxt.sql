/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jspm04645jcdpglxt

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-12-22 15:20:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', '2020-12-21 21:19:51');

-- ----------------------------
-- Table structure for `changci`
-- ----------------------------
DROP TABLE IF EXISTS `changci`;
CREATE TABLE `changci` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `huajuxinxiid` int(10) unsigned NOT NULL COMMENT '话剧信息id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `haibao` varchar(255) NOT NULL COMMENT '海报',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `yanyichangsuo` int(10) unsigned NOT NULL COMMENT '演艺场所',
  `kaichangshijian` varchar(25) NOT NULL COMMENT '开场时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `shengyupiaoshu` varchar(50) NOT NULL COMMENT '剩余票数',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `changci_huajuxinxiid_index` (`huajuxinxiid`),
  KEY `changci_fenlei_index` (`fenlei`),
  KEY `changci_yanyichangsuo_index` (`yanyichangsuo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changci
-- ----------------------------

-- ----------------------------
-- Table structure for `goupiao`
-- ----------------------------
DROP TABLE IF EXISTS `goupiao`;
CREATE TABLE `goupiao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changciid` int(10) unsigned NOT NULL COMMENT '场次id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `yanyichangsuo` int(10) unsigned NOT NULL COMMENT '演艺场所',
  `kaichangshijian` varchar(25) NOT NULL COMMENT '开场时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `shengyupiaoshu` varchar(50) NOT NULL COMMENT '剩余票数',
  `goumaipiaoshu` int(11) NOT NULL COMMENT '购买票数',
  `xuanzuo` varchar(50) NOT NULL COMMENT '选座',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `zhuangtai` varchar(255) NOT NULL COMMENT '状态',
  `goupiaoren` varchar(50) NOT NULL COMMENT '购票人',
  `iszf` varchar(10) NOT NULL DEFAULT '否' COMMENT '是否支付',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `goupiao_changciid_index` (`changciid`),
  KEY `goupiao_yanyichangsuo_index` (`yanyichangsuo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goupiao
-- ----------------------------
INSERT INTO `goupiao` VALUES ('1', '1', '12212126172117', '《霸王别姬》', '1', '2020-12-22 20:00:00', '2020-12-22 22:00:00', '80.00', '64', '2', '3_4,3_5', '160.00', '已结束', '001', '是', '2020-12-22 10:33:06');
INSERT INTO `goupiao` VALUES ('2', '1', '12212126172117', '《霸王别姬》', '1', '2020-12-22 20:00:00', '2020-12-22 22:00:00', '80.00', '62', '2', '2_4,2_5', '160.00', '已出票', '001', '是', '2020-12-22 10:34:34');
INSERT INTO `goupiao` VALUES ('3', '2', '12221040021960', '《两将军》', '1', '2020-12-23 15:00:00', '2020-12-23 17:00:00', '60.00', '64', '4', '1_2,1_3,1_4,1_5', '240.00', '已退票', '100', '是', '2020-12-22 15:03:54');
INSERT INTO `goupiao` VALUES ('4', '2', '12221040021960', '《两将军》', '1', '2020-12-23 15:00:00', '2020-12-23 17:00:00', '60.00', '63', '2', '3_7,4_8', '120.00', '已结束', '100', '是', '2020-12-22 15:17:34');

-- ----------------------------
-- Table structure for `huajufenlei`
-- ----------------------------
DROP TABLE IF EXISTS `huajufenlei`;
CREATE TABLE `huajufenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(255) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of huajufenlei
-- ----------------------------
INSERT INTO `huajufenlei` VALUES ('1', '爆笑情景', '2020-12-21 21:20:25');
INSERT INTO `huajufenlei` VALUES ('2', '舞台剧场', '2020-12-21 21:20:30');
INSERT INTO `huajufenlei` VALUES ('3', '情感演绎', '2020-12-22 14:48:33');

-- ----------------------------
-- Table structure for `huajuxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `huajuxinxi`;
CREATE TABLE `huajuxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `haibao` varchar(255) NOT NULL COMMENT '海报',
  `zhuyan` varchar(50) NOT NULL COMMENT '主演',
  `shizhang` varchar(50) NOT NULL COMMENT '时长',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `huajuxinxi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of huajuxinxi
-- ----------------------------
INSERT INTO `huajuxinxi` VALUES ('1', '12212126172117', '开心麻花沉浸式喜剧体验', '2', 'upload/1608619519338.png', '张晓棠', '120分钟', '<p><span style=\"color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal;\">温馨提示：为响应国家防疫要求，部分剧院实施交叉或隔排售票方式，故在疫情期间，平台将无法保障同一订单3张及以内保证连座，给您观演带来不便，敬请谅解~</span></p><p><span style=\"color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal;\"><img src=\"upload/20201222/1551608619565730.png\" _src=\"upload/20201222/1551608619565730.png\"/></span></p>', '2020-12-21 21:28:38');
INSERT INTO `huajuxinxi` VALUES ('2', '12221040021960', '孟京辉经典戏剧作品《狐狸天使', '1', 'upload/1608619583116.png', '马敬帅、汪宇演', '120分钟', '<ul class=\"content_txt\" style=\"border: 0px; font-size: 12px; line-height: 24px; color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; white-space: normal;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">舞蹈女演员露露在夜晚的大街上遇到了一只狐狸，狐狸带着她来到了“蒙娜丽莎书店”。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">书店里一个神秘的男人请她坐下喝一杯，他拿出的绿杯子正是露露常常梦到的那一只。露露满心欢喜地握住绿杯子，突然间跌入一场狐狸的婚礼。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">手里握着绿杯子的露露忽然回到了“蒙娜丽莎书店”，书店里的男人却没有了踪影。她扭头透过书店的玻璃窗看到了各种各样的人影。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">一个服务员被一场车祸撞飞了脑子里的想法。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">一个植物学家被迪斯科舞厅的音乐撞飞了生活与事业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">一个怀孕的妻子在游泳池发现了六百万的中奖彩票。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">一个心理医生爱上了另一个心理医生。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">一个暴饮暴食的心电图女孩潜入了导演的家中。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">斑斓、诡异、迷离、放肆、优雅、激情，时间和空间的交叉点。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">露露接到了一个电话，她推开小丑，拿起飞镖，向婚礼现场飞奔。</p></ul><p><br/></p>', '2020-12-22 10:40:51');
INSERT INTO `huajuxinxi` VALUES ('3', '12221041392056', '开心麻花爆笑舞台剧《谈判专家》', '2', 'upload/1608619622190.png', '闫学晶', '120分钟', '<p><img src=\"upload/20201222/93741608619643865.png\" _src=\"upload/20201222/93741608619643865.png\"/></p>', '2020-12-22 10:42:34');
INSERT INTO `huajuxinxi` VALUES ('4', '12221450091513', '经典芭蕾舞剧《天鹅湖》', '2', 'upload/1608619811011.png', '张三，李四，王五', '120分钟', '<ul class=\"content_txt\" style=\"border: 0px; font-size: 12px; line-height: 24px; color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; white-space: normal;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">有一场芭蕾舞剧，是传世经典</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">经典梦幻的童话剧情、轻盈灵动的舞姿</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">“四小天鹅”、“32个挥鞭转”</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">以及那耳熟能详的旋律……</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">广州芭蕾舞团再现</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">柴可夫斯基经典芭蕾舞剧《天鹅湖》！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><img width=\"700\" height=\"441\" src=\"./upload/1608619830839.png\" damai_height=\"441\" damai_width=\"700\" style=\"border-width: initial; margin: 10px 0px; padding: 0px; outline-style: none; width: 598px; height: auto; border-radius: 5px;\"/></p></ul><p><br/></p>', '2020-12-22 14:50:31');
INSERT INTO `huajuxinxi` VALUES ('5', '12221450325780', '开心麻花五星爆笑大戏《瞎画艺术家》', '1', 'upload/1608619841544.png', '张三，李四，王五', '120分钟', '<ul class=\"content_txt\" style=\"border: 0px; font-size: 12px; line-height: 24px; color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; white-space: normal;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(27, 27, 27); font-family: 微软雅黑;\"><span style=\"margin: 0px; padding: 0px; border: 0px; background-color: rgb(229, 51, 51); color: rgb(255, 255, 255); font-size: 24px;\"><span style=\"font-weight: bolder;\"><span style=\"margin: 0px; padding: 0px; border: 0px; line-height: 2;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 16px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; line-height: 2; font-size: 24px;\">1.演出可能含有不适宜儿童观看内容，儿童谢绝入场.</span><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: 24px; line-height: 2;\"></span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; line-height: 2; font-size: 24px;\">2.话剧演出性质特殊且具时效性，门票售出一概不退不换.</span><br/><span style=\"margin: 0px; padding: 0px; border: 0px; line-height: 2; font-size: 24px;\">3.演出阵容以现场为准.</span></span></span></span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 微软雅黑; background-color: rgb(229, 51, 51); color: rgb(255, 255, 255); font-size: 24px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><img src=\"./upload/1608619865847.png\" alt=\"【深圳站】开心麻花五星爆笑大戏《瞎画艺术家》\" style=\"border-width: initial; margin: 10px 0px; padding: 0px; outline-style: none; width: 598px; height: auto; border-radius: 5px;\"/></p></ul><p><br/></p>', '2020-12-22 14:51:06');
INSERT INTO `huajuxinxi` VALUES ('6', '12221451273425', '舞剧《永不消逝的电波》', '3', 'upload/1608619889333.png', '张译、刘浩存', '120分钟', '<ul class=\"content_txt\" style=\"border: 0px; font-size: 12px; line-height: 24px; color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; white-space: normal;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><img src=\"./upload/1608619911561.png\" style=\"border-width: initial; margin: 10px 0px; padding: 0px; outline-style: none; width: 598px; height: auto; border-radius: 5px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">庆祝深圳特区40周年·献礼演出季</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">舞剧《永不消逝的电波》</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">时间：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">2021年1月8-10日（五-日） 20:00</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">2021年1月9日（六）&nbsp; 14:30</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">团体：上海歌舞团有限公司</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 上海东方青春舞蹈团</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">剧目介绍</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">上海街头，雨夜。&nbsp;李侠与兰芬假扮夫妻，开启&nbsp;12&nbsp;年的潜伏生涯……&nbsp;每一天，行走在刀锋，&nbsp;每一晚，秘密情报传送千里。&nbsp;一重重伪装，藏起疲惫，眺望曙光。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">解放前夕，黎明将至，夜色更加阴冷。&nbsp;李侠的身边，无形的敌人步步逼进，无数战友消失在疾风骤雨。&nbsp;报社秘书、摄影记者、裁缝掌柜、小学徒、黄包车夫、社长、卖花女，&nbsp;他们的身份究竟是真是假？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">无声的枪口，紧张的追逐，闪电撕裂心的伤口，吞声饮泪……&nbsp;一路患难走来的李侠夫妇，面临生死抉择。&nbsp;李侠坦然发送最后一份情报，笑对牺牲。&nbsp;天，快亮了。<br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">作品介绍</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">上海是中国共产党的诞生地，无数革命先烈曾在这里英勇就义，这座城市有 着光荣的革命传统，传承着红色基因，承担着重要使命。上海歌舞团响应上海市委书记李强同志“全面打响上海红色文化品牌、海派文化品牌、江南文化品牌”的要求，以解放前夕英勇牺牲的我党情报人员李白等烈士们为创作原型，创作演 出舞剧《永不消逝的电波》，向英雄致敬！向革命先烈致敬！传承和弘扬上海红 色文化！为建国 70 周年、建党 100 周年献礼！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">舞剧《永不消逝的电波》取材自“100 位为新中国成立做出突出贡献的英雄 模范”人物之一——李白，以李白烈士的真实故事为素材，在尊重历史的基础上进行大胆原创，融入青春色彩、红色记忆、浪漫情怀、谍战氛围等元素，通过舞 剧的独特表现形式，把石库门、弄堂、马路、报馆、旗袍裁缝店等老上海的城市 特色细致入微地呈现在舞台上，以高度凝练的舞剧叙事、唯美的意象表达、灵活 写意的舞台布景和谍战的紧张悬念，再现了为我党民族解放事业而壮烈牺牲的、可歌可泣的英雄形象。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">全剧时长约两小时，分上下半场，从李侠与兰芬假扮夫妻在上海开启潜伏生涯开始，长达12 年的岁月里，他们每日行走在生与死的刀锋上，秘密用电波传递着情报。谍影重重的上海，谁是敌人，谁是朋友？身边充斥着暗箭冷枪，数不尽的同志英勇就义，撕心裂肺却唯有吞声饮泪。无声的枪口，紧张的追逐，李侠夫妇一路患难走过。“天”快亮了，却迎来生死抉择。坦然发送出最后一份电报， 李侠笑对牺牲！长河无声奔去，唯爱与信念永存！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br style=\"margin: 0px; padding: 0px;\"/></p></ul><p><br/></p>', '2020-12-22 14:51:51');
INSERT INTO `huajuxinxi` VALUES ('7', '12221452371887', '话剧《四世同堂》', '3', 'upload/1608619959011.png', '马敬帅、汪宇演', '120分钟', '<ul class=\"content_txt\" style=\"border: 0px; font-size: 12px; line-height: 24px; color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; white-space: normal;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">中国国家话剧院是中华人民共和国文化和旅游部直属的国家艺术院团。拥有雄厚的艺术创作资源和辉煌的戏剧文化传统。以欧阳予倩、廖承志、吴雪、舒强、金山、孙维世为代表的几代戏剧前辈，奠定了剧院的诞生、发展、继承和创新的坚实厚重的基础。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">中国国家话剧院以创作和演出高质量、高品位的古今中外优秀戏剧作品为己任；致力创造精品、重视人才培养、锐意开拓市场；是一片创建中国民族话剧的沃土，是一方驰骋戏剧梦想的舞台，是无数生生不息、辛勤耕耘的戏剧人的家园！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">中国国家话剧院拥有三个现代化剧场，适合不同风格和规模的剧目上演；并以北京为中心、辐射全国；同时加强国际间的戏剧交流与合作；竭力为广大人民观众奉献世界和民族的先进戏剧文化硕果。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">中国国家话剧院坚持“中国原创、世界经典、实验探索”的创作理念，树立崇高艺术理想，担当戏剧文化责任，坚定时代美学追求和科学经营理念，塑造国家艺术形象，努力发挥国家艺术院团的代表作用、示范作用和导向作用。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">中国国家话剧院现任院长周予援，党委书记诸葛燕喃，副院长戈大立、白雪峰、田沁鑫，党委副书记、纪委书记闻国久。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">《四世同堂》介绍：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">《四世同堂》是一部表现抗战北平沦陷区普通民众生活与抗战的长篇小说，被老舍先生自认为“从事写作以来最长的、可能也是最好的一本书”，文学界将其评为 “20世纪中文小说一百强”，其文学、艺术和思想、社会价值超越于《茶馆》《骆驼祥子》等作品，更被称为“值得每一代中国人阅读的文学经典，值得每一个中国人珍藏的民族记忆。”</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">导演田沁鑫采用“新现实主义”手法，几乎把半个多世纪前的老舍先生笔下的北京西城“小羊圈”胡同复原到舞台上，通过舞台效果将祁家、冠家、钱家三户人家的院内、室内，和胡同风情巧妙的呈现在舞台上，与演员们互动性的展开八年抗战中北京人民的艰难、忍耐、抗争的生活画卷，立体化还原民国北京人的衣、食、住、行相关的舞台风貌，以讲述中国故事特有的文化立场，和坚持精品奉献人民的文化态度与自信，集结中国国家话剧院优秀的演员们，生动的展现老舍先生笔下的这一部浩繁的“平民史诗”。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">2010年10月底，《四世同堂》在台湾中山纪念馆轰动首演，座无虚席的观众被《四世同堂》中展现的“老北京文化风情及时代下人性”打动，感慨“看到活的历史”，开“大陆话剧台湾首演”先河。随后，这段发生在抗战时期，有关老北京小羊圈胡同百姓悲欢荣辱的故事，讲到了台北、北京、香港、澳门、上海、深圳等四十多个城市。《四世同堂》走到哪里，都受到观众追捧，带着老舍先生鲜明语言魅力的这部平民史诗，征服了大江南北近30万观众。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">2011年1月12日至28日，话剧《四世同堂》北京天桥剧场首演。为让观众一进剧场就感受到浓郁北京味儿，主办方在开演前，将老北京庙会部分摊位布置在剧场前厅。本场演出集结了国家话剧院优秀表演艺术家雷恪生、孙红雷、黄磊（特约）、朱媛媛、辛柏青、秦海璐、陶虹、殷桃、邢佳栋等九位明星，群星</p></ul><p><br/></p>', '2020-12-22 14:53:00');
INSERT INTO `huajuxinxi` VALUES ('8', '12221453011151', '李宗盛作品音乐剧《当爱已成往事》', '3', 'upload/1608620000082.png', '马敬帅、汪宇演', '120分钟', '<ul class=\"content_txt\" style=\"border: 0px; font-size: 12px; line-height: 24px; color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; white-space: normal;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><span style=\"font-weight: bolder;\">一、项目介绍</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">2019年11月，李宗盛作品音乐剧《当爱已成往事》在历经长达5年的策划制作后首登舞台，上海、北京、深圳3城15场演出全部售罄，为观众带来“全明星”版豪华演出阵容。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">2020年10月，李宗盛作品音乐剧《当爱已成往事》开启新的全国巡演。该剧由李宗盛亲自拟定命名，百老汇托尼奖最佳导演John Rando执导，并与著名制片人、编剧邢爱娜共同编写全新故事的点唱机音乐剧（Jukebox Musical）。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">力邀曾获奥斯卡最佳艺术指导奖、艾美奖、托尼奖最佳舞美设计奖、并连续6年获邀设计奥斯卡颁奖典礼舞台的百老汇著名舞美设计Derek McLane领衔舞美团队，以及艾美奖获得者、美剧《名声大噪（SMASH）》的编舞Joshua Bergasse加盟创作，为音乐剧创编舞蹈动作。在编曲方面，由李宗盛多年好友，“御用”编曲周国仪共同为音乐剧的每首曲目重新编曲。在和声和弦乐方面，更是邀请到了国内知名音乐创作人、歌手、小提琴手李剑青加盟创作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">多次获得托尼奖最佳灯光设计提名Japhy Weideman受邀为该音乐剧进行灯光设计。曾凭借《长靴皇后》获得托尼奖最佳音响设计奖John Shivers和百老汇著名音响设计David&nbsp;Patridga受邀进行音响设计。同时，还有曾与亚洲多位知名音乐人合作的吉他手Jamie&nbsp;Wilson、贝斯手Andy&nbsp;Peterson和鼓手John&nbsp;Ashley&nbsp;Thomas共同参与幕后的音乐演奏和录制。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">全剧以全新的故事视角，选取了近三十首李宗盛经典音乐作品串联起整部音乐剧，并巧妙地将音乐与剧情有机融合，让观众能够在欣赏李宗盛音乐的同时，体会一个独特的爱与别离的故事。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><span style=\"font-weight: bolder;\">二、剧情介绍</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">一场看似毫无预兆的相遇,让暖暖成为寒江命中注定的救赎。富有才华但却陷入爱情和事业双重打击的音乐制作人寒江，破罐破摔地放逐自己，整日在酒吧里消磨时光。青春洋溢、乐观积极的暖暖用毫无保留的爱、绽放的生命和天籁般的声音，帮助寒江走出了自我怀疑的瓶颈，重新开始音乐创作。他陪着暖暖，在更大的舞台上实现梦想。但寒江不知道的是，暖暖灿烂的笑容背后,隐藏着无法言说的别离命运。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">假如生命只剩下短暂的时光,我们将何以消磨?</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\">她的选择，是用生命写成歌，唱给你听……</p></ul><p><br/></p>', '2020-12-22 14:53:35');
INSERT INTO `huajuxinxi` VALUES ('9', '12221453371792', '绝对喜剧《二八八的别结婚》', '2', 'upload/1608620034698.png', '张三，李四，王五', '120分钟', '<ul class=\"content_txt\" style=\"border: 0px; font-size: 12px; line-height: 24px; color: rgb(119, 119, 119); font-family: PingFangSC, PingFangSC-Regular, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;; white-space: normal;\"><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">婚礼能乱套成如此模样也是千载难逢。</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">司仪为何一直对那个东西念念不忘。</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">新郎到底知道了什么秘密？</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">为什么告诉自己的岳母而不告诉母亲？</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">新娘如何得知新郎知道了秘密？</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">新娘自以为知道了真正的秘密？</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">司仪突然发现要结婚的是父亲？</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">而神秘的婆婆</span>……</span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\">&nbsp;</span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">所有人都整出不同的幺蛾子。</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">最后婚礼能否顺利进行？</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\">&nbsp;</span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">看过的观众都纷纷表示笑到一口水都不能喝</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">总之，这部绝对喜剧绝对让你笑到岔气。</span></span></p><p style=\"margin-top: 4px; margin-bottom: 4px; padding: 0px; border: 0px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">所以说</span></span><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px;\">嘛</span></span><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: Arial; font-size: 13px;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-family: 宋体;\">，二八八的别结婚</span></span></p></ul><p><br/></p>', '2020-12-22 14:54:12');

-- ----------------------------
-- Table structure for `huiyuan`
-- ----------------------------
DROP TABLE IF EXISTS `huiyuan`;
CREATE TABLE `huiyuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) NOT NULL COMMENT '用户名',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of huiyuan
-- ----------------------------
INSERT INTO `huiyuan` VALUES ('1', '001', '001', '小明', '男', '13666666666', 'upload/1608561855020.png', '2020-12-21 22:44:16');
INSERT INTO `huiyuan` VALUES ('2', '002', '002', '小红', '女', '13666666666', 'upload/1608605311351.png', '2020-12-22 10:48:32');
INSERT INTO `huiyuan` VALUES ('3', '003', '003', '比鲁斯', '女', '13666666666', 'upload/1608605479975.png', '2020-12-22 10:51:21');
INSERT INTO `huiyuan` VALUES ('4', '100', '100', '小明', '男', '13666666666', 'upload/1608620546870.png', '2020-12-22 15:02:28');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '连接地址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '1', 'upload/1608620185620.png', '#', '2020-12-21 21:21:05');
INSERT INTO `lunbotu` VALUES ('2', '2', 'upload/1608620100699.png', '#', '2020-12-21 21:21:17');
INSERT INTO `lunbotu` VALUES ('3', '324', 'upload/1608620243242.png', '#', '2020-12-22 14:57:24');

-- ----------------------------
-- Table structure for `pingjia`
-- ----------------------------
DROP TABLE IF EXISTS `pingjia`;
CREATE TABLE `pingjia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goupiaoid` int(10) unsigned NOT NULL COMMENT '购票id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `goumaipiaoshu` int(11) NOT NULL COMMENT '购买票数',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `pingfen` varchar(255) NOT NULL COMMENT '评分',
  `pingyu` text NOT NULL COMMENT '评语',
  `pingjiaren` varchar(50) NOT NULL COMMENT '评价人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `pingjia_goupiaoid_index` (`goupiaoid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pingjia
-- ----------------------------
INSERT INTO `pingjia` VALUES ('1', '1', '12212126172117', '《霸王别姬》', '80.00', '2', '160.00', '好评', '111', '001', '2020-12-22 10:33:32');
INSERT INTO `pingjia` VALUES ('2', '4', '12221040021960', '《两将军》', '60.00', '2', '120.00', '好评', '测试 ', '100', '2020-12-22 15:17:46');

-- ----------------------------
-- Table structure for `shoucangjilu`
-- ----------------------------
DROP TABLE IF EXISTS `shoucangjilu`;
CREATE TABLE `shoucangjilu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `xwid` int(10) unsigned NOT NULL,
  `biao` varchar(255) NOT NULL,
  `biaoti` varchar(255) NOT NULL,
  `url` varchar(512) NOT NULL,
  `ziduan` varchar(255) NOT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoucangjilu
-- ----------------------------

-- ----------------------------
-- Table structure for `tuipiao`
-- ----------------------------
DROP TABLE IF EXISTS `tuipiao`;
CREATE TABLE `tuipiao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goupiaoid` int(10) unsigned NOT NULL COMMENT '购票id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `yanyichangsuo` int(10) unsigned NOT NULL COMMENT '演艺场所',
  `kaichangshijian` varchar(25) NOT NULL COMMENT '开场时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `goumaipiaoshu` int(11) NOT NULL COMMENT '购买票数',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `tuipiaoyuanyin` text NOT NULL COMMENT '退票原因',
  `tuipiaozhangshu` int(11) NOT NULL COMMENT '退票张数',
  `tuipiaoren` varchar(50) NOT NULL COMMENT '退票人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `tuipiao_goupiaoid_index` (`goupiaoid`),
  KEY `tuipiao_yanyichangsuo_index` (`yanyichangsuo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuipiao
-- ----------------------------
INSERT INTO `tuipiao` VALUES ('1', '3', '12221040021960', '《两将军》', '1', '2020-12-23 15:00:00', '2020-12-23 17:00:00', '60.00', '4', '240.00', '测试', '3', '100', '2020-12-22 15:17:14');

-- ----------------------------
-- Table structure for `yanyiting`
-- ----------------------------
DROP TABLE IF EXISTS `yanyiting`;
CREATE TABLE `yanyiting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `jipai` varchar(50) NOT NULL COMMENT '几排',
  `jilie` varchar(50) NOT NULL COMMENT '几列',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yanyiting
-- ----------------------------
INSERT INTO `yanyiting` VALUES ('1', '12212130362133', 'A厅大剧场', '8', '8', '2020-12-21 21:30:54');
INSERT INTO `yanyiting` VALUES ('2', '12221448567284', 'B厅小剧场', '5', '5', '2020-12-22 14:49:10');
