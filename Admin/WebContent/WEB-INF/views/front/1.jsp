<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--    84페이지 - #BZ002-TB01-A 가게프로필 탭 - 소개 (가게정보관리)-->
  <section id="BZ002-TB01-A" class="content">
  
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
       
        <div class="big_box">
            <div class="box box1"> <!--가게 기본정보-->
                <h3 class="title">가게 기본정보</h3>
                <ul class="txt_box">
                    <li>[알림] - 별도 배너 (시안 전달예정)</li>
                    <li>소개문구</li>
                    <li>주소</li>
                    <li>영업시간</li>
                    <li>예1. 월~금 9:00~18:00(토,일 휴무)</li>
                    <li>예1. 월,수,목,토 9:30~18:30(화,금,일 휴무)</li>
                    <li>전화번호</li>
                    <li>홈페이지</li>
                    <li>옵션정보</li>
                    <li>[카달로그서비스 회원 혜택]</li>
                </ul>
                <div class="btn"><a href="${root}/front/mypage/shop_update?shopIdx=${shopIdx}">가게 정보 관리하기</a></div>
            </div>
             <div class="box box2">
                <h3 class="title">가격표</h3><!--가격표-->
                <div class="txt_box">
                    <c:forEach items="${goodsList}" var="obj">
	                    <div class="sub_box">
	                        <div class="top_box">
	                            <h4 class="sub_title">${obj.name}</h4>
	                            <c:choose>
	                            	<c:when test="${not empty obj.price}">
			                            <p class="price">${obj.price}원</p>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<p class="price">${obj.min_price}원</p>
	                            	</c:otherwise>
	                            </c:choose>
	                        </div>
	                        <div class="bottom_box"><p>${obj.additional_info}</p></div>
	                        <c:if test="${not empty obj.best}">
		                        <div style="margin-top:10px;">
		                        <span style="font-weight:bold;background-color: #9999ff;text-align: center;padding:5px;">
		                        best</span></div>
	                        </c:if>
	                    </div>
                    </c:forEach>
                    </div>
                <div class="btn"><a href="${root}/front/mypage/goods_manage?shopIdx=${shopIdx}">가격표 관리하기</a></div>
            </div>
            
             <div class="box box3">
                <h3 class="title">소식</h3><!--소식-->
                <div class="txt_box">
                	<c:forEach items="${newsList}" var="obj">
	                   <div class="sub_box">
	                        <div class="pic"><img src="${root}/upload/${obj.imageList[0]}" style="width:100%;height:100%;"></div>
	                        <div class="info">
	                            <h4 class="info_title">${obj.title }</h4>
	                            <p class="thumb"><span><i class="far fa-thumbs-up"></i></span>좋아요&nbsp;${obj.likeCnt}</p>
	                        </div>
	                    </div>
                	</c:forEach>
                    
                </div>
                <div class="btn"><a href="${root}/front/mypage/shop_news?shopIdx=${shopIdx}">소식 더보기</a></div>
            </div>
            
             <div class="box box4">
                <h3 class="title">후기</h3>
                
                <div class="txt_box">
	                	<div class="big_box">
	                        <div class="small_box small_box_1">
	                            <div class="pic">
	                            	<img src="${root}/upload/${reviewList[0].profile_image}" style="width:100%;height:100%">
	                            </div>
	                            <div class="info">
	                                <div class="sub_box_1"><p>${reviewList[0].name}<span>HOLIC</span></p></div>
	                                <ul class="sub_box_2">
	                                    <li><p><i class="fas fa-pencil-alt"></i><span>${reviewList[0].reviewCnt}</span></p></li>
	                                    <li><p>${reviewList[0].regdate}</p></li>
	                                </ul>
	                            </div>
	                            <ul class="right_box">
	                                <li><p>방금전</p></li>
	                                <li><a href="javascript:void(0)"><i class="fas fa-ellipsis-v"></i></a></li>
	                            </ul>
	                        </div>    
	                        <ul class="small_box txt_box">
	                            <li><p>${reviewList[0].content}</p></li>
	                        </ul>
	                        <div class="swiper-container">
	                            <div class="swiper-wrapper">
	                            	<c:forEach items="${reviewList[0].imageList}" var="obj">
		                                <div class="swiper-slide">
		                                	<img src="${root}/upload/${obj}" style="width:100%;height:100%">
		                                </div>
	                            	</c:forEach>
	                                
	                            </div>
	                        </div>
	                        <ul class="small_box thumb_box">
	                            <li><a href="javascript:void(0)"><i class="far fa-thumbs-up"></i></a></li>
	                            <li><p>좋아요</p></li>
	                            <li><p>${reviewList[0].likeCnt}</p></li>
	                            <li class="slash"><p>/</p></li>
	                            <li><p>조회</p></li>
	                            <li><p>${reviewList[0].view_count}</p></li>
	                        </ul>
	                    </div>
   
                    
                </div>
                <div class="btn"><a href="${root}/front/mypage/shop_review?shopIdx=${shopIdx}">후기 더보기</a></div>
            </div>
        </div>
    </section>

    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
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