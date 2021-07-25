<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${root}/css/style.css">
<link rel="stylesheet" href="${root}/css/wo.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="${root}/vendor/jquery/jquery.min.js"></script>
</head>
<body>
<!--    84페이지 - #BZ002-TB01-A 가게프로필 탭 - 소개 (가게정보관리)-->
  <section id="BZ002-TB01-A" class="content">
       <div class="top">
            <div class="icon_left"><a href=""><i class="fas fa-times"></i></a></div>
            <h1 class="title">라루체</h1>
            <div class="icon_right"><a href=""><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
        
        <div class="profile_top"><img src="" alt="">
        <a href="${root}/front/mypage/profile_update?shopIdx=${shopIdx}" style="position: absolute;right: 8px;">수정</a></div>
        <div class="profile_bottom">
            <ul class="left_box">
                <li>라루체</li>
                <li>반포면</li>
                <li>매일 11:30 ~ 22:00</li>
            </ul>
			
            <ul class="right_box" onclick="javascript:location.href='${root}/front/mypage/shop_bookmark?shopIdx=${shopIdx}'">
                <li><a href=""><i class="fas fa-plus"></i></a></li>
                <li>단골</li>
                <li>0</li>
            </ul>
        </div>

        <div class="call">
            <div class="call_left"><a href="">채팅관리</a></div>
            <div class="call_right"><a href="">매니저관리</a></div>
        </div>
        <ul id="gnb">
            <li><a href="">소개</a></li>
            <li><a href="">소식</a></li>
            <li><a href="">상품<span>8</span></a></li>
            <li><a href="">후기<span>9</span></a></li>
        </ul>
        <div class="big_box">
            <div class="box box1"> <!--가게 기본정보-->
                <h3 class="title">가게 기본정보</h3>
                <ul class="txt_box">
                    <li>[알림] - 별도 배너 (시안 전달예정)</li>
                    <li>소개문구</li>
                    <li>주소</li>
                    <li>영업시간</li>
                    <li>예1. 월~금 9:00~18:00(토,일 휴무)</li>
                    <li>예1. 월,수,목,토 9:30~18:30(화,금,일 휴무)</li>
                    <li>전화번호</li>
                    <li>홈페이지</li>
                    <li>옵션정보</li>
                    <li>[카달로그서비스 회원 혜택]</li>
                </ul>
                <div class="btn"><a href="${root}/front/mypage/shop_update?shopIdx=${shopIdx}">가게 정보 관리하기</a></div>
            </div>
             <div class="box box2">
                <h3 class="title">가격표</h3><!--가격표-->
                <div class="txt_box">
                    <div class="sub_box">
                        <div class="top_box">
                            <h4 class="sub_title">판매 상품 명</h4>
                            <p class="price">00,000원</p>
                        </div>
                        <div class="bottom_box"><p>세부 설명 영역</p></div>
                    </div>
                    <div class="sub_box">
                        <div class="top_box">
                            <h4 class="sub_title">판매 상품 명</h4>
                            <p class="price">00,000원</p>
                        </div>
                        <div class="bottom_box"><p>세부 설명 영역</p></div>
                    </div>
                    <div class="sub_box">
                        <div class="top_box">
                            <h4 class="sub_title">판매 상품 명</h4>
                            <p class="price">00,000원</p>
                        </div>
                        <div class="bottom_box"><p>BEST</p></div>
                    </div>
                    </div>
                <div class="btn"><a href="${root}/front/mypage/goods_manage?shopIdx=${shopIdx}">가격표 관리하기</a></div>
            </div>
            
             <div class="box box3">
                <h3 class="title">소식</h3><!--소식-->
                <div class="txt_box">
                   <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h4 class="info_title">등록 소식글 제목</h4>
                            <p class="thumb"><span><i class="far fa-thumbs-up"></i></span>좋아요&nbsp;3</p>
                        </div>
                    </div>
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h4 class="info_title">등록 소식글 제목</h4>
                            <p class="thumb"><span><i class="far fa-thumbs-up"></i></span>좋아요&nbsp;3</p>
                        </div>
                    </div>
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h4 class="info_title">등록 소식글 제목</h4>
                            <p class="thumb"><span><i class="far fa-thumbs-up"></i></span>좋아요&nbsp;3</p>
                        </div>
                    </div>
                </div>
                <div class="btn"><a href="">소식 더보기</a></div>
            </div>
            
             <div class="box box4">
                <h3 class="title">후기</h3>
                
                <div class="txt_box">
                    <div class="big_box">
                        <div class="small_box small_box_1">
                            <div class="pic"></div>
                            <div class="info">
                                <div class="sub_box_1"><p>둘기<span>HOLIC</span></p></div>
                                <ul class="sub_box_2">
                                    <li><p><i class="fas fa-pencil-alt"></i><span>786</span></p></li>
                                    <li><p><i class="fas fa-user-friends"></i><span>112</span></p></li>
                                </ul>
                            </div>
                            <ul class="right_box">
                                <li><p>방금전</p></li>
                                <li><a href=""><i class="fas fa-ellipsis-v"></i></a></li>
                            </ul>
                        </div>    
                        <ul class="small_box txt_box">
                            <li><p>짜장면 없는 중식당, 엘벧엘</p></li>
                            <li><p>아직은 회색이지만 높은 평점에 너무 궁금해져 다녀온 곳. 제<br>평가로 확정 평점이 생겼으면 하는 마음입니다 ㅎ.ㅎ</p><br>...</li>
                        </ul>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"></div>
                                <div class="swiper-slide"></div>
                                <div class="swiper-slide"></div>
                            </div>
                        </div>
                        <ul class="small_box thumb_box">
                            <li><a href=""><i class="far fa-thumbs-up"></i></a></li>
                            <li><p>좋아요</p></li>
                            <li><p>3</p></li>
                            <li class="slash"><p>/</p></li>

                            <li><p>조회</p></li>
                            <li><p>999</p></li>
                        </ul>
                    </div>
                </div>
                <div class="btn"><a href="">후기 관리하기</a></div>
            </div>
        </div>
    </section>

    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</body>
</html>