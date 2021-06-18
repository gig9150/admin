SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS activity_areas;
DROP TABLE IF EXISTS manager_and_additional_role;
DROP TABLE IF EXISTS additional_role;
DROP TABLE IF EXISTS goods;
DROP TABLE IF EXISTS member_and_shop;
DROP TABLE IF EXISTS shop_coupon;
DROP TABLE IF EXISTS shop_image;
DROP TABLE IF EXISTS shop_keyword;
DROP TABLE IF EXISTS shop_manager;
DROP TABLE IF EXISTS shop_news_comments;
DROP TABLE IF EXISTS shop_news_image;
DROP TABLE IF EXISTS shop_news_like;
DROP TABLE IF EXISTS shop_news;
DROP TABLE IF EXISTS shop_panalty;
DROP TABLE IF EXISTS shop_report;
DROP TABLE IF EXISTS reply_review;
DROP TABLE IF EXISTS review_keyword;
DROP TABLE IF EXISTS shop_review_image;
DROP TABLE IF EXISTS shop_review;
DROP TABLE IF EXISTS shop;
DROP TABLE IF EXISTS area_sigungu;
DROP TABLE IF EXISTS area;
DROP TABLE IF EXISTS franchise_domain;
DROP TABLE IF EXISTS franchise_manager;
DROP TABLE IF EXISTS franchise;
DROP TABLE IF EXISTS frequent_question;
DROP TABLE IF EXISTS frequent_question_category;
DROP TABLE IF EXISTS manager_member;
DROP TABLE IF EXISTS member_penalty;
DROP TABLE IF EXISTS member_sta;
DROP TABLE IF EXISTS question_answer;
DROP TABLE IF EXISTS question_image;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS notice_image;
DROP TABLE IF EXISTS Notice;
DROP TABLE IF EXISTS question_category;
DROP TABLE IF EXISTS report_category;
DROP TABLE IF EXISTS review_keyword_category;
DROP TABLE IF EXISTS role_group_and_detail;
DROP TABLE IF EXISTS role_detail;
DROP TABLE IF EXISTS role_groups;




/* Create Tables */

CREATE TABLE activity_areas
(
	-- 활동 지역 번호
	activity_areas_id int(11) NOT NULL AUTO_INCREMENT COMMENT '활동 지역 번호',
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 활동 지역 
	area varchar(300) NOT NULL COMMENT '활동 지역 ',
	-- 인증 날짜 
	certi_date timestamp NOT NULL COMMENT '인증 날짜 ',
	PRIMARY KEY (activity_areas_id)
);


CREATE TABLE additional_role
(
	-- 추가 권한 번호
	addtional_role_id int(5) NOT NULL AUTO_INCREMENT COMMENT '추가 권한 번호',
	additional_role_name varchar(200),
	PRIMARY KEY (addtional_role_id)
);


CREATE TABLE area
(
	-- 지역 번호
	id int(11) NOT NULL AUTO_INCREMENT COMMENT '지역 번호',
	-- 지역 명
	area_name varchar(10) COMMENT '지역 명',
	-- 노출순서 
	view_num int(11) COMMENT '노출순서 ',
	PRIMARY KEY (id)
);


CREATE TABLE area_sigungu
(
	-- 고유번호
	id int(11) NOT NULL AUTO_INCREMENT COMMENT '고유번호',
	-- 지역 번호
	area_code int(11) NOT NULL COMMENT '지역 번호',
	-- 상세 지역명 
	sigungu_name varchar(10) COMMENT '상세 지역명 ',
	-- Y:등록 N:삭제
	state char(1) DEFAULT 'Y' COMMENT 'Y:등록 N:삭제',
	PRIMARY KEY (id)
);


