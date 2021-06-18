-- 역할 관리 디테일 insert 
INSERT INTO role_detail(NAME) VALUES('메인홈페이지 관리');
INSERT INTO role_detail(NAME) VALUES('가게홍보페이지 관리');
INSERT INTO role_detail(NAME) VALUES('기획전등록 관리');
INSERT INTO role_detail(NAME) VALUES('계정등록/수정');
INSERT INTO role_detail(NAME) VALUES('계정활동내역');
INSERT INTO role_detail(NAME) VALUES('계정 접속 내역');
INSERT INTO role_detail(NAME) VALUES('가게리스트');
INSERT INTO role_detail(NAME) VALUES('가게 신청 심사');
INSERT INTO role_detail(NAME) VALUES('쿠폰 관리');
INSERT INTO role_detail(NAME) VALUES('회원 관리');
INSERT INTO role_detail(NAME) VALUES('회원');
INSERT INTO role_detail(NAME) VALUES('가게');
INSERT INTO role_detail(NAME) VALUES('가게소식');
INSERT INTO role_detail(NAME) VALUES('산지직거래');
INSERT INTO role_detail(NAME) VALUES('중고장터');
INSERT INTO role_detail(NAME) VALUES('일상');
INSERT INTO role_detail(NAME) VALUES('일상댓글/답글');
INSERT INTO role_detail(NAME) VALUES('거래내역');
INSERT INTO role_detail(NAME) VALUES('후기내역');
INSERT INTO role_detail(NAME) VALUES('1:1문의 관리');
INSERT INTO role_detail(NAME) VALUES('신고문의 관리');
INSERT INTO role_detail(NAME) VALUES('FAQ 관리');
INSERT INTO role_detail(NAME) VALUES('공지사항 관리');

-- 최고 매니저
INSERT INTO manager_member(id,pw,name,level,send_url) VALUES('admin','1234','admin',10,'123');

-- franchise insert
insert into franchise(franchise_code,franchise_name,service_name) values('code','franchise','호빵팔아요');

-- role_groups 컬럼 변경 
ALTER TABLE  role_groups MODIFY registrar varchar(300)

-- additional_role insert
INSERT INTO additional_role(additional_role_name) VALUES('엑셀다운로드');
INSERT INTO additional_role(additional_role_name) VALUES('문의답변(수정)');
INSERT INTO additional_role(additional_role_name) VALUES('신고답변(수정)');
INSERT INTO additional_role(additional_role_name) VALUES('FAQ등록(수정))');
INSERT INTO additional_role(additional_role_name) VALUES('공지사항등록(수정)');
INSERT INTO additional_role(additional_role_name) VALUES('패널티적용(회원,가게 모두)');

