<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style>
	.key-ul li{
	    display: inline-block;
	    background: lightgray;
	    margin: 0 0 10px 19px;
	    font-size: 11px;
	    padding: 5px;
	}

</style>
<title>Document</title>
</head>
<body>

 	 <!--34페이지 - #BZ001-TB04-DT01 가게 프로필 tab - 후기 - 상세페이지 - 사장님댓글-->
    <section id="BZ001-TB04-DT01" class="content">
       <div class="box top">
            <div class="icon_left"><a href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가게후기</h1>
            <div class="icon_right"><a href="javascript:void(0)" class="reportTriger"><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
               <div class="content content3">
           
            <div class="box box_1">
                <div class="box_1_left">
                    <div class="pic" style="border-radius: 50%;">
                    	<img src="${root}/upload/${reMap.profile_image}" style="width:100%;height:100%;border-radius: inherit;">
                    </div>
                    <div class="info">
                        <div class="sub_box sub_box1">
                            <p>${reMap.nickName}</p>
                        </div>
                        <div class="sub_box sub_box2">
                            <p>${reMap.area_name}<span>&#8226;</span>${reMap.regdate}</p>
                        </div>
                    </div>
                </div>
                
            </div>
           
            <p class="box txt_box">${reMap.content}</p>
             <ul class="box btn">
                <c:forEach items="${reMap.keyList}" var = "obj2">
	                <li><a href="javascript:void(0)">${obj2}</a></li>
             	</c:forEach>
            </ul>
            <div class="box swiper-container">
                <div class="swiper-wrapper">
                	<c:forEach items="${reMap.imageList}" var="obj2">
	                    <div class="swiper-slide">
	                    	<img src="${root}/upload/${obj2}" style="width:100%;height:100%;">
	                    </div>
                	</c:forEach>
                </div>
            </div>
            <ul class="box thumb_box">
                <c:choose>
					<c:when test="${not empty reMap.member_id}">
						<li class="thumb-li" data-id="${reMap.shop_review_id}"><a href="javascript:void(0)"><i class="far fa-thumbs-up"></i></a>좋아요<span>${reMap.likeCnt}</span></li>
					</c:when>
					<c:otherwise>
						<li class="thumb-li" data-id="${reMap.shop_review_id}"><a href="javascript:void(0)"><i class="far fa-thumbs-down"></i></a>좋아요<span>${reMap.likeCnt}</span></li>
					</c:otherwise>
				</c:choose>
	               
               <li><span>조회</span>${reMap.view_count}</li>
            </ul>
            <c:if test="${not empty reMap.reply}">
	            <div class="comment">
	                <div class="pic"><img src="${root}/img/group_2058.png" alt=""></div>
	                <div class="info">
	                    <h5 class="info_title">사장님 댓글</h5>
	                    <p class="txt">${reMap.reply}</p>
	                </div>
	            </div>
      		</c:if>
        </div>
        
        
    </section>
	
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
	
	<script>
		$(function() {
			
			$(document).click(function(e){
				if(!$(e.target).hasClass('.reportTriger')){
					
					$('.content').removeClass('reviewon');
					$('.report_box').css('display','none');
					
				}
			})
			
			$(window).scroll(function(){
				var num = $(this).scrollTop();
				console.log(num);
				if(num > 420){
					$(".tab").addClass('on');
					$('.tab_div').css('display','block');
				}else{
					$(".tab").removeClass('on');
					$('.tab_div').css('display','none');
				}
			});
			
			
			$('.reportTriger').on('click',function(e){ 
				if($('.content').hasClass('reviewon')){
					$('.content').removeClass('reviewon');
					$('.report_box').css('display','none');
					e.stopPropagation();
				}else{
					$('.content').addClass('reviewon');
					$('.report_box').css('display','block');
					e.stopPropagation();
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
				
				let shopReviewId = $(this).data('id');
				
				if($(this).find('i').hasClass('fa-thumbs-down')){
					
					$(this).find('i').removeClass('fa-thumbs-down').addClass('fa-thumbs-up');
					$.ajax({
						url:'${root}/front/shop/reviewLikeAdd/'+shopReviewId,
						type:'get',
						success:function(data){
							console.log(data);
						}
					});
					
					$(this).children('span').html(parseInt($(this).children('span').html()) + 1);
					
				}else{
					
					$(this).find('i').removeClass('fa-thumbs-up').addClass('fa-thumbs-down');
					$.ajax({
						url:'${root}/front/shop/reviewLikeDel/'+shopReviewId,
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