CREATE TABLE franchise
(
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL AUTO_INCREMENT COMMENT '프렌차이즈 번호 
',
	-- 가맹점 코드
	-- 
	franchise_code varchar(300) NOT NULL COMMENT '가맹점 코드
',
	-- 가맹사 이름
	franchise_name varchar(300) NOT NULL COMMENT '가맹사 이름',
	-- 서비스명 
	service_name  varchar(300) NOT NULL COMMENT '서비스명 ',
	-- 서비스 상태
	service_status varchar(300) COMMENT '서비스 상태',
	-- 로고 파일 
	logo_file varchar(300) COMMENT '로고 파일 ',
	-- 포인트 컬러
	point_color varchar(200) COMMENT '포인트 컬러',
	-- 대표자 이름 
	-- 
	representative_name  varchar(100) COMMENT '대표자 이름 
',
	-- 사업자 번호 
	business_number varchar(300) COMMENT '사업자 번호 ',
	-- 주소 
	address varchar(300) COMMENT '주소 ',
	-- 전화번호 
	phone_number varchar(300) COMMENT '전화번호 ',
	-- 팩스 
	fax varchar(300) COMMENT '팩스 ',
	-- 담당자 이름 
	responsibility_name varchar(300) COMMENT '담당자 이름 ',
	-- 담당자 부서 
	responsibility_depa varchar(300) COMMENT '담당자 부서 ',
	-- 담당자 직책 
	-- 
	responsibility_position varchar(300) COMMENT '담당자 직책 
',
	-- 담당자 번호 
	responsibility_number varchar(100) COMMENT '담당자 번호 ',
	-- 담당자 핸드폰 번호 
	responsibility_phone varchar(100) COMMENT '담당자 핸드폰 번호 ',
	-- 담당자 이메일
	responsibility_email varchar(200) COMMENT '담당자 이메일',
	-- 관리자 메모 
	memo text COMMENT '관리자 메모 ',
	-- 메인 도메인 
	-- 
	main_domain varchar(300) COMMENT '메인 도메인 
',
	-- 등록 일자 
	regdate timestamp COMMENT '등록 일자 ',
	PRIMARY KEY (franchise_id),
	UNIQUE (franchise_code)
);


CREATE TABLE franchise_domain
(
	-- 프렌차이즈 도메인 번호
	franchise_domain_id int(11) NOT NULL AUTO_INCREMENT COMMENT '프렌차이즈 도메인 번호',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	-- 추가 도메인 
	-- 
	additional_domian varchar(300) COMMENT '추가 도메인 
',
	PRIMARY KEY (franchise_domain_id)
);


CREATE TABLE franchise_manager
(
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가맹점매니저번호',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	-- 역할그룹 번호 
	role_group_id int(5) COMMENT '역할그룹 번호 ',
	-- 프랜차이즈 관리자 코드
	franchise_manager_code varchar(300) COMMENT '프랜차이즈 관리자 코드',
	-- 관리자 : 1
	-- 매니저 : 2
	status int(5) NOT NULL COMMENT '관리자 : 1
매니저 : 2',
	-- 아이디 
	-- 
	id varchar(100) NOT NULL COMMENT '아이디 
',
	-- 비밀번호 
	-- 
	pw varchar(300) NOT NULL COMMENT '비밀번호 
',
	-- 이름 
	-- 
	name  varchar(100) COMMENT '이름 
',
	-- 이메일
	-- 
	email  varchar(200) COMMENT '이메일
',
	-- 핸드폰 번호
	phone varchar(300) COMMENT '핸드폰 번호',
	-- 최근접속일
	access_date date COMMENT '최근접속일',
	-- 생성일
	regdate timestamp COMMENT '생성일',
	PRIMARY KEY (franchise_manager_id),
	UNIQUE (franchise_manager_code),
	UNIQUE (id)
);


CREATE TABLE frequent_question
(
	-- 자주묻는 질문 번호
	frequent_question_id int(11) NOT NULL AUTO_INCREMENT COMMENT '자주묻는 질문 번호',
	-- 자주묻는 질문 카테고리 번호
	frequent_question_category_id int(11) NOT NULL COMMENT '자주묻는 질문 카테고리 번호',
	-- 질문 제목
	title  varchar(300) NOT NULL COMMENT '질문 제목',
	-- 질문 내용
	content  text NOT NULL COMMENT '질문 내용',
	PRIMARY KEY (frequent_question_id)
);


CREATE TABLE frequent_question_category
(
	-- 자주묻는 질문 카테고리 번호
	frequent_question_category_id int(11) NOT NULL AUTO_INCREMENT COMMENT '자주묻는 질문 카테고리 번호',
	-- 자주묻는 질문 카테고리 내용 
	content varchar(200) NOT NULL COMMENT '자주묻는 질문 카테고리 내용 ',
	PRIMARY KEY (frequent_question_category_id)
);


