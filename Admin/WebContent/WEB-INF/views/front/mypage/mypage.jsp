<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style>
	#MY001 .box a{
		color:#000;
	}

</style>
<title>Document</title>
</head>
<body>
	<!--#MY001 (하단바)마이페이지-->
    <section id="MY001" class="content">
        <div class="box top">
            <div class="icon_right"><a href=""><i class="fas fa-cog"></i></a></div>
            <h1 class="title">마이페이지</h1>
        </div>
        <div class="box box_1">
            <div class="pic">
            	<img src="${root}/upload/${mainImage}" style="width:100%;height:100%;border-radius:inherit;">
                <label for="file_box"><i class="fas fa-camera"></i></label>
                <input type="file" id="file_box">
            </div>
            <div class="info">
                <p class="name">${name}</p>
                <p class="txt_box">
                    <span>${areaName}</span><span>&#35;${memberCode}</span>
                </p>
            </div>
        </div>
        <div class="inner">
            <div class="box box_2">
                <a href="${root}/front/member/member_update">회 원 정 보 수 정</a>
            </div>
        </div>
        <div class="box box_3">
            <div class="box_3_box">
                <div class="pic">
                    <a href=""><i class="fab fa-sellcast"></i></a>
                </div>
                <div class="info">
                    <p>찜목록</p>
                </div>
            </div>
            <div class="box_3_box">
                <div class="pic">
                    <a href="${root}/front/mypage/bookmark"><i class="fab fa-sellcast"></i></a>
                </div>
                <div class="info">
                    <p>단골목록</p>
                </div>
            </div>
            <div class="box_3_box">
                <div class="pic">
                    <a href="${root}/front/mypage/my_review"><i class="fas fa-shopping-basket"></i></a>
                </div>
                <div class="info">
                    <p>후기목록</p>
                </div>
            </div>
            <div class="box_3_box">
                <div class="pic">
                    <a href=""><i class="fas fa-heart"></i></a>
                </div>
                <div class="info">
                    <p>찜목록</p>
                </div>
            </div>
        </div>

        <div class="box box_4">
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-house-user"></i></a>
                </div>
                <div class="info">
                    <p>나의 판매내역</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-bullhorn"></i></a>
                </div>
                <div class="info">
                    <p>나의 구매내역</p>
                </div>
            </div>

        </div>

        <div class="box box_5">
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-map-marker-alt"></i></a>
                </div>
                <div class="info">
                    <p>나의 일상글목록</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-crosshairs"></i></a>
                </div>
                <div class="info">
                    <p>나의 댓글 목록</p>
                </div>
            </div>
       </div>


        <div class="box box_7">
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fab fa-sellcast"></i></a>
                </div>
                <div class="info">
                	<a href="${root}/front/mypage/shop_apply"><p>가게프로필 신청하기</p></a>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="far fa-edit"></i></a>
                </div>
                <div class="info">
                    <p id="shop-btn">가게프로필 입장하기</p>
                </div>
            </div>
        </div>

        <div class="box box_8">
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-tag"></i></a>
                </div>
                <div class="info">
                    <p>키워드알림 등록</p>
                </div>
            </div>
        </div>
        <div class="box box_10">    
            <div class="small_box">
                <div class="pic">
                    <i class="fas fa-cog"></i>
                </div>
                <div class="info">
                    <a href="${root}/front/mypage/withdrawal"><p>회원탈퇴</p></a>
                </div>
            </div>
        </div>
         <div class="box bottom_box">
            <div class="box">
                <div class="pic"><i class="fas fa-home"></i></div>
                <div class="info"><a href="${root}/front/shop/shop_promotion">홈</a></div>
            </div>
            <div class="box">
                <div class="pic"><i class="far fa-heart"></i></div>
                <div class="info"><a href="">찜</a></div>
            </div>
            <div class="box">
                <div class="pic"><i class="far fa-edit"></i></div>
                <div class="info"><a href="">글쓰기</a></div>
            </div>
            <div class="box">
                <div class="pic"><i class="far fa-comment-dots"></i></div>
                <div class="info"><a href="">채팅</a></div>
            </div>
            <div class="box">
                <div class="pic"><i class="far fa-user"></i></div>
                <div class="info"><a href="${root}/front/myPage">MY</a></div>
            </div>
        </div>
        
         <div class="profile">
           	<c:forEach items="${shopList}" var="obj">	
	           	<div class="box" data-id="${obj.shop_idx}">
	             	<div class="pic">
	             		<img src="${root}/upload/${obj.main_image}" style="width:100%;height:100%;border-radius:50%">
	             	</div>
	                <ul class="info">
	                    <li>${obj.shop_name}</li>
	                    <li>${obj.area_name}</li>
	                </ul>
	           	</div>
           	</c:forEach>
        </div>
    </section>
    
    
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
	<script>
	
		
		$(function(){
			
			//가게 프로필 목록
			$('#shop-btn').click(function(){
				$('#MY001').addClass('on');
			});
			
			//가게 입장
			$('.profile .box').click(function(){
				
				let shopIdx = $(this).data('id');
				location.href="${root}/front/mypage/shop?shopIdx="+shopIdx;
				
			});
			
		});
	
	</script>
	
</body>
</html>