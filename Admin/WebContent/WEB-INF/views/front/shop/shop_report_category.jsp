<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${root}/css/style.css">
<link rel="stylesheet" href="${root}/css/wo.css">
<title>Document</title>
</head>
<body>
    <section id="BZ026_3" class="content">
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/shop/shop_promotion"><i class="fas fa-times"></i></a></div>
            <h1 class="title">동네 소식 신고</h1>
        </div>
        <div class="inner">
            <ul class="cause">
            	<li>신고하려는 이유를 선택해주세요.</li>
            	<c:forEach items="${categoryList}" var="obj">
            		<c:choose>
            			<c:when test="${obj.report_category_id eq 5}">
            				<li><a href="${root}/front/shop/shop_report?status=${status}&shopIdx=${shopIdx}&reportCategoryId=${obj.report_category_id}">${obj.category_content}<span><i class="fas fa-chevron-right"></i></span></a></li>
            			</c:when>
            			<c:otherwise>
            				<li><a class="categorySelect" href="${root}/front/shop/shop_report_success?status=${status}&shopIdx=${shopIdx}&reportCategoryId=${obj.report_category_id}" 
            				data-report-category-id="${obj.report_category_id}">${obj.category_content}</a></li>
            			</c:otherwise>
            		</c:choose>
            	</c:forEach>
            </ul>
        </div>
    </section>
</body>
<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script>

// 	$(function(){
// 		$('.categorySelect').on('click',function(){
			
// 			const reportCategoryId = $(this).data('reportCategoryId');
			
// 		});
// 	});
	
</script>
</html>