CREATE TABLE goods
(
	-- 상품번호 
	goods_id int(11) NOT NULL AUTO_INCREMENT COMMENT '상품번호 ',
	shop_idx int(11) NOT NULL,
	-- 상품이름 
	name  varchar(100) NOT NULL COMMENT '상품이름 ',
	-- 정가
	price int(50) COMMENT '정가',
	-- 최소금액
	min_price int(50) COMMENT '최소금액',
	-- 추가 설명(선택)
	additional_info  text COMMENT '추가 설명(선택)',
	PRIMARY KEY (goods_id)
);


CREATE TABLE manager_and_additional_role
(
	-- 매니저의 추가 권한 번호 
	-- 
	manager_and_additional_role_id int(11) NOT NULL AUTO_INCREMENT COMMENT '매니저의 추가 권한 번호 
',
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 추가 권한 번호
	addtional_role_id int(5) NOT NULL COMMENT '추가 권한 번호',
	PRIMARY KEY (manager_and_additional_role_id)
);


CREATE TABLE manager_member
(
	manager_member_idx  int(11) NOT NULL AUTO_INCREMENT,
	id varchar(50) NOT NULL,
	pw varchar(50) NOT NULL,
	name  varchar(50) NOT NULL,
	-- 1~10
	-- 1:일반
	-- 10:최고
	level  int(11) NOT NULL COMMENT '1~10
1:일반
10:최고',
	-- http방식 URL
	send_url varchar(300) NOT NULL COMMENT 'http방식 URL',
	-- db 종류
	user_db_type varchar(10) DEFAULT 'NULL' COMMENT 'db 종류',
	-- db방식 호스트
	user_db_host varchar(100) COMMENT 'db방식 호스트',
	-- db방식 아이디
	user_db_id varchar(100) COMMENT 'db방식 아이디',
	-- db방식 패스워드 
	-- 
	user_id_pw varchar(100) COMMENT 'db방식 패스워드 
',
	-- db방식 db명
	user_db_name varchar(100) COMMENT 'db방식 db명',
	-- 최종변경일자
	-- 
	udate datetime COMMENT '최종변경일자
',
	-- 등록일자
	regdate timestamp COMMENT '등록일자',
	PRIMARY KEY (manager_member_idx ),
	UNIQUE (id)
);


CREATE TABLE member
(
	-- 회원코드
	member_id int(11) NOT NULL AUTO_INCREMENT COMMENT '회원코드',
	phone  varchar(100) NOT NULL,
	-- 회원 코드
	member_code varchar(300) COMMENT '회원 코드',
	-- 회원닉네임
	name  varchar(50) NOT NULL COMMENT '회원닉네임',
	-- 회원 동네
	adress varchar(200) NOT NULL COMMENT '회원 동네',
	profile_image varchar(100),
	-- 일반 회원 : 1
	-- 판매장 회원 : 2
	-- 
	status int(5) DEFAULT 1 NOT NULL COMMENT '일반 회원 : 1
판매장 회원 : 2
',
	-- 정상 : 1
	-- 탈퇴 : 2
	-- 
	Withdrawal int(5) COMMENT '정상 : 1
탈퇴 : 2
',
	regdate timestamp NOT NULL,
	PRIMARY KEY (member_id),
	UNIQUE (member_code)
);


CREATE TABLE member_and_shop
(
	-- 단골가게 번호
	member_and_shop_id int(11) NOT NULL AUTO_INCREMENT COMMENT '단골가게 번호',
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	shop_idx int(11) NOT NULL,
	PRIMARY KEY (member_and_shop_id)
);


CREATE TABLE member_penalty
(
	-- 회원 패널티 번호
	member_penalty_id int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 패널티 번호',
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 패널티 날짜
	panalty_date int(11) COMMENT '패널티 날짜',
	-- 패널티 이름
	-- 1:경고
	-- 2:정지
	-- 3:차단
	panalty_name int(5) COMMENT '패널티 이름
1:경고
2:정지
3:차단',
	-- 발견 경로 
	discovery_path varchar(300) COMMENT '발견 경로 ',
	-- 패널티 사유
	reason varchar(300) COMMENT '패널티 사유',
	-- 패널티 처리자 
	register varchar(100) COMMENT '패널티 처리자 ',
	-- 패널티 등록 날짜
	regdate timestamp COMMENT '패널티 등록 날짜',
	PRIMARY KEY (member_penalty_id)
);


