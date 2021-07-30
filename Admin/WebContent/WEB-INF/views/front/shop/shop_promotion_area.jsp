<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="HHmm" /></c:set> 
<c:set var="day"><fmt:formatDate value="${today}" pattern="E"/></c:set>
<fmt:parseNumber var="date_N" value="${date}" integerOnly="true"/>
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
	#GNB001-JY01-2{position: relative;}
	#GNB001-JY01-2.areaSelect::after{position: absolute; left: 0; top: 0; content:''; display: block; width: 100%; height: 100%; }	
</style>
</head>
<body>
<section id="GNB001-JY01-2" class="content">
     <div class="top">
            <div class="top_left">
                <input type="text" placeholder="검색어를 입력해주세요">
                <a href=""><i class="fas fa-search"></i></a>
            </div>
            <div class="top_right">
                <a href="" class="bell_1"><i class="far fa-bell"></i></a>
                <a href="" class="bell_2">20</a>
            </div>
        </div>

        <ul id="gnb">
            <li><a href="${root}/front/home">홈</a></li>
            <li><a href="${root}/front/shop/shop_promotion">가게홍보</a></li>
            <li><a href="">산지직거래</a></li>
            <li><a href="">중고장터</a></li>
            <li><a href="">일상</a></li>
        </ul>
        
        <div class="box box_1">
            <ul class="place">
                <li class="place"><a href="javascript:void(0);">지역<span><i class="fas fa-chevron-down"></i></span></a></li>
                <li><a href="javascript:void(0)">${shopList[0].area_name}</a></li>
            </ul>
            <ul class="right_box">
                <li><a href=""><i class="fas fa-bars"></i></a></li>
                <li><a href=""><i class="fas fa-th-large"></i></a></li>
                <li><a href=""><i class="fas fa-filter"></i></a></li>
            </ul>
        </div>
           <div class="inner">
           	<c:forEach items="${shopList}" var="obj">
	            <div class="sub_box">
	                <div class="pic">
	                	<img style="width:100%;height:100%;" src="${root}/upload/${obj.main_image}">
	                </div>
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
	                        <li>${obj.holiday} 휴무</li>
	                        <li>${fn:substring(startDate_N,0,2)}:${fn:substring(startDate_N,2,4)} ~ ${fn:substring(endDate_N,0,2)}:${fn:substring(endDate_N,2,4)}</li>
	                    </ul>
	                    <ul class="sub_info sub_info_3">
	                        <li><i class="far fa-comment"></i></li>
	                        <li>${obj.reviewCount}</li><br>
	                        <li><i class="fas fa-heart"></i></li>
	                        <li>${obj.bookmarkCount}</li>
	                    </ul>
	                </div>
	            </div>
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
        
        <!-- 지역선택 modal -->
	    <section id="GNB001-JY01" class="content" style="display:none;">
		    <div class="box">
		       <div class="top_box">
		            <h1 class="title">지역선택 <span><a class="closeAreaSelect" href="javascript:void(0)"><i class="fas fa-times"></i></a></span></h1>
		       </div>
		        <ul class="area-ul">
		        	<li><a class="all-a">지역 전체</a></li>
		            <c:forEach items="${areaList}" var="obj">
		            	<li><a data-id="${obj.id}">${obj.area_name}</a></li>
		            </c:forEach>
		        </ul>
		    </div>
		</section>

        
</section>

<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${root}/js/main.js"></script>
<script>

	$(function(){
		
		let page = 5;
		let area = '${area}';
		
		//스크롤 페이징 
		$(window).scroll(function(){
			
            let $window = $(this);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            
            if( scrollTop + windowHeight == documentHeight ){
            	
            	
            	
            	$.ajax({
            		url:'${root}/front/shop/shopPromotionArea/'+page+'/'+area,
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
		
		//지역 선택창 ON
		$('.place').on('click',function(){
			$('#GNB001').addClass('areaSelect');
			$('#GNB001-JY01').css('display','block');
		});
		
		//지역선택창 OFF
		$('.closeAreaSelect').on('click',function(){
			$('#GNB001').removeClass('areaSelect');
			$('#GNB001-JY01').css('display','none');
		});	
		
		$('.area-ul li a').not('all-a').on('click',function(){
			
			let id = $(this).data('id');
			location.href="${root}/front/shop/shop_promotion_area?area="+id;
	
		});
		
		$('.all-a').on('click',function(){
			location.href="${root}/front/shop/shop_promotion_area";
		});

        
        
	});
	
	

</script>
</body>
</html>