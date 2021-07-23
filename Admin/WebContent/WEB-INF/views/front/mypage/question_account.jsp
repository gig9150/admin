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
	<!--    59페이지 - #MY001-QA02 마이페이지_1:1문의_문의내역보기-->
    <section id="MY001-QA02" class="content">
        <div class="top">
            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">1:1 문의 작성하기</h1>
        </div>
	        <c:forEach items="${questionList}" var="obj">
	        	<div class="box box1">
	               <div class="toggle_top">
	                    <div class="title_box">
	                        <div class="title_left">
	                             <h2>${obj.question_content}</h2>
	                             <c:choose>
	                             	<c:when test="${obj.answer_status eq 2}">
		                             	<p class="answer">답변 전</p>
	                             	</c:when>
	                             	<c:otherwise>
	                             		<p class="answer">답변 완료</p>
	                             	</c:otherwise>
	                             </c:choose>
	                         </div>
	                        <div class="title_right">
	                            <a class="btn btn1" href="javascript:void(0)"><i class="fas fa-chevron-down"></i></a>
	                        </div>
	                    </div>
	                    <div class="title_txt">
	                        <p class="txt">${obj.content }</p>
	                    </div>
	                </div>
	                <div class="toggle_bottom">
	                    <div class="txt_box">
	                        <p>문의 내용이 전체 노출됨<br>문의 내용이 전체 노출됨<br>문의 내용이 전체 노출됨</p>
	                    </div>
	                    <div class="answer_box">
	                        <p>답변 완료</p>
	                    </div>
	                    <div class="bottom_box">
	                        <h2>A</h2>
	                        <P>문의에 대한 답변이 노출됨<br>문의에 대한 답변이 노출됨<br>문의에 대한 답변이 노출됨</P>
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
        </section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
</body>
</html>