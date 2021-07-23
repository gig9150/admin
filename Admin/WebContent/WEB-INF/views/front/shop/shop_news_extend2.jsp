<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${root}/css/style.css">
<link rel="stylesheet" href="${root}/css/wo.css">
<title>Document</title>
</head>
<body>
<section id="BZ001-TB02-DT01" class="content">
    <div class="box title_box">
            <div class="icon icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <div class="icon icon_right"><a href="javascript:void(0)" id="reportTriger"><i class="fas fa-ellipsis-v"></i></a></div>
    </div>
    <div class="box box_1">
        <div class="pic"></div>
        <div class="info">
            <div class="sub_box"><p>${detailMap.shop_name }</p></div>
            <div class="sub_box"><p>${detailMap.area_name}<span>/</span>${detailMap.sector_content}</p></div>
        </div>
        <c:choose>
	      	<c:when test="${checkNum eq 1}">
		        <div class="right_btn"><a href="javascript:void(0)"
		         id="regularMember">단 골 ${bookmarkCnt}</a></div>      	
	      	</c:when>
	      	<c:otherwise>
	      		<div class="right_btn" style="background-color:#ffffff">
	      		<a href="javascript:void(0)" id="regularMember" style="color:#78a6d8">단 골 ${bookmarkCnt}
	      		</a></div>
	      	</c:otherwise>
	   </c:choose>
    </div>
    <div class="box btn">
         <div class="event"><a href="">${map.cate_content}</a></div>
        <div class="ago"><p>${map.regdate}</p></div>
    </div>
    <div class="box box_2"><p>${map.content}</p></div>
    <div class="box swiper-container">
        <div class="swiper-wrapper">
        	<c:forEach items="${map.imageList}" var="obj">
	            <div class="swiper-slide"><img src="${root}/upload/${obj}" style="width:100%;height:100%"></div>
        	</c:forEach>
        </div>
    </div>
    
    <ul class="box thumb_box">
        <li><a href=""><i class="far fa-thumbs-up"></i></a></li>
        <li><p>좋아요</p></li>
        <li><p>${map.likeCnt}</p></li>
        <li class="slash"><p>/</p></li>
    
        <li><p>조회</p></li>
        <li><p>${map.view_count}</p></li>
    </ul>
    
    <div class="report_box" style="display:none">
        	<p class="report"><a class="reportA" href="${root}/front/shop/shop_report_category?status=shop&shopIdx=${detailMap.shop_idx}">신고하기</a></p>
        </div>
        
        <div class="pop_up_box">
        	<c:choose>
        		<c:when test="${checkNum eq 1}">
        			<p class="ask">단골로 추가하시겠습니까&nbsp;?</p>
        		</c:when>
        		<c:otherwise>
        			<p class="ask">단골로 해제하시겠습니까&nbsp;?</p>
        		</c:otherwise>
        	</c:choose>

           <div class="btn_box">
               <div class="btn cancel"><a href="">취소</a></div>
               <c:choose>
               	<c:when test="${checkNum eq 1}">
	            	<div class="btn sure"><a href="${root}/front/shop/shop_bookmark?shopIdx=${detailMap.shop_idx}&shopNewsId=${map.shop_news_id}&nowPage=news">확인</a></div>
               	</c:when>
               	<c:otherwise>
               		<div class="btn sure"><a href="${root}/front/shop/shop_bookmark_cancel?shopIdx=${detailMap.shop_idx}&shopNewsId=${map.shop_news_id}&nowPage=news">확인</a></div>
               	</c:otherwise>
               </c:choose>
           </div>
       </div>
</section>


<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${root}/js/main.js"></script>

<script>
		$(function() {
			
			
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