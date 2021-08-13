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
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/mypage/shop?shopIdx=${shopMap.shop_idx}"><i class="fas fa-times"></i></a></div>
            <h1 class="title">${shopMap.shop_name}</h1>
            <div class="icon_right"><a href="javascript:void(0)" class="reportTriger"><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
        <div class="box box_1">
           <div class="left_box">
                <div class="pic">
                </div>
                <div class="info">
                    <div class="sub_box">
                        <p>${shopMap.shop_name}</p>
                    </div>
                    <div class="sub_box">
                        <p>${shopMap.area_name}<span>/</span>${map.regdate}</p>
                    </div>
                    <div class="sub_box">
                        <p>${map.cate_content}</p>
                    </div>
                </div>
            </div>
            <ul class="right_box">
                <li class="regular regular1"><a href="${root}/front/mypage/shop_bookmark?shopIdx=${shopMap.shop_idx}"><i class="fas fa-plus"></i><span>단골</span>${bookmarkCnt}</a></li>
                <li class="regular regular2"><a href="${root}/front/mypage/shop_bookmark?shopIdx=${shopMap.shop_idx}"><i class="fas fa-plus"></i><span>단골</span>${bookmarkCnt}</a></li>
            </ul>
        </div>
        
        <div class="box box_2">
            <strong>${map.title}</strong>
            <p>${map.content}</p>
        </div>
        <div class="box swiper-container">
            <div class="swiper-wrapper">
            	<c:forEach items="${map.imageList}" var="obj">
            		<div class="swiper-slide"><img src="${root}/upload/${obj}" style="width:100%;height:100%"></div>
            	</c:forEach>
            </div>
        </div>

        <ul class="box thumb_box">
            <c:choose>
				<c:when test="${not empty map.member_id}">
					<li class="thumb-li" data-id="${map.shop_news_id}"><a href="javascript:void(0)" style="margin-right: 3px;"><i class="far fa-thumbs-up"></i></a>좋아요<span>${map.likeCnt}</span></li>
				</c:when>
				<c:otherwise>
					<li class="thumb-li" data-id="${map.shop_news_id}"><a href="javascript:void(0)" style="margin-right: 3px;"><i class="far fa-thumbs-down"></i></a>좋아요<span>${map.likeCnt}</span></li>
				</c:otherwise>
			</c:choose>
            <li><span>조회</span>${map.view_count}</li>
        </ul>
        
    </section>


<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${root}/js/main.js"></script>

<script>
		$(function() {
			
			
			$('.reportTriger').on('click',function(){ 
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
					$(this).children('span').html(parseInt($(this).children('span').html()) + 1);
					
				}else{
					
					$(this).find('i').removeClass('fa-thumbs-up').addClass('fa-thumbs-down');
					$.ajax({
						url:'${root}/front/shop/newsLikeDel/'+shopNewsId,
						type:'get',
						success:function(data){
							console.log(data);
						}
					});
					$(this).children('span').html(parseInt($(this).children('span').html()) - 1);
					
				}
			});
			
		});
		
	</script>

</body>
</html>