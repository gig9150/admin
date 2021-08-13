<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="HHmm" />
</c:set>
<c:set var="day">
	<fmt:formatDate value="${today}" pattern="E" />
</c:set>
<fmt:parseNumber var="date_N" value="${date}" integerOnly="true" />
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
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
</head>
<body>
	<!-- GNB001-EX01 가게홍보 메인페이지_큐레이션 [더보기]페이지-->
	<section id="GNB001-EX01" class="content">
		<div class="top">
			<div class="icon">
				<a href="javascript:history.back();"><img src="${root}/img/left.png" alt=""></a>
			</div>
			<h1 class="profile">${exhiInfo.exhi_name}</h1>
		</div>
		<div class="box banner">
			<img src="${root}/upload/${exhiInfo.banner_image}" style="width: 100%;height: 100%;">
		</div>

		<div class="box box_1">
			<ul class="right_box">
				<li><a href=""><i class="fas fa-bars"></i></a></li>
				<li><a href=""><i class="fas fa-th-large"></i></a></li>

			</ul>
		</div>


		<div class="inner">
			<c:forEach items="${curationShopList}" var="obj">
				
					<div class="sub_box">
						<a href="${root}/front/shop/shop_detail?shopIdx=${obj.shop_idx}">
							<div class="pic">
								<img style="width:100%;height:100%;" src="${root}/upload/${obj.main_image}">
							</div>
						</a>
						<div class="info">
							<ul class="sub_info sub_info_1">
								<li>${obj.shop_name}</li>
								<li>${obj.area_name}</li>
								<fmt:parseNumber var="startDate_N" value="${obj.start_date}" integerOnly="true" />
	                            <fmt:parseNumber var="endDate_N" value="${obj.end_date}" integerOnly="true" />
	                           	<c:choose>
	                           		<c:when test="${date_N > startDate_N and date_N < endDate_N and obj.holiday != day}">
	                           			<li style="color: #fff; background-color: #78a6d8;">영업중</li>
	                           		</c:when>
	                           		<c:otherwise>
	                           			<li style="color: #fff;background-color: #888">영업종료</li>
	                           		</c:otherwise>
	                           	</c:choose>
							</ul>
							<ul class="sub_info sub_info_2">
								<li>${obj.sector}/</li>
								<c:choose>
									<c:when test="${obj.holiday eq null}">
										<li>매일</li>
									</c:when>
									<c:otherwise>								
										<li>${obj.holiday} 휴무</li>									
									</c:otherwise>
								</c:choose>
								
								<li>${fn:substring(startDate_N,0,2)}:${fn:substring(startDate_N,2,4)} ~ ${fn:substring(endDate_N,0,2)}:${fn:substring(endDate_N,2,4)}</li>
							</ul>
							<ul class="sub_info sub_info_3">
								<li><i class="far fa-comment"></i></li>
								<li>${obj.reviewCount }</li>
								<br>
								<li><i class="fas fa-heart"></i></li>
								<li>${obj.bookmarkCount}</li>
							</ul>
						</div>
					</div>
			</c:forEach>
		</div>
		<div class="bottom_box">
            <div class="box">
                <div class="pic"><a href=""><i class="fas fa-home"></i></a></div>
                <div class="info"><a href="${root}/front/shop/shop_promotion">홈</a></div>
            </div>
            <div class="box">
                <div class="pic"><a href=""><i class="far fa-file-alt"></i></a></div>
                <div class="info"><a href="">동네현황</a></div>
            </div>
            <div class="box">
                <div class="pic"><a href=""><i class="far fa-edit"></i></a></div>
                <div class="info"><a href="">내 근처</a></div>
            </div>
            <div class="box">
                <div class="pic"><a href=""><i class="fas fa-map-marker-alt"></i></a></div>
                <div class="info"><a href="">채팅</a></div>
            </div>
            <div class="box">
                <div class="pic"><a href=""><i class="far fa-user"></i></a></div>
                <div class="info"><a href="${root}/front/myPage">MY</a></div>
            </div>
        </div>


	</section>

	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
	<script>
		$(function(){
				
				let page = 5;
				let exhiId = '${exhiId}';
				
				$(window).scroll(function(){
					
		            let $window = $(this);
		            let scrollTop = $window.scrollTop();
		            let windowHeight = $window.height();
		            let documentHeight = $(document).height();
		            
		            if( scrollTop + windowHeight == documentHeight ){
		            	
		            	
		            	
		            	$.ajax({
		            		url:'${root}/front/shop/shopPromotionCuration/'+page+'/'+exhiId,
		            		type:'get',
		            		dataType:'json',
		            		success:function(data){
		            			
		            			if(data == ''){
		            				alert('마지막 페이지입니다.');
		            				return;
		            			}
		            			
		            			$.each(data,function(index,val){
		            				
		            				let shopInfo = '';
		            				let startDate = parseInt(val.start_date);
		            				let endDate = parseInt(val.end_date);
		            				let dateN = '${data_N}';
		            				let day = '${day}';
		            				
		            				
		            				shopInfo += '<div class="sub_box">';
		            				shopInfo += '<div class="pic">';
		            				shopInfo += '<img style="width:100%;height:100%;" src="${root}/upload/'+val.main_image+'">';
		            				shopInfo += '</div>';
		            				shopInfo += '<div class="info">';
		            				shopInfo += '<ul class="sub_info sub_info_1">';
		            				shopInfo += '<li>'+val.shop_name+'</li>&nbsp;';
		            				shopInfo += '<li>'+val.area_name+'</li>';
		           					if(dateN > startDate && dateN < endDate && val.holiday != day){
		           						shopInfo += '<li style="color: #fff; background-color:#78a6d8;">영업중</li>';
		           					}else{
		           						shopInfo += '<li style="color: #fff;background-color:#888">영업종료</li>';
		           					}
		            				shopInfo += '</ul>';
		            				shopInfo += '<ul class="sub_info sub_info_2">';
		            				shopInfo += '<li>'+val.sector+' /</li>';
		            				shopInfo += '<li>'+val.holiday+' 휴무 </li>&nbsp;';
		            				shopInfo += '<li>'+val.start_date+'~'+val.end_date+'</li>';
		            				shopInfo += '</ul>';
		            				shopInfo += '<ul class="sub_info sub_info_3">';
		            				shopInfo += '<li style="margin-right: 5px;"><i class="far fa-comment"></i></li>';
		            				shopInfo += '<li style="margin-right: 5px;">'+val.reviewCount+'</li><br>';
		            				shopInfo += '<li style="margin-right: 5px;"><i class="fas fa-heart"></i></li>';
		            				shopInfo += '<li>'+val.bookmarkCount+'</li>';
		            				shopInfo += '</ul></div></div>';
		            				
									$('.inner').append(shopInfo);
								});
		            			
		            			page = page + 5;
		            		}
		            	});
		            }
		        });
				
			});
	</script>
</body>
</html>