CREATE TABLE member_sta
(
	-- 회원 통계 번호 
	-- 
	member_sta_id  int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 통계 번호 
',
	-- 상품 등록 컬럼
	goods int(11) COMMENT '상품 등록 컬럼',
	-- 게시물 통계 컬럼 
	post int(11) COMMENT '게시물 통계 컬럼 ',
	-- 후기 컬럼 
	review int(11) COMMENT '후기 컬럼 ',
	-- 댓글 컬럼
	commet int(11) COMMENT '댓글 컬럼',
	-- 날짜
	date timestamp COMMENT '날짜',
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	PRIMARY KEY (member_sta_id )
);


CREATE TABLE Notice
(
	notice_id int(11) NOT NULL AUTO_INCREMENT,
	-- 공지사항 내용 
	title varchar(200) NOT NULL COMMENT '공지사항 내용 ',
	-- 공지사항 내용 
	content text NOT NULL COMMENT '공지사항 내용 ',
	-- 공지사항 등록 날짜
	regdate timestamp NOT NULL COMMENT '공지사항 등록 날짜',
	PRIMARY KEY (notice_id)
);


CREATE TABLE notice_image
(
	-- 공지사항 이미지 번호
	notice_image_id int(11) NOT NULL AUTO_INCREMENT COMMENT '공지사항 이미지 번호',
	notice_id int(11) NOT NULL,
	-- 공지사항 이미지 파일 이름
	name varchar(300) NOT NULL COMMENT '공지사항 이미지 파일 이름',
	-- 공지사항 이미지 파일 타입 
	type varchar(50) NOT NULL COMMENT '공지사항 이미지 파일 타입 ',
	PRIMARY KEY (notice_image_id)
);


CREATE TABLE question
(
	questtion_id int(11) NOT NULL AUTO_INCREMENT,
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 문의 카테고리 번호 
	question_category_id int(11) NOT NULL COMMENT '문의 카테고리 번호 ',
	regdate timestamp NOT NULL,
	PRIMARY KEY (questtion_id)
);


CREATE TABLE question_answer
(
	questtion_id int(11) NOT NULL,
	-- 문의 답변 제목
	title varchar(300) NOT NULL COMMENT '문의 답변 제목',
	-- 문의 답변 제목
	content text NOT NULL COMMENT '문의 답변 제목',
	-- 답변등록시간 
	regdate timestamp NOT NULL COMMENT '답변등록시간 '
);


CREATE TABLE question_category
(
	-- 문의 카테고리 번호 
	question_category_id int(11) NOT NULL AUTO_INCREMENT COMMENT '문의 카테고리 번호 ',
	-- 카테고리 내용
	content  varchar(200) NOT NULL COMMENT '카테고리 내용',
	PRIMARY KEY (question_category_id)
);


CREATE TABLE question_image
(
	-- 문의 이미지 번호
	question_image_id int(11) NOT NULL AUTO_INCREMENT COMMENT '문의 이미지 번호',
	questtion_id int(11) NOT NULL,
	-- 파일 이름
	name  varchar(300) NOT NULL COMMENT '파일 이름',
	-- 파일 타입 
	type varchar(50) COMMENT '파일 타입 ',
	PRIMARY KEY (question_image_id)
);


CREATE TABLE reply_review
(
	-- 리뷰 답글 번호
	reply_review_id int(11) NOT NULL AUTO_INCREMENT COMMENT '리뷰 답글 번호',
	-- 가게 리뷰 번호 
	shop_review_id int(11) NOT NULL COMMENT '가게 리뷰 번호 ',
	-- 답글 내용
	content  varchar(300) COMMENT '답글 내용',
	-- 등록 날짜
	regdate timestamp COMMENT '등록 날짜',
	PRIMARY KEY (reply_review_id)
);


CREATE TABLE report_category
(
	report_category_id int(11) NOT NULL AUTO_INCREMENT,
	-- 카테고리 내용 
	category_content varchar(200) NOT NULL COMMENT '카테고리 내용 ',
	PRIMARY KEY (report_category_id)
);


CREATE TABLE review_keyword
(
	review_keyword_id int(11) NOT NULL,
	-- 가게 리뷰 번호 
	shop_review_id int(11) NOT NULL COMMENT '가게 리뷰 번호 ',
	-- 리뷰 키워드 카테고리 번호
	review_keyword_category_id int(11) NOT NULL COMMENT '리뷰 키워드 카테고리 번호',
	PRIMARY KEY (review_keyword_id),
	UNIQUE (review_keyword_id)
);


