-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.25 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- admin 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `admin`;

-- 테이블 admin.activity_areas 구조 내보내기
CREATE TABLE IF NOT EXISTS `activity_areas` (
  `activity_areas_id` int NOT NULL AUTO_INCREMENT COMMENT '활동 지역 번호',
  `member_id` int NOT NULL COMMENT '회원코드',
  `area` varchar(300) NOT NULL COMMENT '활동 지역 ',
  `certi_date` timestamp NOT NULL COMMENT '인증 날짜 ',
  PRIMARY KEY (`activity_areas_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `activity_areas_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.activity_areas:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `activity_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_areas` ENABLE KEYS */;

-- 테이블 admin.additional_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `additional_role` (
  `addtional_role_id` int NOT NULL AUTO_INCREMENT COMMENT '추가 권한 번호',
  `additional_role_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`addtional_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.additional_role:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `additional_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `additional_role` ENABLE KEYS */;

-- 테이블 admin.area_dong 구조 내보내기
CREATE TABLE IF NOT EXISTS `area_dong` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '읍면동 번호\r\n',
  `zip_code` varchar(50) DEFAULT NULL COMMENT '우편번호\r\n',
  `area_name` varchar(50) DEFAULT NULL COMMENT '행정동',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.area_dong:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `area_dong` DISABLE KEYS */;
INSERT INTO `area_dong` (`id`, `zip_code`, `area_name`) VALUES
	(1, NULL, '반포면');
/*!40000 ALTER TABLE `area_dong` ENABLE KEYS */;

-- 테이블 admin.area_sigun 구조 내보내기
CREATE TABLE IF NOT EXISTS `area_sigun` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '상위 지역 번호\r\n',
  `zip_code` varchar(4) DEFAULT NULL COMMENT '우편번호 ',
  `area_nm` int DEFAULT NULL COMMENT '지역이름',
  `area_type` int DEFAULT NULL COMMENT '1: 광역시,도 / 2:시,군,구',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.area_sigun:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `area_sigun` DISABLE KEYS */;
INSERT INTO `area_sigun` (`id`, `zip_code`, `area_nm`, `area_type`) VALUES
	(1, '1', 1, 11);
/*!40000 ALTER TABLE `area_sigun` ENABLE KEYS */;

-- 테이블 admin.direct_transaction 구조 내보내기
CREATE TABLE IF NOT EXISTS `direct_transaction` (
  `direct_transaction_id` int NOT NULL AUTO_INCREMENT COMMENT '산지 직거래 번호\r\n',
  `shop_idx` int NOT NULL,
  PRIMARY KEY (`direct_transaction_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `direct_transaction_ibfk_1` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.direct_transaction:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `direct_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `direct_transaction` ENABLE KEYS */;

-- 테이블 admin.exhi 구조 내보내기
CREATE TABLE IF NOT EXISTS `exhi` (
  `exhi_id` int NOT NULL AUTO_INCREMENT COMMENT '기획전 번호',
  `franchise_id` int NOT NULL COMMENT '프렌차이즈 번호 \r\n',
  `exhi_category_id` int NOT NULL COMMENT '전시 카테고리 번호\r\n',
  `exhi_section` int DEFAULT NULL COMMENT '가맹사 구분 \r\n1:가게 홍보\r\n2:중고 거래\r\n3:산지 직거래\r\n',
  `exhi_name` varchar(300) DEFAULT NULL COMMENT '기획전 이름 \r\n',
  `exhi_sub` varchar(300) DEFAULT NULL COMMENT '기획전 서브멘트',
  `exhi_explain` varchar(1000) DEFAULT NULL COMMENT '기획전 설명 ',
  `banner_image` varchar(300) DEFAULT NULL COMMENT '배너 이미지\r\n',
  `start_date` timestamp NULL DEFAULT NULL COMMENT '시작 날짜 ',
  `start_aclock` varchar(100) DEFAULT NULL COMMENT '시작시간\r\n',
  `end_date` timestamp NULL DEFAULT NULL COMMENT '종료 날짜',
  `end_aclock` varchar(100) DEFAULT NULL COMMENT '종료 시간',
  `pro_status` int DEFAULT NULL COMMENT '1:미진행\r\n2:진행중\r\n3:진행완료',
  `open_status` int DEFAULT NULL COMMENT '공개 여부 \r\n1:공개\r\n2:비공개\r\n',
  `url` varchar(300) DEFAULT NULL COMMENT 'url',
  `regi_status` int DEFAULT NULL COMMENT '등록여부\r\n1:등록 \r\n2:미등록 \r\n',
  `regi_order` int DEFAULT NULL COMMENT '등록 순서',
  `event_code` varchar(300) DEFAULT NULL COMMENT '이벤트 코드',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '등록 날짜\r\n',
  PRIMARY KEY (`exhi_id`),
  KEY `exhi_category_id` (`exhi_category_id`),
  KEY `franchise_id` (`franchise_id`),
  CONSTRAINT `exhi_ibfk_1` FOREIGN KEY (`exhi_category_id`) REFERENCES `exhi_category` (`exhi_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exhi_ibfk_2` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.exhi:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `exhi` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhi` ENABLE KEYS */;

-- 테이블 admin.exhi_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `exhi_category` (
  `exhi_category_id` int NOT NULL AUTO_INCREMENT COMMENT '전시 카테고리 번호\r\n',
  `content` varchar(300) DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`exhi_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.exhi_category:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `exhi_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhi_category` ENABLE KEYS */;

-- 테이블 admin.exhi_sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `exhi_sub` (
  `exhi_sub_id` int NOT NULL AUTO_INCREMENT COMMENT '전시품 번호',
  `exhi_id` int NOT NULL COMMENT '기획전 번호',
  `shop_idx` int NOT NULL,
  `direct_transaction_id` int NOT NULL COMMENT '산지 직거래 번호\r\n',
  PRIMARY KEY (`exhi_sub_id`),
  KEY `direct_transaction_id` (`direct_transaction_id`),
  KEY `exhi_id` (`exhi_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `exhi_sub_ibfk_1` FOREIGN KEY (`direct_transaction_id`) REFERENCES `direct_transaction` (`direct_transaction_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exhi_sub_ibfk_2` FOREIGN KEY (`exhi_id`) REFERENCES `exhi` (`exhi_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exhi_sub_ibfk_3` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.exhi_sub:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `exhi_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhi_sub` ENABLE KEYS */;

-- 테이블 admin.franchise 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchise` (
  `franchise_id` int NOT NULL AUTO_INCREMENT COMMENT '프렌차이즈 번호 \r\n',
  `id` int NOT NULL COMMENT '상위 지역 번호\r\n',
  `franchise_code` varchar(300) NOT NULL COMMENT '가맹점 코드\r\n',
  `franchise_name` varchar(300) NOT NULL COMMENT '가맹사 이름',
  `service_name` varchar(300) NOT NULL COMMENT '서비스명 ',
  `service_status` varchar(300) DEFAULT NULL COMMENT '서비스 상태',
  `logo_file` varchar(300) DEFAULT NULL COMMENT '로고 파일 ',
  `point_color` varchar(200) DEFAULT NULL COMMENT '포인트 컬러',
  `representative_name` varchar(100) DEFAULT NULL COMMENT '대표자 이름 \r\n',
  `business_number` varchar(300) DEFAULT NULL COMMENT '사업자 번호 ',
  `address` varchar(300) DEFAULT NULL COMMENT '주소 ',
  `phone_number` varchar(300) DEFAULT NULL COMMENT '전화번호 ',
  `fax` varchar(300) DEFAULT NULL COMMENT '팩스 ',
  `memo` text COMMENT '관리자 메모 ',
  `main_domain` varchar(300) DEFAULT NULL COMMENT '메인 도메인 \r\n',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '등록 일자 ',
  `customer_service` varchar(300) DEFAULT NULL COMMENT '고객센터\r\n',
  `shop_service` int DEFAULT NULL COMMENT '가게 소식 서비스 \r\n1: 이용 2: 불이용',
  `shop_approval` int DEFAULT NULL COMMENT '가게 소식 서비스\r\n1: 사전 모니터링 2 : 사후 모니터링\r\n',
  `daliy_service` int DEFAULT NULL COMMENT '1:이용 2:불이용 ',
  `daliy_aproval` int DEFAULT NULL COMMENT '일상 서비스 \r\n1: 사전 모니터링 2: 사후 모니터링 ',
  `used_service` int DEFAULT NULL COMMENT '중고거래 서비스\r\n1:이용 2: 불이용',
  `used_approval` int DEFAULT NULL COMMENT '중고거래 서비스 \r\n1: 사전 모니터링 2: 사후 모니터링',
  `direct_trade_Service` int DEFAULT NULL COMMENT '산지 직거래 서비스\r\n1:이용 2: 불이용',
  `direct_trade_approval` int DEFAULT NULL COMMENT '산지 직거래 서비스\r\n1: 사전 모니터링 2 : 사후 모니터링 ',
  PRIMARY KEY (`franchise_id`),
  UNIQUE KEY `franchise_code` (`franchise_code`),
  KEY `id` (`id`),
  CONSTRAINT `franchise_ibfk_1` FOREIGN KEY (`id`) REFERENCES `area_sigun` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.franchise:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `franchise` DISABLE KEYS */;
INSERT INTO `franchise` (`franchise_id`, `id`, `franchise_code`, `franchise_name`, `service_name`, `service_status`, `logo_file`, `point_color`, `representative_name`, `business_number`, `address`, `phone_number`, `fax`, `memo`, `main_domain`, `regdate`, `customer_service`, `shop_service`, `shop_approval`, `daliy_service`, `daliy_aproval`, `used_service`, `used_approval`, `direct_trade_Service`, `direct_trade_approval`) VALUES
	(1, 1, 'asdasd1', 'name', 'name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `franchise` ENABLE KEYS */;

-- 테이블 admin.franchise_domain 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchise_domain` (
  `franchise_domain_id` int NOT NULL AUTO_INCREMENT COMMENT '프렌차이즈 도메인 번호',
  `franchise_id` int NOT NULL COMMENT '프렌차이즈 번호 \r\n',
  `additional_domain` varchar(300) DEFAULT NULL COMMENT '추가 도메인 \r\n',
  PRIMARY KEY (`franchise_domain_id`),
  KEY `franchise_id` (`franchise_id`),
  CONSTRAINT `franchise_domain_ibfk_1` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.franchise_domain:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `franchise_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchise_domain` ENABLE KEYS */;

-- 테이블 admin.franchise_manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchise_manager` (
  `franchise_manager_id` int NOT NULL AUTO_INCREMENT COMMENT '가맹점매니저번호',
  `role_group_id` int DEFAULT NULL COMMENT '역할그룹 번호 ',
  `franchise_manager_code` varchar(300) DEFAULT NULL COMMENT '프랜차이즈 관리자 코드',
  `level` int DEFAULT NULL COMMENT '1 : 관리자\r\n2 : 운영자\r\n',
  `status` int NOT NULL COMMENT '1 : 정상\r\n2 : 정지',
  `id` varchar(100) NOT NULL COMMENT '아이디 \r\n',
  `pw` varchar(300) NOT NULL COMMENT '비밀번호 \r\n',
  `name` varchar(100) DEFAULT NULL COMMENT '이름 \r\n',
  `email` varchar(200) DEFAULT NULL COMMENT '이메일\r\n',
  `phone` varchar(300) DEFAULT NULL COMMENT '핸드폰 번호',
  `excel` int DEFAULT NULL COMMENT '1 : 엑셀 다운 가능 \r\n2 : 다운 불가능',
  `recent_ip` varchar(300) DEFAULT NULL COMMENT '최근 접속 ip',
  `access_date` date DEFAULT NULL COMMENT '최근접속일',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '생성일',
  PRIMARY KEY (`franchise_manager_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `franchise_manager_code` (`franchise_manager_code`),
  KEY `role_group_id` (`role_group_id`),
  CONSTRAINT `franchise_manager_ibfk_1` FOREIGN KEY (`role_group_id`) REFERENCES `role_groups` (`role_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.franchise_manager:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `franchise_manager` DISABLE KEYS */;
INSERT INTO `franchise_manager` (`franchise_manager_id`, `role_group_id`, `franchise_manager_code`, `level`, `status`, `id`, `pw`, `name`, `email`, `phone`, `excel`, `recent_ip`, `access_date`, `regdate`) VALUES
	(1, 1, 'd2df4hfa!@', 1, 1, 'admin', '1739!@', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `franchise_manager` ENABLE KEYS */;

-- 테이블 admin.franchise_respon 구조 내보내기
CREATE TABLE IF NOT EXISTS `franchise_respon` (
  `franchise_respon_id` int NOT NULL AUTO_INCREMENT COMMENT '담당자 번호\r\n',
  `franchise_id` int NOT NULL COMMENT '프렌차이즈 번호 \r\n',
  `respon_name` varchar(300) DEFAULT NULL COMMENT '이름',
  `respon_phone` varchar(300) DEFAULT NULL COMMENT '연락처',
  `respon_address` varchar(300) DEFAULT NULL COMMENT '주소',
  `respon_email` varchar(300) DEFAULT NULL COMMENT '이메일',
  `respon_depa` varchar(300) DEFAULT NULL COMMENT '부서',
  `respon_position` varchar(300) DEFAULT NULL COMMENT '직책',
  PRIMARY KEY (`franchise_respon_id`),
  KEY `franchise_id` (`franchise_id`),
  CONSTRAINT `franchise_respon_ibfk_1` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.franchise_respon:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `franchise_respon` DISABLE KEYS */;
/*!40000 ALTER TABLE `franchise_respon` ENABLE KEYS */;

-- 테이블 admin.frequent_question 구조 내보내기
CREATE TABLE IF NOT EXISTS `frequent_question` (
  `frequent_question_id` int NOT NULL AUTO_INCREMENT COMMENT '자주묻는 질문 번호',
  `frequent_question_category_id` int NOT NULL COMMENT '자주묻는 질문 카테고리 번호',
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `title` varchar(500) NOT NULL COMMENT '질문 제목',
  `content` text NOT NULL COMMENT '질문 내용',
  PRIMARY KEY (`frequent_question_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  KEY `frequent_question_category_id` (`frequent_question_category_id`),
  CONSTRAINT `frequent_question_ibfk_1` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `frequent_question_ibfk_2` FOREIGN KEY (`frequent_question_category_id`) REFERENCES `frequent_question_category` (`frequent_question_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.frequent_question:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `frequent_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `frequent_question` ENABLE KEYS */;

-- 테이블 admin.frequent_question_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `frequent_question_category` (
  `frequent_question_category_id` int NOT NULL AUTO_INCREMENT COMMENT '자주묻는 질문 카테고리 번호',
  `content` varchar(200) NOT NULL COMMENT '자주묻는 질문 카테고리 내용 ',
  PRIMARY KEY (`frequent_question_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.frequent_question_category:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `frequent_question_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `frequent_question_category` ENABLE KEYS */;

-- 테이블 admin.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `goods_id` int NOT NULL AUTO_INCREMENT COMMENT '상품번호 ',
  `shop_idx` int NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '상품이름 ',
  `price` int DEFAULT NULL COMMENT '정가',
  `min_price` int DEFAULT NULL COMMENT '최소금액',
  `additional_info` text COMMENT '추가 설명(선택)',
  PRIMARY KEY (`goods_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.goods:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 admin.manager_access 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager_access` (
  `manager_access_id` int NOT NULL AUTO_INCREMENT COMMENT '접속 내역 번호',
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `ip` varchar(300) DEFAULT NULL COMMENT '접속 아이피\r\n',
  `result` int DEFAULT NULL COMMENT '처리 결과',
  `detail_content` varchar(300) DEFAULT NULL COMMENT '상세 내용',
  `access_date` timestamp NULL DEFAULT NULL COMMENT '접속 날짜',
  PRIMARY KEY (`manager_access_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  CONSTRAINT `manager_access_ibfk_1` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.manager_access:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_access` ENABLE KEYS */;

-- 테이블 admin.manager_and_additional_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager_and_additional_role` (
  `manager_and_additional_role_id` int NOT NULL AUTO_INCREMENT COMMENT '매니저의 추가 권한 번호 \r\n',
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `addtional_role_id` int NOT NULL COMMENT '추가 권한 번호',
  PRIMARY KEY (`manager_and_additional_role_id`),
  KEY `addtional_role_id` (`addtional_role_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  CONSTRAINT `manager_and_additional_role_ibfk_1` FOREIGN KEY (`addtional_role_id`) REFERENCES `additional_role` (`addtional_role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manager_and_additional_role_ibfk_2` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.manager_and_additional_role:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager_and_additional_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_and_additional_role` ENABLE KEYS */;

-- 테이블 admin.manager_and_franchise 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager_and_franchise` (
  `manager_and_franchise_id` int NOT NULL AUTO_INCREMENT COMMENT '접근 가능 가맹사 번호',
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `franchise_id` int NOT NULL COMMENT '프렌차이즈 번호 \r\n',
  PRIMARY KEY (`manager_and_franchise_id`),
  KEY `franchise_id` (`franchise_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  CONSTRAINT `manager_and_franchise_ibfk_1` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manager_and_franchise_ibfk_2` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.manager_and_franchise:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager_and_franchise` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_and_franchise` ENABLE KEYS */;

-- 테이블 admin.manager_and_pro 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager_and_pro` (
  `manager_and_pro_id` int NOT NULL AUTO_INCREMENT COMMENT '매니저 처리 내용 번호 \r\n',
  `pro_sub_category_id` int NOT NULL,
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '접속 일자',
  `ip` varchar(300) DEFAULT NULL COMMENT '접속 아이피 \r\n',
  `url` varchar(300) DEFAULT NULL COMMENT '페이지 url ',
  `reason` varchar(300) DEFAULT NULL COMMENT '사유',
  PRIMARY KEY (`manager_and_pro_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  KEY `pro_sub_category_id` (`pro_sub_category_id`),
  CONSTRAINT `manager_and_pro_ibfk_1` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manager_and_pro_ibfk_2` FOREIGN KEY (`pro_sub_category_id`) REFERENCES `pro_sub_category` (`pro_sub_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.manager_and_pro:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager_and_pro` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_and_pro` ENABLE KEYS */;

-- 테이블 admin.manager_notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager_notice` (
  `manager_notice_id` int NOT NULL AUTO_INCREMENT COMMENT '관리자 공지 번호',
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `notice_title` varchar(300) DEFAULT NULL COMMENT '제목',
  `notice_content` varchar(1000) DEFAULT NULL COMMENT '내용',
  `ori_attach_file` varchar(300) DEFAULT NULL COMMENT '기존 파일 이름',
  `attach_file` varchar(300) DEFAULT NULL COMMENT '첨부파일',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '등록일 ',
  PRIMARY KEY (`manager_notice_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  CONSTRAINT `manager_notice_ibfk_1` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.manager_notice:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_notice` ENABLE KEYS */;

-- 테이블 admin.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int NOT NULL AUTO_INCREMENT COMMENT '회원코드',
  `franchise_id` int NOT NULL COMMENT '프렌차이즈 번호 \r\n',
  `id` int NOT NULL COMMENT '읍면동 번호\r\n',
  `member_code` varchar(300) DEFAULT NULL COMMENT '회원 코드',
  `phone` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '회원닉네임',
  `latitude` varchar(300) DEFAULT NULL COMMENT '위도',
  `longitude` varchar(300) DEFAULT NULL COMMENT '경도\r\n',
  `adress` varchar(200) NOT NULL COMMENT '회원 동네',
  `profile_image` varchar(100) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '일반 회원 : 1\r\n판매장 회원 : 2\r\n',
  `withdrawal` int DEFAULT NULL COMMENT '정상 : 1\r\n탈퇴 : 2\r\n',
  `memo` varchar(300) DEFAULT NULL COMMENT '관리자 메모',
  `regdate` timestamp NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_code` (`member_code`),
  KEY `id` (`id`),
  KEY `franchise_id` (`franchise_id`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`id`) REFERENCES `area_dong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `member_ibfk_2` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_id`, `franchise_id`, `id`, `member_code`, `phone`, `name`, `latitude`, `longitude`, `adress`, `profile_image`, `status`, `withdrawal`, `memo`, `regdate`) VALUES
	(1, 1, 1, NULL, '111222', 'member', NULL, NULL, '이수역', NULL, 1, 1, '1', '2021-07-19 00:10:10');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 admin.member_and_shop 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_and_shop` (
  `member_and_shop_id` int NOT NULL AUTO_INCREMENT COMMENT '단골가게 번호',
  `member_id` int NOT NULL COMMENT '회원코드',
  `shop_idx` int NOT NULL,
  PRIMARY KEY (`member_and_shop_id`),
  KEY `member_id` (`member_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `member_and_shop_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `member_and_shop_ibfk_2` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.member_and_shop:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_and_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_and_shop` ENABLE KEYS */;

-- 테이블 admin.member_penalty 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_penalty` (
  `member_penalty_id` int NOT NULL AUTO_INCREMENT COMMENT '회원 패널티 번호',
  `member_id` int NOT NULL COMMENT '회원코드',
  `penalty_name` int DEFAULT NULL COMMENT '패널티 이름\r\n1:경고/ 2:정지/ 3:차단',
  `penalty_sort` int DEFAULT NULL COMMENT '패널티 구분 1:  계정 / 2: 상품 / 3: 채팅 / 4: 게시글',
  `discovery_path` varchar(300) DEFAULT NULL COMMENT '발견 경로 ',
  `reason` varchar(300) DEFAULT NULL COMMENT '패널티 사유',
  `cancel_reason` varchar(300) DEFAULT NULL COMMENT '패널티 해지 사유',
  `register` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '패널티 처리자 ',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '패널티 등록 날짜',
  `state` int DEFAULT NULL COMMENT '1 : 적용\r\n2 : 해지',
  `penalty_date` int DEFAULT NULL COMMENT '패널티 잔여일\r\n',
  PRIMARY KEY (`member_penalty_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `member_penalty_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.member_penalty:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_penalty` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_penalty` ENABLE KEYS */;

-- 테이블 admin.member_sta 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_sta` (
  `member_sta_id` int NOT NULL AUTO_INCREMENT COMMENT '회원 통계 번호 \r\n',
  `member_id` int NOT NULL COMMENT '회원코드',
  `login` int DEFAULT NULL COMMENT '로그인 횟수 ',
  `bookmark` int DEFAULT NULL COMMENT '단골 목록',
  `sale` int DEFAULT NULL COMMENT '판매 횟수 ',
  `board` int DEFAULT NULL COMMENT '신고 글 업로드 횟수',
  `report` int DEFAULT NULL COMMENT '신고 받은 횟수 ',
  `penalty` int DEFAULT NULL COMMENT '패널티 횟수',
  `date` timestamp NULL DEFAULT NULL COMMENT '날짜',
  PRIMARY KEY (`member_sta_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `member_sta_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.member_sta:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_sta` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_sta` ENABLE KEYS */;

-- 테이블 admin.member_update_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_update_list` (
  `member_update_list_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '회원코드',
  `manager_num` int DEFAULT NULL COMMENT '관리자 수정 번호(관리자가 수정했으면 null 아님!)',
  `update_before` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '수정 전 \r\n',
  `update_after` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '수정 후',
  `update_column` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '수정 컬럼 ',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '수정 일자 ',
  PRIMARY KEY (`member_update_list_id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  CONSTRAINT `member_update_list_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_esperanto_ci;

-- 테이블 데이터 admin.member_update_list:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_update_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_update_list` ENABLE KEYS */;

-- 테이블 admin.news_comments_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `news_comments_reply` (
  `news_comments_reply_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 소식 답글 번호 \r\n',
  `shop_news_comments_id` int NOT NULL COMMENT '가게 소식 댓글 번호 ',
  PRIMARY KEY (`news_comments_reply_id`),
  KEY `shop_news_comments_id` (`shop_news_comments_id`),
  CONSTRAINT `news_comments_reply_ibfk_1` FOREIGN KEY (`shop_news_comments_id`) REFERENCES `shop_news_comments` (`shop_news_comments_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.news_comments_reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `news_comments_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_comments_reply` ENABLE KEYS */;

-- 테이블 admin.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `title` varchar(200) NOT NULL COMMENT '공지사항 내용 ',
  `content` text NOT NULL COMMENT '공지사항 내용 ',
  `regdate` timestamp NOT NULL COMMENT '공지사항 등록 날짜',
  PRIMARY KEY (`notice_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.notice:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 admin.notice_and_franchise 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice_and_franchise` (
  `notice_and_franchise_id` int NOT NULL AUTO_INCREMENT COMMENT '관리자 공지 해당 가맹사 번호 ',
  `manager_notice_id` int NOT NULL COMMENT '관리자 공지 번호',
  `franchise_id` int NOT NULL COMMENT '프렌차이즈 번호 \r\n',
  PRIMARY KEY (`notice_and_franchise_id`),
  KEY `franchise_id` (`franchise_id`),
  KEY `manager_notice_id` (`manager_notice_id`),
  CONSTRAINT `notice_and_franchise_ibfk_1` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `notice_and_franchise_ibfk_2` FOREIGN KEY (`manager_notice_id`) REFERENCES `manager_notice` (`manager_notice_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.notice_and_franchise:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice_and_franchise` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_and_franchise` ENABLE KEYS */;

-- 테이블 admin.notice_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice_image` (
  `notice_image_id` int NOT NULL AUTO_INCREMENT COMMENT '공지사항 이미지 번호',
  `notice_id` int NOT NULL,
  `name` varchar(300) NOT NULL COMMENT '공지사항 이미지 파일 이름',
  `type` varchar(50) NOT NULL COMMENT '공지사항 이미지 파일 타입 ',
  PRIMARY KEY (`notice_image_id`),
  KEY `notice_id` (`notice_id`),
  CONSTRAINT `notice_image_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`notice_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.notice_image:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_image` ENABLE KEYS */;

-- 테이블 admin.pro_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `pro_category` (
  `pro_category_id` int NOT NULL AUTO_INCREMENT COMMENT '처리 수행 번호',
  `content` varchar(300) DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`pro_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.pro_category:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pro_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_category` ENABLE KEYS */;

-- 테이블 admin.pro_sub_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `pro_sub_category` (
  `pro_sub_category_id` int NOT NULL AUTO_INCREMENT,
  `pro_category_id` int NOT NULL COMMENT '처리 수행 번호',
  `content` varchar(300) DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`pro_sub_category_id`),
  KEY `pro_category_id` (`pro_category_id`),
  CONSTRAINT `pro_sub_category_ibfk_1` FOREIGN KEY (`pro_category_id`) REFERENCES `pro_category` (`pro_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.pro_sub_category:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pro_sub_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_sub_category` ENABLE KEYS */;

-- 테이블 admin.question 구조 내보내기
CREATE TABLE IF NOT EXISTS `question` (
  `questtion_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '회원코드',
  `question_category_id` int NOT NULL COMMENT '문의 카테고리 번호 ',
  `question_content` varchar(1000) DEFAULT NULL COMMENT '문의 내용',
  `answer_status` int DEFAULT NULL COMMENT '답변 등록여부\r\n등록  : 1\r\n미등록 : 2',
  `regdate` timestamp NOT NULL,
  PRIMARY KEY (`questtion_id`),
  KEY `member_id` (`member_id`),
  KEY `question_category_id` (`question_category_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`question_category_id`) REFERENCES `question_category` (`question_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.question:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

-- 테이블 admin.question_answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `question_answer` (
  `question_answer_id` int NOT NULL AUTO_INCREMENT COMMENT '문의 답변 번호 \r\n',
  `question_id` int NOT NULL,
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `content` text NOT NULL COMMENT '문의 답변 제목',
  `temp_content` text COMMENT '문의 답변 임시\r\n',
  `send_message` int DEFAULT NULL COMMENT '알림 톡 발송 여부 \r\n1: 발송 2: 미발송 ',
  `regdate` timestamp NOT NULL COMMENT '답변등록시간 ',
  PRIMARY KEY (`question_answer_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `question_answer_ibfk_1` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `question_answer_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`questtion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.question_answer:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_answer` ENABLE KEYS */;

-- 테이블 admin.question_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `question_category` (
  `question_category_id` int NOT NULL AUTO_INCREMENT COMMENT '문의 카테고리 번호 ',
  `content` varchar(200) NOT NULL COMMENT '카테고리 내용',
  PRIMARY KEY (`question_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.question_category:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_category` ENABLE KEYS */;

-- 테이블 admin.question_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `question_image` (
  `question_image_id` int NOT NULL AUTO_INCREMENT COMMENT '문의 이미지 번호',
  `questtion_id` int NOT NULL,
  `name` varchar(300) NOT NULL COMMENT '파일 이름',
  `type` varchar(50) DEFAULT NULL COMMENT '파일 타입 ',
  PRIMARY KEY (`question_image_id`),
  KEY `questtion_id` (`questtion_id`),
  CONSTRAINT `question_image_ibfk_1` FOREIGN KEY (`questtion_id`) REFERENCES `question` (`questtion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.question_image:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_image` ENABLE KEYS */;

-- 테이블 admin.reply_review 구조 내보내기
CREATE TABLE IF NOT EXISTS `reply_review` (
  `reply_review_id` int NOT NULL AUTO_INCREMENT COMMENT '리뷰 답글 번호',
  `shop_review_id` int NOT NULL COMMENT '가게 리뷰 번호 ',
  `content` varchar(300) DEFAULT NULL COMMENT '답글 내용',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '등록 날짜',
  PRIMARY KEY (`reply_review_id`),
  KEY `shop_review_id` (`shop_review_id`),
  CONSTRAINT `reply_review_ibfk_1` FOREIGN KEY (`shop_review_id`) REFERENCES `shop_review` (`shop_review_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.reply_review:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reply_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply_review` ENABLE KEYS */;

-- 테이블 admin.report 구조 내보내기
CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 신고 번호',
  `franchise_id` int NOT NULL COMMENT '프렌차이즈 번호 \r\n',
  `member_id` int DEFAULT NULL COMMENT '회원코드',
  `member_or_shop` int DEFAULT NULL COMMENT '1: 회원신고 / 2: 가게신고',
  `member_or_shop_num` int DEFAULT NULL COMMENT '번호',
  `member_or_shop_name` varchar(300) DEFAULT NULL COMMENT '가게 or 회원 이름 \r\n',
  `report_category_id` int DEFAULT NULL,
  `report_categoris_id` int NOT NULL COMMENT '신고 범주 번호',
  `report_to` varchar(300) DEFAULT NULL COMMENT '신고 대상 \r\n',
  `report_to_num` int DEFAULT NULL COMMENT '신고대상 번호',
  `content` varchar(1000) DEFAULT NULL COMMENT '신고 내용',
  `answer_status` int DEFAULT NULL COMMENT '답변 등록여부\r\n1:확인 중 2: 처리 완료 ',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`report_id`),
  KEY `franchise_id` (`franchise_id`),
  KEY `member_id` (`member_id`),
  KEY `report_categoris_id` (`report_categoris_id`),
  KEY `report_category_id` (`report_category_id`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `report_ibfk_3` FOREIGN KEY (`report_categoris_id`) REFERENCES `report_categoris` (`report_categoris_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `report_ibfk_4` FOREIGN KEY (`report_category_id`) REFERENCES `report_category` (`report_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.report:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

-- 테이블 admin.report_categoris 구조 내보내기
CREATE TABLE IF NOT EXISTS `report_categoris` (
  `report_categoris_id` int NOT NULL AUTO_INCREMENT COMMENT '신고 범주 번호',
  `content` int DEFAULT NULL COMMENT '신고 항목\r\n1 : 계정 / 2 : 게시글 / 3 : 상품 \r\n',
  `sub_content` varchar(300) DEFAULT NULL COMMENT '신고 종류',
  PRIMARY KEY (`report_categoris_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.report_categoris:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `report_categoris` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_categoris` ENABLE KEYS */;

-- 테이블 admin.report_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `report_category` (
  `report_category_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(300) DEFAULT NULL COMMENT '카테고리 내용',
  PRIMARY KEY (`report_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.report_category:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `report_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_category` ENABLE KEYS */;

-- 테이블 admin.report_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `report_image` (
  `report_image_id` int NOT NULL AUTO_INCREMENT COMMENT '신고 이미지 번호',
  `report_id` int NOT NULL COMMENT '신고 번호\r\n',
  `image_name` varchar(300) DEFAULT NULL COMMENT '이미지 이름 ',
  PRIMARY KEY (`report_image_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `report_image_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.report_image:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `report_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_image` ENABLE KEYS */;

-- 테이블 admin.report_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `report_reply` (
  `shop_report_reply_id` int NOT NULL AUTO_INCREMENT COMMENT '신고 답변 번호',
  `report_id` int NOT NULL COMMENT '신고 번호\r\n',
  `franchise_manager_id` int NOT NULL COMMENT '가맹점매니저번호',
  `reply_content` varchar(500) DEFAULT NULL COMMENT '답변 내용',
  `temp_content` varchar(500) DEFAULT NULL COMMENT '임시 저장 내용',
  `send_message` int DEFAULT NULL COMMENT '알림 톡 발송여부\r\n1: 발송\r\n2: 미발송\r\n',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '등록일\r\n',
  PRIMARY KEY (`shop_report_reply_id`),
  KEY `franchise_manager_id` (`franchise_manager_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `report_reply_ibfk_1` FOREIGN KEY (`franchise_manager_id`) REFERENCES `franchise_manager` (`franchise_manager_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `report_reply_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.report_reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `report_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_reply` ENABLE KEYS */;

-- 테이블 admin.review_keyword 구조 내보내기
CREATE TABLE IF NOT EXISTS `review_keyword` (
  `review_keyword_id` int NOT NULL,
  `shop_review_id` int NOT NULL COMMENT '가게 리뷰 번호 ',
  `review_keyword_category_id` int NOT NULL COMMENT '리뷰 키워드 카테고리 번호',
  PRIMARY KEY (`review_keyword_id`),
  UNIQUE KEY `review_keyword_id` (`review_keyword_id`),
  KEY `review_keyword_category_id` (`review_keyword_category_id`),
  KEY `shop_review_id` (`shop_review_id`),
  CONSTRAINT `review_keyword_ibfk_1` FOREIGN KEY (`review_keyword_category_id`) REFERENCES `review_keyword_category` (`review_keyword_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `review_keyword_ibfk_2` FOREIGN KEY (`shop_review_id`) REFERENCES `shop_review` (`shop_review_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.review_keyword:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_keyword` ENABLE KEYS */;

-- 테이블 admin.review_keyword_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `review_keyword_category` (
  `review_keyword_category_id` int NOT NULL AUTO_INCREMENT COMMENT '리뷰 키워드 카테고리 번호',
  `content` varchar(200) NOT NULL COMMENT '리뷰 키워드 카테고리 내용',
  PRIMARY KEY (`review_keyword_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.review_keyword_category:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review_keyword_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_keyword_category` ENABLE KEYS */;

-- 테이블 admin.role_groups 구조 내보내기
CREATE TABLE IF NOT EXISTS `role_groups` (
  `role_group_id` int NOT NULL AUTO_INCREMENT COMMENT '역할그룹 번호 ',
  `role_group_name` varchar(300) DEFAULT NULL COMMENT '역할 그룹 이름',
  `role_group_info` text COMMENT '역할 그룹 설명',
  `regdate` timestamp NOT NULL COMMENT '등록일\r\n',
  `registrar` varchar(300) DEFAULT NULL COMMENT '등록자\r\n',
  PRIMARY KEY (`role_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.role_groups:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `role_groups` DISABLE KEYS */;
INSERT INTO `role_groups` (`role_group_id`, `role_group_name`, `role_group_info`, `regdate`, `registrar`) VALUES
	(1, 'role', 'info', '2021-07-18 13:50:12', 'admin');
/*!40000 ALTER TABLE `role_groups` ENABLE KEYS */;

-- 테이블 admin.role_group_and_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `role_group_and_detail` (
  `role_group_and_detail_id` int NOT NULL AUTO_INCREMENT COMMENT '권한 그룹과 디테일 테이블 번호 ',
  `role_group_id` int NOT NULL COMMENT '역할그룹 번호 ',
  `detail_role` int DEFAULT NULL COMMENT '세부 역할',
  `crud` int DEFAULT NULL COMMENT '1:create 2:read 3:update 4:delete',
  PRIMARY KEY (`role_group_and_detail_id`),
  KEY `role_group_id` (`role_group_id`),
  CONSTRAINT `role_group_and_detail_ibfk_1` FOREIGN KEY (`role_group_id`) REFERENCES `role_groups` (`role_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.role_group_and_detail:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `role_group_and_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_group_and_detail` ENABLE KEYS */;

-- 테이블 admin.shop 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop` (
  `shop_idx` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL COMMENT '회원코드',
  `franchise_id` int NOT NULL COMMENT '프렌차이즈 번호 \r\n',
  `id` int NOT NULL COMMENT '읍면동 번호\r\n',
  `shop_name` varchar(100) NOT NULL COMMENT '가게 이름',
  `member_name` varchar(50) NOT NULL COMMENT '회원이름 ',
  `date_of_birth` date DEFAULT NULL COMMENT '생년월일 ',
  `phone` varchar(100) DEFAULT NULL COMMENT '핸드폰 번호',
  `representative` varchar(300) NOT NULL COMMENT '대표자 이름\r\n',
  `buisness_num` varchar(50) NOT NULL COMMENT '사업자 번호',
  `buisness_name` varchar(100) NOT NULL COMMENT '사업자 상호 ',
  `buisness_address` varchar(200) NOT NULL,
  `buisess_image_name` varchar(200) NOT NULL COMMENT '사업자 등록증 ',
  `status` int NOT NULL COMMENT '가게 승인 상태\r\n1:승인완료\r\n2:심사중\r\n3:반려\r\n4:보류',
  `regdate` timestamp NOT NULL COMMENT '가게 신청일',
  `introduce_shop` text COMMENT '가게 소개',
  `start_date` varchar(50) DEFAULT NULL COMMENT '시작시간\r\n',
  `end_date` varchar(50) DEFAULT NULL COMMENT '끝시간 ',
  `buisess_hours_info` varchar(200) DEFAULT NULL COMMENT '영업시간정보',
  `homepage_url` varchar(200) DEFAULT NULL COMMENT '홈페이지 주소',
  `notice_info` text COMMENT '고객 알림',
  `latitude` varchar(300) DEFAULT NULL COMMENT '위도 \r\n',
  `longitude` varchar(300) DEFAULT NULL COMMENT '경도',
  `address` varchar(300) DEFAULT NULL COMMENT '주소\r\n',
  `shop_code` varchar(300) DEFAULT NULL COMMENT '가게 코드',
  `activity_status` int DEFAULT NULL COMMENT '1:활동중\r\n2:중지\r\n3:탈퇴 \r\n',
  `best_goods_id` int DEFAULT NULL COMMENT '대표상품메뉴',
  `sector` varchar(300) DEFAULT NULL COMMENT '업종 \r\n',
  `approve_date` date DEFAULT NULL COMMENT '승인일',
  `with_date` date DEFAULT NULL COMMENT '탈퇴일',
  `main_image` varchar(300) DEFAULT NULL COMMENT '메인 이미지\r\n',
  `register` varchar(300) DEFAULT NULL COMMENT '처리자명',
  `responsibility_memo` varchar(300) DEFAULT NULL COMMENT '관리자 메모',
  `return_reason` varchar(300) DEFAULT NULL COMMENT '반려 사유 ',
  `business_status` int DEFAULT NULL COMMENT '영업상태\r\n1 : 영업중\r\n2 : 휴업중',
  `to_benefit` varchar(300) DEFAULT NULL COMMENT '드리는 혜택',
  `holiday` varchar(300) DEFAULT NULL COMMENT '휴일 \r\n',
  PRIMARY KEY (`shop_idx`),
  UNIQUE KEY `shop_code` (`shop_code`),
  KEY `id` (`id`),
  KEY `franchise_id` (`franchise_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`id`) REFERENCES `area_dong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`franchise_id`) REFERENCES `franchise` (`franchise_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;

-- 테이블 admin.shop_coupon 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_coupon` (
  `shop_coupon` int NOT NULL AUTO_INCREMENT COMMENT '가게 쿠폰 \r\n',
  `shop_idx` int NOT NULL,
  PRIMARY KEY (`shop_coupon`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `shop_coupon_ibfk_1` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_coupon:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_coupon` ENABLE KEYS */;

-- 테이블 admin.shop_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_image` (
  `shop_image_idx` int NOT NULL AUTO_INCREMENT,
  `shop_idx` int NOT NULL,
  `image_name` varchar(200) NOT NULL COMMENT '파일 이미지 이름 ',
  `image_type` varchar(50) NOT NULL COMMENT '이미지 타입',
  `regdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`shop_image_idx`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `shop_image_ibfk_1` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_image:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_image` ENABLE KEYS */;

-- 테이블 admin.shop_keyword 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_keyword` (
  `shop_keyword_id` int NOT NULL AUTO_INCREMENT,
  `shop_idx` int NOT NULL,
  `keyword` varchar(50) NOT NULL COMMENT '키워드',
  PRIMARY KEY (`shop_keyword_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `shop_keyword_ibfk_1` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_keyword:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_keyword` ENABLE KEYS */;

-- 테이블 admin.shop_manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_manager` (
  `shop_manager_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 매니저 번호 ',
  `shop_idx` int NOT NULL,
  `member_id` int NOT NULL COMMENT '회원코드',
  PRIMARY KEY (`shop_manager_id`),
  KEY `member_id` (`member_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `shop_manager_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_manager_ibfk_2` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_manager:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_manager` ENABLE KEYS */;

-- 테이블 admin.shop_news 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_news` (
  `shop_news_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 소식 번호',
  `shop_idx` int NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '가게 소식 제목 ',
  `content` text NOT NULL COMMENT '가게 소식 내용 ',
  `regdate` timestamp NOT NULL,
  `view_count` int DEFAULT NULL COMMENT '조회수',
  PRIMARY KEY (`shop_news_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `shop_news_ibfk_1` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_news:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_news` ENABLE KEYS */;

-- 테이블 admin.shop_news_comments 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_news_comments` (
  `shop_news_comments_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 소식 댓글 번호 ',
  `member_id` int NOT NULL COMMENT '회원코드',
  `shop_news_id` int NOT NULL COMMENT '가게 소식 번호',
  `content` text NOT NULL COMMENT '댓글 내용 ',
  `regdate` timestamp NOT NULL COMMENT '등록 시간 ',
  PRIMARY KEY (`shop_news_comments_id`),
  KEY `member_id` (`member_id`),
  KEY `shop_news_id` (`shop_news_id`),
  CONSTRAINT `shop_news_comments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_news_comments_ibfk_2` FOREIGN KEY (`shop_news_id`) REFERENCES `shop_news` (`shop_news_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_news_comments:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_news_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_news_comments` ENABLE KEYS */;

-- 테이블 admin.shop_news_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_news_image` (
  `shop_news_image_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 소식 이미지 번호',
  `shop_news_id` int NOT NULL COMMENT '가게 소식 번호',
  `name` varchar(300) NOT NULL COMMENT '가게 소식 이미지 파일 이름 ',
  `type` varchar(50) NOT NULL COMMENT '가게 소식 이미지 파일 타입 ',
  `regdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`shop_news_image_id`),
  KEY `shop_news_id` (`shop_news_id`),
  CONSTRAINT `shop_news_image_ibfk_1` FOREIGN KEY (`shop_news_id`) REFERENCES `shop_news` (`shop_news_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_news_image:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_news_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_news_image` ENABLE KEYS */;

-- 테이블 admin.shop_news_like 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_news_like` (
  `shop_news_like_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 소식 좋아요 번호 ',
  `member_id` int NOT NULL COMMENT '회원코드',
  `shop_news_id` int NOT NULL COMMENT '가게 소식 번호',
  PRIMARY KEY (`shop_news_like_id`),
  KEY `member_id` (`member_id`),
  KEY `shop_news_id` (`shop_news_id`),
  CONSTRAINT `shop_news_like_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_news_like_ibfk_2` FOREIGN KEY (`shop_news_id`) REFERENCES `shop_news` (`shop_news_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_news_like:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_news_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_news_like` ENABLE KEYS */;

-- 테이블 admin.shop_panalty 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_panalty` (
  `shop_panalty_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 패널티 번호 ',
  `shop_idx` int NOT NULL,
  `panalty_date` int DEFAULT NULL COMMENT '패널티 기간',
  `panalty_name` int DEFAULT NULL COMMENT '패널티 상태\r\n1:경고\r\n2:정지\r\n3:차단',
  `discovery_path` varchar(300) DEFAULT NULL COMMENT '발견경로 \r\n',
  `reason` varchar(300) DEFAULT NULL COMMENT '패널티 사유 ',
  `register` varchar(100) DEFAULT NULL COMMENT '패널티 처리자',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '패널티 등록 날짜',
  PRIMARY KEY (`shop_panalty_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `shop_panalty_ibfk_1` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_panalty:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_panalty` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_panalty` ENABLE KEYS */;

-- 테이블 admin.shop_review 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_review` (
  `shop_review_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 리뷰 번호 ',
  `shop_idx` int NOT NULL,
  `member_id` int NOT NULL COMMENT '회원코드',
  `content` varchar(300) NOT NULL COMMENT '후기 내용',
  `regdate` timestamp NULL DEFAULT NULL COMMENT '후기 날짜',
  `review_like` int DEFAULT NULL COMMENT '도움이 돼요',
  PRIMARY KEY (`shop_review_id`),
  KEY `member_id` (`member_id`),
  KEY `shop_idx` (`shop_idx`),
  CONSTRAINT `shop_review_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_review_ibfk_2` FOREIGN KEY (`shop_idx`) REFERENCES `shop` (`shop_idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_review:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_review` ENABLE KEYS */;

-- 테이블 admin.shop_review_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_review_image` (
  `shop_review_image_id` int NOT NULL AUTO_INCREMENT COMMENT '가게 리뷰 이미지 번호',
  `shop_review_id` int NOT NULL COMMENT '가게 리뷰 번호 ',
  `name` varchar(300) NOT NULL COMMENT '가게 리뷰 이미지 파일 이름',
  `type` varchar(300) DEFAULT NULL COMMENT '이미지 타입',
  PRIMARY KEY (`shop_review_image_id`),
  KEY `shop_review_id` (`shop_review_id`),
  CONSTRAINT `shop_review_image_ibfk_1` FOREIGN KEY (`shop_review_id`) REFERENCES `shop_review` (`shop_review_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 admin.shop_review_image:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_review_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_review_image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
