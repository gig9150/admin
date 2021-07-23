SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS activity_areas;
DROP TABLE IF EXISTS manager_and_additional_role;
DROP TABLE IF EXISTS additional_role;
DROP TABLE IF EXISTS member_and_shop;
DROP TABLE IF EXISTS member_penalty;
DROP TABLE IF EXISTS member_sta;
DROP TABLE IF EXISTS member_update_list;
DROP TABLE IF EXISTS question_answer;
DROP TABLE IF EXISTS question_image;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS report_image;
DROP TABLE IF EXISTS report_reply;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS exhi_sub;
DROP TABLE IF EXISTS direct_transaction;
DROP TABLE IF EXISTS goods;
DROP TABLE IF EXISTS shop_coupon;
DROP TABLE IF EXISTS shop_image;
DROP TABLE IF EXISTS shop_keyword;
DROP TABLE IF EXISTS shop_manager;
DROP TABLE IF EXISTS news_comments_reply;
DROP TABLE IF EXISTS shop_news_comments;
DROP TABLE IF EXISTS shop_news_image;
DROP TABLE IF EXISTS shop_news_like;
DROP TABLE IF EXISTS shop_news;
DROP TABLE IF EXISTS shop_penalty;
DROP TABLE IF EXISTS reply_review;
DROP TABLE IF EXISTS review_keyword;
DROP TABLE IF EXISTS shop_review_image;
DROP TABLE IF EXISTS shop_review;
DROP TABLE IF EXISTS shop_update_list;
DROP TABLE IF EXISTS shop;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS area_dong;
DROP TABLE IF EXISTS exhi;
DROP TABLE IF EXISTS franchise_domain;
DROP TABLE IF EXISTS franchise_respon;
DROP TABLE IF EXISTS manager_and_franchise;
DROP TABLE IF EXISTS notice_and_franchise;
DROP TABLE IF EXISTS franchise;
DROP TABLE IF EXISTS area_sigun;
DROP TABLE IF EXISTS exhi_category;
DROP TABLE IF EXISTS frequent_question;
DROP TABLE IF EXISTS manager_access;
DROP TABLE IF EXISTS manager_and_pro;
DROP TABLE IF EXISTS manager_notice;
DROP TABLE IF EXISTS notice_image;
DROP TABLE IF EXISTS notice;
DROP TABLE IF EXISTS franchise_manager;
DROP TABLE IF EXISTS frequent_question_category;
DROP TABLE IF EXISTS pro_sub_category;
DROP TABLE IF EXISTS pro_category;
DROP TABLE IF EXISTS question_category;
DROP TABLE IF EXISTS report_categoris;
DROP TABLE IF EXISTS report_category;
DROP TABLE IF EXISTS review_keyword_category;
DROP TABLE IF EXISTS role_group_and_detail;
DROP TABLE IF EXISTS role_groups;
DROP TABLE IF EXISTS sector;




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


CREATE TABLE area_dong
(
	-- 읍면동 번호
	-- 
	id int(11) NOT NULL AUTO_INCREMENT COMMENT '읍면동 번호
',
	-- 우편번호
	-- 
	zip_code varchar(50) COMMENT '우편번호
',
	-- 행정동
	area_name varchar(50) COMMENT '행정동',
	PRIMARY KEY (id)
);


CREATE TABLE area_sigun
(
	-- 상위 지역 번호
	-- 
	id int(11) NOT NULL AUTO_INCREMENT COMMENT '상위 지역 번호
',
	-- 우편번호 
	zip_code varchar(4) COMMENT '우편번호 ',
	-- 지역이름
	area_nm int(11) COMMENT '지역이름',
	-- 1: 광역시,도 / 2:시,군,구
	area_type int(11) COMMENT '1: 광역시,도 / 2:시,군,구',
	PRIMARY KEY (id)
);


CREATE TABLE direct_transaction
(
	-- 산지 직거래 번호
	-- 
	direct_transaction_id int(11) NOT NULL AUTO_INCREMENT COMMENT '산지 직거래 번호
',
	shop_idx int(11) NOT NULL,
	PRIMARY KEY (direct_transaction_id)
);