CREATE TABLE review_keyword_category
(
	-- 리뷰 키워드 카테고리 번호
	review_keyword_category_id int(11) NOT NULL AUTO_INCREMENT COMMENT '리뷰 키워드 카테고리 번호',
	-- 리뷰 키워드 카테고리 내용
	content varchar(200) NOT NULL COMMENT '리뷰 키워드 카테고리 내용',
	PRIMARY KEY (review_keyword_category_id)
);


CREATE TABLE role_detail
(
	-- 상세 권한 번호 
	-- 
	role_detail_id int(11) NOT NULL AUTO_INCREMENT COMMENT '상세 권한 번호 
',
	-- 상세 권한 이름
	name  varchar(300) COMMENT '상세 권한 이름',
	PRIMARY KEY (role_detail_id)
);


CREATE TABLE role_groups
(
	-- 역할그룹 번호 
	role_group_id int(5) NOT NULL AUTO_INCREMENT COMMENT '역할그룹 번호 ',
	-- 역할 그룹 이름
	role_group_name varchar(300) COMMENT '역할 그룹 이름',
	-- 역할 그룹 설명
	role_group_info  text COMMENT '역할 그룹 설명',
	-- 프랜차이즈 코드 
	franchise_code varchar(300) COMMENT '프랜차이즈 코드 ',
	-- 등록일
	-- 
	regdate timestamp NOT NULL COMMENT '등록일
',
	-- 등록자
	-- 
	registrar varchar(300) COMMENT '등록자
',
	PRIMARY KEY (role_group_id)
);


CREATE TABLE role_group_and_detail
(
	-- 권한 그룹과 디테일 테이블 번호 
	role_group_and_detail_id int(11) NOT NULL AUTO_INCREMENT COMMENT '권한 그룹과 디테일 테이블 번호 ',
	-- 역할그룹 번호 
	role_group_id int(5) NOT NULL COMMENT '역할그룹 번호 ',
	-- 상세 권한 번호 
	-- 
	role_detail_id int(11) NOT NULL COMMENT '상세 권한 번호 
',
	PRIMARY KEY (role_group_and_detail_id)
);


CREATE TABLE shop
(
	shop_idx int(11) NOT NULL AUTO_INCREMENT,
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	-- 고유번호
	id int(11) NOT NULL COMMENT '고유번호',
	-- 가게 이름
	shop_name varchar(100) NOT NULL COMMENT '가게 이름',
	-- 회원이름 
	member_name  varchar(50) NOT NULL COMMENT '회원이름 ',
	-- 생년월일 
	date_of_birth date COMMENT '생년월일 ',
	-- 핸드폰 번호
	phone varchar(100) COMMENT '핸드폰 번호',
	-- 대표자 이름
	-- 
	representative varchar(300) COMMENT '대표자 이름
',
	-- 사업자 번호
	buisness_num varchar(50) NOT NULL COMMENT '사업자 번호',
	-- 사업자 상호 
	buisness_name varchar(100) NOT NULL COMMENT '사업자 상호 ',
	buisness_address varchar(200) NOT NULL,
	-- 사업자 등록증 
	buisess_image_name varchar(200) NOT NULL COMMENT '사업자 등록증 ',
	-- 가게 승인 상태
	-- 1:승인완료
	-- 2:심사중
	-- 3:반려
	-- 4:보류
	status int(5) NOT NULL COMMENT '가게 승인 상태
1:승인완료
2:심사중
3:반려
4:보류',
	-- 가게 신청일
	regdate timestamp NOT NULL COMMENT '가게 신청일',
	-- 가게 소개
	introduce_shop text COMMENT '가게 소개',
	-- 시작시간
	-- 
	start_date varchar(50) COMMENT '시작시간
',
	-- 끝시간 
	end_date varchar(50) COMMENT '끝시간 ',
	-- 영업시간정보
	buisess_hours_info varchar(200) COMMENT '영업시간정보',
	-- 홈페이지 주소
	homepage_url varchar(200) COMMENT '홈페이지 주소',
	-- 고객 알림
	notice_info text COMMENT '고객 알림',
	-- 가게 지역 
	area varchar(300) NOT NULL COMMENT '가게 지역 ',
	-- 위도 
	-- 
	latitude varchar(300) COMMENT '위도 
',
	-- 경도
	longitude varchar(300) COMMENT '경도',
	-- 가게 코드
	shop_code varchar(300) COMMENT '가게 코드',
	-- 1:활동중
	-- 2:중지
	-- 3:탈퇴 
	-- 
	activity_status int(5) COMMENT '1:활동중
2:중지
3:탈퇴 
',
	-- 대표상품메뉴
	best_goods_id int(11) COMMENT '대표상품메뉴',
	-- 업종 
	-- 
	sector varchar(300) COMMENT '업종 
',
	-- 승인일
	approve_date date COMMENT '승인일',
	-- 탈퇴일
	with_date date COMMENT '탈퇴일',
	-- 메인 이미지
	-- 
	main_image varchar(300) COMMENT '메인 이미지
',
	-- 처리자명
	register varchar(300) COMMENT '처리자명',
	PRIMARY KEY (shop_idx),
	UNIQUE (shop_code)
);


