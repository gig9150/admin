<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

</head>
<body>

	<!--31페이지 #BZ001-TB02-DT01 가게 프로필 tab - 소식 - 상세페이지 - 쿠폰없는케이스-->

	<section id="BZ001-TB02-DT01" class="content">
	    <div class="box title_box">
           <div class="icon icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <div class="icon icon_right"><a href=""><i class="fas fa-ellipsis-v"></i></a></div>
	    </div>
	    <div class="box box_1">
	        <div class="pic">
	        	<img src="${root}/uplaod/${shopMap.main_image}">
	        </div>
	        <div class="info">
	            <div class="sub_box"><p>${shopMap.shop_name}</p></div>
	            <div class="sub_box"><p>${shopMap.area_name}<span>/</span>${map.regdate}</p></div>
	        </div>
	    </div>
	    <div class="box btn">
	         <div class="event"><a href="javascript:void(0)">${map.cate_content}</a></div>
	        <div class="ago"><p>방금전</p></div>
	    </div>
	    <div class="box box_2"><p>소식글 상세 내용</p></div>
	    <div class="box swiper-container">
	        <div class="swiper-wrapper">
	        	<c:forEach items="${map.imageList}" var="obj2">
		            <div class="swiper-slide">
		            	<img src="${root}/upload/${obj2}" style="width:100%;height:100%;">
		            </div>
	        	</c:forEach>
	        </div>
	    </div>
	    
	    <ul class="box thumb_box">
	        <c:choose>
				<c:when test="${not empty map.member_id}">
					<li class="thumb-li" data-id="${obj.shop_news_id}"><a href="javascript:void(0)"><i class="far fa-thumbs-up"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="thumb-li" data-id="${obj.shop_news_id}"><a href="javascript:void(0)"><i class="far fa-thumbs-down"></i></a></li>
				</c:otherwise>
			</c:choose>
	        <li><p>좋아요</p></li>
	        <li><p>${map.likeCnt }</p></li>
	        <li class="slash"><p>/</p></li>
	    
	        <li><p>조회</p></li>
	        <li><p>${map.view_count}</p></li>
	    </ul>
	    
	</section>

    
   	<script src="${root}/vendor/jquery/jquery.min.js"></script>
   	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="${root}/js/main.js"></script>
	
	
	<script>
	
		$(function(){
		
			
			//좋아요
			$('.thumb-li').click(function(){
				
				let shopNewsId = $(this).data('id');
				if($(this).find('i').hasClass('fa-thumbs-down')){
					
					$(this).find('i').removeClass('fa-thumbs-down').addClass('fa-thumbs-up');
					$.ajax({
						url:'${root}/front/shop/newsLikeAdd/'+shopNewsId,
						type:'get',
						success:function(data){
							console.log(data);
						}
					});
					$(this).next().next().find('p').html(parseInt($(this).next().next().find('p').html()) + 1);
					
				}else{
					
					$(this).find('i').removeClass('fa-thumbs-up').addClass('fa-thumbs-down');
					$.ajax({
						url:'${root}/front/shop/newsLikeDel/'+shopNewsId,
						type:'get',
						success:function(data){
							console.log(data);
						}
					});
					$(this).next().next().find('p').html(parseInt($(this).next().next().find('p').html()) - 1);
					
				}
			});
			
		});
	
	</script>

</body>
</html>