CREATE TABLE exhi
(
	-- 기획전 번호
	exhi_id int(11) NOT NULL AUTO_INCREMENT COMMENT '기획전 번호',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	-- 전시 카테고리 번호
	-- 
	exhi_category_id int(11) NOT NULL COMMENT '전시 카테고리 번호
',
	-- 가맹사 구분 
	-- 1:가게 홍보
	-- 2:중고 거래
	-- 3:산지 직거래
	-- 
	exhi_section int(11) COMMENT '가맹사 구분 
1:가게 홍보
2:중고 거래
3:산지 직거래
',
	-- 기획전 이름 
	-- 
	exhi_name varchar(300) COMMENT '기획전 이름 
',
	-- 기획전 서브멘트
	exhi_sub varchar(300) COMMENT '기획전 서브멘트',
	-- 기획전 설명 
	exhi_explain varchar(1000) COMMENT '기획전 설명 ',
	-- 배너 이미지
	-- 
	banner_image varchar(300) COMMENT '배너 이미지
',
	-- 시작 날짜 
	start_date timestamp COMMENT '시작 날짜 ',
	-- 시작시간
	-- 
	start_aclock varchar(100) COMMENT '시작시간
',
	-- 종료 날짜
	end_date timestamp COMMENT '종료 날짜',
	-- 종료 시간
	end_aclock varchar(100) COMMENT '종료 시간',
	-- 1:미진행
	-- 2:진행중
	-- 3:진행완료
	pro_status int(11) COMMENT '1:미진행
2:진행중
3:진행완료',
	-- 공개 여부 
	-- 1:공개
	-- 2:비공개
	-- 
	open_status int(11) COMMENT '공개 여부 
1:공개
2:비공개
',
	-- url
	url varchar(300) COMMENT 'url',
	-- 등록여부
	-- 1:등록 
	-- 2:미등록 
	-- 
	regi_status int(11) COMMENT '등록여부
1:등록 
2:미등록 
',
	-- 등록 순서
	regi_order int(11) COMMENT '등록 순서',
	-- 이벤트 코드
	event_code varchar(300) COMMENT '이벤트 코드',
	-- 등록 날짜
	-- 
	regdate timestamp COMMENT '등록 날짜
',
	PRIMARY KEY (exhi_id)
);


CREATE TABLE exhi_category
(
	-- 전시 카테고리 번호
	-- 
	exhi_category_id int(11) NOT NULL AUTO_INCREMENT COMMENT '전시 카테고리 번호
',
	-- 내용
	content varchar(300) COMMENT '내용',
	PRIMARY KEY (exhi_category_id)
);


CREATE TABLE exhi_sub
(
	-- 전시품 번호
	exhi_sub_id int(11) NOT NULL AUTO_INCREMENT COMMENT '전시품 번호',
	-- 기획전 번호
	exhi_id int(11) NOT NULL COMMENT '기획전 번호',
	shop_idx int(11) NOT NULL,
	-- 산지 직거래 번호
	-- 
	direct_transaction_id int(11) NOT NULL COMMENT '산지 직거래 번호
',
	PRIMARY KEY (exhi_sub_id)
);


CREATE TABLE franchise
(
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL AUTO_INCREMENT COMMENT '프렌차이즈 번호 
',
	-- 상위 지역 번호
	-- 
	id int(11) NOT NULL COMMENT '상위 지역 번호
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
	-- 관리자 메모 
	memo text COMMENT '관리자 메모 ',
	-- 메인 도메인 
	-- 
	main_domain varchar(300) COMMENT '메인 도메인 
',
	-- 등록 일자 
	regdate timestamp COMMENT '등록 일자 ',
	-- 고객센터
	-- 
	customer_service varchar(300) COMMENT '고객센터
',
	-- 가게 소식 서비스 
	-- 1: 이용 2: 불이용
	shop_service int(5) COMMENT '가게 소식 서비스 
1: 이용 2: 불이용',
	-- 가게 소식 서비스
	-- 1: 사전 모니터링 2 : 사후 모니터링
	-- 
	shop_approval int(5) COMMENT '가게 소식 서비스
1: 사전 모니터링 2 : 사후 모니터링
',
	-- 1:이용 2:불이용 
	daliy_service int(5) COMMENT '1:이용 2:불이용 ',
	-- 일상 서비스 
	-- 1: 사전 모니터링 2: 사후 모니터링 
	daliy_aproval int(5) COMMENT '일상 서비스 
1: 사전 모니터링 2: 사후 모니터링 ',
	-- 중고거래 서비스
	-- 1:이용 2: 불이용
	used_service int(5) COMMENT '중고거래 서비스
1:이용 2: 불이용',
	-- 중고거래 서비스 
	-- 1: 사전 모니터링 2: 사후 모니터링
	used_approval int(5) COMMENT '중고거래 서비스 
1: 사전 모니터링 2: 사후 모니터링',
	-- 산지 직거래 서비스
	-- 1:이용 2: 불이용
	direct_trade_Service int(5) COMMENT '산지 직거래 서비스
1:이용 2: 불이용',
	-- 산지 직거래 서비스
	-- 1: 사전 모니터링 2 : 사후 모니터링 
	direct_trade_approval int(5) COMMENT '산지 직거래 서비스
1: 사전 모니터링 2 : 사후 모니터링 ',
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
	additional_domain varchar(300) COMMENT '추가 도메인 
',
	PRIMARY KEY (franchise_domain_id)
);


