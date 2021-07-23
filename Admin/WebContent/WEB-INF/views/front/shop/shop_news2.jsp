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
	<!--    30페이지 - #BZ001-TB02 가게 프로필 TAB – 소식-->
	<section id="BZ001-TB02" class="content">
	    <div class="box title_box">
	            <div class="icon"><a href=""><i class="fas fa-chevron-left"></i></a></div>
	            <h1 class="title">당근마켓 서비스</h1>
	
	    </div>
	    <ul id="gnb">
	        <li><a href="">소개</a></li>
	        <li><a href="">소식</a></li>
	        <li><a href="">상품<span>8</span></a></li>
	        <li><a href="">후기<span>9</span></a></li>
	    </ul>
	    <c:forEach items="${list}" var="obj">
		    <div class="box box_1">
		        <div class="pic"></div>
		        <div class="info">
		            <div class="sub_box"><p>${detailMap.shop_name}</p></div>
		            <div class="sub_box"><p>${detailMap.area_name}<span>/</span>${obj.regdate}</p></div>
		        </div>
		    </div>    
		    <ul class="box btn">
		        <li><a href="">${obj.cate_content}</a></li>
	<!-- 	        <li><a href="">쿠폰</a></li> -->
		    </ul>
		    <a href="${root}/front/shop/shop_news_extend2?shopIdx=${detailMap.shop_idx}&shopNewsId=${obj.shop_news_id}">
			    <ul class="box txt_box">
			        <li><p>${obj.title }</p></li>
			        <li><p>${obj.content}</p></li>
			    </ul>
			    <div class="box swiper-container">
			        <div class="swiper-wrapper">
			            <c:forEach items="${obj.imageList}" var="obj2">
				            <div class="swiper-slide"><img src="${root}/upload/${obj2}" style="width::100%;height:100%"></div>
			            </c:forEach>		            	
			        </div>
			    </div>
			</a>
		    <ul class="box thumb_box">
		        <li><a href=""><i class="far fa-thumbs-up"></i></a></li>
		        <li><p>좋아요</p></li>
		        <li><p>${obj.likeCnt }</p></li>
		        <li class="slash"><p>/</p></li>
		    
		        <li><p>조회</p></li>
		        <li><p>${obj.view_count}</p></li>
		    </ul>
		</c:forEach>
	</section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
</body>
</html>