CREATE TABLE shop_coupon
(
	-- 가게 쿠폰 
	-- 
	shop_coupon int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 쿠폰 
',
	shop_idx int(11) NOT NULL,
	PRIMARY KEY (shop_coupon)
);


CREATE TABLE shop_image
(
	shop_image_idx int(11) NOT NULL AUTO_INCREMENT,
	shop_idx int(11) NOT NULL,
	-- 파일 이미지 이름 
	image_name  varchar(200) NOT NULL COMMENT '파일 이미지 이름 ',
	-- 이미지 타입
	image_type varchar(50) NOT NULL COMMENT '이미지 타입',
	regdate timestamp,
	PRIMARY KEY (shop_image_idx)
);


CREATE TABLE shop_keyword
(
	shop_keyword_id int(20) NOT NULL AUTO_INCREMENT,
	shop_idx int(11) NOT NULL,
	-- 키워드
	keyword varchar(50) NOT NULL COMMENT '키워드',
	PRIMARY KEY (shop_keyword_id)
);


CREATE TABLE shop_manager
(
	-- 가게 매니저 번호 
	shop_manager_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 매니저 번호 ',
	shop_idx int(11) NOT NULL,
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	PRIMARY KEY (shop_manager_id)
);


CREATE TABLE shop_news
(
	-- 가게 소식 번호
	shop_news_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 소식 번호',
	shop_idx int(11) NOT NULL,
	-- 가게 소식 제목 
	title varchar(100) NOT NULL COMMENT '가게 소식 제목 ',
	-- 가게 소식 내용 
	content  text NOT NULL COMMENT '가게 소식 내용 ',
	regdate timestamp NOT NULL,
	PRIMARY KEY (shop_news_id)
);


CREATE TABLE shop_news_comments
(
	-- 가게 소식 댓글 번호 
	shop_news_comments_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 소식 댓글 번호 ',
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 가게 소식 번호
	shop_news_id int(11) NOT NULL COMMENT '가게 소식 번호',
	-- 댓글 내용 
	content  text NOT NULL COMMENT '댓글 내용 ',
	-- 등록 시간 
	regdate timestamp NOT NULL COMMENT '등록 시간 ',
	PRIMARY KEY (shop_news_comments_id)
);


CREATE TABLE shop_news_image
(
	-- 가게 소식 이미지 번호
	shop_news_image_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 소식 이미지 번호',
	-- 가게 소식 번호
	shop_news_id int(11) NOT NULL COMMENT '가게 소식 번호',
	-- 가게 소식 이미지 파일 이름 
	name  varchar(300) NOT NULL COMMENT '가게 소식 이미지 파일 이름 ',
	-- 가게 소식 이미지 파일 타입 
	type varchar(50) NOT NULL COMMENT '가게 소식 이미지 파일 타입 ',
	PRIMARY KEY (shop_news_image_id)
);


CREATE TABLE shop_news_like
(
	-- 가게 소식 좋아요 번호 
	shop_news_like_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 소식 좋아요 번호 ',
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 가게 소식 번호
	shop_news_id int(11) NOT NULL COMMENT '가게 소식 번호',
	PRIMARY KEY (shop_news_like_id)
);