CREATE TABLE franchise_manager
(
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가맹점매니저번호',
	-- 역할그룹 번호 
	role_group_id int(5) COMMENT '역할그룹 번호 ',
	-- 프랜차이즈 관리자 코드
	franchise_manager_code varchar(300) COMMENT '프랜차이즈 관리자 코드',
	-- 1 : 관리자
	-- 2 : 운영자
	-- 
	level int(5) COMMENT '1 : 관리자
2 : 운영자
',
	-- 1 : 정상
	-- 2 : 정지
	status int(5) NOT NULL COMMENT '1 : 정상
2 : 정지',
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
	-- 1 : 엑셀 다운 가능 
	-- 2 : 다운 불가능
	excel int(5) COMMENT '1 : 엑셀 다운 가능 
2 : 다운 불가능',
	-- 최근 접속 ip
	recent_ip varchar(300) COMMENT '최근 접속 ip',
	-- 최근접속일
	access_date date COMMENT '최근접속일',
	-- 생성일
	regdate timestamp COMMENT '생성일',
	PRIMARY KEY (franchise_manager_id),
	UNIQUE (franchise_manager_code),
	UNIQUE (id)
);


CREATE TABLE franchise_respon
(
	-- 담당자 번호
	-- 
	franchise_respon_id int(11) NOT NULL AUTO_INCREMENT COMMENT '담당자 번호
',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	-- 이름
	respon_name varchar(300) COMMENT '이름',
	-- 연락처
	respon_phone varchar(300) COMMENT '연락처',
	-- 주소
	respon_address varchar(300) COMMENT '주소',
	-- 이메일
	respon_email varchar(300) COMMENT '이메일',
	-- 부서
	respon_depa varchar(300) COMMENT '부서',
	-- 직책
	respon_position varchar(300) COMMENT '직책',
	PRIMARY KEY (franchise_respon_id)
);


