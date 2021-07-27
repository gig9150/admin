<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="HHmm" /></c:set> 
<c:set var="day"><fmt:formatDate value="${today}" pattern="E"/></c:set>
<fmt:parseNumber var="date_N" value="${date}" integerOnly="true"/>
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
	<!--56페이지 - #MY001-RV00 - 마이페이지_후기목록-->
    <section id="MY001-RV00" class="content">
        <div class="top">
            <div class="icon"><a href=""><img src="./img/left.png" alt=""></a></div>
            <h1 class="profile">후기 목록</h1>
        </div>
        
        <div class="inner">
        	<c:forEach items="${reviewList}" var="obj">
        		<fmt:parseNumber var="startDate_N" value="${obj.start_date}" integerOnly="false"/>
                <fmt:parseNumber var="endDate_N"  value="${obj.end_date}" integerOnly="false" />
	            <div class="sub_box">
	                <div class="pic">
	                	<img src="${root}/upload/${obj.main_image}" style="width:100%;height:100%;">
	                </div>
	                <div class="info">
	                    <ul class="sub_info sub_info_1">
	                        <li>${obj.shop_name }</li>
	                        <li>${obj.sector_content }</li>
	                        <c:choose>
                           		<c:when test="${date_N > startDate_N and date_N < endDate_N and obj2.holiday != day}">
                           			<li>영업중 </li>
                           		</c:when>
                           		<c:otherwise>
                           			<li>영업종료</li>
                           		</c:otherwise>
                           	</c:choose>
	                    </ul>
	                    
	                    <ul class="sub_info sub_info_2">
	                        <li>${obj.sector_content} / 영업시간</li><br>
	                        <li>${obj.holiday} 휴무 </li><br>
                            <li>${fn:substring(startDate_N,0,2)}:${fn:substring(startDate_N,2,4)} ~ ${fn:substring(endDate_N,0,2)}:${fn:substring(endDate_N,2,4)}</li>
	                    </ul>
	                    
	                    <ul class="sub_info sub_info_3">
	                        <li><i class="far fa-comment"></i></li>
	                        <li>${obj.review_count}</li><br>
	                        <li><i class="fas fa-heart"></i></li>
	                        <li>${obj.bookmark_count}</li>
	                    </ul>
	                    
	                </div>
	                <div class="review_box">
	                    <a href="">내가 남긴 후기</a>
	                </div>
	            </div>
        	</c:forEach>
            
            

        </div>
        <div class="box bottom_box">
            <div class="box">
                <div class="pic"><i class="fas fa-home"></i></div>
                <div class="info"><a href="">홈</a></div>
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
                <div class="info"><a href="">MY</a></div>
            </div>
        </div>
    </section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
</body>
</html>