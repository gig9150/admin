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
	
	.none-box{
		display:none;
		position: relative;
	
	}
	
	.none-box li{
		position:absolute;
		right:0px;
	    width: 64px;
	    height: 20px;
	    text-align: center;
	    border: 1px solid #9999ff;
	    font-size: 12px;
    	line-height: 18px;
	}
	
	.none-box li:nth-child(1){
		top:-5px;
	}
	
	.none-box li:nth-child(2){
		top:20px;
	}
	
	.none-box li:nth-child(3){
		top:45px;
	}

</style>
</head>
<body>

	<!--    98페이지(6/30 파일) BZ002-TB01-E 가게프로필 탭 - 소개(후기)-->
    <section id="BZ002-TB01-E" class="content">
    
    	<div class="top">
			<div class="icon_left">
				<a href="${root}/front/myPage"><i class="fas fa-times"></i></a>
			</div>
			<h1 class="title">${map.shop_name}</h1>
			<div class="icon_right">
				<a href="javascript:void(0)"><i class="fas fa-ellipsis-v"></i></a>
			</div>
		</div>
		
		<div class="profile_top">
			<img src="${root}/upload/${map.main_image}"
				style="width: 100%; height: 100%;position: absolute;top: 0;right: 0;">
			<div class="img_file">
                  <label for="file_box"><i class="fas fa-camera"></i></label>
                  <input type="file" id="file_box">
            </div>
            <div class="cancel">
                <a href="${root}/front/mypage/profile_delete?shopIdx=${shopIdx}"><i class="far fa-times-circle"></i></a>
            </div>
		</div>
		<div class="profile_bottom">
			<ul class="left_box">
				<li>${map.shop_name}</li>
				<li>${map.area_name}</li>
				<li>${map.start_date}~ ${map.end_date}</li>
			</ul>
		
			<ul class="right_box"
				onclick="javascript:location.href='${root}/front/mypage/shop_bookmark?shopIdx=${shopIdx}'">
				<li><a href="javascript:void(0)"><i class="fas fa-plus"></i></a></li>
				<li>단골</li>
				<li>${bookmarkCnt}</li>
			</ul>
		</div>
		
		<div class="call">
			<div class="call_left">
				<a href="javascript:void(0)">채팅관리</a>
			</div>
			<div class="call_right">
				<a href="javascript:void(0)">매니저관리</a>
			</div>
		</div>
		<ul id="gnb">
			<li><a href="${root}/front/mypage/shop?shopIdx=${map.shop_idx}">소개</a></li>
			<li><a href="${root}/front/mypage/shop_news?shopIdx=${map.shop_idx}">소식</a></li>
			<li><a href="${root}/front/mypage/shop_review?shopIdx=${map.shop_idx}">후기<span></span></a></li>
		</ul>
		<div class="layout2" style="display: none;">
			<div class="top">
				<div class="icon_left">
					<a href="javascript:void(0)"><i class="fas fa-chevron-left"></i></a>
				</div>
				<h1 class="title">가게프로필명</h1>
			</div>
			<ul id="gnb">
				<li><a href="${root}/front/mypage/shop?shopIdx=${map.shop_idx}">소개</a></li>
				<li><a href="${root}/front/mypage/shop_news?shopIdx=${map.shop_idx}">소식</a></li>
				<li><a href="${root}/front/mypage/shop_review?shopIdx=${map.shop_idx}">후기<span></span></a></li>
			</ul>
		</div>
        <c:forEach items="${list}" var="obj">
	        <div class="big_box">
	            <div class="box box_1">
	                <div class="pic"></div>
	                <div class="info">
	                    <div class="sub_box_1"><p>${obj.nickName}<span>HOLIC</span></p></div>
	                    <ul class="sub_box_2">
	                        <li><p><i class="fas fa-pencil-alt"></i><span>${obj.reviewCnt}</span></p></li>
<!-- 	                        <li><p><i class="fas fa-user-friends"></i><span>112</span></p></li> -->
	                        <li><p>${obj.regdate}</p></li>
	                    </ul>
	                </div>
	            </div>    
	            <ul class="box txt_box" data-id="${obj.shop_review_id}">
	                <li><p>${obj.content }</p></li>
	            </ul>
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
	                <li class="right_menu"><a href="javascript:void(0)"><i class="fas fa-ellipsis-h"></i></a></li>
	            </ul>
	        </div>
	        <c:choose>
	        	<c:when test="${not empty obj.reply}">
			        <ul class="comment">
			            <li>
			                <p>사장님 댓글</p>
			                <ul class="comment_btn">
			                    <li><a href="javascript:void(0)">삭제</a></li>
			                    <li><a href="javascript:void(0)">수정</a></li>
			                </ul>
			            </li>
			            <li><p>${obj.reply}</p></li>
			        </ul>	
	        	</c:when>
	        	<c:otherwise>
	        		<form action="${root}/front/mypage/review_reply">
	        			<input type="hidden" name="shopIdx" value="${shopIdx}">
	        			<input type="hidden" name="shopReviewId" value="${obj.shop_review_id}">
				        <div class="no_comment">
				            <div class="small_box">
	<!-- 			                <p>우리 가게 후기에 댓글을 남겨주세요.</p> -->
								<input name="reply" type="text" style="height: 32px;border: 1px solid #bbb;background-color: #eee;border-radius: 5px;">
				                <div class="no_btn">
				                	<button>등록</button>
				                </div>
				            </div>
				        </div>
					</form>
	        	</c:otherwise>
	        </c:choose>
	    </c:forEach>
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
			
	
			$(window).scroll(function(){
				var num = $(this).scrollTop();
				if(num > 420){
					$(".layout2").css("display","block");
				}else{
					$(".layout2").css("display","none");
				}
			});
			
			//수정 삭제 숨기기 
			$('.menu').click(function(){
				$('.none-box').toggle();
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
			
			$('.txt_box').click(function(){
				let shopReviewId = $(this).data('id');
				let shopIdx = '${shopIdx}';
				location.href="${root}/front/mypage/review_detail?shopReviewId="+shopReviewId+"&shopIdx="+shopIdx;
			});
			
			$('.img_file').click(function(){
				location.href="${root}/front/mypage/profile_update?shopIdx=${shopIdx}";
			});
			
		});
		
	</script>
	

</body>
</html>