CREATE TABLE frequent_question
(
	-- 자주묻는 질문 번호
	frequent_question_id int(11) NOT NULL AUTO_INCREMENT COMMENT '자주묻는 질문 번호',
	-- 자주묻는 질문 카테고리 번호
	frequent_question_category_id int(11) NOT NULL COMMENT '자주묻는 질문 카테고리 번호',
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 질문 제목
	title  varchar(500) NOT NULL COMMENT '질문 제목',
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


CREATE TABLE manager_access
(
	-- 접속 내역 번호
	manager_access_id int(11) NOT NULL AUTO_INCREMENT COMMENT '접속 내역 번호',
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 접속 아이피
	-- 
	ip varchar(300) COMMENT '접속 아이피
',
	-- 처리 결과
	result int(11) COMMENT '처리 결과',
	-- 상세 내용
	detail_content varchar(300) COMMENT '상세 내용',
	-- 접속 날짜
	access_date timestamp COMMENT '접속 날짜',
	PRIMARY KEY (manager_access_id)
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


CREATE TABLE manager_and_franchise
(
	-- 접근 가능 가맹사 번호
	manager_and_franchise_id int(11) NOT NULL AUTO_INCREMENT COMMENT '접근 가능 가맹사 번호',
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	PRIMARY KEY (manager_and_franchise_id)
);


CREATE TABLE manager_and_pro
(
	-- 매니저 처리 내용 번호 
	-- 
	manager_and_pro_id  int(11) NOT NULL AUTO_INCREMENT COMMENT '매니저 처리 내용 번호 
',
	pro_sub_category_id int(11) NOT NULL,
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 접속 일자
	regdate timestamp COMMENT '접속 일자',
	-- 접속 아이피 
	-- 
	ip varchar(300) COMMENT '접속 아이피 
',
	-- 페이지 url 
	url varchar(300) COMMENT '페이지 url ',
	-- 사유
	reason varchar(300) COMMENT '사유',
	PRIMARY KEY (manager_and_pro_id )
);


CREATE TABLE manager_notice
(
	-- 관리자 공지 번호
	manager_notice_id int(11) NOT NULL AUTO_INCREMENT COMMENT '관리자 공지 번호',
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 제목
	notice_title varchar(300) COMMENT '제목',
	-- 내용
	notice_content varchar(1000) COMMENT '내용',
	-- 기존 파일 이름
	ori_attach_file varchar(300) COMMENT '기존 파일 이름',
	-- 첨부파일
	attach_file varchar(300) COMMENT '첨부파일',
	-- 등록일 
	regdate timestamp COMMENT '등록일 ',
	PRIMARY KEY (manager_notice_id)
);


CREATE TABLE member
(
	-- 회원코드
	member_id int(11) NOT NULL AUTO_INCREMENT COMMENT '회원코드',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	-- 읍면동 번호
	-- 
	id int(11) NOT NULL COMMENT '읍면동 번호
',
	-- 회원 코드
	member_code varchar(300) COMMENT '회원 코드',
	phone  varchar(100) NOT NULL,
	-- 회원닉네임
	name  varchar(50) NOT NULL COMMENT '회원닉네임',
	-- 위도
	latitude varchar(300) COMMENT '위도',
	-- 경도
	-- 
	longitude varchar(300) COMMENT '경도
',
	-- 회원 동네
	address varchar(200) NOT NULL COMMENT '회원 동네',
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
	withdrawal int(5) COMMENT '정상 : 1
탈퇴 : 2
',
	-- 관리자 메모
	memo  varchar(300) COMMENT '관리자 메모',
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
	-- 패널티 이름
	-- 1:경고
	-- 2:정지
	-- 3:차단
	penalty_name int(5) COMMENT '패널티 이름
1:경고
2:정지
3:차단',
	-- 패널티 구분
	-- 1:  계정 / 2: 상품 / 3: 채팅 / 4: 게시글
	penalty_sort int(5) COMMENT '패널티 구분
1:  계정 / 2: 상품 / 3: 채팅 / 4: 게시글',
	-- 발견 경로
	--  1:사전 모니터링 / 2: 신고
	discovery_path int(5) COMMENT '발견 경로
 1:사전 모니터링 / 2: 신고',
	-- 패널티 사유
	reason varchar(300) COMMENT '패널티 사유',
	-- 패널티 해지 사유
	cancel_reason varchar(300) COMMENT '패널티 해지 사유',
	-- 패널티 처리자 
	register varchar(100) COMMENT '패널티 처리자 ',
	-- 패널티 등록 날짜
	startDate timestamp COMMENT '패널티 등록 날짜',
	-- 패널티 종료일 
	endDate timestamp COMMENT '패널티 종료일 ',
	-- 등록일
	-- 
	regdate timestamp COMMENT '등록일
',
	-- 1 : 적용
	-- 2 : 해지
	state int(5) COMMENT '1 : 적용
2 : 해지',
	PRIMARY KEY (member_penalty_id)
);


CREATE TABLE member_sta
(
	-- 회원 통계 번호 
	-- 
	member_sta_id  int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 통계 번호 
',
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	login int(11),
	-- 단골 목록 
	-- 
	bookmark int(11) COMMENT '단골 목록 
',
	-- 판매 횟수
	sale int(11) COMMENT '판매 횟수',
	-- 소식 글 업로드 횟수
	board int(11) COMMENT '소식 글 업로드 횟수',
	-- 신고 받은 횟수 
	report int(11) COMMENT '신고 받은 횟수 ',
	-- 패널티 횟수 
	-- 
	penalty int(11) COMMENT '패널티 횟수 
',
	-- 날짜
	date timestamp COMMENT '날짜',
	PRIMARY KEY (member_sta_id )
);


CREATE TABLE member_update_list
(
	member_update_list_id int(11) NOT NULL AUTO_INCREMENT,
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 매니저 번호
	manager_num int(11) COMMENT '매니저 번호',
	-- 수정 전 
	-- 
	update_before varchar(300) COMMENT '수정 전 
',
	-- 수정 후
	update_after varchar(300) COMMENT '수정 후',
	-- 수정 컬럼 
	update_column varchar(300) COMMENT '수정 컬럼 ',
	-- 수정 일자 
	regdate timestamp COMMENT '수정 일자 ',
	PRIMARY KEY (member_update_list_id)
);


CREATE TABLE news_comments_reply
(
	-- 가게 소식 답글 번호 
	-- 
	news_comments_reply_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 소식 답글 번호 
',
	-- 가게 소식 댓글 번호 
	shop_news_comments_id int(11) NOT NULL COMMENT '가게 소식 댓글 번호 ',
	PRIMARY KEY (news_comments_reply_id)
);


CREATE TABLE notice
(
	notice_id int(11) NOT NULL AUTO_INCREMENT,
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 공지사항 내용 
	title varchar(200) NOT NULL COMMENT '공지사항 내용 ',
	-- 공지사항 내용 
	content text NOT NULL COMMENT '공지사항 내용 ',
	-- 공지사항 등록 날짜
	regdate timestamp NOT NULL COMMENT '공지사항 등록 날짜',
	PRIMARY KEY (notice_id)
);


CREATE TABLE notice_and_franchise
(
	-- 관리자 공지 해당 가맹사 번호 
	notice_and_franchise_id int(11) NOT NULL AUTO_INCREMENT COMMENT '관리자 공지 해당 가맹사 번호 ',
	-- 관리자 공지 번호
	manager_notice_id int(11) NOT NULL COMMENT '관리자 공지 번호',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	PRIMARY KEY (notice_and_franchise_id)
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


CREATE TABLE pro_category
(
	-- 처리 수행 번호
	pro_category_id int(11) NOT NULL AUTO_INCREMENT COMMENT '처리 수행 번호',
	-- 내용
	content varchar(300) COMMENT '내용',
	PRIMARY KEY (pro_category_id)
);


CREATE TABLE pro_sub_category
(
	pro_sub_category_id int(11) NOT NULL AUTO_INCREMENT,
	-- 처리 수행 번호
	pro_category_id int(11) NOT NULL COMMENT '처리 수행 번호',
	-- 내용
	content varchar(300) COMMENT '내용',
	PRIMARY KEY (pro_sub_category_id)
);


CREATE TABLE question
(
	questtion_id int(11) NOT NULL AUTO_INCREMENT,
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	-- 문의 카테고리 번호 
	question_category_id int(11) NOT NULL COMMENT '문의 카테고리 번호 ',
	-- 문의 내용
	question_content varchar(1000) COMMENT '문의 내용',
	-- 답변 등록여부
	-- 등록  : 1
	-- 미등록 : 2
	answer_status int(11) COMMENT '답변 등록여부
등록  : 1
미등록 : 2',
	regdate timestamp NOT NULL,
	PRIMARY KEY (questtion_id)
);


CREATE TABLE question_answer
(
	-- 문의 답변 번호 
	-- 
	question_answer_id int(11) NOT NULL AUTO_INCREMENT COMMENT '문의 답변 번호 
',
	question_id int(11) NOT NULL,
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 문의 답변 제목
	content text NOT NULL COMMENT '문의 답변 제목',
	-- 문의 답변 임시
	-- 
	temp_content text COMMENT '문의 답변 임시
',
	-- 알림 톡 발송 여부 
	-- 1: 발송 2: 미발송 
	send_message int(11) COMMENT '알림 톡 발송 여부 
1: 발송 2: 미발송 ',
	-- 답변등록시간 
	regdate timestamp NOT NULL COMMENT '답변등록시간 ',
	PRIMARY KEY (question_answer_id)
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


CREATE TABLE report
(
	-- 가게 신고 번호
	report_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 신고 번호',
	-- 프렌차이즈 번호 
	-- 
	franchise_id int(11) NOT NULL COMMENT '프렌차이즈 번호 
',
	-- 회원코드
	member_id int(11) COMMENT '회원코드',
	-- 1: 회원신고 / 2: 가게신고
	member_or_shop int(11) COMMENT '1: 회원신고 / 2: 가게신고',
	-- 번호
	member_or_shop_num int(11) COMMENT '번호',
	-- 가게 or 회원 이름 
	-- 
	member_or_shop_name varchar(300) COMMENT '가게 or 회원 이름 
',
	report_category_id int(11),
	-- 신고 범주 번호
	report_categoris_id int(11) NOT NULL COMMENT '신고 범주 번호',
	-- 신고 대상 
	-- 
	report_to varchar(300) COMMENT '신고 대상 
',
	-- 신고대상 번호
	report_to_num int(11) COMMENT '신고대상 번호',
	-- 신고 내용
	content varchar(1000) COMMENT '신고 내용',
	-- 답변 등록여부
	-- 1:확인 중 2: 처리 완료 
	answer_status int(11) COMMENT '답변 등록여부
1:확인 중 2: 처리 완료 ',
	-- 등록일
	regdate timestamp COMMENT '등록일',
	PRIMARY KEY (report_id)
);


CREATE TABLE report_categoris
(
	-- 신고 범주 번호
	report_categoris_id int(11) NOT NULL AUTO_INCREMENT COMMENT '신고 범주 번호',
	-- 신고 항목
	-- 1 : 계정 / 2 : 게시글 / 3 : 상품 
	-- 
	content int(11) COMMENT '신고 항목
1 : 계정 / 2 : 게시글 / 3 : 상품 
',
	-- 신고 종류
	sub_content varchar(300) COMMENT '신고 종류',
	PRIMARY KEY (report_categoris_id)
);


CREATE TABLE report_category
(
	report_category_id int(11) NOT NULL AUTO_INCREMENT,
	-- 카테고리 내용
	content varchar(300) COMMENT '카테고리 내용',
	PRIMARY KEY (report_category_id)
);


CREATE TABLE report_image
(
	-- 신고 이미지 번호
	report_image_id int(11) NOT NULL AUTO_INCREMENT COMMENT '신고 이미지 번호',
	-- 신고 번호
	-- 
	report_id int(11) NOT NULL COMMENT '신고 번호
',
	-- 이미지 이름 
	image_name  varchar(300) COMMENT '이미지 이름 ',
	PRIMARY KEY (report_image_id)
);


CREATE TABLE report_reply
(
	-- 신고 답변 번호
	shop_report_reply_id int(11) NOT NULL AUTO_INCREMENT COMMENT '신고 답변 번호',
	-- 신고 번호
	-- 
	report_id int(11) NOT NULL COMMENT '신고 번호
',
	-- 가맹점매니저번호
	franchise_manager_id int(11) NOT NULL COMMENT '가맹점매니저번호',
	-- 답변 내용
	reply_content varchar(500) COMMENT '답변 내용',
	-- 임시 저장 내용
	temp_content varchar(500) COMMENT '임시 저장 내용',
	-- 알림 톡 발송여부
	-- 1: 발송
	-- 2: 미발송
	-- 
	send_message int(11) COMMENT '알림 톡 발송여부
1: 발송
2: 미발송
',
	-- 등록일
	-- 
	regdate timestamp COMMENT '등록일
',
	PRIMARY KEY (shop_report_reply_id)
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


CREATE TABLE role_groups
(
	-- 역할그룹 번호 
	role_group_id int(5) NOT NULL AUTO_INCREMENT COMMENT '역할그룹 번호 ',
	-- 역할 그룹 이름
	role_group_name varchar(300) COMMENT '역할 그룹 이름',
	-- 역할 그룹 설명
	role_group_info  text COMMENT '역할 그룹 설명',
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
	-- 세부 역할
	detail_role int(11) COMMENT '세부 역할',
	-- 1:create 2:read 3:update 4:delete
	crud int(11) COMMENT '1:create 2:read 3:update 4:delete',
	PRIMARY KEY (role_group_and_detail_id)
);


CREATE TABLE sector
(
	-- 업종번호
	sector_id int(11) NOT NULL AUTO_INCREMENT COMMENT '업종번호',
	-- 업종 이름
	-- 
	sector_content varchar(300) COMMENT '업종 이름
',
	PRIMARY KEY (sector_id)
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
	-- 읍면동 번호
	-- 
	id int(11) NOT NULL COMMENT '읍면동 번호
',
	-- 업종번호
	sector_id int(11) NOT NULL COMMENT '업종번호',
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
	representative varchar(300) NOT NULL COMMENT '대표자 이름
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
	-- 위도 
	-- 
	latitude varchar(300) COMMENT '위도 
',
	-- 경도
	longitude varchar(300) COMMENT '경도',
	-- 주소
	-- 
	address varchar(300) COMMENT '주소
',
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
	-- 관리자 메모
	responsibility_memo varchar(300) COMMENT '관리자 메모',
	-- 반려 사유 
	return_reason varchar(300) COMMENT '반려 사유 ',
	-- 영업상태
	-- 1 : 영업중
	-- 2 : 휴업중
	business_status int(11) COMMENT '영업상태
1 : 영업중
2 : 휴업중',
	-- 드리는 혜택
	to_benefit varchar(300) COMMENT '드리는 혜택',
	-- 휴일 
	-- 
	holiday varchar(300) COMMENT '휴일 
',
	-- 소개 문구
	intro_ph varchar(300) COMMENT '소개 문구',
	-- 최근 접속일
	-- 
	recent_access timestamp COMMENT '최근 접속일
',
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
	-- 회원코드
	member_id int(11) NOT NULL COMMENT '회원코드',
	shop_idx int(11) NOT NULL,
	-- 요청일
	-- 
	regdate timestamp COMMENT '요청일
',
	-- 승인일
	-- 
	appro_date timestamp COMMENT '승인일
',
	-- 최근 접속일
	recent_access timestamp COMMENT '최근 접속일',
	-- 활성 상태 
	-- 1 : 활성 / 2 : 삭제
	-- 
	active_status int(5) COMMENT '활성 상태 
1 : 활성 / 2 : 삭제
',
	-- 처리자
	-- 
	prosessor varchar(300) COMMENT '처리자
',
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
	-- 조회수
	view_count int(11) COMMENT '조회수',
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
	regdate timestamp,
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


CREATE TABLE shop_penalty
(
	-- 가게 패널티 번호 
	shop_penalty_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 패널티 번호 ',
	shop_idx int(11) NOT NULL,
	-- 패널티 상태
	-- 1:경고
	-- 2:정지
	-- 3:차단
	panalty_name  int(5) COMMENT '패널티 상태
1:경고
2:정지
3:차단',
	-- 패널티 구분
	-- 1:  계정 / 2: 상품 / 3: 채팅 / 4: 게시글
	penalty_sort int(5) COMMENT '패널티 구분
1:  계정 / 2: 상품 / 3: 채팅 / 4: 게시글',
	-- 발견경로 
	-- 
	discovery_path varchar(300) COMMENT '발견경로 
',
	-- 패널티 사유 
	reason varchar(300) COMMENT '패널티 사유 ',
	-- 패널티 취소 사유
	cancel_reason varchar(300) COMMENT '패널티 취소 사유',
	-- 패널티 처리자
	register varchar(100) COMMENT '패널티 처리자',
	-- 패널티 등록 날짜
	-- 
	startDate timestamp COMMENT '패널티 등록 날짜
',
	-- 패널티 종료 날짜
	-- 
	endDate timestamp COMMENT '패널티 종료 날짜
',
	-- 등록일
	regdate timestamp COMMENT '등록일',
	-- 1 : 적용 / 2 : 해지
	-- 
	state int(5) COMMENT '1 : 적용 / 2 : 해지
',
	PRIMARY KEY (shop_penalty_id)
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
	-- 후기 날짜
	regdate timestamp COMMENT '후기 날짜',
	-- 도움이 돼요
	review_like int(11) COMMENT '도움이 돼요',
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
	-- 이미지 타입
	type varchar(300) COMMENT '이미지 타입',
	PRIMARY KEY (shop_review_image_id)
);


CREATE TABLE shop_update_list
(
	-- 가게 수정 이력 번호
	-- 
	shop_update_list_id int(11) NOT NULL AUTO_INCREMENT COMMENT '가게 수정 이력 번호
',
	shop_idx int(11) NOT NULL,
	-- 수정 일자
	-- 
	regdate timestamp COMMENT '수정 일자
',
	-- 수정 항목
	-- 1 : 가입상태 / 2: 가게프로필 / 3:기본정보 / 4:가격표 / 5 : 매니저
	update_category int(11) COMMENT '수정 항목
1 : 가입상태 / 2: 가게프로필 / 3:기본정보 / 4:가격표 / 5 : 매니저',
	-- 수정 종류 (가입상태) 1: 정상 / 탈퇴 (가게 프로필) 2 : 가게명 , 3:등록지역 , 4:키워드 , 5:대표 이미지 (기본 정보) 6: 주소 , 7:전화번호 , 8 : 영업시간 , 9: 홈페이지 , 10: 소개문구 , 11: 회원혜택 , 12: 알림 (가격표) 13 : 추가 / 삭제(매니저) 14 : 추가 / 삭제
	--   
	update_kind int(11) COMMENT '수정 종류 (가입상태) 1: 정상 / 탈퇴 (가게 프로필) 2 : 가게명 , 3:등록지역 , 4:키워드 , 5:대표 이미지 (기본 정보) 6: 주소 , 7:전화번호 , 8 : 영업시간 , 9: 홈페이지 , 10: 소개문구 , 11: 회원혜택 , 12: 알림 (가격표) 13 : 추가 / 삭제(매니저) 14 : 추가 / 삭제
  ',
	-- 수정 전
	update_before varchar(300) COMMENT '수정 전',
	-- 수정 후 
	update_after  varchar(300) COMMENT '수정 후 ',
	-- 처리자
	-- 
	register varchar(300) COMMENT '처리자
',
	PRIMARY KEY (shop_update_list_id)
);



/* Create Foreign Keys */

ALTER TABLE manager_and_additional_role
	ADD FOREIGN KEY (addtional_role_id)
	REFERENCES additional_role (addtional_role_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE member
	ADD FOREIGN KEY (id)
	REFERENCES area_dong (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE shop
	ADD FOREIGN KEY (id)
	REFERENCES area_dong (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE franchise
	ADD FOREIGN KEY (id)
	REFERENCES area_sigun (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE exhi_sub
	ADD FOREIGN KEY (direct_transaction_id)
	REFERENCES direct_transaction (direct_transaction_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE exhi_sub
	ADD FOREIGN KEY (exhi_id)
	REFERENCES exhi (exhi_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE exhi
	ADD FOREIGN KEY (exhi_category_id)
	REFERENCES exhi_category (exhi_category_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE exhi
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE franchise_domain
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE franchise_respon
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE manager_and_franchise
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE member
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE notice_and_franchise
	ADD FOREIGN KEY (franchise_id)
	REFERENCES franchise (franchise_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE report
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


ALTER TABLE frequent_question
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE manager_access
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE manager_and_additional_role
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE manager_and_franchise
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE manager_and_pro
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE manager_notice
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE notice
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE question_answer
	ADD FOREIGN KEY (franchise_manager_id)
	REFERENCES franchise_manager (franchise_manager_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE report_reply
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


ALTER TABLE notice_and_franchise
	ADD FOREIGN KEY (manager_notice_id)
	REFERENCES manager_notice (manager_notice_id)
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


ALTER TABLE member_update_list
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


ALTER TABLE report
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


ALTER TABLE shop_review
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE notice_image
	ADD FOREIGN KEY (notice_id)
	REFERENCES notice (notice_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE pro_sub_category
	ADD FOREIGN KEY (pro_category_id)
	REFERENCES pro_category (pro_category_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE manager_and_pro
	ADD FOREIGN KEY (pro_sub_category_id)
	REFERENCES pro_sub_category (pro_sub_category_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE question_answer
	ADD FOREIGN KEY (question_id)
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


ALTER TABLE report_image
	ADD FOREIGN KEY (report_id)
	REFERENCES report (report_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE report_reply
	ADD FOREIGN KEY (report_id)
	REFERENCES report (report_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE report
	ADD FOREIGN KEY (report_categoris_id)
	REFERENCES report_categoris (report_categoris_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE report
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


ALTER TABLE shop
	ADD FOREIGN KEY (sector_id)
	REFERENCES sector (sector_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE direct_transaction
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE exhi_sub
	ADD FOREIGN KEY (shop_idx)
	REFERENCES shop (shop_idx)
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


ALTER TABLE shop_penalty
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


ALTER TABLE shop_update_list
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


ALTER TABLE news_comments_reply
	ADD FOREIGN KEY (shop_news_comments_id)
	REFERENCES shop_news_comments (shop_news_comments_id)
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



