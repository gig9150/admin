<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<style>

	.btn{
		width:100%;
		margin:20px 0;
	}
	
	.box .pic{
		border-radius: 0px !important;
	
	}
	
	.box .pic img{
	
		width: 100%;
		height:100%;
		
	}
	
	.btn a {
        display: block;
	    width: 100%;
	    height: 36px;
	    line-height: 36px;
	    text-align: center;
	    color: #4472c4;
	    background-color: #ffffff;
	    border-radius: 5px;
	    border: 1px solid #4472c4;
	}

</style>
</head>
<body>
	<!--    101페이지 #BZ002-DG01 가게프로필 - 단골-->
    <section id="BZ002-DG01" class="content">
        <div class="top">
            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">단골목록</h1>
        </div>
        <div class="profile">
        	<c:forEach items="${list}" var="obj">
	            <div class="box">
	                <div class="pic">
	                	<img src="${root}/upload/${obj.imageList[0]}">
	                </div>
	                <ul class="info">
	                    <li>${obj.title}</li>
	                    <li><span stlye="font-weight: bold;">좋아요</span>&nbsp;${obj.likeCnt}</li>
	                </ul>
	            </div>
        	</c:forEach>
              
            <div class="btn">
            	<a href="${root}/front/mypage/shop_news?shopIdx=${shopIdx}">소식 더 보기</a>
            </div>
        </div>
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