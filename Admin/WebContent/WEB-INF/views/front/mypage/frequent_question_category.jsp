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
	<!--    60페이지 - #MY001-QA02-2 마이페이지_1:1문의_문의내역보기-->
    <section id="MY001-QA02-2" class="content">
         <div class="box top">
            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">자주 묻는 질문</h1>
        </div>
        <div class="search_box">
            <div class="search">
                <input type="text" placeholder="질문 키워드를 검색해보세요.">
                <a href=""><i class="fas fa-search"></i></a>
            </div>
        </div>
        <table border= "2" width="100%" height="210" align="center" bordercolor="#e1e1e1" style="border-collapse:collapse;";>
        	<tr>
        	<c:forEach items="${categoryList}" var="obj" varStatus="status">
	            <td data-id="${obj.frequent_question_category_id}">${obj.content}</td>
	            <c:if test="${status.count % 3 == 0}">
	            	</tr>
	            	<tr>
	            </c:if>
        	</c:forEach>
        </table>
        <ul>
        </ul>
    </section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
	<script>
		$(function(){
			$('#MY001-QA02-2 td').click(function(){
				let id = $(this).data('id');
				$.ajax({
					url:'${root}/front/mypage/getFreTitle/'+id,
					type:'get',
					success:function(data){
						$('ul').empty();
						$.each(data,function(i,v){
							$('ul').append('<li><a href="${root}/front/mypage/frequent_question?frequentQuestionId='+v.frequent_question_id+'"><span>Q</span>'+v.title+'</a></li>');
						});
					}
				});
			});
		});
	
	</script>
</body>
</html>