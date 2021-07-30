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
<title>Document</title>
</head>
<body>
<!--   HM008 - 가게홍보 - 상세리스트 - 3.큐레이션 영역 <더보기> 상세-->
   <section id="HM008_3" class="content">
      
       <div class="box title_box">
            <div class="icon"><a href="${root}/front/shop/shop_promotion"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">카달로그 서비스</h1>
            
        </div>
         <div class="box top_box">
                <div class="place_btn"><a href="">지역▼</a></div>
                <ul class="recom">
                    <li><a href="">1단</a></li>
                    <li><a href="">2단</a></li>
                    <li><a href="">필터<span><i class="fas fa-filter"></i></span></a></li>
                </ul>
            </div>
            <div class="banner">
<!--                 <p class="txt">큐레이션 명(or배너) 노출</p> -->
                <p class="txt">${search}</p>
            </div>
            <div class="inner">
            <div class="sub_box">

                    <div class="pic">
	                    	<img src="${root}/upload/22.jpg" width="100%" height="100%">
	                </div>
                    <div class="info">
                        <ul class="sub_info sub_info_1">
                            <li>휘연</li>
                            <li>반포면</li>
                            <li>영업중</li>
                        </ul>
                        <ul class="sub_info sub_info_2">
                            <li>까페/영업시간</li><br>
                            <li>매일</li>
                            <li>11&#58;00&#126;21&#58;00</li>
                        </ul>
                        <ul class="sub_info sub_info_3">
                            <li>후기</li>
                            <li>000</li><br>
                            <li>즐겨찾기</li>
                            <li>000</li>
                        </ul>
                    </div>
                </div>
                <div class="sub_box">

                    <div class="pic">
	                    	<img src="${root}/upload/11.jpg" width="100%" height="100%">
	                </div>
                    <div class="info">
                        <ul class="sub_info sub_info_1">
                            <li>휘연</li>
                            <li>반포면</li>
                            <li>영업중</li>
                        </ul>
                        <ul class="sub_info sub_info_2">
                            <li>까페/영업시간</li><br>
                            <li>매일</li>
                            <li>11&#58;00&#126;21&#58;00</li>
                        </ul>
                        <ul class="sub_info sub_info_3">
                            <li>후기</li>
                            <li>000</li><br>
                            <li>즐겨찾기</li>
                            <li>000</li>
                        </ul>
                    </div>
                </div>
                <div class="sub_box">

                    <div class="pic">
	                    	<img src="${root}/upload/33.jpg" width="100%" height="100%">
	                </div>
                    <div class="info">
                        <ul class="sub_info sub_info_1">
                            <li>휘연</li>
                            <li>반포면</li>
                            <li>영업중</li>
                        </ul>
                        <ul class="sub_info sub_info_2">
                            <li>까페/영업시간</li><br>
                            <li>매일</li>
                            <li>11&#58;00&#126;21&#58;00</li>
                        </ul>
                        <ul class="sub_info sub_info_3">
                            <li>후기</li>
                            <li>000</li><br>
                            <li>즐겨찾기</li>
                            <li>000</li>
                        </ul>
                    </div>
                </div>
                <div class="sub_box">

                    <div class="pic">
	                    	<img src="${root}/upload/44.jpg" width="100%" height="100%">
	                </div>
                    <div class="info">
                        <ul class="sub_info sub_info_1">
                            <li>휘연</li>
                            <li>반포면</li>
                            <li>영업중</li>
                        </ul>
                        <ul class="sub_info sub_info_2">
                            <li>까페/영업시간</li><br>
                            <li>매일</li>
                            <li>11&#58;00&#126;21&#58;00</li>
                        </ul>
                        <ul class="sub_info sub_info_3">
                            <li>후기</li>
                            <li>000</li><br>
                            <li>즐겨찾기</li>
                            <li>000</li>
                        </ul>
                    </div>
                </div>
                <div class="sub_box">

                    <div class="pic">
	                    	<img src="${root}/upload/66.jpg" width="100%" height="100%">
	                </div>
                    <div class="info">
                        <ul class="sub_info sub_info_1">
                            <li>휘연</li>
                            <li>반포면</li>
                            <li>영업중</li>
                        </ul>
                        <ul class="sub_info sub_info_2">
                            <li>까페/영업시간</li><br>
                            <li>매일</li>
                            <li>11&#58;00&#126;21&#58;00</li>
                        </ul>
                        <ul class="sub_info sub_info_3">
                            <li>후기</li>
                            <li>000</li><br>
                            <li>즐겨찾기</li>
                            <li>000</li>
                        </ul>
                    </div>
                </div>
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
</body>
</html>