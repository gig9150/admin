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
<title>Document</title>
</head>
<body>
 <!-- 27페이지 - #BZ001-TB01 - 가게 프로필 (일반 회원 진입 시)-->
    <section id="BZ001-TB01" class="content">
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/shop/shop_promotion"><i class="fas fa-times"></i></a></div>
            <h1 class="title">${detailMap.shop_name}</h1>
            <div class="icon_right"><a href="javascript:void(0)" id="reportTriger"><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
        <ul id="gnb">
            <li><a href="">소개</a></li>
            <li><a href="">소식</a></li>
            <li><a href="">상품<span>8</span></a></li>
            <li><a href="">후기<span>9</span></a></li>
        </ul>
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
<!--             <div class="regular"><a id="regularMember" href="javascript:void(0)"> -->
<%--        		<span><i class="fas fa-check"></i></span>단골<span>${bookmarkCnt}</span></a></div> --%>

        </div>

        <div class="call">
            <div class="call_left"><a href=""><span><i class="fas fa-phone"></i></span>전화문의</a></div>
            <div class="call_right"><a href="${root}/front/shop/shop_review_register?shopIdx=${detailMap.shop_idx}"><span><i class="fas fa-edit"></i></span>후기작성</a></div>
        </div>

        <ul class="tab">
            <li><a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}">홈</a></li>
            <li><a href="${root}/front/shop/shop_news2?shopIdx=${detailMap.shop_idx}">소식</a></li>
            <li><a href="${root}/front/shop/shop_review2?shopIdx=${detailMap.shop_idx}">후기1</a></li>
        </ul>

        <div class="box notice">
            <p><span><i class="fas fa-bullhorn"></i></span>알림 없어용</p>
        </div>

        <div class="box infomation">
            <h3 class="box_title">정보</h3>
            <p class="icon"><i class="far fa-smile-wink"></i><i class="far fa-grin-stars"></i><i class="far fa-grin-stars"></i><i class="far fa-grin-stars"></i><i class="far fa-grin-stars"></i>${detailMap.introduce_shop}<a href="">더보기</a></p>
            <p class="place"><span><i class="fas fa-map-marker-alt">${detailMap.address}</i></span></p>
            <p class="time"><span><i class="far fa-clock"></i></span>${detailMap.start_date} - ${detailMap.end_date}<span>${detailMap.holiy }</span></p>


            <p class="ex">${detailMap.to_benefit}</p>
        </div>

        <div class="box price">
            <h3 class="box_title">가격</h3>
            <c:forEach items="${goodsList}" var="obj">
	            <div class="price_top">
	                <div class="sub_box_top">
	                    <p>${obj.name}</p>
	                    <p>${obj.price} 원</p>
	                </div>
	                <div class="sub_box_bottom">
	                    <p>${obj.additional_info}</p>
	                </div>
	            </div>
            </c:forEach>
        </div>
		<c:set var="newsLoop" value="false"/>
        <div class="box news">
            <h3 class="box_title">소식</h3>
            <c:forEach items="${newsList}" var="obj" varStatus="status">
            	<c:if test="${not newsLoop}">
		            <div class="sub_box">
		                <div class="pic">
		                	<img src="${root}/upload/${obj.imageList[0]}" style="width: 100%;height: 100%;">
		                </div>
		                <div class="info">
		                    <p class="sub_title">${obj.title}</p>
		                    <p>${obj.content}</p>
		                </div>
		                <c:if test="${status.count == 5}">
							<c:set var="newsLoop" value="true"/>
						</c:if>	
		            </div>
		       </c:if>
	        </c:forEach>
            <div class="btn"><a href="">소식 더보기</a></div>
        </div>
		<c:set var="reviewLoop" value="false"/>
        <div class="box review">
            <h3 class="box_title">후기<span>${reviewCnt}</span></h3>
            <c:forEach items="${reviewList}" var="obj" varStatus="status">
            <c:if test="${not reviewLoop}">
	            <div class="title_box">
	                <div class="pic"></div>
	                <div class="info">
	                    <h4 class="info_title">${obj.nickName}</h4>
	                    <p class="sub_title">${obj.area_name}<span>&#8226;</span>${obj.regdate }</p>
	                    <a href="" class="bar"><i class="fas fa-ellipsis-v"></i></a>
	                </div>
	            </div>
	            <div class="txt_box">
	                <div class="info">
	                    <p class="txt">${obj.review_content}<i class="far fa-smile-wink"></i><i class="far fa-smile-wink"></i></p>
	                    <ul class="tag">
	                        <c:forEach items="${obj.keywordList}" var="obj2">
								<li><p>${obj2}</p></li>
							</c:forEach>
	                    </ul>
	                </div>
	                <ul class="recom">
	                    <li><i class="far fa-thumbs-up"></i></li>
	                    <li>도움이 돼요</li>
	                    <li>${obj.like}</li>
	                </ul>
	            </div>
	            <c:if test="${status.count == 5}">
					<c:set var="reviewLoop" value="true"/>
				</c:if>
	        </c:if>
	        </c:forEach>
            <div class="btn"><a href="">소식 더보기</a></div>
        </div>
        
        <div class="box bottom_box">
            <div class="box">
                <div class="pic"><i class="fas fa-home"></i></div>
                <div class="info"><a href="">홈</a></div>
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
                <div class="info"><a href="">MY</a></div>
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