CREATE TABLE shop_panalty
(
	-- 가게 패널티 번호 
	shop_panalty_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 패널티 번호 ',
	shop_idx int(11) NOT NULL,
	-- 패널티 기간
	panalty_date int(11) COMMENT '패널티 기간',
	-- 패널티 상태
	-- 1:경고
	-- 2:정지
	-- 3:차단
	panalty_name  int(5) COMMENT '패널티 상태
1:경고
2:정지
3:차단',
	-- 발견경로 
	-- 
	discovery_path varchar(300) COMMENT '발견경로 
',
	-- 패널티 사유 
	reason varchar(300) COMMENT '패널티 사유 ',
	-- 패널티 처리자
	register varchar(100) COMMENT '패널티 처리자',
	-- 패널티 등록 날짜
	regdate timestamp COMMENT '패널티 등록 날짜',
	PRIMARY KEY (shop_panalty_id)
);


CREATE TABLE shop_report
(
	-- 가게 신고 번호
	shop_report_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 신고 번호',
	report_category_id int(11) NOT NULL,
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	shop_idx int(11) NOT NULL,
	PRIMARY KEY (shop_report_id)
);


CREATE TABLE shop_review
(
	-- 가게 리뷰 번호 
	shop_review_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 리뷰 번호 ',
	shop_idx int(11) NOT NULL,
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 후기 내용
	content  varchar(300) NOT NULL COMMENT '후기 내용',
	-- 댓글 날짜
	regdate timestamp COMMENT '댓글 날짜',
	PRIMARY KEY (shop_review_id)
);


CREATE TABLE shop_review_image
(
	-- 가게 리뷰 이미지 번호
	shop_review_image_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 리뷰 이미지 번호',
	-- 가게 리뷰 번호 
	shop_review_id int(11) NOT NULL COMMENT '가게 리뷰 번호 ',
	-- 가게 리뷰 이미지 파일 이름
	name varchar(300) NOT NULL COMMENT '가게 리뷰 이미지 파일 이름',
	-- 가게 리뷰 이미지 파일 타입 
	type varchar(50) NOT NULL COMMENT '가게 리뷰 이미지 파일 타입 ',
	PRIMARY KEY (shop_review_image_id)
);



/* Create Foreign Keys */

ALTER TABLE manager_and_additional_role
	ADD FOREIGN KEY (addtional_role_id)
	REFERENCES additional_role (addtional_role_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE area_sigungu
	ADD FOREIGN KEY (area_code)
	REFERENCES area (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop
	ADD FOREIGN KEY (id)
	REFERENCES area_sigungu (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE franchise_domain
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE franchise_manager
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE manager_and_additional_role
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE frequent_question
	ADD FOREIGN KEY (frequent_question_category_id)
	REFERENCES frequent_question_category (frequent_question_category_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE activity_areas
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE member_and_shop
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE member_penalty
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE member_sta
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE question
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_manager
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_news_comments
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_news_like
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_report
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_review
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE notice_image
	ADD FOREIGN KEY (notice_id)
	REFERENCES Notice (notice_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE question_answer
	ADD FOREIGN KEY (questtion_id)
	REFERENCES question (questtion_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE question_image
	ADD FOREIGN KEY (questtion_id)
	REFERENCES question (questtion_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE question
	ADD FOREIGN KEY (question_category_id)
	REFERENCES question_category (question_category_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_report
	ADD FOREIGN KEY (report_category_id)
	REFERENCES report_category (report_category_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review_keyword
	ADD FOREIGN KEY (review_keyword_category_id)
	REFERENCES review_keyword_category (review_keyword_category_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE role_group_and_detail
	ADD FOREIGN KEY (role_detail_id)
	REFERENCES role_detail (role_detail_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE franchise_manager
	ADD FOREIGN KEY (role_group_id)
	REFERENCES role_groups (role_group_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE role_group_and_detail
	ADD FOREIGN KEY (role_group_id)
	REFERENCES role_groups (role_group_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE goods
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE member_and_shop
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_coupon
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_image
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_keyword
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_manager
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_news
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_panalty
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_report
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_review
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_news_comments
	ADD FOREIGN KEY (shop_news_id)
	REFERENCES shop_news (shop_news_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_news_image
	ADD FOREIGN KEY (shop_news_id)
	REFERENCES shop_news (shop_news_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_news_like
	ADD FOREIGN KEY (shop_news_id)
	REFERENCES shop_news (shop_news_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply_review
	ADD FOREIGN KEY (shop_review_id)
	REFERENCES shop_review (shop_review_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review_keyword
	ADD FOREIGN KEY (shop_review_id)
	REFERENCES shop_review (shop_review_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop_review_image
	ADD FOREIGN KEY (shop_review_id)
	REFERENCES shop_review (shop_review_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



