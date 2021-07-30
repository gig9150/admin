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
	<!--    86페이지(6/30일 파일) - #BZ002-TB01-B - 가게프로필 탭 – 소개 (가격표) _ 가격표생성하기-->
    <section id="BZ002-TB01-B" class="content">
        <div class="top">
            <div class="icon_left"><a href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가격표 관리하기</h1>
        </div>
        <c:forEach items="${list}" var="obj">
	        <div class="box box1">
	            <div class="pic"><a href=""><i class="fas fa-bars"></i></a></div>
	            <div class="info">
	                <ul>
	                    <li>${obj.name}</li>
	                   	<c:choose>
	                   		<c:when test="${empty obj.price}">
	                   			<li>${obj.min_price}</li>
	                   		</c:when>
	                   		<c:otherwise>
	                   			<li>${obj.price}</li>
	                   		</c:otherwise>
	                   	</c:choose>
	                    <li>${obj.additional_info}</li>
                    	<c:if test="${obj.best eq 1}">
                    		<li>best</li>
                    	</c:if>
	                </ul>
	                <div class="info_btn"><a href="${root}/front/mypage/goods_update?goodsId=${obj.goods_id}&shopIdx=${shopIdx}">수정</a></div>
	            </div>
	        </div>
        </c:forEach>
        <div class="btn"><a href="${root}/front/mypage/goods_add?shopIdx=${shopIdx}">가격표 생성하기</a></div>
    </section>

    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="${root}/js/main.js"></script>
	
	
</body>
</html>