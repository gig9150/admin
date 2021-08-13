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
	<input type="hidden" name="shopName" value="${detailMap.shop_name}">
	<!--BZ001-DC01_2 - 소식 - 게시글 신고하기 - 신고하는 이유(2)-->
    <section id="BZ001-DC01_2" class="content">
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}"><i class="fas fa-times"></i></a></div>
            <h1 class="title">가게프로필 신고</h1>
        </div>
        
           <div class="box box_1">
                <div class="pic"><img src="${root}/upload/${image}" style="width:100%;height:100%;border-radius:inherit;"></div>
                <div class="info">
                    <div class="sub_box"><p>${name}</p></div>
                    <div class="sub_box"><p>${areaName}</p></div>
                </div>

            </div>
           <div class="box box_1">
                <div class="pic"><img src="${root}/upload/${detailMap.main_image}" style="width:100%;height:100%;border-radius:inherit;"></div>
                <div class="info">
                    <div class="sub_box"><p>${detailMap.shop_name}</p></div>
                    <div class="sub_box"><p>${detailMap.area_name}</p></div>
                </div>

            </div>
            <div class="inner">
            <h1 class="small_box title_2">신고하는 이유를 간략하게 알려주세요.</h1>
            <div class="small_box enter_box">
                <p class="ex">기타</p>
                <div class="enter" style="padding:0px;">
                	<input name="content" placeholder="신고 내용을 입력해주세요." type="text" 
                	style="width:100%;height:100%">
                </div>
                <p class="limit">글자수 제한(0/300)</p>
            </div>
            <div class="small_box btn"><button style="width: 100%;
											    height: 100%;
											    background: #78a6d8;border: none;color: #ffffff;font-size: 14px;
    font-weight: bold;">카달로그 서비스팀에게 보내기</button></div>
        </div>
        <div class="box bottom_box">
            <div class="box">
                <div class="pic"><i class="fas fa-home"></i></div>
                <div class="info"><a href="${root}/front/shop/shop_promotion">홈</a></div>
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
                <div class="info"><a href="${root}/front/myPage">MY</a></div>
            </div>
        </div>
    </section>
</form>
</body>
</html>