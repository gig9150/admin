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
<style>
	.tab.on{
	
		position:fixed;
		width:100%;
		top:50px;
		background:#ffffff;
		z-index: 999;
		
	}
	
	.tab_div{
	
		background:#ffffff;
		text-align: center;
		position: fixed;
	    width: 100%;
	    top: 0px;
	    height: 50px;
	    font-size: 20px;
	    font-weight: bold;
	    line-height: 50px;
	    padding: 0 20px;
	
	}
	
	.tab_div div{
	
	    float: left;
    	line-height: 50px;
		
	}
	
	.tab_div i{
	
		color: #000000;
		
	}
	
	#BZ001-TB02 .box_3{margin-top: 75px; padding: 0; width: 100%; height: 100px; border: 1px solid #ccc;}
	#BZ001-TB02 .box_3 .box_3_box{
	    display: flex; flex-direction: column; justify-content: center; flex-wrap: nowrap; align-items: center;
	    float: left; width: 50%; height: 100%; text-align: center; border-right: 1px solid #f4f4f4;}
	#BZ001-TB02 .box_3 .box_3_box .pic{margin: 0 0 10px; width: 22px; height: 22px;}
	#BZ001-TB02 .box_3 .box_3_box .pic a{display: block; width: 100%; height: 100%;}
	#BZ001-TB02 .box_3 .box_3_box .pic a img{display: block; width: 100%;}
	#BZ001-TB02 .box_3 .box_3_box .info p{font-size: 14px;}
	
	#BZ001-TB02 .notice{padding: 10px 20px;width: 100%;; border-top: 1px solid #eee; border-bottom: 8px solid #f4f4f4; text-align: center}
	#BZ001-TB02 .notice a{display: block; width: 100%; height: 48px; padding: 10px 0; color: #fff; background-color: #78a6d8; border-radius: 5px; line-height: 28px;}
	#BZ001-TB02 .notice span{padding: 0 5px;}
	
</style>
<title>Document</title>
</head>
<body>
	    <!--    30페이지 - #BZ001-TB02 가게 프로필 TAB – 소식-->
    <section id="BZ001-TB02" class="content">
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/myPage"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">${map.shop_name}</h1>
            <div class="icon_right"><a href="javascript:void(0)" class="reportTriger"><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
        <div class="profile_top"><img src="${root}/upload/${map.main_image}" style="width:100%;height:100%"></div>
        <div class="profile_bottom">
            <ul class="left_box">
                <li><img src="${root}/img/group_2058.png" alt=""></li>
                <li class="regular regular1"><a href="${root}/front/mypage/shop_bookmark?shopIdx=${shopIdx}"><i class="fas fa-plus"></i><span>단골</span>${bookmarkCnt}</a></li>
                <li class="regular regular2"><a href="${root}/front/mypage/shop_bookmark?shopIdx=${shopIdx}"><i class="fas fa-plus"></i><span>단골</span>${bookmarkCnt}</a></li>
            </ul>
            <ul class="right_box">
                <li>${map.shop_name}</li>
                <li>${map.area_name}</li>
                <li><span>산지직거래</span><span>배달</span></li>
            </ul>

        </div>

        <!--
        <div class="call_box">
            <div class="call call_left"><a href=""><span><img src="img/%EA%B7%B8%EB%A3%B9%201655.png" alt=""></span>전화문의</a></div>
            <div class="call call_right"><a href=""><span><img src="img/%EA%B7%B8%EB%A3%B9%201659.png" alt=""></span>채팅문의</a></div>
        </div>
-->
<!--         <div class="call_box"> -->
<%--             <c:choose> --%>
<%--         		<c:when test="${not empty detailMap.phone}"> --%>
<%--         			<div class="call call_left"><a href="tel:${detailMap.phone}"><span></span>전화문의</a></div> --%>
<%--         		</c:when> --%>
<%--         		<c:otherwise> --%>
<!--         			<div class="call call_left"><a onclick="alert('등록된 번호가 존재하지 않습니다.')"><span></span>전화문의</a></div> -->
<%--         		</c:otherwise> --%>
<%--         	</c:choose> --%>
<!--             <div class="call call_right"><a href="javascript:void(0)"><span></span>채팅문의</a></div> -->
<!--         </div> -->

		<div class="box box_3">
            <div class="box_3_box">
                <div class="pic"><a href="${root}/front/mypage/shop_news?shopIdx=${map.shop_idx}"><img src="${root}/img/group_2028.png" alt=""></a></div>
                <div class="info"><p>소식 관리</p></div>
            </div>
