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
<title>Document</title>
</head>
<body>
	<!--33페이지 - #BZ001-TB04 가게 프로필 TAB – 후기-->
	<section id="BZ001-TB04" class="content">
	    <div class="box title_box">
            <div class="icon"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가게프로필명</h1>
	    </div>
	    <ul id="gnb">
	        <li><a href="">소개</a></li>
	        <li><a href="">소식</a></li>
	        <li><a href="">상품<span>8</span></a></li>
	        <li><a href="">후기<span>9</span></a></li>
	    </ul>
	    <div class="top_btn"><a href="">후기 작성하기</a></div>
	    <div class="big_box">
	        <div class="box box_1">
	            <div class="pic"></div>
	            <div class="info">
	                <div class="sub_box_1"><p>둘기<span>HOLIC</span></p></div>
	                <ul class="sub_box_2">
	                    <li><p><i class="fas fa-pencil-alt"></i><span>786</span></p></li>
	                    <li><p><i class="fas fa-user-friends"></i><span>112</span></p></li>
	                </ul>
	            </div>
	            <ul class="box right_box">
	                <li><p>방금전</p></li>
	                <li><a href=""><i class="fas fa-ellipsis-v"></i></a></li>
	            </ul>
	        </div>    
	        <ul class="box txt_box">
	            <li><p>짜장면 없는 중식당, 엘벧엘</p></li>
	            <li><p>아직은 회색이지만 높은 평점에 너무 궁금해져 다녀온 곳. 제<br>평가로 확정 평점이 생겼으면 하는 마음입니다 ㅎ.ㅎ</p><br>...</li>
	        </ul>
	        <div class="box swiper-container">
	            <div class="swiper-wrapper">
	                <div class="swiper-slide"></div>
	                <div class="swiper-slide"></div>
	                <div class="swiper-slide"></div>
	            </div>
	        </div>
	        <ul class="box thumb_box">
	            <li><a href=""><i class="far fa-thumbs-up"></i></a></li>
	            <li><p>좋아요</p></li>
	            <li><p>3</p></li>
	            <li class="slash"><p>/</p></li>
	            
	            <li><p>조회</p></li>
	            <li><p>999</p></li>
	        </ul>
	    </div>
	</section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
</body>
</html>