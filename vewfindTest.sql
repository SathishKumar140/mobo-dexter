# SQL Manager Lite for MySQL 5.4.2.43077
# ---------------------------------------
# Host     : viewfind.clpupa6oe9nj.us-west-2.rds.amazonaws.com
# Port     : 3306
# Database : vewfindTest


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `vewfindTest`;

CREATE DATABASE `vewfindTest`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `vewfindTest`;

#
# Structure for the `app_history` table : 
#

CREATE TABLE `app_history` (
  `HISTORY_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `USE_CASE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'User or Business',
  `ACTION_TYPE` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Type of operation',
  `USER_ID` INTEGER(11) DEFAULT NULL COMMENT 'Which user is responsible for operation',
  `USER_PASSWORD` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Used Only When User Logs in Or at the time of Register',
  `TAG_ID` INTEGER(11) DEFAULT NULL,
  `SAVE_THUMB_TAG_ID` INTEGER(11) DEFAULT NULL COMMENT 'Contains Either save tag id or thumb tag id',
  `NOTIF_ID` INTEGER(11) DEFAULT NULL,
  `NOTIF_TO` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'To whom the notification is sent or to be sent',
  `REWARD_ID` INTEGER(11) DEFAULT NULL COMMENT 'Reward ID For the user',
  `RESPONSE` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'APP Response for request',
  `COMMENTS` TEXT COLLATE latin1_swedish_ci COMMENT 'Extra Comments',
  `CREATED_DATE` DATETIME DEFAULT NULL COMMENT 'Row created date and time',
  PRIMARY KEY USING BTREE (`HISTORY_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=437 AVG_ROW_LENGTH=187 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `bill_board` table : 
#

CREATE TABLE `bill_board` (
  `BILLBOARD_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `TAG_ID` INTEGER(11) NOT NULL,
  `BILL_BOARD_NAME` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AGE_START` INTEGER(11) DEFAULT NULL,
  `AGE_END` INTEGER(11) DEFAULT NULL,
  `OP_AREA_CITY` TINYINT(4) DEFAULT 1 COMMENT '1 is considered as AND Operator',
  `OP_CITY_COUNTRY` TINYINT(4) DEFAULT 1 COMMENT '1 is considered as AND Operator',
  `OP_COUNTRY_GENDER` TINYINT(4) DEFAULT 1 COMMENT '1 is considered as AND Operator',
  `OP_GENDER_AGE` TINYINT(4) DEFAULT 1 COMMENT '1 is considered as AND Operator',
  `VIDEO_URL` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`BILLBOARD_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=8 AVG_ROW_LENGTH=2730 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `billboard` table : 
#

CREATE TABLE `billboard` (
  `BILLBOARD_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `CRITERIA` VARCHAR(45) COLLATE latin1_swedish_ci NOT NULL,
  `START_AGE_ONE` INTEGER(11) DEFAULT NULL,
  `END_AGE_ONE` INTEGER(11) DEFAULT NULL,
  `GENDER_ONE` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `TAG_ID` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `START_AGE_TWO` INTEGER(11) DEFAULT NULL,
  `END_AGE_TWO` INTEGER(11) DEFAULT NULL,
  `GENDER_TWO` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `DEFLT` VARCHAR(45) COLLATE latin1_swedish_ci NOT NULL,
  `BILLBOARD_NAME` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `BILLBOARD_VDO_URL1` VARCHAR(60) COLLATE latin1_swedish_ci DEFAULT NULL,
  `BILLBOARD_VDO_URL2` VARCHAR(60) COLLATE latin1_swedish_ci DEFAULT NULL,
  `BILLBOARD_VDO_URL3` VARCHAR(60) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`BILLBOARD_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=4 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT='\t\t\t\t'
;

#
# Structure for the `billboardNew` table : 
#

CREATE TABLE `billboardNew` (
  `BILLBOARD_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `TAG_ID` VARCHAR(45) COLLATE latin1_swedish_ci NOT NULL,
  `CRITERIA_1` INTEGER(11) DEFAULT NULL,
  `CRITERIA_2` INTEGER(11) DEFAULT NULL,
  `CRITERIA_3` INTEGER(11) DEFAULT NULL,
  `CRITERIA_4` INTEGER(11) DEFAULT NULL,
  `CRITERIA_5` INTEGER(11) DEFAULT NULL,
  `CRITERIA_6` INTEGER(11) DEFAULT NULL,
  `CRITERIA_7` INTEGER(11) DEFAULT NULL,
  `CRITERIA_8` INTEGER(11) DEFAULT NULL,
  `CRITERIA_9` INTEGER(11) DEFAULT NULL,
  `CRITERIA_10` INTEGER(11) DEFAULT NULL,
  `AREA_1` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_2` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_3` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_4` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_5` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_6` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_7` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_8` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_9` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AREA_10` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `OPE_1_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_1_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_1_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_1_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_2_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_2_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_2_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_2_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_3_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_3_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_3_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_3_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_4_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_4_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_4_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_4_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_5_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_5_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_5_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_5_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_6_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_6_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_6_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_6_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_7_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_7_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_7_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_7_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_8_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_8_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_8_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_8_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_9_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_9_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_9_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_9_D` TEXT COLLATE latin1_swedish_ci,
  `OPE_10_A` TEXT COLLATE latin1_swedish_ci,
  `OPE_10_B` TEXT COLLATE latin1_swedish_ci,
  `OPE_10_C` TEXT COLLATE latin1_swedish_ci,
  `OPE_10_D` TEXT COLLATE latin1_swedish_ci,
  `CITY_1` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_2` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_3` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_4` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_5` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_6` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_7` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_8` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_9` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CITY_10` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_1` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_2` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_3` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_4` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_5` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_6` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_7` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_8` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_9` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `COUNTRY_10` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_1` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_2` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_3` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_4` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_5` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_6` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_7` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_8` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_9` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `GENDER_10` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `AGE_START_1` INTEGER(11) DEFAULT NULL,
  `AGE_START_2` INTEGER(11) DEFAULT NULL,
  `AGE_START_3` INTEGER(11) DEFAULT NULL,
  `AGE_START_4` INTEGER(11) DEFAULT NULL,
  `AGE_START_5` INTEGER(11) DEFAULT NULL,
  `AGE_START_6` INTEGER(11) DEFAULT NULL,
  `AGE_START_7` INTEGER(11) DEFAULT NULL,
  `AGE_START_8` INTEGER(11) DEFAULT NULL,
  `AGE_START_9` INTEGER(11) DEFAULT NULL,
  `AGE_START_10` INTEGER(11) DEFAULT NULL,
  `AGE_END_1` INTEGER(11) DEFAULT NULL,
  `AGE_END_2` INTEGER(11) DEFAULT NULL,
  `AGE_END_3` INTEGER(11) DEFAULT NULL,
  `AGE_END_4` INTEGER(11) DEFAULT NULL,
  `AGE_END_5` INTEGER(11) DEFAULT NULL,
  `AGE_END_6` INTEGER(11) DEFAULT NULL,
  `AGE_END_7` INTEGER(11) DEFAULT NULL,
  `AGE_END_8` INTEGER(11) DEFAULT NULL,
  `AGE_END_9` INTEGER(11) DEFAULT NULL,
  `AGE_END_10` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`BILLBOARD_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=2 AVG_ROW_LENGTH=16384 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `business` table : 
#

CREATE TABLE `business` (
  `BUSINESS_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `BUSINESS_NAME` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_CONTACT_NAME` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_TYPE` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_SUBTYPE` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_CATEGORY` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_SUBCATEGORY` TEXT COLLATE latin1_swedish_ci,
  `BUSINEES_OWNEDTAGID` INTEGER(11) DEFAULT NULL,
  `BUSINESS_MOBILE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `BUSINESS_PHONE` INTEGER(11) DEFAULT NULL,
  `BUSINESS_EMAIL` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_PASSWORD` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_ADDRESS_NO` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_ADDRESS_STREET` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_ADDRESS_AREA` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_ADDRESS_CITY` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_ADDRESS_AREA_CODE` INTEGER(11) DEFAULT NULL,
  `BUSINESS_ADDRESS_COUNTRY` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_REGISTERED_DATE` DATE DEFAULT NULL,
  `BUSINESS_LASTLOGIN_DATE` DATE DEFAULT NULL,
  `BUSINESS_STATUS` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_REGISTERED` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_APPROVED` TEXT COLLATE latin1_swedish_ci,
  `BUSINESS_PAYMENTINFO` DOUBLE DEFAULT NULL,
  `BUSINESS_LASTPAIDAMOUNT` DOUBLE DEFAULT NULL,
  `BUSINESS_LASTPAIDDATE` DATE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`BUSINESS_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=23 AVG_ROW_LENGTH=744 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `coupon_offer` table : 
#

CREATE TABLE `coupon_offer` (
  `coupon_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `coupon_name` TEXT COLLATE latin1_swedish_ci,
  `buissness_id` INTEGER(11) DEFAULT NULL,
  `tag_id` INTEGER(11) DEFAULT NULL,
  `coupon_vallidity` TEXT COLLATE latin1_swedish_ci,
  `redeem_status` INTEGER(11) DEFAULT NULL,
  `coupon_status` INTEGER(11) DEFAULT NULL,
  `coupon_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `coupon_start_datime` DATETIME DEFAULT NULL,
  `coupon_end_datime` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`coupon_id`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `demo_countries` table : 
#

CREATE TABLE `demo_countries` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT 0,
  `name` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `description` VARCHAR(255) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `population` DOUBLE UNSIGNED NOT NULL,
  `picture_url` VARCHAR(100) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `picture_url_1` VARCHAR(100) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `is_democracy` INTEGER(10) UNSIGNED NOT NULL DEFAULT 0,
  `independent_date` DATETIME DEFAULT '0000-00-00 00:00:00',
  `independent_time` TIME NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY USING BTREE (`id`) COMMENT ''
)ENGINE=MyISAM
AUTO_INCREMENT=240 AVG_ROW_LENGTH=31 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `demo_democracy` table : 
#

CREATE TABLE `demo_democracy` (
  `id` INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`id`) COMMENT ''
)ENGINE=MyISAM
AUTO_INCREMENT=3 AVG_ROW_LENGTH=20 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `demo_presidents` table : 
#

CREATE TABLE `demo_presidents` (
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `region_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT 0,
  `country_id` INTEGER(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` DATE DEFAULT NULL,
  `work_phone` VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` VARCHAR(70) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `validator_email` VARCHAR(70) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `password` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `validator_password` VARCHAR(30) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `status` ENUM('Candidate','Vice','Current') COLLATE latin1_swedish_ci DEFAULT 'Candidate',
  `favorite_color` VARCHAR(7) COLLATE latin1_swedish_ci NOT NULL DEFAULT '#ffffff',
  `rating` SMALLINT(6) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY USING BTREE (`id`) COMMENT ''
)ENGINE=MyISAM
AUTO_INCREMENT=8 AVG_ROW_LENGTH=48 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `demo_regions` table : 
#

CREATE TABLE `demo_regions` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`id`) COMMENT ''
)ENGINE=MyISAM
AUTO_INCREMENT=10 AVG_ROW_LENGTH=20 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `deviceMaster` table : 
#

CREATE TABLE `deviceMaster` (
  `DEVICE_ID` INTEGER(11) DEFAULT NULL,
  `USER_ID` INTEGER(11) DEFAULT NULL,
  `DEVICE_IMIE_NUMBER` TEXT COLLATE latin1_swedish_ci,
  `DEVICE_MAKE` TEXT COLLATE latin1_swedish_ci,
  `DEVICE_MODEL` TEXT COLLATE latin1_swedish_ci,
  `DEVICE_OS_VERSION` TEXT COLLATE latin1_swedish_ci,
  `DEVICE_LASTLOGIN_DATE` DATE DEFAULT NULL,
  `DEVICE_LASTLOGIN_TIME` TIME DEFAULT NULL,
  `DEVICE_MAGNETOMETER` TEXT COLLATE latin1_swedish_ci,
  `DEVICE_GYROSCOPE` TEXT COLLATE latin1_swedish_ci,
  `DEVICE_CAMERA` TEXT COLLATE latin1_swedish_ci,
  `DEVICE_ISSUES` TEXT COLLATE latin1_swedish_ci,
  `DEVICE_DIAGNOSTICS_STATUS` TEXT COLLATE latin1_swedish_ci
)ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `invoice` table : 
#

CREATE TABLE `invoice` (
  `INVOICE_ID` INTEGER(11) DEFAULT NULL,
  `BUSINESS_ID` INTEGER(11) DEFAULT NULL,
  `TAG_ID` INTEGER(11) DEFAULT NULL,
  `INVOICE_NUMBER` INTEGER(11) DEFAULT NULL,
  `INOVICE_DATE` DATE DEFAULT NULL,
  `INOVICE_VALUE` DOUBLE DEFAULT NULL,
  `INOVICE_STAX` DOUBLE DEFAULT NULL,
  `INOVICE_TOTAL` DOUBLE DEFAULT NULL,
  `INOVICE_STATUS` TEXT COLLATE latin1_swedish_ci,
  `INVOICE_PAYDUEDATE` DATE DEFAULT NULL,
  `INVOICE_SENTEMAIL` TINYINT(1) DEFAULT NULL,
  `INVOICE_REMINDERSENT_DATE` TEXT COLLATE latin1_swedish_ci
)ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `mdefalut_val` table : 
#

CREATE TABLE `mdefalut_val` (
  `DEF_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `DEF_TYPE` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `DEF_SUB_TYPE` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `DEF_VAL` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `DEF_VAL_DISP` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`DEF_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=27 AVG_ROW_LENGTH=1365 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `offer` table : 
#

CREATE TABLE `offer` (
  `offer_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `offer_name` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `business_id` INTEGER(11) DEFAULT NULL,
  `tag_id` INTEGER(11) DEFAULT NULL,
  `offer_validity` TEXT COLLATE latin1_swedish_ci,
  `redeem_status` INTEGER(11) DEFAULT NULL,
  `offer_status` INTEGER(11) DEFAULT NULL,
  `offer_type` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `offer_code` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `offer_start_datetime` DATETIME DEFAULT NULL,
  `offer_end_datetime` DATETIME DEFAULT NULL,
  PRIMARY KEY USING BTREE (`offer_id`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=24 AVG_ROW_LENGTH=712 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `peopleFinder` table : 
#

CREATE TABLE `peopleFinder` (
  `USER_ID` INTEGER(11) DEFAULT NULL,
  `USER_NICKNAME` TEXT COLLATE latin1_swedish_ci,
  `USER_LATITUDE` DOUBLE DEFAULT NULL,
  `USER_LONGITUDE` DOUBLE DEFAULT NULL,
  `USER_ADDEDDATE` DATE DEFAULT NULL,
  `USER_ADDEDTIME` TIME DEFAULT NULL,
  `USER_SETTIME` TIME DEFAULT NULL
)ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `role` table : 
#

CREATE TABLE `role` (
  `ROLE_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`ROLE_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=4 AVG_ROW_LENGTH=5461 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `save_tag` table : 
#

CREATE TABLE `save_tag` (
  `save_tag_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `user_id` INTEGER(11) DEFAULT NULL,
  `tag_id` INTEGER(11) DEFAULT NULL,
  `save_date` DATE DEFAULT NULL,
  `thumb_type` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `thumb_comment` TEXT COLLATE latin1_swedish_ci,
  PRIMARY KEY USING BTREE (`save_tag_id`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=8 AVG_ROW_LENGTH=2730 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `tagMaster` table : 
#

CREATE TABLE `tagMaster` (
  `TAG_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `TAG_NAME` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `TAG_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `SUBTAG_ID` INTEGER(11) DEFAULT NULL,
  `SUBTAG_NAME` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `TAG_TYPE` TEXT COLLATE latin1_swedish_ci,
  `TAG_SUBTYPE` TEXT COLLATE latin1_swedish_ci,
  `TAG_CATEGORY` TEXT COLLATE latin1_swedish_ci,
  `TAG_SUBCATERGORY` TEXT COLLATE latin1_swedish_ci,
  `TAG_VALUETYPE` DOUBLE DEFAULT NULL,
  `TAG_CURRECNY` VARCHAR(45) COLLATE latin1_swedish_ci DEFAULT NULL,
  `TAG_VALUE` DOUBLE DEFAULT NULL,
  `STATUS` TEXT COLLATE latin1_swedish_ci,
  `TAG_ACCESSTYPE` TEXT COLLATE latin1_swedish_ci,
  `TAG_MEASUREDHOW` TEXT COLLATE latin1_swedish_ci,
  `TAG_LATITUDE` DOUBLE DEFAULT NULL,
  `TAG_LONGITUDE` DOUBLE DEFAULT NULL,
  `TAG_LATPLUS2` DOUBLE DEFAULT NULL,
  `TAG_LATMINUS2` DOUBLE DEFAULT NULL,
  `TAG_LONGPLUS2` DOUBLE DEFAULT NULL,
  `TAG_LONGMINUSS2` DOUBLE DEFAULT NULL,
  `TAG_RATING` INTEGER(11) DEFAULT NULL,
  `PUBLISHDEVICE_LAT` DOUBLE DEFAULT NULL,
  `PUBLISHDEVICE_LONG` DOUBLE DEFAULT NULL,
  `SUBMITTED_BY` TEXT COLLATE latin1_swedish_ci,
  `SUBMIT_DATE` DATE DEFAULT NULL,
  `APPROVED_BY` TEXT COLLATE latin1_swedish_ci,
  `APPROVAL_DATE` DATE DEFAULT NULL,
  `TAG_RATING_UP` TEXT COLLATE latin1_swedish_ci,
  `TAG_RATING_DOWN` TEXT COLLATE latin1_swedish_ci,
  `TAG_FEEDBACK_COMMENTS` TEXT COLLATE latin1_swedish_ci,
  `LAT_POINT1` TEXT COLLATE latin1_swedish_ci,
  `LAT_POINT2` TEXT COLLATE latin1_swedish_ci,
  `LAT_POINT3` TEXT COLLATE latin1_swedish_ci,
  `LAT_POINT4` TEXT COLLATE latin1_swedish_ci,
  `LONG_POINT1` TEXT COLLATE latin1_swedish_ci,
  `LONG_POINT2` TEXT COLLATE latin1_swedish_ci,
  `LONG_POINT3` TEXT COLLATE latin1_swedish_ci,
  `LONG_POINT4` TEXT COLLATE latin1_swedish_ci,
  `TAG_IMG_PATH` VARCHAR(250) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CREATED_BY` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `CREATED_DATE` DATE DEFAULT NULL,
  `CREATED_BY_BUSNSS` INTEGER(11) DEFAULT NULL,
  `CREATED_DATE_BUSNSS` DATE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`TAG_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=45 AVG_ROW_LENGTH=455 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `user` table : 
#

CREATE TABLE `user` (
  `USER_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `USER_FIRSTNAME` TEXT COLLATE latin1_swedish_ci,
  `USER_SECONDNAME` TEXT COLLATE latin1_swedish_ci,
  `USER_NICKNAME` TEXT COLLATE latin1_swedish_ci,
  `USER_MOBILE` VARCHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_PHONE` INTEGER(11) DEFAULT NULL,
  `USER_EMAIL` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_PASSWORD` TEXT COLLATE latin1_swedish_ci,
  `USER_ADDRESS_NO` TEXT COLLATE latin1_swedish_ci,
  `USER_ADDRESS_STREET` TEXT COLLATE latin1_swedish_ci,
  `USER_ADDRESS_AREA` TEXT COLLATE latin1_swedish_ci,
  `USER_ADDRESS_CITY` TEXT COLLATE latin1_swedish_ci,
  `USER_ADDRESS_AREA_CODE` TEXT COLLATE latin1_swedish_ci,
  `USER_ADDRESS_COUNTRY` TEXT COLLATE latin1_swedish_ci,
  `USER_PERM_ADDR_NO` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_PERM_ADDR_STREET` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_PERM_ADDR_AREA` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_PERM_ADDR_CITY` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_PERM_ADDR_AREA_CODE` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_PERM_ADDR_COUNTRY` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_OFF_ADDR_NO` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_OFF_ADDR_STREET` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_OFF_ADDR_AREA` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_OFF_ADDR_CITY` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_OFF_ADDR_AREA_CODE` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_OFF_AREA_COUNTRY` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_BACHELOR_DEG` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_MASTER_DEG` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_GENDER` TEXT COLLATE latin1_swedish_ci,
  `USER_BIRTH_DATE` INTEGER(11) DEFAULT NULL,
  `USER_BIRTH_MONTH` INTEGER(11) DEFAULT NULL,
  `USER_BIRTH_YEAR` INTEGER(11) DEFAULT NULL,
  `USER_REGISTERED_DATE` DATE DEFAULT NULL,
  `USER_LASTLOGIN_DATE` DATE DEFAULT NULL,
  `USER_LASTREWARD_DATE` DATE DEFAULT NULL,
  `USER_LAST_DEVICEID` INTEGER(11) DEFAULT NULL,
  `USER_LAST_DEVICE_LAT` DOUBLE DEFAULT NULL,
  `USER_LAST_DEVICE_LONG` DOUBLE DEFAULT NULL,
  `USER_TAG_FORWARDED` TEXT COLLATE latin1_swedish_ci,
  `USER_TAG_SAVED` TEXT COLLATE latin1_swedish_ci,
  `USER_LAST_APP_LOGIN` TEXT COLLATE latin1_swedish_ci,
  `ROLE_ID` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `USER_NOTIFICATION` TEXT COLLATE latin1_swedish_ci,
  `USER_PIC` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`USER_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=58 AVG_ROW_LENGTH=297 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `user_notifications` table : 
#

CREATE TABLE `user_notifications` (
  `NOTIF_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` INTEGER(11) DEFAULT NULL,
  `SENDER_NAME` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'User Name',
  `TAG_ID` INTEGER(11) DEFAULT NULL,
  `SENDER_MOB_NO` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'User Mob No',
  `COMMENTS` TEXT COLLATE latin1_swedish_ci,
  `CREATED_BY` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`NOTIF_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=3 AVG_ROW_LENGTH=16384 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `user_rewards` table : 
#

CREATE TABLE `user_rewards` (
  `REWARD_ID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` INTEGER(11) DEFAULT NULL,
  `REWARD_POINTS` BIGINT(20) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`REWARD_ID`) COMMENT ''
)ENGINE=InnoDB
AUTO_INCREMENT=2 AVG_ROW_LENGTH=16384 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Structure for the `vantagePoints` table : 
#

CREATE TABLE `vantagePoints` (
  `VP_ID` INTEGER(11) DEFAULT NULL,
  `VP_NAME` TEXT COLLATE latin1_swedish_ci,
  `VP_DESCRIPTION` TEXT COLLATE latin1_swedish_ci,
  `VP_STREET` TEXT COLLATE latin1_swedish_ci,
  `VP_AREA` TEXT COLLATE latin1_swedish_ci,
  `VP_AREACODE` INTEGER(11) DEFAULT NULL,
  `VP_CITY` TEXT COLLATE latin1_swedish_ci,
  `VP_STATE` TEXT COLLATE latin1_swedish_ci,
  `VP_COUNTRY` TEXT COLLATE latin1_swedish_ci,
  `VP_LATITUDE` DOUBLE DEFAULT NULL,
  `VP_LONGITUDE` DOUBLE DEFAULT NULL,
  `VP_MEASUREDHOW` TEXT COLLATE latin1_swedish_ci,
  `VP_ACCURACYCHECKED` TEXT COLLATE latin1_swedish_ci
)ENGINE=InnoDB
AVG_ROW_LENGTH=496 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
COMMENT=''
;

#
# Data for the `app_history` table  (LIMIT -62,500)
#

INSERT INTO `app_history` (`HISTORY_ID`, `USE_CASE`, `ACTION_TYPE`, `USER_ID`, `USER_PASSWORD`, `TAG_ID`, `SAVE_THUMB_TAG_ID`, `NOTIF_ID`, `NOTIF_TO`, `REWARD_ID`, `RESPONSE`, `COMMENTS`, `CREATED_DATE`) VALUES

  (1,NULL,'LOGIN',0,'',NULL,NULL,NULL,NULL,NULL,'FAIL','No user with the mail ID gjghnghv or multiple user','2014-05-05 05:34:33'),
  (2,NULL,'LOGIN',0,'',NULL,NULL,NULL,NULL,NULL,'FAIL','No user with the mail ID fbcbvcbf or multiple user','2014-05-05 05:40:13'),
  (3,NULL,'LOGIN',46,'jgvscbfdsk',NULL,NULL,NULL,NULL,NULL,'Fail','Password Mismatch','2014-05-05 05:40:42'),
  (4,NULL,'LOGIN',46,'ushkuhcksjc',NULL,NULL,NULL,NULL,NULL,'Fail','Password Mismatch','2014-05-05 05:41:23'),
  (5,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-05 05:41:42'),
  (6,NULL,'LOGIN',50,'q',NULL,NULL,NULL,NULL,NULL,'Success','Account Succesfully Created','2014-05-05 06:33:05'),
  (7,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-05 06:37:14'),
  (8,NULL,'LOGIN',0,'',NULL,NULL,NULL,NULL,NULL,'FAIL','No user with the mail ID  or multiple users with s','2014-05-06 05:07:56'),
  (9,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 05:10:40'),
  (10,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 05:11:08'),
  (11,NULL,'REGISTER',51,'',NULL,NULL,NULL,NULL,NULL,'Success','Account Succesfully Created','2014-05-06 05:41:28'),
  (12,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 05:43:38'),
  (13,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 05:44:02'),
  (14,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 05:44:05'),
  (15,NULL,'REGISTER',52,'fsbj',NULL,NULL,NULL,NULL,NULL,'Success','Account Succesfully Created','2014-05-06 05:46:41'),
  (16,NULL,'REGISTER',53,'fsbj',NULL,NULL,NULL,NULL,NULL,'Success','Account Succesfully Created','2014-05-06 05:50:36'),
  (17,NULL,'REGISTER',54,'fsbj',NULL,NULL,NULL,NULL,NULL,'Success','Account Succesfully Created','2014-05-06 05:51:00'),
  (18,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 05:57:10'),
  (19,NULL,'REGISTER',0,'',NULL,NULL,NULL,NULL,NULL,'Success','Account Creation Failed','2014-05-06 05:57:10'),
  (20,NULL,'REGISTER',0,'',NULL,NULL,NULL,NULL,NULL,'Success','Account Creation Failed','2014-05-06 06:01:06'),
  (21,NULL,'REGISTER',0,'',NULL,NULL,NULL,NULL,NULL,'Success','Account Creation Failed','2014-05-06 06:01:49'),
  (22,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32$sql_history=INS',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 06:01:49'),
  (23,NULL,'AutoLogin',0,'baa7a52965b99778f38ef37f235e9053',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 06:02:48'),
  (24,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32$sql_history=INS',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 06:03:07'),
  (25,NULL,'AutoLogin',0,'baa7a52965b99778f38ef37f235e9053',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 06:03:41'),
  (26,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-06 06:05:11'),
  (27,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32$sql_history=INS',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 06:06:59'),
  (28,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 06:12:44'),
  (29,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-06 06:12:44'),
  (30,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 06:29:20'),
  (31,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 06:31:55'),
  (32,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 07:18:01'),
  (33,NULL,'Contact Business',46,NULL,26,NULL,NULL,NULL,NULL,'Fail','Multiple Business or No business associated with t','2014-05-06 07:21:29'),
  (34,NULL,'LOGIN',46,' asas',NULL,NULL,NULL,NULL,NULL,'Fail','Password Mismatch','2014-05-06 07:41:51'),
  (35,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 07:42:34'),
  (36,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-06 07:43:35'),
  (37,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 09:43:57'),
  (38,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 09:47:41'),
  (39,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 09:56:57'),
  (40,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 09:59:45'),
  (41,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 10:02:34'),
  (42,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 10:13:50'),
  (43,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 10:25:57'),
  (44,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 10:32:22'),
  (45,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 10:34:56'),
  (46,'User','Thumb',46,'',4,5,NULL,NULL,NULL,'Success','Commented','2014-05-06 10:36:52'),
  (47,'User','Thumb',46,'',4,0,NULL,NULL,NULL,'Already Exists','Already Commented on the tag','2014-05-06 10:37:14'),
  (48,'User','Thumb',46,'',4,0,NULL,NULL,NULL,'Already Exists','Already Commented on the tag','2014-05-06 10:37:28'),
  (49,'User','Thumb',46,'',4,0,NULL,NULL,NULL,'Already Exists','Already Commented on the tag','2014-05-06 10:37:43'),
  (50,'User','Thumb',46,'',4,NULL,NULL,NULL,NULL,'Already Exists','Already Commented on the tag','2014-05-06 10:39:05'),
  (51,'User','Thumb',46,'',4,NULL,NULL,NULL,NULL,'Already Exists','Already Commented on the tag','2014-05-06 10:39:20'),
  (52,'User','Thumb',46,'',5,6,NULL,NULL,NULL,'Success','Commented','2014-05-06 10:39:48'),
  (53,'User','Thumb',46,'',5,6,NULL,NULL,NULL,'Success','Commented','2014-05-06 10:40:00'),
  (54,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 10:50:02'),
  (55,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 10:58:07'),
  (56,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:05:53'),
  (57,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:07:10'),
  (58,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:10:45'),
  (59,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:15:00'),
  (60,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:17:17'),
  (61,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:20:17'),
  (62,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:23:30'),
  (63,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:24:55'),
  (64,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:26:48'),
  (65,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:30:14'),
  (66,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-06 11:34:42'),
  (67,'User','Send Notification',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Send notification response failed there is no regi','2014-05-07 05:49:25'),
  (68,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-07 07:11:57'),
  (69,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910034 A','2014-05-07 07:14:18'),
  (70,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891003','2014-05-07 07:14:18'),
  (71,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-07 07:19:20'),
  (72,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 07:21:25'),
  (73,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 07:21:26'),
  (74,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910284 A','2014-05-07 07:21:35'),
  (75,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891028','2014-05-07 07:21:35'),
  (76,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 07:21:51'),
  (77,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-07 07:31:39'),
  (78,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 07:34:12'),
  (79,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 07:34:12'),
  (80,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910341 and l','2014-05-07 07:34:19'),
  (81,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910341 A','2014-05-07 07:34:20'),
  (82,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891034','2014-05-07 07:34:20'),
  (83,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-07 07:37:00'),
  (84,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910174 and l','2014-05-07 07:37:08'),
  (85,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910174 A','2014-05-07 07:37:09'),
  (86,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891017','2014-05-07 07:37:09'),
  (87,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 08:34:02'),
  (88,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 08:34:02'),
  (89,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910216 and l','2014-05-07 08:34:28'),
  (90,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910216 A','2014-05-07 08:34:29'),
  (91,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891021','2014-05-07 08:34:29'),
  (92,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 08:39:34'),
  (93,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 08:39:34'),
  (94,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 08:48:22'),
  (95,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 08:48:23'),
  (96,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910386 and l','2014-05-07 08:48:30'),
  (97,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910386 A','2014-05-07 08:48:32'),
  (98,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891038','2014-05-07 08:48:32'),
  (99,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 08:50:55'),
  (100,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 08:53:40'),
  (101,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 08:54:25'),
  (102,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 08:54:59'),
  (103,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 09:03:23'),
  (104,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 09:03:23'),
  (105,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8909509 and l','2014-05-07 09:03:35'),
  (106,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8909509 A','2014-05-07 09:03:37'),
  (107,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.890950','2014-05-07 09:03:37'),
  (108,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 6','2014-05-07 09:04:37'),
  (109,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 09:07:11'),
  (110,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 09:07:11'),
  (111,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910309 and l','2014-05-07 09:07:17'),
  (112,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910309 A','2014-05-07 09:07:20'),
  (113,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891030','2014-05-07 09:07:20'),
  (114,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','Bill Board data found for the tagid: 8 and respond','2014-05-07 09:08:09'),
  (115,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 09:10:46'),
  (116,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 09:10:46'),
  (117,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910236 and l','2014-05-07 09:10:54'),
  (118,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910236 A','2014-05-07 09:10:56'),
  (119,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891023','2014-05-07 09:10:56'),
  (120,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:12:04'),
  (121,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:12:18'),
  (122,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','Bill Board data found for the tagid: 8 and respond','2014-05-07 09:14:35'),
  (123,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 09:22:13'),
  (124,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 09:22:13'),
  (125,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.891017 and lo','2014-05-07 09:22:20'),
  (126,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.93524 And','2014-05-07 09:22:28'),
  (127,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.93524 ','2014-05-07 09:22:28'),
  (128,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 09:24:36'),
  (129,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 09:24:36'),
  (130,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910055 and l','2014-05-07 09:24:45'),
  (131,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910055 A','2014-05-07 09:24:53'),
  (132,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891005','2014-05-07 09:24:53'),
  (133,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 15','2014-05-07 09:27:33'),
  (134,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 13','2014-05-07 09:27:39'),
  (135,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:28:41'),
  (136,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:28:52'),
  (137,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:29:03'),
  (138,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:29:09'),
  (139,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:29:41'),
  (140,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:29:51'),
  (141,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:','2014-05-07 09:29:56'),
  (142,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 09:33:35'),
  (143,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 09:33:35'),
  (144,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8909937 and l','2014-05-07 09:33:45'),
  (145,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8909937 A','2014-05-07 09:33:53'),
  (146,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.890993','2014-05-07 09:33:53'),
  (147,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 09:36:09'),
  (148,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 09:36:28'),
  (149,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 09:36:34'),
  (150,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 09:36:40'),
  (151,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 09:36:46'),
  (152,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 09:36:48'),
  (153,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 09:38:43'),
  (154,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 09:38:44'),
  (155,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910052 and l','2014-05-07 09:38:51'),
  (156,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910052 A','2014-05-07 09:38:57'),
  (157,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891005','2014-05-07 09:38:57'),
  (158,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 09:40:21'),
  (159,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 09:40:46'),
  (160,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 10:14:33'),
  (161,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 10:14:33'),
  (162,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910178 and l','2014-05-07 10:14:43'),
  (163,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910178 A','2014-05-07 10:15:03'),
  (164,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891017','2014-05-07 10:15:03'),
  (165,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:9','2014-05-07 10:16:04'),
  (166,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 10:16:17'),
  (167,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 10:16:28'),
  (168,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 10:17:18'),
  (169,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:9','2014-05-07 10:17:26'),
  (170,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 10:17:57'),
  (171,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 10:18:22'),
  (172,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 10:18:36'),
  (173,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 10:18:42'),
  (174,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 10:18:49'),
  (175,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 10:22:15'),
  (176,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 10:22:15'),
  (177,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910102 and l','2014-05-07 10:22:25'),
  (178,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910102 A','2014-05-07 10:22:36'),
  (179,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891010','2014-05-07 10:22:36'),
  (180,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 10:24:50'),
  (181,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 10:25:00'),
  (182,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 10:25:10'),
  (183,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 10:51:03'),
  (184,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 10:51:03'),
  (185,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8909984 and l','2014-05-07 10:51:14'),
  (186,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8909984 A','2014-05-07 10:51:27'),
  (187,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.890998','2014-05-07 10:51:27'),
  (188,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 10:52:40'),
  (189,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:43','2014-05-07 10:53:20'),
  (190,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 10:55:41'),
  (191,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 10:55:42'),
  (192,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910215 and l','2014-05-07 10:55:51'),
  (193,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910215 A','2014-05-07 10:56:09'),
  (194,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891021','2014-05-07 10:56:09'),
  (195,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:43','2014-05-07 10:57:40'),
  (196,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 11:08:05'),
  (197,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 11:08:05'),
  (198,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910174 and l','2014-05-07 11:08:15'),
  (199,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910174 A','2014-05-07 11:08:22'),
  (200,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891017','2014-05-07 11:08:22'),
  (201,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 11:10:17'),
  (202,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 11:10:49'),
  (203,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 11:10:59'),
  (204,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 11:12:59'),
  (205,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 11:12:59'),
  (206,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910206 and l','2014-05-07 11:13:08'),
  (207,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910206 A','2014-05-07 11:13:15'),
  (208,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891020','2014-05-07 11:13:15'),
  (209,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910206 A','2014-05-07 11:20:09'),
  (210,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No surrounding tags found with latitude: 12.891020','2014-05-07 11:20:09'),
  (211,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910206 A','2014-05-07 11:20:57'),
  (212,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910206 A','2014-05-07 11:21:33'),
  (213,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910206 A','2014-05-07 11:25:24'),
  (214,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 11:27:30'),
  (215,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 11:27:30'),
  (216,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.891022 and lo','2014-05-07 11:27:49'),
  (217,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910206 A','2014-05-07 11:28:12'),
  (218,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 11:29:46'),
  (219,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 11:29:46'),
  (220,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910142 and l','2014-05-07 11:29:56'),
  (221,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910142 A','2014-05-07 11:30:01'),
  (222,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 11:32:04'),
  (223,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 11:32:04'),
  (224,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910046 and l','2014-05-07 11:32:11'),
  (225,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910046 A','2014-05-07 11:32:17'),
  (226,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 11:35:07'),
  (227,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','Bill Board data found for the tagid: 8 and respond','2014-05-07 11:38:37'),
  (228,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 17','2014-05-07 11:38:45'),
  (229,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 11:38:51'),
  (230,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','Bill Board data found for the tagid: 8 and respond','2014-05-07 11:39:04'),
  (231,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 11:39:09'),
  (232,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 11:40:27'),
  (233,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 11:41:24'),
  (234,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 11:41:24'),
  (235,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.891019 and lo','2014-05-07 11:41:32'),
  (236,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.891019 An','2014-05-07 11:41:34'),
  (237,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','Bill Board data found for the tagid: 8 and respond','2014-05-07 11:41:48'),
  (238,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 17','2014-05-07 11:42:07'),
  (239,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 16','2014-05-07 11:42:12'),
  (240,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 11:42:17'),
  (241,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 11:43:27'),
  (242,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 11:44:05'),
  (243,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 11:44:11'),
  (244,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 11:44:17'),
  (245,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 11:44:29'),
  (246,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 11:44:33'),
  (247,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 11:47:24'),
  (248,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 11:47:24'),
  (249,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910123 and l','2014-05-07 11:47:37'),
  (250,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910123 A','2014-05-07 11:47:48'),
  (251,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 17','2014-05-07 11:51:31'),
  (252,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 11:52:36'),
  (253,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 16','2014-05-07 11:52:51'),
  (254,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 17','2014-05-07 11:52:57'),
  (255,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 11:56:04'),
  (256,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 11:56:04'),
  (257,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910104 and l','2014-05-07 11:56:20'),
  (258,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910104 A','2014-05-07 11:56:25'),
  (259,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 12:07:14'),
  (260,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 16','2014-05-07 12:07:30'),
  (261,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 17','2014-05-07 12:07:35'),
  (262,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 12:09:03'),
  (263,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 12:09:13'),
  (264,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 12:09:25'),
  (265,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 12:09:44'),
  (266,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 12:09:52'),
  (267,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 12:09:58'),
  (268,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 12:10:02'),
  (269,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','Bill Board data found for the tagid: 8 and respond','2014-05-07 12:10:05'),
  (270,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','Bill Board data found for the tagid: 8 and respond','2014-05-07 12:10:08'),
  (271,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 16','2014-05-07 12:10:10'),
  (272,NULL,'AutoLogin',0,'\r\n\r\n0c74157e69618260d22f4f3d45ac6d32Success\r\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-07 12:12:21'),
  (273,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910035 and l','2014-05-07 12:12:30'),
  (274,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910035 A','2014-05-07 12:12:33'),
  (275,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 9','2014-05-07 12:12:45'),
  (276,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 16','2014-05-07 12:13:03'),
  (277,NULL,'Billboard Details',45,NULL,NULL,NULL,NULL,NULL,NULL,'FAIL','No bill board data found for the tagid: 17','2014-05-07 12:13:06'),
  (278,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 12:13:14'),
  (279,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 12:13:19'),
  (280,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 12:13:24'),
  (281,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 12:22:41'),
  (282,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 12:22:41'),
  (283,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910054 and l','2014-05-07 12:22:49'),
  (284,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910054 A','2014-05-07 12:22:50'),
  (285,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 12:24:48'),
  (286,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 12:25:04'),
  (287,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 12:29:30'),
  (288,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 12:29:30'),
  (289,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910039 and l','2014-05-07 12:29:40'),
  (290,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910039 A','2014-05-07 12:29:42'),
  (291,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 12:29:51'),
  (292,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 12:30:26'),
  (293,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 12:30:31'),
  (294,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 12:30:43'),
  (295,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 12:30:54'),
  (296,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 12:31:05'),
  (297,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 12:31:22'),
  (298,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 12:31:46'),
  (299,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 12:32:23'),
  (300,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 12:32:36'),
  (301,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 12:32:44'),
  (302,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 12:33:00'),
  (303,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 12:33:09'),
  (304,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:17','2014-05-07 12:35:32'),
  (305,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 12:35:40'),
  (306,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 12:35:45'),
  (307,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 12:38:31'),
  (308,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 12:38:31'),
  (309,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910179 and l','2014-05-07 12:38:42'),
  (310,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910179 A','2014-05-07 12:38:44'),
  (311,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 12:38:58'),
  (312,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 12:39:07'),
  (313,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:17','2014-05-07 12:39:13'),
  (314,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 12:39:26'),
  (315,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:15','2014-05-07 12:39:56'),
  (316,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 12:40:03'),
  (317,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 12:44:02'),
  (318,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 12:44:02'),
  (319,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910351 and l','2014-05-07 12:44:22'),
  (320,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910351 A','2014-05-07 12:44:24'),
  (321,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 12:47:23'),
  (322,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 12:47:23'),
  (323,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910275 and l','2014-05-07 12:47:31'),
  (324,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910275 A','2014-05-07 12:47:32'),
  (325,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 12:52:18'),
  (326,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 12:52:18'),
  (327,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910151 and l','2014-05-07 12:52:28'),
  (328,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910151 A','2014-05-07 12:52:30'),
  (329,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 12:54:22'),
  (330,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 13:03:38'),
  (331,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 13:03:39'),
  (332,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8910203 and l','2014-05-07 13:03:49'),
  (333,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8910203 A','2014-05-07 13:03:50'),
  (334,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-07 13:06:28'),
  (335,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-07 13:06:29'),
  (336,NULL,'Vantage Points',0,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Vantage Points Found For Latitude:12.8909994 and l','2014-05-07 13:06:36'),
  (337,NULL,'Tag Details Surrounding',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Surrounding Tags found with latitude: 12.8909994 A','2014-05-07 13:06:37'),
  (338,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 13:07:06'),
  (339,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:17','2014-05-07 13:07:15'),
  (340,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:13','2014-05-07 13:07:43'),
  (341,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:8','2014-05-07 13:07:48'),
  (342,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:6','2014-05-07 13:07:56'),
  (343,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:17','2014-05-07 13:08:33'),
  (344,NULL,'Tag Description',0,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:16','2014-05-07 13:08:44'),
  (345,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-08 05:45:19'),
  (346,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-08 05:45:19'),
  (347,NULL,'Tag Description',46,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Responded with the tagdetails created by user with','2014-05-08 05:46:07'),
  (348,NULL,'AutoLogin',0,'\r\n\r\n0c74157e69618260d22f4f3d45ac6d32Success\r\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 05:46:31'),
  (349,NULL,'Tag Description',46,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Responded with the tagdetails created by user with','2014-05-08 05:47:02'),
  (350,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-08 05:55:05'),
  (351,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-08 05:55:06'),
  (352,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-08 06:00:15'),
  (353,NULL,'Contact Business',46,NULL,26,NULL,NULL,NULL,NULL,'Fail','Multiple Business or No business associated with t','2014-05-08 06:00:25'),
  (354,NULL,'Save Tag',46,NULL,26,NULL,NULL,NULL,NULL,'Fail','Tag Already Saved By User','2014-05-08 06:00:44'),
  (355,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-08 06:16:32'),
  (356,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-08 06:16:32'),
  (357,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-08 06:59:18'),
  (358,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-08 06:59:18'),
  (359,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 07:07:33'),
  (360,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 08:23:08'),
  (361,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 08:24:01'),
  (362,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 08:29:18'),
  (363,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 08:32:47'),
  (364,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 09:26:36'),
  (365,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 09:32:35'),
  (366,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 09:35:31'),
  (367,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 09:43:08'),
  (368,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 09:44:38'),
  (369,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 09:51:49'),
  (370,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 09:54:10'),
  (371,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:01:14'),
  (372,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-08 10:05:59'),
  (373,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-08 10:05:59'),
  (374,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:38:32'),
  (375,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:40:00'),
  (376,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:42:06'),
  (377,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:43:46'),
  (378,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:46:47'),
  (379,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:49:19'),
  (380,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:51:40'),
  (381,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:56:53'),
  (382,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 10:58:54'),
  (383,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 11:01:45'),
  (384,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 12:10:30'),
  (385,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 12:11:54'),
  (386,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 12:41:16'),
  (387,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 12:45:26'),
  (388,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-08 12:48:01'),
  (389,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 04:40:49'),
  (390,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 04:51:40'),
  (391,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 04:52:41'),
  (392,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 05:01:08'),
  (393,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 05:56:45'),
  (394,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 05:59:43'),
  (395,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 06:13:07'),
  (396,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 06:15:39'),
  (397,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 07:02:03'),
  (398,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-09 07:12:07'),
  (399,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-09 07:12:07'),
  (400,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 07:17:16'),
  (401,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 07:20:33'),
  (402,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 07:24:14'),
  (403,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-09 08:38:53'),
  (404,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 09:02:16'),
  (405,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-09 09:48:36'),
  (406,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 11:38:45'),
  (407,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 11:38:59'),
  (408,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 11:40:28'),
  (409,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 11:40:45'),
  (410,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 11:49:52'),
  (411,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 11:50:02'),
  (412,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 11:51:12'),
  (413,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 11:51:32'),
  (414,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-09 11:57:57'),
  (415,NULL,'AutoLogin',0,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL,NULL,NULL,'Success','Succesfully Logged In','2014-05-09 11:57:58'),
  (416,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 11:58:10'),
  (417,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 11:59:26'),
  (418,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 11:59:47'),
  (419,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 12:02:14'),
  (420,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 12:02:26'),
  (421,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 12:06:36'),
  (422,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 12:06:45'),
  (423,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 12:12:29'),
  (424,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 12:13:35'),
  (425,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 12:16:14'),
  (426,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 12:18:28'),
  (427,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 12:18:37'),
  (428,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-09 12:20:56'),
  (429,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:33','2014-05-09 12:21:07'),
  (430,NULL,'Tag Description',45,NULL,NULL,NULL,NULL,NULL,NULL,'Success','Tag Found with TagId:32','2014-05-09 12:22:12'),
  (431,'User','Rewards',45,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','There are no Rewards for the user with mail id asas','2014-05-12 04:43:41'),
  (432,'User','Rewards',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fail','Reward response failed there is no registered user with the mail id asasa','2014-05-12 04:45:09'),
  (433,NULL,'AutoLogin',0,'\n\n0c74157e69618260d22f4f3d45ac6d32Success\n',NULL,NULL,NULL,NULL,NULL,'Fail','No Users With this auto login Id','2014-05-12 05:16:11'),
  (434,NULL,'LOGIN',46,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-12 05:27:08'),
  (435,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-12 06:35:41'),
  (436,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-12 06:36:48'),
  (437,NULL,'LOGIN',45,'asas',NULL,NULL,NULL,NULL,NULL,'Success','Logged in succesfully','2014-05-12 06:46:09');
COMMIT;

#
# Data for the `bill_board` table  (LIMIT -493,500)
#

INSERT INTO `bill_board` (`BILLBOARD_ID`, `TAG_ID`, `BILL_BOARD_NAME`, `AREA`, `CITY`, `COUNTRY`, `GENDER`, `AGE_START`, `AGE_END`, `OP_AREA_CITY`, `OP_CITY_COUNTRY`, `OP_COUNTRY_GENDER`, `OP_GENDER_AGE`, `VIDEO_URL`) VALUES

  (1,9,NULL,'Kudlu','Bangalore','INDIA','M',5,10,1,1,1,1,NULL),
  (2,9,NULL,'G B Palya','Bangalore','INDIA','F',10,15,1,1,1,1,NULL),
  (3,9,'Bill Board 1','Area1','City1','INDIA','Gender1',10,15,1,1,1,1,'Mark J - Marvelous Light.mp3'),
  (5,9,'billboar1','arwa','banga','india','male',10,15,1,0,1,1,'Test Image 1 Apartment Front Room.jpg'),
  (6,26,'ds','ds','ds','d','d',10,15,1,1,1,1,'Test Image 2 Apartment Bed Room.jpg'),
  (7,25,'name1','dv','ds','ds','d',10,15,1,1,1,1,'Test Image 2 Apartment Bed Room1.jpg');
COMMIT;

#
# Data for the `billboard` table  (LIMIT -498,500)
#

INSERT INTO `billboard` (`BILLBOARD_ID`, `CRITERIA`, `START_AGE_ONE`, `END_AGE_ONE`, `GENDER_ONE`, `TAG_ID`, `START_AGE_TWO`, `END_AGE_TWO`, `GENDER_TWO`, `DEFLT`, `BILLBOARD_NAME`, `BILLBOARD_VDO_URL1`, `BILLBOARD_VDO_URL2`, `BILLBOARD_VDO_URL3`) VALUES

  (1,'AGE',18,30,'M','8',18,30,'F','Y','BillBoard One','http://www.appqonnect.com/viewfindAR/big_buck_bunny.mp4',NULL,NULL);
COMMIT;

#
# Data for the `billboardNew` table  (LIMIT -498,500)
#

INSERT INTO `billboardNew` (`BILLBOARD_ID`, `TAG_ID`, `CRITERIA_1`, `CRITERIA_2`, `CRITERIA_3`, `CRITERIA_4`, `CRITERIA_5`, `CRITERIA_6`, `CRITERIA_7`, `CRITERIA_8`, `CRITERIA_9`, `CRITERIA_10`, `AREA_1`, `AREA_2`, `AREA_3`, `AREA_4`, `AREA_5`, `AREA_6`, `AREA_7`, `AREA_8`, `AREA_9`, `AREA_10`, `OPE_1_A`, `OPE_1_B`, `OPE_1_C`, `OPE_1_D`, `OPE_2_A`, `OPE_2_B`, `OPE_2_C`, `OPE_2_D`, `OPE_3_A`, `OPE_3_B`, `OPE_3_C`, `OPE_3_D`, `OPE_4_A`, `OPE_4_B`, `OPE_4_C`, `OPE_4_D`, `OPE_5_A`, `OPE_5_B`, `OPE_5_C`, `OPE_5_D`, `OPE_6_A`, `OPE_6_B`, `OPE_6_C`, `OPE_6_D`, `OPE_7_A`, `OPE_7_B`, `OPE_7_C`, `OPE_7_D`, `OPE_8_A`, `OPE_8_B`, `OPE_8_C`, `OPE_8_D`, `OPE_9_A`, `OPE_9_B`, `OPE_9_C`, `OPE_9_D`, `OPE_10_A`, `OPE_10_B`, `OPE_10_C`, `OPE_10_D`, `CITY_1`, `CITY_2`, `CITY_3`, `CITY_4`, `CITY_5`, `CITY_6`, `CITY_7`, `CITY_8`, `CITY_9`, `CITY_10`, `COUNTRY_1`, `COUNTRY_2`, `COUNTRY_3`, `COUNTRY_4`, `COUNTRY_5`, `COUNTRY_6`, `COUNTRY_7`, `COUNTRY_8`, `COUNTRY_9`, `COUNTRY_10`, `GENDER_1`, `GENDER_2`, `GENDER_3`, `GENDER_4`, `GENDER_5`, `GENDER_6`, `GENDER_7`, `GENDER_8`, `GENDER_9`, `GENDER_10`, `AGE_START_1`, `AGE_START_2`, `AGE_START_3`, `AGE_START_4`, `AGE_START_5`, `AGE_START_6`, `AGE_START_7`, `AGE_START_8`, `AGE_START_9`, `AGE_START_10`, `AGE_END_1`, `AGE_END_2`, `AGE_END_3`, `AGE_END_4`, `AGE_END_5`, `AGE_END_6`, `AGE_END_7`, `AGE_END_8`, `AGE_END_9`, `AGE_END_10`) VALUES

  (1,'1',0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
COMMIT;

#
# Data for the `business` table  (LIMIT -477,500)
#

INSERT INTO `business` (`BUSINESS_ID`, `BUSINESS_NAME`, `BUSINESS_CONTACT_NAME`, `BUSINESS_TYPE`, `BUSINESS_SUBTYPE`, `BUSINESS_CATEGORY`, `BUSINESS_SUBCATEGORY`, `BUSINEES_OWNEDTAGID`, `BUSINESS_MOBILE`, `BUSINESS_PHONE`, `BUSINESS_EMAIL`, `BUSINESS_PASSWORD`, `BUSINESS_ADDRESS_NO`, `BUSINESS_ADDRESS_STREET`, `BUSINESS_ADDRESS_AREA`, `BUSINESS_ADDRESS_CITY`, `BUSINESS_ADDRESS_AREA_CODE`, `BUSINESS_ADDRESS_COUNTRY`, `BUSINESS_REGISTERED_DATE`, `BUSINESS_LASTLOGIN_DATE`, `BUSINESS_STATUS`, `BUSINESS_REGISTERED`, `BUSINESS_APPROVED`, `BUSINESS_PAYMENTINFO`, `BUSINESS_LASTPAIDAMOUNT`, `BUSINESS_LASTPAIDDATE`) VALUES

  (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'soni.pratham@outlook.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8867867683',NULL,'gpradeep24@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
COMMIT;

#
# Data for the `demo_countries` table  (LIMIT -310,500)
#

INSERT INTO `demo_countries` (`id`, `region_id`, `name`, `description`, `population`, `picture_url`, `picture_url_1`, `is_democracy`, `independent_date`, `independent_time`) VALUES

  (2,1,'Angola','',10000,'','',0,'2009-05-28 00:00:00','00:00:00'),
  (3,1,'Benin','',0,'','',0,NULL,'00:00:00'),
  (4,1,'Botswana','',0,'','',0,NULL,'00:00:00'),
  (5,1,'Burkina Faso','',0,'','',0,NULL,'00:00:00'),
  (6,1,'Burundi','',0,'','',0,NULL,'00:00:00'),
  (7,1,'Cameroon','',0,'','',0,NULL,'00:00:00'),
  (8,1,'Cape Verde','',0,'','',0,NULL,'00:00:00'),
  (9,1,'Central African Republic','',0,'','',0,NULL,'00:00:00'),
  (10,1,'Chad','',0,'','',0,NULL,'00:00:00'),
  (11,1,'Comoros','',10000,'','',0,'2007-10-26 00:00:00','00:00:00'),
  (12,1,'Cote d-Ivoire','',0,'','',0,NULL,'00:00:00'),
  (13,1,'Democratic Republic of the Congo','',0,'','',0,NULL,'00:00:00'),
  (14,1,'Djibouti','',0,'','',0,NULL,'00:00:00'),
  (16,1,'Equatorial Guinea','',0,'','',0,NULL,'00:00:00'),
  (17,1,'Eritrea','',0,'','',0,NULL,'00:00:00'),
  (18,1,'Ethiopia','',0,'','',0,NULL,'00:00:00'),
  (19,1,'Gabon','',0,'','',0,NULL,'00:00:00'),
  (20,1,'Gambia','',0,'','',0,NULL,'00:00:00'),
  (21,1,'Ghana','',0,'','',0,NULL,'00:00:00'),
  (22,1,'Guinea','',0,'','',0,NULL,'00:00:00'),
  (23,1,'Guinea-Bissau','',0,'','',0,NULL,'00:00:00'),
  (24,1,'Kenya','',0,'','',0,NULL,'00:00:00'),
  (25,1,'Lesotho','',0,'','',0,NULL,'00:00:00'),
  (26,1,'Liberia','',0,'','',0,NULL,'00:00:00'),
  (27,1,'Libya','',0,'','',0,NULL,'00:00:00'),
  (28,1,'Madagascar','',0,'','',0,NULL,'00:00:00'),
  (29,1,'Malawi','',0,'','',0,NULL,'00:00:00'),
  (54,1,'Mali','',0,'','',0,NULL,'00:00:00'),
  (55,1,'Mauritania','',0,'','',0,NULL,'00:00:00'),
  (56,1,'Mauritius','',0,'','',0,NULL,'00:00:00'),
  (57,1,'Morocco','',0,'','',0,NULL,'00:00:00'),
  (58,1,'Mozambique','',0,'','',0,NULL,'00:00:00'),
  (59,1,'Namibia','',0,'','',0,NULL,'00:00:00'),
  (60,1,'Niger','',0,'','',0,NULL,'00:00:00'),
  (61,1,'Nigeria','',0,'','',0,NULL,'00:00:00'),
  (62,1,'Republic of the Congo','',0,'','',0,NULL,'00:00:00'),
  (63,1,'Rwanda','',0,'','',0,NULL,'00:00:00'),
  (64,1,'Sao Tome and Principe','',0,'','',0,NULL,'00:00:00'),
  (65,1,'Senegal','',0,'','',0,NULL,'00:00:00'),
  (66,1,'Seychelles','',0,'','',0,NULL,'00:00:00'),
  (67,1,'Sierra Leone','',0,'','',0,NULL,'00:00:00'),
  (68,1,'Somalia','',0,'','',0,NULL,'00:00:00'),
  (69,1,'South Africa','',0,'','',0,NULL,'00:00:00'),
  (70,1,'Sudan','',0,'','',0,NULL,'00:00:00'),
  (71,1,'Swaziland','',0,'','',0,NULL,'00:00:00'),
  (72,1,'Tanzania','',0,'','',0,NULL,'00:00:00'),
  (73,1,'Togo','',0,'','',0,NULL,'00:00:00'),
  (74,1,'Tunisia','',0,'','',0,NULL,'00:00:00'),
  (75,1,'Uganda','',0,'','',0,NULL,'00:00:00'),
  (76,1,'Western Sahara','',0,'','',0,NULL,'00:00:00'),
  (77,1,'Zambia','',0,'','',0,NULL,'00:00:00'),
  (78,1,'Zimbabwe','',0,'','',0,NULL,'00:00:00'),
  (80,2,'Bangladesh','',0,'','',0,NULL,'00:00:00'),
  (81,2,'Bhutan','',0,'','',0,NULL,'00:00:00'),
  (82,2,'Brunei','',0,'','',0,NULL,'00:00:00'),
  (83,2,'Cambodia','',0,'','',0,NULL,'00:00:00'),
  (84,2,'China','',0,'','',0,NULL,'00:00:00'),
  (85,2,'Hong Kong','',0,'','',0,NULL,'00:00:00'),
  (86,2,'India','',0,'','',0,NULL,'00:00:00'),
  (87,2,'Indonesia','',0,'','',0,NULL,'00:00:00'),
  (88,2,'Japan','',0,'','',0,NULL,'00:00:00'),
  (89,2,'Kazakhstan','',0,'','',0,NULL,'00:00:00'),
  (90,2,'Laos','',0,'','',0,NULL,'00:00:00'),
  (91,2,'Macao','',0,'','',0,NULL,'00:00:00'),
  (92,2,'Malaysia','',0,'','',0,NULL,'00:00:00'),
  (93,2,'Maldives','',0,'','',0,NULL,'00:00:00'),
  (94,2,'Mongolia','',0,'','',0,NULL,'00:00:00'),
  (95,2,'Myanmar','',0,'','',0,NULL,'00:00:00'),
  (96,2,'Nepal','',0,'','',0,NULL,'00:00:00'),
  (97,2,'North Korea','',0,'','',0,NULL,'00:00:00'),
  (98,2,'Pakistan','',0,'','',0,NULL,'00:00:00'),
  (99,2,'Philippines','',0,'','',0,NULL,'00:00:00'),
  (100,2,'Singapore','',0,'','',0,NULL,'00:00:00'),
  (101,2,'South Korea','',0,'','',0,NULL,'00:00:00'),
  (102,2,'Sri Lanka','',0,'','',0,NULL,'00:00:00'),
  (103,2,'Taiwan','',0,'','',0,NULL,'00:00:00'),
  (104,2,'Tajikistan','',0,'','',0,NULL,'00:00:00'),
  (105,2,'Thailand','',0,'','',0,NULL,'00:00:00'),
  (106,2,'Vietnam','',0,'','',0,NULL,'00:00:00'),
  (108,3,'Antigua','',10000,'','',0,'2009-05-27 00:00:00','00:00:00'),
  (109,3,'Bahamas','',0,'','',0,NULL,'00:00:00'),
  (110,3,'Barbados','',0,'','',0,NULL,'00:00:00'),
  (111,3,'Dominica','',0,'','',0,NULL,'00:00:00'),
  (112,3,'Grenada','',0,'','',0,NULL,'00:00:00'),
  (113,3,'St.Kitts & Nevis','',0,'','',0,NULL,'00:00:00'),
  (114,3,'St.Lucia','',0,'','',0,NULL,'00:00:00'),
  (115,3,'St.Vincent & the Grenadines','',0,'','',0,NULL,'00:00:00'),
  (116,3,'Trinidad & Tobago','',0,'','',0,NULL,'00:00:00'),
  (118,4,'Andorra','test',10000,'','',0,'2007-09-21 16:34:54','00:00:00'),
  (119,4,'Armenia','<br>',10000,'','',0,'2009-05-29 00:00:00','00:00:00'),
  (120,4,'Austria','<br>',10000,'','',0,'2009-05-20 00:00:00','00:00:00'),
  (121,4,'Azerbaijan','',0,'','',0,NULL,'00:00:00'),
  (122,4,'Belarus','',0,'','',0,NULL,'00:00:00'),
  (123,4,'Belgium','',0,'','',0,NULL,'00:00:00'),
  (124,4,'Bosnia and Herzegovina','',0,'','',0,NULL,'00:00:00'),
  (125,4,'Bulgaria','',0,'','',0,NULL,'00:00:00'),
  (126,4,'Croatia','',0,'','',0,NULL,'00:00:00'),
  (127,4,'Czech Republic','',0,'','',0,NULL,'00:00:00'),
  (128,4,'Denmark','',0,'','',0,NULL,'00:00:00'),
  (129,4,'Estonia','',0,'','',0,NULL,'00:00:00'),
  (130,4,'Finland','',0,'','',0,NULL,'00:00:00'),
  (131,4,'France','',0,'','',0,NULL,'00:00:00'),
  (132,4,'Georgia','',0,'','',0,NULL,'00:00:00'),
  (133,4,'Germany','',0,'','',0,NULL,'00:00:00'),
  (134,4,'Greece','',0,'','',0,NULL,'00:00:00'),
  (135,4,'Hungary','',0,'','',0,NULL,'00:00:00'),
  (136,4,'Iceland','',0,'','',0,NULL,'00:00:00'),
  (137,4,'Ireland','',0,'','',0,NULL,'00:00:00'),
  (138,4,'Italy','',0,'','',0,NULL,'00:00:00'),
  (139,4,'Latvia','',0,'','',0,NULL,'00:00:00'),
  (140,4,'Liechtenstein','',0,'','',0,NULL,'00:00:00'),
  (141,4,'Lithuania','',0,'','',0,NULL,'00:00:00'),
  (142,4,'Luxembourg','',0,'','',0,NULL,'00:00:00'),
  (143,4,'Macedonia','',0,'','',0,NULL,'00:00:00'),
  (144,4,'Malta','',0,'','',0,NULL,'00:00:00'),
  (145,4,'Moldova','',0,'','',0,NULL,'00:00:00'),
  (146,4,'Monaco','',0,'','',0,NULL,'00:00:00'),
  (147,4,'Netherlands','',0,'','',0,NULL,'00:00:00'),
  (148,4,'Norway','',0,'','',0,NULL,'00:00:00'),
  (149,4,'Poland','',0,'','',0,NULL,'00:00:00'),
  (150,4,'Portugal','',0,'','',0,NULL,'00:00:00'),
  (151,4,'Romania','',0,'','',0,NULL,'00:00:00'),
  (152,4,'Russian Federation','',0,'','',0,NULL,'00:00:00'),
  (153,4,'San Marino','',0,'','',0,NULL,'00:00:00'),
  (154,4,'Slovakia','',0,'','',0,NULL,'00:00:00'),
  (155,4,'Slovenia','',0,'','',0,NULL,'00:00:00'),
  (156,4,'Spain','',0,'','',0,NULL,'00:00:00'),
  (157,4,'Sweden','',0,'','',0,NULL,'00:00:00'),
  (158,4,'Switzerland','',0,'','',0,NULL,'00:00:00'),
  (159,4,'Turkey','',0,'','',0,NULL,'00:00:00'),
  (160,4,'Ukraine','',0,'','',0,NULL,'00:00:00'),
  (161,4,'United Kingdom','',0,'','',0,NULL,'00:00:00'),
  (162,4,'Yugoslavia','',0,'','',0,NULL,'00:00:00'),
  (163,5,'Bahrain','',0,'','',0,NULL,'00:00:00'),
  (164,5,'Cyprus','',0,'','',0,NULL,'00:00:00'),
  (165,5,'Egypt','',0,'','',0,NULL,'00:00:00'),
  (166,5,'Iran','',0,'','',0,NULL,'00:00:00'),
  (167,5,'Iraq','',0,'','',0,NULL,'00:00:00'),
  (168,5,'Israel','',0,'','',0,NULL,'00:00:00'),
  (169,5,'Jordan','',0,'','',0,NULL,'00:00:00'),
  (170,5,'Kuwait','',0,'','',0,NULL,'00:00:00'),
  (171,5,'Lebanon','',0,'','',0,NULL,'00:00:00'),
  (172,5,'Oman','',0,'','',0,NULL,'00:00:00'),
  (173,5,'Qatar','',0,'','',0,'2007-02-02 00:00:00','00:00:00'),
  (174,5,'Saudi Arabia','',0,'','',0,NULL,'00:00:00'),
  (175,5,'Syria','',0,'','',0,NULL,'00:00:00'),
  (176,5,'Turkey','',0,'','',0,NULL,'00:00:00'),
  (177,5,'United Arab Emirates','',0,'','',0,NULL,'00:00:00'),
  (178,5,'Yemen','',0,'','',0,NULL,'00:00:00'),
  (179,6,'Belize','',0,'','',0,NULL,'00:00:00'),
  (180,6,'Canada','',0,'','',0,NULL,'00:00:00'),
  (181,6,'Costa Rica','',0,'','',0,NULL,'00:00:00'),
  (182,6,'Cuba','',0,'','',0,NULL,'00:00:00'),
  (183,6,'Dominican Republic','',0,'','',0,NULL,'00:00:00'),
  (184,6,'El Salvador','',0,'','',0,NULL,'00:00:00'),
  (185,6,'Guatemala','',0,'','',0,NULL,'00:00:00'),
  (186,6,'Haiti','',0,'','',0,NULL,'00:00:00'),
  (192,6,'Honduras','',0,'','',0,NULL,'00:00:00'),
  (193,6,'Jamaica','',0,'','',0,NULL,'00:00:00'),
  (194,6,'Mexico','',0,'','',0,NULL,'00:00:00'),
  (195,6,'Nicaragua','',0,'','',0,NULL,'00:00:00'),
  (196,6,'Panama','',0,'','',0,NULL,'00:00:00'),
  (197,6,'United States of America','',0,'','',0,NULL,'00:00:00'),
  (198,7,'Australia','',0,'','',0,NULL,'00:00:00'),
  (199,7,'Federated States of Micronesia','',0,'','',0,NULL,'00:00:00'),
  (200,7,'Fiji','',0,'','',0,NULL,'00:00:00'),
  (201,7,'Kiribati','',0,'','',0,NULL,'00:00:00'),
  (202,7,'Marshall Islands','',0,'','',0,NULL,'00:00:00'),
  (203,7,'Nauru','',0,'','',0,NULL,'00:00:00'),
  (204,7,'New Zealand','',0,'','',0,NULL,'00:00:00'),
  (205,7,'Palau','',0,'','',0,NULL,'00:00:00'),
  (206,7,'Papua New Guinea','',0,'','',0,NULL,'00:00:00'),
  (207,7,'Samoa','',0,'','',0,NULL,'00:00:00'),
  (208,7,'Solomon Islands','',0,'','',0,NULL,'00:00:00'),
  (209,7,'Tonga','',0,'','',0,NULL,'00:00:00'),
  (210,7,'Tuvalu','',0,'','',0,NULL,'00:00:00'),
  (211,7,'Vanuatu','',0,'','',0,NULL,'00:00:00'),
  (212,8,'Argentina','',0,'','',0,NULL,'00:00:00'),
  (213,8,'Bolivia','',0,'','',0,NULL,'00:00:00'),
  (214,8,'Brazil','',0,'','',0,NULL,'00:00:00'),
  (215,8,'Chile','',0,'','',0,NULL,'00:00:00'),
  (216,8,'Colombia','',0,'','',0,NULL,'00:00:00'),
  (217,8,'Ecuador','',0,'','',0,NULL,'00:00:00'),
  (218,8,'French Guiana','',0,'','',0,NULL,'00:00:00'),
  (219,8,'Guyana','ryry',10000,'','',0,'2007-09-21 00:00:00','00:00:00'),
  (220,8,'Paraguay','',10000,'','',0,'2007-09-21 00:00:00','00:00:00'),
  (222,8,'Suriname','<br>',10000,'','',0,'2007-09-21 00:00:00','00:00:00'),
  (223,8,'Urugvay','<br>',250000,'','',1,'2007-09-21 00:00:00','00:00:00'),
  (227,9,'Arctic','Lorem ipsum dolor.',10000,'','',0,'2007-10-02 00:00:00','12:13:00');
COMMIT;

#
# Data for the `demo_democracy` table  (LIMIT -497,500)
#

INSERT INTO `demo_democracy` (`id`, `description`) VALUES

  (1,'Yes'),
  (2,'No');
COMMIT;

#
# Data for the `demo_presidents` table  (LIMIT -493,500)
#

INSERT INTO `demo_presidents` (`id`, `region_id`, `country_id`, `name`, `birth_date`, `work_phone`, `email`, `validator_email`, `password`, `validator_password`, `status`, `favorite_color`, `rating`, `is_active`) VALUES

  (1,1,2,'Mombo','1995-02-14','(123)-345-45-56','mbo@mycountry.gov','','test','','Candidate','#1E90FF',0,0),
  (2,2,2,'Rombo','1965-11-08','','','','','','Candidate','#FF7F50',1,1),
  (3,3,173,'mr. Portos','2007-02-23','','','','','','Candidate','#800080',2,1),
  (5,4,160,'Kuchma','2007-02-06','','','','','','Vice','#FFFFE0',3,0),
  (6,5,227,'Rondo','1952-02-14','','','','','','Candidate','#87CEFA',4,0),
  (7,10,225,'Poro','2007-02-19','','','','','','Candidate','#00008B',5,1);
COMMIT;

#
# Data for the `demo_regions` table  (LIMIT -490,500)
#

INSERT INTO `demo_regions` (`id`, `name`) VALUES

  (1,'Africa'),
  (2,'Asia'),
  (3,'Caribbean'),
  (4,'Europe'),
  (5,'Middle East'),
  (6,'North America'),
  (7,'Oceania'),
  (8,'South America'),
  (9,'North & South Poles');
COMMIT;

#
# Data for the `mdefalut_val` table  (LIMIT -487,500)
#

INSERT INTO `mdefalut_val` (`DEF_ID`, `DEF_TYPE`, `DEF_SUB_TYPE`, `DEF_VAL`, `DEF_VAL_DISP`) VALUES

  (6,'TagType',NULL,'Business','Business'),
  (7,'TagType',NULL,'NonBusiness','Non Business'),
  (17,'TagSubType','Business','Business1','Business1'),
  (18,'TagSubType','Business','Business2','Business2'),
  (19,'TagSubType','NonBusiness','NonBusiness1','NonBusiness1'),
  (20,'TagSubType','NonBusiness','NonBusiness2','NonBusiness2'),
  (21,'TagCategory',NULL,'Category1','1st Category'),
  (22,'TagCategory',NULL,'Category2','2nd Category'),
  (23,'TagSubCategory','Category1','subcat1undercat1','subcat1 under category1'),
  (24,'TagSubCategory','Category1','subcat2undercat1','subcat2 under category1'),
  (25,'TagSubCategory','Category2','subcat1undercat2','subcat1 under category2'),
  (26,'TagSubCategory','Category2','subcat2undercat2','subcat2 under category2');
COMMIT;

#
# Data for the `offer` table  (LIMIT -476,500)
#

INSERT INTO `offer` (`offer_id`, `offer_name`, `business_id`, `tag_id`, `offer_validity`, `redeem_status`, `offer_status`, `offer_type`, `offer_code`, `offer_start_datetime`, `offer_end_datetime`) VALUES

  (1,'Offer1',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2,'Offer2',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (3,'Offer3',3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (4,'Offer4',4,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (5,'Offer5',5,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (6,'Offer6',6,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (7,'Offer7',7,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (8,'Offer8',8,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (9,'Offer9',9,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (10,'Offer10',10,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (11,'Offer11',11,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (12,'Offer12',12,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (13,'Offer13',13,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (14,'Offer14',14,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (15,'Offer15',15,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (16,'Offer16',16,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (17,'Offer17',17,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (18,'Offer18',18,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (19,'Offer19',19,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (20,'Offer20',20,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (21,'Offer20',20,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (22,'Offer21',21,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (23,'Offer Name',46,26,NULL,1,1,'Offer Type ','Offer Code','2014-04-28 00:00:00','2014-04-28 00:00:00');
COMMIT;

#
# Data for the `role` table  (LIMIT -496,500)
#

INSERT INTO `role` (`ROLE_ID`, `ROLE_NAME`) VALUES

  (1,'Admin'),
  (2,'User'),
  (3,'Business');
COMMIT;

#
# Data for the `save_tag` table  (LIMIT -493,500)
#

INSERT INTO `save_tag` (`save_tag_id`, `user_id`, `tag_id`, `save_date`, `thumb_type`, `thumb_comment`) VALUES

  (1,1,11,'2014-04-23',NULL,NULL),
  (2,1,19,'2014-04-23',NULL,NULL),
  (3,46,26,'2014-04-28',NULL,NULL),
  (5,46,4,'2014-05-06','Down','comments'),
  (6,46,5,'2014-05-06','Down','comments'),
  (7,45,16,'2014-05-07',NULL,NULL);
COMMIT;

#
# Data for the `tagMaster` table  (LIMIT -463,500)
#

INSERT INTO `tagMaster` (`TAG_ID`, `TAG_NAME`, `TAG_DESCRIPTION`, `SUBTAG_ID`, `SUBTAG_NAME`, `TAG_TYPE`, `TAG_SUBTYPE`, `TAG_CATEGORY`, `TAG_SUBCATERGORY`, `TAG_VALUETYPE`, `TAG_CURRECNY`, `TAG_VALUE`, `STATUS`, `TAG_ACCESSTYPE`, `TAG_MEASUREDHOW`, `TAG_LATITUDE`, `TAG_LONGITUDE`, `TAG_LATPLUS2`, `TAG_LATMINUS2`, `TAG_LONGPLUS2`, `TAG_LONGMINUSS2`, `TAG_RATING`, `PUBLISHDEVICE_LAT`, `PUBLISHDEVICE_LONG`, `SUBMITTED_BY`, `SUBMIT_DATE`, `APPROVED_BY`, `APPROVAL_DATE`, `TAG_RATING_UP`, `TAG_RATING_DOWN`, `TAG_FEEDBACK_COMMENTS`, `LAT_POINT1`, `LAT_POINT2`, `LAT_POINT3`, `LAT_POINT4`, `LONG_POINT1`, `LONG_POINT2`, `LONG_POINT3`, `LONG_POINT4`, `TAG_IMG_PATH`, `CREATED_BY`, `CREATED_DATE`, `CREATED_BY_BUSNSS`, `CREATED_DATE_BUSNSS`) VALUES

  (1,'Dalma','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,NULL,NULL,'BillBoard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.935192,77.62415,12.935212,12.935172,77.62417,77.62413,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house4.png',NULL,NULL,NULL,NULL),
  (2,'Biryani Ghar','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,NULL,NULL,'BillBoard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.935347,77.624288,12.935367,12.935327,77.624308,77.624268,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house3.jpg',NULL,NULL,NULL,NULL),
  (3,'Kamat','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,NULL,NULL,'BillBoard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.935474,77.624543,12.935494,12.935454,77.624563,77.624523,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house2.jpg',NULL,NULL,NULL,NULL),
  (4,'Panasonic','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,NULL,NULL,'BillBoard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.935192,77.624632,12.935212,12.935172,77.624652,77.624612,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house1.jpg',NULL,NULL,NULL,NULL),
  (6,'Corner1','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Rent',NULL,NULL,NULL,NULL,NULL,NULL,12.891372,77.641612,12.891392,12.891352,77.641632,77.641592,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house1.jpg',NULL,NULL,NULL,NULL),
  (7,'Corner2','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Architect',NULL,NULL,NULL,NULL,NULL,NULL,12.891813,77.641398,12.891833,12.891793,77.641418,77.641378,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house2.jpg',NULL,NULL,NULL,NULL),
  (8,'Center3','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Landscapes',NULL,NULL,NULL,NULL,NULL,NULL,12.891254,77.641394,12.891274,12.891234,77.641414,77.641374,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house3.jpg',NULL,NULL,NULL,NULL),
  (9,'Corner4','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'BillBoard','Sale',NULL,NULL,NULL,NULL,NULL,NULL,12.891119,77.641136,12.891139,12.891099,77.641156,77.641116,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house4.png',NULL,NULL,NULL,NULL),
  (10,'Center5','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Rent',NULL,NULL,NULL,NULL,NULL,NULL,12.891325,77.641021,12.891345,12.891305,77.641041,77.641001,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house5.jpg',NULL,NULL,NULL,NULL),
  (13,'TagA','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Sale',NULL,NULL,NULL,NULL,NULL,NULL,12.891432,77.641584,12.891452,12.891412,77.641604,77.641564,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house8.jpg','2',NULL,NULL,NULL),
  (14,'TagB','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Rent',NULL,NULL,NULL,NULL,NULL,NULL,12.891566,77.641518,12.891586,12.891546,77.641538,77.641498,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house9.jpg','46',NULL,NULL,NULL),
  (15,'TagC','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Architect',NULL,NULL,NULL,NULL,NULL,NULL,12.891309,77.641506,12.891329,12.891289,77.641526,77.641486,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house10.jpg',NULL,NULL,NULL,NULL),
  (16,'TagD','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Landscapes',NULL,NULL,NULL,NULL,NULL,NULL,12.891167,77.641246,12.891187,12.891147,77.641266,77.641226,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house1.jpg',NULL,NULL,NULL,NULL),
  (17,'TagE','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Sale',NULL,NULL,NULL,NULL,NULL,NULL,12.891216,77.64108,12.891236,12.891196,77.6411,77.64106,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house2.jpg',NULL,NULL,NULL,NULL),
  (19,'ws','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,'1.23344444','Business',NULL,'RealEstate','Architect',NULL,NULL,NULL,'Created',NULL,NULL,0,0,0.00002,-0.00002,0.00002,-0.00002,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house4.png','','2014-04-03',NULL,NULL),
  (20,'ws','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,'1.23344444','Business',NULL,'RealEstate','Landscapes',NULL,NULL,NULL,'Created',NULL,NULL,0,0,0.00002,-0.00002,0.00002,-0.00002,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house5.jpg','','2014-04-03',NULL,NULL),
  (21,'fg','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,'dgj','Businesss',NULL,'RealEstate','1',NULL,NULL,NULL,'Created',NULL,NULL,19.022977511862,72.8652223572135,19.0229975119,19.0229575119,72.8652423572,72.8652023572,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house6.jpg','','2014-04-03',NULL,NULL),
  (22,'dgui','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,'dhj','Businesss',NULL,'BillBoard','1',NULL,NULL,NULL,'Created',NULL,NULL,19.0233182499686,72.8638718649745,19.02333825,19.02329825,72.863891865,72.863851865,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house7.jpg','','2014-04-03',NULL,NULL),
  (23,'ffg','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,'ggg','Tag Type','Tag Type','Tag Type','1',NULL,NULL,NULL,'Created',NULL,NULL,19.0225236159222,72.866655997932,19.0225436159,19.0225036159,72.8666759979,72.8666359979,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house8.jpg','','2014-04-03',NULL,NULL),
  (24,'ffg','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,'ggg','Tag Type','Tag Type','Tag Type','1',NULL,NULL,NULL,'Created',NULL,NULL,19.0223876370788,72.8678841143847,19.0224076371,19.0223676371,72.8679041144,72.8678641144,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/house9.jpg','','2014-04-03',NULL,NULL),
  (25,'Prestige Silverdale 3BHK','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,'Business',NULL,'RealEstate','Rent',NULL,NULL,NULL,'Created',NULL,NULL,12.909524,77.684538,12.909544,12.908747,77.684558,77.683879,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Room.jpg',NULL,'2014-04-21',46,'2014-04-16'),
  (26,'Clubhouse','This well maintained complex includes Community Hall, Swimming Pool, Squash, Badminton, Tennis, Billiards, Children''s Play Area, Garden. For reservations please contact us.',NULL,NULL,NULL,NULL,'RealEstate','Rent',NULL,NULL,NULL,NULL,NULL,NULL,12.906942,77.682874,12.906962,12.905953,77.682894,77.682242,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg',NULL,'2014-04-21',46,'2014-04-16'),
  (27,'test','test',NULL,'cb','Hotel','Busineess','RealEstate','volvo',NULL,NULL,NULL,'Created',NULL,NULL,12.963074,-0.113983,12.963094,12.963054,-0.113963,-0.114003,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-23',NULL,NULL),
  (28,'czx','c',NULL,'xcd','Hotel','Busineess','RealEstate','volvo',NULL,NULL,NULL,'Created',NULL,NULL,12.953706,-0.289764,12.953726,12.953686,-0.289744,-0.289784,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-23',NULL,NULL),
  (29,'f','f',NULL,'f','Hotel','Busineess','RealEstate','volvo',NULL,NULL,NULL,'Created',NULL,NULL,12.902007,-0.062141,12.902027,12.901987,-0.062121,-0.062161,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-23',NULL,NULL),
  (30,'f','f',NULL,'f','Hotel','Busineess','RealEstate','volvo',NULL,NULL,NULL,'Created',NULL,NULL,12.902007,-0.062141,12.902027,12.901987,-0.062121,-0.062161,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-23',NULL,NULL),
  (31,'dc','xv',NULL,'','Hotel','Busineess','RealEstate','volvo',NULL,NULL,NULL,'Created',NULL,NULL,13.145015,-0.585022,13.145035,13.144995,-0.585002,-0.585042,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-23',NULL,NULL),
  (32,'vf','xfv',NULL,'vf','Hotel','Busineess','RealEstate','volvo',NULL,NULL,NULL,'Created',NULL,NULL,20.632784,13.579102,20.632804,20.632764,13.579122,13.579082,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-23',NULL,NULL),
  (33,'Sagar','This well maintained complex includes Community Hall, Swimming Pool, Squash, Badminton, Tennis, Billiards, Children''s Play Area, Garden. For reservations please contact us.',NULL,NULL,NULL,NULL,'RealEstate','Restairant',NULL,NULL,NULL,NULL,NULL,NULL,12.890198,77.639804,12.890218,12.890049,77.639824,77.63963,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg',NULL,NULL,1,'2014-04-30'),
  (34,'Trident','3BHK, 1700 sq ft flat, Rs25K/month + 6 months deposit. Vegetarians only. 2nd floor, semi-furnished.\r\nFully done Wardrobes and kitchen cabinet. Clubhouse amenities include gym, party hall and swimming pool. ',NULL,NULL,NULL,NULL,'RealEstate','Automobiles',NULL,NULL,NULL,NULL,NULL,NULL,12.890587,77.639745,12.890607,12.890359,77.639765,77.639509,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg',NULL,NULL,1,'2014-04-30'),
  (35,'d','d',NULL,'','','','RealEstate','',NULL,NULL,NULL,'Created',NULL,NULL,1.845384,25.839844,1.845404,1.845364,25.839864,25.839824,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-25',NULL,NULL),
  (36,'s','s',NULL,'','','','RealEstate','',NULL,NULL,NULL,'Created',NULL,NULL,-1.493971,35.507813,-1.493951,-1.493991,35.507833,35.507793,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-25',NULL,NULL),
  (37,'s','s',NULL,'','','','RealEstate','',NULL,NULL,NULL,'Created',NULL,NULL,0,0,0.00002,-0.00002,0.00002,-0.00002,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-25',NULL,NULL),
  (38,'s','s',NULL,'s','','','RealEstate','',NULL,NULL,NULL,'Created',NULL,NULL,-4.127285,18.28125,-4.127265,-4.127305,18.28127,18.28123,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg','46','2014-04-25',NULL,NULL),
  (39,'Corner6','fd',NULL,NULL,NULL,NULL,'RealEstate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891549,77.640917,12.891569,12.891529,77.640937,77.640897,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg',NULL,NULL,NULL,NULL),
  (40,'TagF','ds',NULL,NULL,NULL,NULL,'RealEstate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891478,77.640953,12.891498,12.891458,77.640973,77.640933,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://viewfindar.com/images/Clubhouse.jpg',NULL,NULL,NULL,NULL);
COMMIT;

#
# Data for the `user` table  (LIMIT -444,500)
#

INSERT INTO `user` (`USER_ID`, `USER_FIRSTNAME`, `USER_SECONDNAME`, `USER_NICKNAME`, `USER_MOBILE`, `USER_PHONE`, `USER_EMAIL`, `USER_PASSWORD`, `USER_ADDRESS_NO`, `USER_ADDRESS_STREET`, `USER_ADDRESS_AREA`, `USER_ADDRESS_CITY`, `USER_ADDRESS_AREA_CODE`, `USER_ADDRESS_COUNTRY`, `USER_PERM_ADDR_NO`, `USER_PERM_ADDR_STREET`, `USER_PERM_ADDR_AREA`, `USER_PERM_ADDR_CITY`, `USER_PERM_ADDR_AREA_CODE`, `USER_PERM_ADDR_COUNTRY`, `USER_OFF_ADDR_NO`, `USER_OFF_ADDR_STREET`, `USER_OFF_ADDR_AREA`, `USER_OFF_ADDR_CITY`, `USER_OFF_ADDR_AREA_CODE`, `USER_OFF_AREA_COUNTRY`, `USER_BACHELOR_DEG`, `USER_MASTER_DEG`, `USER_GENDER`, `USER_BIRTH_DATE`, `USER_BIRTH_MONTH`, `USER_BIRTH_YEAR`, `USER_REGISTERED_DATE`, `USER_LASTLOGIN_DATE`, `USER_LASTREWARD_DATE`, `USER_LAST_DEVICEID`, `USER_LAST_DEVICE_LAT`, `USER_LAST_DEVICE_LONG`, `USER_TAG_FORWARDED`, `USER_TAG_SAVED`, `USER_LAST_APP_LOGIN`, `ROLE_ID`, `USER_NOTIFICATION`, `USER_PIC`) VALUES

  (1,'','','','0',0,'','8e96f2e5f1de94d279e8cb82b85631ebf0c3150a8c1367129f706b691a25e8ef','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (2,'testname2','','','0',0,'','89be6a1a0394b8386c302cf4303dbecc81e3168c1918bbf8918839c87dde6105','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (3,'','','','0',0,'','f313a54979f86bafb1c6a2fe904c8f954044861cf3e7f45c834fb720589e8f46','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (4,'','','','0',0,'','09d52b68d5c432b00881ae20abbcf906937962ab1d523fb6084a9090681216d7','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (5,'','','','0',0,'','e4dc04e330c5f4c090d2576342ca0d480a546f5071eac12718225b3ed3ee1588','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (6,'','','','0',0,'','69eefc2cc3cd3af6f4f37c23e3c97c3dac309002f35a095aa511b0bfb704c0fb','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (7,'','','','0',0,'','ae54ee0f75b2ab1b6046d873046e3a639de99f86a11fcc2d5f8a5bbd2c6d04be','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (8,'','','','0',0,'','61da08cee02e80c026cefc6f8ec33c9af2761e250da0a987bae1a4e59b8aca8d','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (9,'','','','0',0,'','7eb7042a9c09b60fa93dd7916deefe56e5d40568ae010c4323a6ea57caae6a3d','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (10,'','','','0',0,'','fd9a2055891ff94df6c0aea10ffa11a7cba12de322d66b6229d348bd7f034006','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (11,'','','','0',0,'','f1140c54e4a05cb9fc5a65c693550a34a11e6b036d5457094dc263610506891a','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (12,'','','','0',0,'','df5caa1b173e80e84f0e0f1e2cd8d20a95294213702a842ccb441e16281c9f5a','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (13,'','','','0',0,'','e58459d0d225706957301bbb54e36182893326f734c4e9cd59a882627c5c2a9a','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (14,'','','','0',0,'','1bfec1c1b5d6bc5950b79cba13e8179b27e5a29163a756b17c7436f3b2f473e5','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (15,'','','','0',0,'','58e549f707cd0c2e720c0a1689b4820e8ed881619cfebb0ae14db643b1bd6580','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (16,'','','','0',0,'','ec7bd0ff32e92d32e9dbd8281c33ad6f3515a9096ed9061bcf858b3500e132c2','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (17,'','','','0',0,'','40a67161c4d855685aede1b3db67a74c741ef4d97a68b4b226a30bd52985f44e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (18,'','','','0',0,'','270d974982586d3261f7445040540f0fedce4a3d03fedd1013511f54882c9760','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (19,'','','','0',0,'','a1e5eb0b00837d38c41fb97420c282854e4767e8602e190e355473169a6b9b78','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,NULL,'0000-00-00','0000-00-00','0000-00-00',0,0,0,'',NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (20,'n','tg','hgv','0',0,'hjdvcjh@jkdfvb.com','4296e1221b9b4a6877c5c4b13ef1ccd4','yh','y','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (21,'n','tg','hgv','0',0,'hjdvcjh@jkdfvb.com','4296e1221b9b4a6877c5c4b13ef1ccd4','yh','y','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (22,'n','tg','hgv','1234567890',2147483647,'hjdvcjh@jkdfvb.com','4296e1221b9b4a6877c5c4b13ef1ccd4','yh','y','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (23,'n','tg','hgv','1234567890',2147483647,'hjdvcjh@jkdfvb.com','4296e1221b9b4a6877c5c4b13ef1ccd4','yh','y','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (24,'n','tg','hgv','99452526',23445293,'','4296e1221b9b4a6877c5c4b13ef1ccd4','yh','y','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (25,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (26,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (27,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (28,'5.','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (29,'5.','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (30,'5.','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (31,'5.','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (32,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (33,'5.','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (34,'5.','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (35,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (36,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (37,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (38,'5.','','','',0,'dd','1aabac6d068eef6a7bad3fdf50a05cc8','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (39,'5.','','','',0,'dd','1aabac6d068eef6a7bad3fdf50a05cc8','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (40,'','','','',0,'ff','633de4b0c14ca52ea2432a3c8a5c4c31','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (41,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (42,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (43,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (44,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (45,'fdf','tgdf','gfgf','+917676715797',5,'asas','baa7a52965b99778f38ef37f235e9053','g','g','g','g','g','g',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,5,'2014-04-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a5599636333b9c38314ed7de08d3eaba',NULL,NULL,NULL),
  (46,'Pradeep',NULL,NULL,'9945252686',2147483647,'gpradeep24@gmail.com','baa7a52965b99778f38ef37f235e9053',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',2,',NULL,NULL),
  (47,'test users','sdf','sd','+918867867683',1234567890,'bsbs','baa7a52965b99778f38ef37f235e9053','r','r',NULL,'r','r','r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-04-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (50,'sa','s','s','12345678',123456,'dvgz@gdgs.com','7694f4a66316e53c8cdd9d9954bd611d','d','df','f','fd','vf','fd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-05-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (51,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (52,'fsbj','fsbj','fsbj','123',1234,'fsbj','e489897075e5216e22cce6ab07d69c00','fsbj','fsbj','fsbj','fsbj','fsbj','fsbj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (53,'fsbj','fsbj','fsbj','123',1234,'fsbj','e489897075e5216e22cce6ab07d69c00','fsbj','fsbj','fsbj','fsbj','fsbj','fsbj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (54,'fsbj','fsbj','fsbj','123',1234,'fsbj','e489897075e5216e22cce6ab07d69c00','fsbj','fsbj','fsbj','fsbj','fsbj','fsbj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (55,'fsbj','fsbj','fsbj','123',1234,'fsbj','e489897075e5216e22cce6ab07d69c00','fsbj','fsbj','fsbj','fsbj','fsbj','fsbj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (56,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL),
  (57,'','','','',0,'','d41d8cd98f00b204e9800998ecf8427e','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'2014-05-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0c74157e69618260d22f4f3d45ac6d32',NULL,NULL,NULL);
COMMIT;

#
# Data for the `user_notifications` table  (LIMIT -497,500)
#

INSERT INTO `user_notifications` (`NOTIF_ID`, `USER_ID`, `SENDER_NAME`, `TAG_ID`, `SENDER_MOB_NO`, `COMMENTS`, `CREATED_BY`) VALUES

  (1,45,'testname2',33,'9945454545','no comments',2),
  (2,45,'testname2',32,'1234567890','many comments',2);
COMMIT;

#
# Data for the `user_rewards` table  (LIMIT -498,500)
#

INSERT INTO `user_rewards` (`REWARD_ID`, `USER_ID`, `REWARD_POINTS`) VALUES

  (1,45,100);
COMMIT;

#
# Data for the `vantagePoints` table  (LIMIT -466,500)
#

INSERT INTO `vantagePoints` (`VP_ID`, `VP_NAME`, `VP_DESCRIPTION`, `VP_STREET`, `VP_AREA`, `VP_AREACODE`, `VP_CITY`, `VP_STATE`, `VP_COUNTRY`, `VP_LATITUDE`, `VP_LONGITUDE`, `VP_MEASUREDHOW`, `VP_ACCURACYCHECKED`) VALUES

  (NULL,'LeftCorner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.935196,77.6245,NULL,NULL),
  (NULL,'RightCorner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.935201,77.624506,NULL,NULL),
  (NULL,'Center',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.935279,77.624393,NULL,NULL),
  (NULL,'van1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891368,77.64163,NULL,NULL),
  (NULL,'van2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891835,77.64141,NULL,NULL),
  (NULL,'van3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891228,77.641392,NULL,NULL),
  (NULL,'van4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.89108,77.64114,NULL,NULL),
  (NULL,'van5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891332,77.640956,NULL,NULL),
  (NULL,'vanA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891458,77.64162,NULL,NULL),
  (NULL,'vanB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891603,77.641548,NULL,NULL),
  (NULL,'vanC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891804,77.641455,NULL,NULL),
  (NULL,'vanD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891288,77.64152,NULL,NULL),
  (NULL,'vanE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891171,77.641299,NULL,NULL),
  (NULL,'vanF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.891218,77.641033,NULL,NULL),
  (NULL,'Vantage1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.908657,77.683651,NULL,NULL),
  (NULL,'Vantage2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.908707,77.683756,NULL,NULL),
  (NULL,'Vantage3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.908895,77.683793,NULL,NULL),
  (NULL,'Vantage4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.909166,77.683862,NULL,NULL),
  (NULL,'Vantage5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.909415,77.683756,NULL,NULL),
  (NULL,'Vantage6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.905924,77.682106,NULL,NULL),
  (NULL,'vantage7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.906055,77.682114,NULL,NULL),
  (NULL,'Vantage8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.906049,77.682224,NULL,NULL),
  (NULL,'Vantage9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.906319,77.682234,NULL,NULL),
  (NULL,'Vantage10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.906308,77.682234,NULL,NULL),
  (NULL,'Vantage11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.906523,77.682132,NULL,NULL),
  (NULL,'Vantage12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.906502,77.682258,NULL,NULL),
  (NULL,'Vantage13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.907011,77.68217,NULL,NULL),
  (NULL,'Vantage14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.906975,77.682258,NULL,NULL),
  (NULL,'Vantage15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.90584,77.682465,NULL,NULL),
  (NULL,'Vantage16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.890303,77.639738,NULL,NULL),
  (NULL,'Vantage17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.890259,77.639629,NULL,NULL),
  (NULL,'Vantage18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.89033,77.639444,NULL,NULL),
  (NULL,'Vantage19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12.89014,77.639585,NULL,NULL);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;