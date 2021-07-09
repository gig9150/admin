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
	<!--CA-MY000 마이페이지-->
    <section id="CA-MY000" class="content">
        <div class="box top">
            <div class="icon_right"><a href=""><i class="fas fa-cog"></i></a></div>
            <h1 class="title">나의 카달로그 </h1>
        </div>
        <div class="box box_1">
            <div class="pic">

            </div>
            <div class="info">
                <p class="name">남깐느</p>
                <p class="txt_box">
                    <span>동촌동</span><span>&#35;0502231</span>
                </p>
            </div>
        </div>
        <div class="inner">
            <div class="box box_2">
                <a href="${root}/front/member/member_update">회원 정보 수정 </a>
            </div>
        </div>
        <div class="box box_3">
            <div class="box_3_box">
                <div class="pic">
                    <a href=""><i class="fab fa-sellcast"></i></a>
                </div>
                <div class="info">
                    <p>단골목록</p>
                </div>
            </div>
            <div class="box_3_box">
                <div class="pic">
                    <a href=""><i class="fas fa-shopping-basket"></i></a>
                </div>
                <div class="info">
                    <p>후기목록</p>
                </div>
            </div>
            <div class="box_3_box">
                <div class="pic">
                    <a href=""><i class="fas fa-heart"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>
        </div>

        <div class="box box_4">
            <div class="small_box">
                <div class="pic">
                    <a href="${root}/front/shop/shop_apply"><i class="fas fa-house-user"></i></a>
                </div>
                <div class="info">
                    <p>가게 프로필 신청하기</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-bullhorn"></i></a>
                </div>
                <div class="info">
                    <p>가게 프로필 입장하기</p>
                </div>
            </div>

        </div>

        <div class="box box_5">
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-map-marker-alt"></i></a>
                </div>
                <div class="info">
                    <p>1:1 문의</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-crosshairs"></i></a>
                </div>
                <div class="info">
                    <p>자주묻는 질문 </p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-tag"></i></a>
                </div>
                <div class="info">
                    <p>공지사항</p>
                </div>
            </div>

        </div>

        <div class="box box_6">
            <div class="pic">
                <a href=""><i class="far fa-clone"></i></a>
            </div>
            <div class="info">
                <p>회원 탈퇴</p>
            </div>
        </div>

        <div class="box box_7">
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fab fa-sellcast"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="far fa-edit"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="far fa-star"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>

        </div>

        <div class="box box_8">
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="far fa-envelope"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-share-alt"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-microphone"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-headphones"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>
            <div class="small_box">
                <div class="pic">
                    <a href=""><i class="fas fa-cog"></i></a>
                </div>
                <div class="info">
                    <p>1</p>
                </div>
            </div>

        </div>

        <div class="bottom_box">
            <div class="box">
                <div class="pic"><a href=""><i class="fas fa-home"></i></a></div>
                <div class="info"><a href="${root}/front/shop/promotion">홈</a></div>
            </div>
            <div class="box">
                <div class="pic"><a href=""><i class="far fa-file-alt"></i></a></div>
                <div class="info"><a href="">동네현황</a></div>
            </div>
            <div class="box">
                <div class="pic"><a href=""><i class="far fa-edit"></i></a></div>
                <div class="info"><a href="">내 근처</a></div>
            </div>
            <div class="box">
                <div class="pic"><a href=""><i class="fas fa-map-marker-alt"></i></a></div>
                <div class="info"><a href="">채팅</a></div>
            </div>
            <div class="box">
                <div class="pic"><a href=""><i class="far fa-user"></i></a></div>
                <div class="info"><a href="${root}/front/member/myPage">MY</a></div>
            </div>
        </div>
    </section>
</body>
</html>