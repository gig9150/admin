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
	<!--   55페이지 - #MY001-DG00 - 마이페이지_단골목록-->
    <section id="MY001-DG00" class="content">
        <div class="top">
            <div class="icon"><a href=""><img src="./img/left.png" alt=""></a></div>
            <h1 class="profile">단골 목록</h1>
        </div>
        
        <div class="inner">
        	<c:forEach items="${bookmartList}" var="obj">
	            <div class="sub_box">
	            
	                <div class="pic"></div>
	                <div class="info">
	                    <ul class="sub_info sub_info_1">
	                        <li>${obj.shop_name}</li>
	                        <li>${obj.sector_content}</li>
	                        <fmt:parseNumber var="startDate_N" value="${obj2.startDate}" integerOnly="false"/>
                            <fmt:parseNumber var="endDate_N"  value="${obj2.endDate}" integerOnly="false" />
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
	                    <ul class="sub_info sub_info_2-1">
	                    <!-- 9월 개발 -->
<!-- 	                        <li><p>산지직거래</p></li> -->
<!-- 	                        <li><p>배달</p></li> -->
	                    </ul>
	                    <ul class="sub_info sub_info_3">
	                        <li><i class="far fa-comment"></i></li>
	                        <li>${obj.review_count}</li><br>
	                        <li><i class="fas fa-heart"></i></li>
	                        <li>0</li>
	                    </ul>
	                    <ul class="sub_info sub_info_4" id="regularMember" data-shop-idx = "${obj.shop_idx}" >
	                        <li><i class="far fa-circle"></i></li>
	                        <li><p>단골</p></li>
	                        <li><p>${obj.bookmark_count}</p></li>
	                    </ul>
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
        
        <div class="pop_up_box">
   			<p class="ask">단골로 해제하시겠습니까&nbsp;?</p>
            <div class="btn_box">
                <div class="btn cancel"><a href="">취소</a></div>
              	<div class="btn sure"><a class="sure-a" href="javascript:void(0)">확인</a></div>
            </div>
        </div>
    </section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
	
	<script>
		$(function() {
			
			$('.sure-a').click(function(){
				let shopIdx = $('#regularMember').data('shopIdx');
				location.href="${root}/front/shop/shop_bookmark_cancel?nowPage=mypage&shopIdx="+shopIdx;
			});
			
			
			$('#reportTriger').on('click',function(){ 
				if($('.content').hasClass('reviewon')){
					$('.content').removeClass('reviewon');
					$('.report_box').css('display','none');
				}else{
					$('.content').addClass('reviewon');
					$('.report_box').css('display','block');
				}
			});
			
			$('#regularMember').on('click',function(){
				if($('.content').hasClass('on')){
					$('.content').removeClass('on');
					$('.pop_up_box').css('display','none');
				}else{
					$('.content').addClass('on');
					$('.pop_up_box').css('display','block');
				}
			});
			
			//카카오맵 
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);
			
		});
		
	</script>
</body>
</html>