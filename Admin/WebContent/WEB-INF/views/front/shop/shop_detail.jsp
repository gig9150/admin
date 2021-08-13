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
	
	.box.infomation div.icon{
	    text-overflow: ellipsis;
	    overflow: hidden;
	    width: 100px;
	    white-space: nowrap;
	}
	
	#intro_expend{
		color:#aaa;
		margin-bottom:15px;
	}
	
</style>
<title>Document</title>
</head>
<body>
     <!-- 27페이지 - #BZ001-TB01 - 가게 프로필 (일반 회원 진입 시)-->
    <section id="BZ001-TB01" class="content">
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/shop/shop_promotion"><i class="fas fa-times"></i></a></div>
            <h1 class="title">${detailMap.shop_name}</h1>
            <div class="icon_right"><a href="javascript:void(0)" class="reportTriger"><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
        <div class="profile_top"><img src="${root}/upload/${detailMap.main_image}" style="width:100%;height:100%"></div>
        <div class="profile_bottom">
        
        	<c:choose>
            	<c:when test="${checkNum eq 1}">
            		<ul class="left_box" id="regularMember" >
		                <li><img src="${root}/img/group_2058.png" alt=""></li>
		                <li class="regular regular1" style="display:none;"><a href="javascript:void(0);"><i class="fas fa-plus"></i><span>단골</span>${bookmarkCnt}</a></li>
		                <li class="regular regular2" style="display:block"><a href="javascript:void(0);"><i class="fas fa-plus"></i><span>단골</span>${bookmarkCnt}</a></li>
		            </ul>
            	</c:when>
            	<c:otherwise>
            		<ul class="left_box" id="regularMember" >
		                <li><img src="${root}/img/group_2058.png" alt=""></li>
		                <li class="regular regular1" style="display:block;"><a href="javascript:void(0);"><i class="fas fa-plus"></i><span>단골</span>${bookmarkCnt}</a></li>
		                <li class="regular regular2" style="display:none"><a href="javascript:void(0);"><i class="fas fa-plus"></i><span>단골</span>${bookmarkCnt}</a></li>
		            </ul>
            	</c:otherwise>
            	
            </c:choose>

            
            <ul class="right_box">
                <li>${detailMap.shop_name}</li>
                <li>${detailMap.area_name}</li>
                <li><span>산지직거래</span><span>배달</span></li>
            </ul>

        </div>

        <!--
        <div class="call_box">
            <div class="call call_left"><a href=""><span><img src="img/%EA%B7%B8%EB%A3%B9%201655.png" alt=""></span>전화문의</a></div>
            <div class="call call_right"><a href=""><span><img src="img/%EA%B7%B8%EB%A3%B9%201659.png" alt=""></span>채팅문의</a></div>
        </div>
		-->
        <div class="call_box">
        	<c:choose>
        		<c:when test="${not empty detailMap.phone}">
        			<div class="call call_left"><a href="tel:${detailMap.phone}"><span></span>전화문의</a></div>
        		</c:when>
        		<c:otherwise>
        			<div class="call call_left"><a onclick="alert('등록된 번호가 존재하지 않습니다.')"><span></span>전화문의</a></div>
        		</c:otherwise>
        	</c:choose>
            
            <div class="call call_right"><a href="javascript:void(0)"><span></span>채팅문의</a></div>
        </div>

		<div class="tab_div" style="display:none;">
			<div class="icon_left"><a href="${root}/front/shop/shop_promotion"><i class="fas fa-chevron-left"></i></a></div>
			${detailMap.shop_name}
		</div>
        <ul class="tab">
            <li><a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}">소개</a></li>
            <li><a href="${root}/front/shop/shop_news2?shopIdx=${detailMap.shop_idx}">소식</a></li>
            <li><a href="${root}/front/shop/shop_review2?shopIdx=${detailMap.shop_idx}">후기</a></li>
        </ul>

        <div class="box notice">
            <p><span class="bell"><img src="${root}/img/group_2060.png"></span><span>컵주문시 받침대 서비스 이벤트중!</span></p>
        </div>
		
		
        <div class="box infomation">
            <h3 class="box_title">정보</h3>
<%--		<p class="icon">${detailMap.introduce_shop}<a href="javascript:void(0)">더보기</a></p> --%>
			<div class="icon">${detailMap.introduce_shop}</div><a id='intro_expend' href="javascript:void(0)">더보기</a>
            <p class="place"><span><i class="fas fa-map-marker-alt"></i></span>${detailMap.address}</p>
            <p class="time"><span><i class="far fa-clock"></i></span>${detailMap.start_date} - ${detailMap.end_date}</p>
            <p class="site_address"><span><i class="fas fa-home"></i></span>${detailMap.homepage_url}</p>
            <div class="map_box">
                <h4 class="map_title">찾아가는 길</h4>
                <div class="map" id="map"></div>
                <p class="map_address">주소</p>
            </div>

            <p class="ex">${detailMap.to_benefit}</p>
        </div>

        <div class="box price_box">
            <h3 class="box_title">가격표</h3>
            <c:forEach items="${goodsList}" var="obj">
            	<c:choose>
            		<c:when test="${obj.best eq 1}">
            			<div class="price_top">
			                <div class="sub_box_top">
			                    <p>${obj.name}<span class="best">BEST</span></p>
			                    <p class="price">${obj.price}원</p>
			                </div>
			                <div class="sub_box_bottom">
			                    <p>${obj.additional_info }</p>
			                </div>
			            </div>
            		</c:when>
            		<c:otherwise>
            		<div class="price_bottom">
		                <div class="sub_box_top">
		                    <p>${obj.name}</p>
		                    <p class="price">${obj.price}원</p>
		                </div>
		                <div class="sub_box_bottom">
		                    <p>${obj.additional_info }</p>
		                </div>
		            </div>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
        </div>
        
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
            
            




    </section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=721999101124afce77f5e74b66d6552c"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	<script>
		$(function() {
			
			$(document).click(function(e){
				if(!$(e.target).hasClass('.reportTriger')){
					
					$('.content').removeClass('reviewon');
					$('.report_box').css('display','none');
				}
			})
			
			
			
			$('#intro_expend').click(function(){
				
				if($('.box.infomation div.icon').css('white-space') == 'normal'){
					
					$('.box.infomation div.icon').css('width','100px').css('white-space','nowrap');
				}else{
					$('.box.infomation div.icon').css('width','100%').css('white-space','normal');
				}
				
			});
			
			$(window).scroll(function(){
				var num = $(this).scrollTop();
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