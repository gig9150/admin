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
<title>Document</title>
</head>
<body>
	<!--33페이지 - #BZ001-TB04 가게 프로필 TAB – 후기-->
	<section id="BZ001-TB04" class="content">
	    <div class="box top">
            <div class="icon_left"><a href="${root}/front/shop/shop_promotion"><i class="fas fa-times"></i></a></div>
            <h1 class="title">${detailMap.shop_name}</h1>
            <div class="icon_right"><a href="javascript:void(0)" id="reportTriger"><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
        <div class="profile_top"><img src="${root}/upload/${detailMap.main_image}" style="width:100%;height:100%"></div>
        <div class="profile_bottom">
            <ul class="left_box">
                <li>${detailMap.shop_name}</li>
                <li>${detailMap.area_name}</li>
                <li>${detailMap.start_date} ~ ${detailMap.end_date}</li>
            </ul>
			<c:choose>
            	<c:when test="${checkNum eq 1}">
            		<ul class="right_box" id="regularMember">
		                <li><a href="javascript:void(0)"><i class="fas fa-plus"></i></a></li>
		                <li>단골</li>
		                <li >${bookmarkCnt}</li>
		            </ul>
            	</c:when>
            	<c:otherwise>
            		<ul class="right_box" id="regularMember" style="background-color:#ffffff;border: 1px solid #7aa4d7;">
		                <li><a href="javascript:void(0)"><i style="color:#78a6d8" class="fas fa-plus"></i></a></li>
		                <li style="color:#78a6d8">단골</li>
		                <li style="color:#78a6d8">${bookmarkCnt}</li>
		            </ul>
            	</c:otherwise>
            </c:choose>

        </div>

        <div class="call">
            <div class="call_left"><a href=""><span><i class="fas fa-phone"></i></span>전화문의</a></div>
            <div class="call_right"><a href="${root}/front/shop/shop_review_register?shopIdx=${detailMap.shop_idx}"><span><i class="fas fa-edit"></i></span>후기작성</a></div>
        </div>

        <ul class="tab">
            <li><a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}">홈</a></li>
            <li><a href="${root}/front/shop/shop_news2?shopIdx=${detailMap.shop_idx}">소식</a></li>
            <li><a href="${root}/front/shop/shop_review2?shopIdx=${detailMap.shop_idx}">후기</a></li>
        </ul>
        
        <div class="layout2">
	       <div class="top">
	            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
	            <h1 class="title">가게프로필명</h1>
	        </div>
	        <ul id="gnb">
	            <li><a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}">소개</a></li>
	            <li><a href="${root}/front/shop/shop_news2?shopIdx=${detailMap.shop_idx}">소식</a></li>
	            <li><a href="${root}/front/shop/shop_review2?shopIdx=${detailMap.shop_idx}">후기<span></span></a></li>
	        </ul>
        </div>
        
	    <div class="top_btn"><a href="${root}/front/shop/shop_review_register?shopIdx=${detailMap.shop_idx}">후기 작성하기</a></div>
	    <c:forEach items="${list}" var="obj">
		    <div class="big_box">
		        <div class="box box_1">
		            <div class="pic"></div>
		            <div class="info">
		                <div class="sub_box_1"><p>${obj.nickName}<span>HOLIC</span></p></div>
		                <ul class="sub_box_2">
		                    <li><p><i class="fas fa-pencil-alt"></i><span>${obj.reviewCnt}</span></p></li>
	<!-- 	                    <li><p><i class="fas fa-user-friends"></i><span>112</span></p></li> -->
							<li><p>${obj.regdate}</p></li>
		                </ul>
		            </div>
		            <ul class="box right_box">
		                <li><p>방금전</p></li>
		                <li><a href=""><i class="fas fa-ellipsis-v"></i></a></li>
		            </ul>
		        </div>    
		        <ul class="box txt_box" 
		        onclick="javascript:location.href='${root}/front/shop/review_detail?shopReviewId=${obj.shop_review_id}'">
		            <li><p>${obj.content }</p></li>
		        </ul>
		        <div class="box swiper-container">
		            <c:forEach items="${obj.imageList}" var="obj2">
	                    <div class="swiper-slide">
	                    	<img src="${root}/upload/${obj2}" style="width:100%;height:100%;">
	                    </div>
                	</c:forEach>
		        </div>
		        <ul class="box thumb_box">
		            <c:choose>
						<c:when test="${not empty obj.member_id}">
							<li class="thumb-li" data-id="${obj.shop_review_id}"><a href="javascript:void(0)"><i class="far fa-thumbs-up"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="thumb-li" data-id="${obj.shop_review_id}"><a href="javascript:void(0)"><i class="far fa-thumbs-down"></i></a></li>
						</c:otherwise>
					</c:choose>
		            <li><p>좋아요</p></li>
		            <li><p>${obj.likeCnt}</p></li>
		            <li class="slash"><p>/</p></li>
		            
		            <li><p>조회</p></li>
		            <li><p>${obj.view_count}</p></li>
		        </ul>
		    </div>
		    
		    <c:if test="${not empty obj.reply}">
		        <ul class="comment">
		            <li>
	                	<p>사장님 댓글 </p>
		            </li>
		            <li><p>${obj.reply}</p></li>
		        </ul>	
        	</c:if>
		    
		    
		</c:forEach>
	    
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
		            	<div class="btn sure"><a href="${root}/front/shop/shop_bookmark?shopIdx=${detailMap.shop_idx}&nowPage=detail">확인</a></div>
                	</c:when>
                	<c:otherwise>
                		<div class="btn sure"><a href="${root}/front/shop/shop_bookmark_cancel?shopIdx=${detailMap.shop_idx}&nowPage=detail">확인</a></div>
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
			
			$(window).scroll(function(){
				var num = $(this).scrollTop();
				if(num > 420){
					$(".layout2").css("display","block");
				}else{
					$(".layout2").css("display","none");
				}
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
					
					$(this).next().next().find('p').html(parseInt($(this).next().next().find('p').html()) + 1);
					
				}else{
					
					$(this).find('i').removeClass('fa-thumbs-up').addClass('fa-thumbs-down');
					$.ajax({
						url:'${root}/front/shop/reviewLikeDel/'+shopReviewId,
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