<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="top">
	<div class="icon_left">
		<a href=""><i class="fas fa-times"></i></a>
	</div>
	<h1 class="title">${map.shop_name}</h1>
	<div class="icon_right">
		<a href=""><i class="fas fa-ellipsis-v"></i></a>
	</div>
</div>

<div class="profile_top">
	<img src="${root}/upload/${map.main_image}"
		style="width: 100%; height: 100%;"> <a
		href="${root}/front/mypage/profile_update?shopIdx=${shopIdx}"
		style="position: absolute; right: 8px;">수정</a>
</div>
<div class="profile_bottom">
	<ul class="left_box">
		<li>${map.shop_name}</li>
		<li>${map.area_name}</li>
		<li>${map.start_date}~ ${map.end_date}</li>
	</ul>

	<ul class="right_box"
		onclick="javascript:location.href='${root}/front/mypage/shop_bookmark?shopIdx=${shopIdx}'">
		<li><a href=""><i class="fas fa-plus"></i></a></li>
		<li>단골</li>
		<li>${bookmarkCnt}</li>
	</ul>
</div>

<div class="call">
	<div class="call_left">
		<a href="">채팅관리</a>
	</div>
	<div class="call_right">
		<a href="">매니저관리</a>
	</div>
</div>
<ul id="gnb">
	<li><a href="${root}/mypage/shop?shopIdx=${map.shop_idx}">소개</a></li>
	<li><a href="${root}/mypage/shop_news?shopIdx=${map.shop_idx}">소식</a></li>
	<li><a href="${root}/mypage/shop_review?shopIdx=${map.shop_idx}">상품<span></span></a></li>
</ul>
<div class="layout2" style="display: none;">
	<div class="top">
		<div class="icon_left">
			<a href=""><i class="fas fa-chevron-left"></i></a>
		</div>
		<h1 class="title">가게프로필명</h1>
	</div>
	<ul id="gnb">
		<li><a href="${root}/mypage/shop?shopIdx=${map.shop_idx}">소개</a></li>
		<li><a href="${root}/mypage/shop_news?shopIdx=${map.shop_idx}">소식</a></li>
		<li><a href="${root}/mypage/shop_review?shopIdx=${map.shop_idx}">상품<span></span></a></li>
	</ul>
</div>