<!--             <div class="box_3_box"> -->
<%--                 <div class="pic"><a href=""><img src="${root}/img/group_1656.png" alt=""></a> --%>
<!--                 </div> -->
<!--                 <div class="info"><p>채팅 관리</p></div> -->
<!--             </div> -->
<!--             <div class="box_3_box"> -->
<%--                 <div class="pic"><a href=""><img src="${root}/img/manager.png" alt=""></a></div> --%>
<!--                 <div class="info"><p>매니저 관리</p></div> -->
<!--             </div> -->
            <div class="box_3_box">
                <div class="pic"><a href="${root}/front/mypage/shop_update?shopIdx=${shopIdx}"><img src="${root}/img/group_1924.png" alt=""></a></div>
                <div class="info"><p>정보 관리</p></div>
            </div>
        </div>

        <div class="tab_div" style="display:none;">
			<div class="icon_left"><a href="${root}/front/myPage"><i class="fas fa-chevron-left"></i></a></div>
			${map.shop_name}
		</div>
        <ul class="tab">
            <li><a href="${root}/front/mypage/shop?shopIdx=${map.shop_idx}">소개</a></li>
            <li><a href="${root}/front/mypage/shop_news?shopIdx=${map.shop_idx}">소식</a></li>
            <li><a href="${root}/front/mypage/shop_review?shopIdx=${map.shop_idx}">후기</a></li>
        </ul>
        
        <div class="box notice">
			<a
				href="${root}/front/mypage/news_regi?shopIdx=${map.shop_idx}"><span><i
					class="fas fa-pencil-alt"></i></span>소식 작성하기</a>
		</div>
<!--
        <div class="box title_box">
            <div class="icon"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">당근마켓 서비스</h1>
        </div>
        <ul id="gnb">
            <li><a href="">소개</a></li>
            <li><a href="">소식</a></li>
            <li><a href="">후기<span>2</span></a></li>
        </ul>
-->
	<c:forEach items="${list}" var="obj">
        <div class="content content1">
            <div class="box box_1">
                <div class="box_1_left">
                    <div class="pic">
                    	<img src="${root}/img/group_2058.png" style="width:100%;height:100%;">
                    </div>
                    <div class="info">
                        <div class="sub_box sub_box1">
                            <p>${map.shop_name}</p>
                        </div>
                        <div class="sub_box sub_box2">
                            <p>${map.area_name}<span>&#8226;</span>${obj.regdate}</p>
                        </div>
                    </div>
                </div>
                <div class="reportTriger menuBar"><a href="javascript:void(0)"><i class="fas fa-ellipsis-v"></i></a></div>
            </div>
            <ul class="box btn">
                <li class="event"><a href="javascript:void(0)">${obj.cate_content}</a></li>
                <li class="coupon"><a href="javascript:void(0)">쿠폰</a></li>
            </ul>
            <p class="box txt_box">
                <span>${obj.title}</span><br>${obj.content} <a href="${root}/front/mypage/news_detail?shopIdx=${map.shop_idx}&shopNewsId=${obj.shop_news_id}">더보기</a>
            </p>
            <div class="box swiper-container">
                <div class="swiper-wrapper">
                	<c:forEach items="${obj.imageList}" var="obj2"> 
	                    <div class="swiper-slide">
	                    	<img src="${root}/upload/${obj2}" style="width:100%;height:100%;">
	                    </div>
                	</c:forEach>
                </div>
            </div>
            <ul class="box thumb_box">
                <c:choose>
					<c:when test="${not empty obj.member_id}">
						<li class="thumb-li" data-id="${obj.shop_news_id}"><a href="javascript:void(0)" style="margin-right: 3px;"><i class="far fa-thumbs-up"></i></a>좋아요<span>${obj.likeCnt}</span></li>
					</c:when>
					<c:otherwise>
						<li class="thumb-li" data-id="${obj.shop_news_id}"><a href="javascript:void(0)" style="margin-right: 3px;"><i class="far fa-thumbs-down"></i></a>좋아요<span>${obj.likeCnt}</span></li>
					</c:otherwise>
				</c:choose>
                <li><span>조회</span>${obj.view_count}</li>
            </ul>
        </div>
	</c:forEach>
	
	<div class="report_box" style="display:none">
    	<p class="report"><a class="reportA" href="${root}/front/shop/shop_report_category?status=shop&shopIdx=${detailMap.shop_idx}">신고하기</a></p>
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