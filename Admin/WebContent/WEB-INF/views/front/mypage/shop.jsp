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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="${root}/vendor/jquery/jquery.min.js"></script>
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
	
	.box.infomation p.icon{
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
</head>
<body>
    <!--    84페이지 - #BZ002-TB01-A 가게프로필 탭 - 소개 (가게정보관리)-->
    <section id="BZ002-TB01-A" class="content">
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/myPage"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">${map.shop_name}</h1>
            <div class="icon_right"><a href="javascript:void(0)"><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
        <div class="profile_top"><img src="${root}/upload/${map.main_image}" style="width:100%;height:100%;"></div>
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
            <p><span class="bell"><img src="${root}/img/group_2060.png" alt=""></span><span>컵주문시 받침대 서비스 이벤트중!</span></p>
        </div>

        <div class="box infomation">
            <h3 class="box_title">정보</h3>
            <p class="icon">${map.introduce_shop}</p><a id='intro_expend' href="javascript:void(0)">더보기</a>
            <p class="place"><span><i class="fas fa-map-marker-alt"></i></span>${map.address}</p>
            <p class="time"><span><i class="far fa-clock"></i></span>${map.start_date} - ${map.end_date}</p>
            <p class="site_address"><span><i class="fas fa-home"></i></span>${map.homepage_url}</p>

            <div class="map_box">
                <h4 class="map_title">찾아가는 길</h4>
                <div class="map" id="map"></div>
                <p class="map_address">충남 공주시 반포면 계룡대로 1392</p>
            </div>

            <p class="ex">${map.to_benefit}</p>
            
            <div class="btn"><a href="${root}/front/mypage/shop_update?shopIdx=${shopIdx}">가게 정보 관리하기</a></div>
        </div>

        <div class="box price_box">
        	
            <h3 class="box_title">가격표</h3>
            <c:forEach items="${goodsList}" var="obj">
	            <div class="price_top">
	                <div class="sub_box_top">
	                    <p>${obj.name}
	                    <c:choose>
	                    	<c:when test="${obj.best eq 1}">
	                    		<span class="best">BEST</span></p>
	                    	</c:when>
	                    	<c:otherwise>
	                    		</p>
	                    	</c:otherwise>
	                    </c:choose>
	                    <c:choose>
	                    	<c:when test="${not empty obj.price}">
	                    		<p class="price">${obj.price}원</p>
	                  		</c:when>
	                  		<c:otherwise>
	                  			<p class="price">${obj.min_price}원</p>
	                  		</c:otherwise>
	                    </c:choose>
	                    
	                </div>
	                <div class="sub_box_bottom">
	                    <p>${obj.additional_info}</p>
	                </div>
	            </div>
	        </c:forEach>

<!--             <div class="price_bottom"> -->
<!--                 <div class="sub_box_top"> -->
<!--                     <p>소수잔</p> -->
<!--                     <p class="price">10,900원</p> -->
<!--                 </div> -->
<!--                 <div class="sub_box_bottom"> -->
<!--                     <p>직접 디자인하고 제작까지한 소주잔</p> -->
<!--                 </div> -->
<!--             </div> -->
            <div class="btn"><a href="${root}/front/mypage/goods_manage?shopIdx=${shopIdx}">가격표 관리하기</a></div>
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

    </section>

    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=721999101124afce77f5e74b66d6552c"></script>
	
	<script>
		
	$(function(){
		
		$(document).click(function(e){
			if(!$(e.target).hasClass('.reportTriger')){
				
				$('.content').removeClass('reviewon');
				$('.report_box').css('display','none');
			}
		})
		
		
		
		$('#intro_expend').click(function(){
			
			if($('.box.infomation p.icon').css('white-space') == 'normal'){
				
				$('.box.infomation p.icon').css('width','100px').css('white-space','nowrap');
			}else{
				$('.box.infomation p.icon').css('width','100%').css('white-space','normal');
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
				$('.like-p').html(parseInt($('.like-p').html()) + 1);
				
			}else{
				
				$(this).find('i').removeClass('fa-thumbs-up').addClass('fa-thumbs-down');
				$.ajax({
					url:'${root}/front/shop/newsLikeDel/'+shopNewsId,
					type:'get',
					success:function(data){
						console.log(data);
					}
				});
				$('.like-p').html(parseInt($('.like-p').html()) - 1);
				
			}
		});
		
		$('.img_file').click(function(){
			location.href="${root}/front/mypage/profile_update?shopIdx=${shopIdx}";
		});
		
	});
	
	</script>
</body>
</html>