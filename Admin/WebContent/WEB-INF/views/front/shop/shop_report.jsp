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
<form action="${root}/front/shop/shop_report_success" type="post">
	<input type="hidden" name="status" value="${status}">
	<input type="hidden" name="reportCategoryId" value="${reportCategoryId}">
	<input type="hidden" name="shopIdx" value="${shopIdx}">
	<section id="BZ026_4" class="content">
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/shop/shop_report_category"><i class="fas fa-arrow-left"></i></a></div>
            <h1 class="title">가게 신고</h1>
        </div>
        <div class="inner">
            <h1 class="small_box title_2">신고하는 이유를 간략하게 알려주세요.</h1>
            <div class="small_box enter_box">
                <p class="ex">기타</p>
                <div class="enter">
	                <textarea style="width:100%;height:100%;border:none;" name="content" placeholder="신고 내용을 입력해주세요."></textarea>
                	<p class="txt"></p>
                </div>
                <p class="limit">글자수 제한(0/300)</p>
            </div>
            <div class="small_box btn"><button type="submit">신고하기</button></div>
        </div>
    </section>
</form>
</body>
</html>