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
     <!--    59페이지 - #MY001-QA02 마이페이지_1:1문의_문의내역보기-->
    <section id="MY001-QA02" class="content">
        <div class="top">
            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">나의 문의내역 보기</h1>
        </div>
        <c:forEach items="${questionList}" var="obj" varStatus="status">
	        <div class="box box1">
	            <div class="toggle_top">
	                <div class="title_box">
	                    <div class="title_left">
	                        <h2>${obj.content}</h2>
	                        <c:choose>
	                        	<c:when test="${obj.answer_status eq 1}">
	                        		<p class="answer">답변완료</p>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<p class="answer">답변 전</p>
	                        	</c:otherwise>
	                        </c:choose>
	                    </div>
	                    <div class="title_right">
	                        <a class="btn btn1" href="javascript:void(0)"><i class="fas fa-chevron-down"></i></a>
	                    </div>
	                </div>
	                <div class="title_txt">
	                    <p class="txt" style="width:80%;  overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${obj.question_content}</p>
	                </div>
	            </div>
	            <div class="toggle_bottom">
	                <div class="txt_box">
	                    <p>${obj.question_content}</p>
	                </div>
	                <div class="answer_box">
	               	
	                </div>
	                <div class="bottom_box">
	                    <h2>A</h2>
	                    <P>${obj.apply}</P>
	                </div>
	            </div>
	        </div>
        </c:forEach>
        
    </section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
	
	<script>
	
       	$(function(){
       		$('.title_right .btn i').click(function(){
       			console.log('ㅇㅋㅇㅋ');
       			
       			if($(this).hasClass('fa-chevron-down')){
       				$(this).parent().parent().parent().next().css('display','none');
       				$(this).parent().parent().parent().parent().next().css('display','block');
       				$(this).removeClass('fa-chevron-down').addClass('fa-chevron-up');
       			}else{
       				$(this).parent().parent().parent().next().css('display','block');
       				$(this).parent().parent().parent().parent().next().css('display','none');
       				$(this).removeClass('fa-chevron-up').addClass('fa-chevron-down');
       			}
       		});
       		
       	});
       
	</script>	
</body>
</html>