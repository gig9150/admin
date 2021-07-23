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
	<!--58페이지 - #MY001-QA01  마이페이지_1:1문의_문의 작성하기-->
	<section id="MY001-QA01" class="content">
	    <div class="box top">
	        <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
	        <h1 class="title">1:1 문의</h1>
	    </div>
	    <ul class="list">
	        <li><a href="${root}/front/mypage/question_register">1:1 문의 작성하기</a></li>
	        <li><a href="${root}/front/mypage/question_account">나의 문의내역 보기</a></li>
	    </ul>
	</section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
</body>
</html>