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
	#GNB001{position: relative;}
	#GNB001.areaSelect::after{position: absolute; left: 0; top: 0; content:''; display: block; width: 100%; height: 100%; }	
</style>
</head>
<body>
<!--#GNB001   GNB탭 - 가게홍보 큐레이션 페이지-->
    <section id="GNB001" class="content">
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
        
        <div class="box_3">
            <div class="place"><a href="javascript:void(0)">지역<span><i class="fas fa-chevron-down"></i></span></a></div>
        </div>
        
        
        	
       	<c:forEach items="${curationList}" var="obj" varStatus="status">
       		<div class="swiper-container box_4">
	            <div class="sub_title_box">
	               <div class="top_box">
	                    <h2 class="sub_title">${obj.exhiName}</h2>
	                    <ul class="list">
	                        <li><p># ${obj.exhiSub}</p></li>
	                    </ul>
	                </div>
	                <ul class="view_more">
	                    <li><a href="${root}/front/shop/shop_promotion_curation?shopExhiId=${obj.shopExhiId}">더보기</a></li>
	                    <li><a href="${root}/front/shop/shop_promotion_curation?shopExhiId=${obj.shopExhiId}"><i class="fas fa-chevron-right"></i></a></li>
	                </ul>
	            </div>
	            <div class="swiper-wrapper">
	            	<c:forEach items="${obj.curationList}" var="obj2">
		                <div class="swiper-slide">
		                    <div class="sub_box">
		                        <div class="pic">
		                        	<a href="${root}/front/shop/shop_detail?shopIdx=${obj2.shopIdx}"><img style="width:100%;height:100%;" src="${root}/upload/${obj2.mainImage}"></a>
		                        </div>
		                        <div class="info">
		                            <ul class="sub_info sub_info_1">
		                                <li>${obj2.shopName}</li>
		                                <li>${obj2.areaName}</li>
		                                <fmt:parseNumber var="startDate_N" value="${obj2.startDate}" integerOnly="false"/>
		                                <fmt:parseNumber var="endDate_N"  value="${obj2.endDate}" integerOnly="false" />
		                               	<c:choose>
		                               		<c:when test="${date_N > startDate_N and date_N < endDate_N and obj2.holiday != day}">
		                               			<li>영업중 </li>
		                               		</c:when>
		                               		<c:otherwise>
		                               			<li>영업종료</li>
		                               		</c:otherwise>
		                               	</c:choose>
		                            </ul>
		                            <ul class="sub_info sub_info_2">
		                                <li>${obj2.sector }/${obj2.holiday} 휴무 </li><br>
		                                <li>${fn:substring(startDate_N,0,2)}:${fn:substring(startDate_N,2,4)} ~ ${fn:substring(endDate_N,0,2)}:${fn:substring(endDate_N,2,4)}</li>
		                            </ul>
		                            <ul class="sub_info sub_info_3">
		                                <li><i class="far fa-comment"></i></li>
		                                <li>${obj2.reviewCount}</li><br>
		                                <li><i class="fas fa-heart"></i></li>
		                                <li>${obj2.bookmarkCount}</li>
		                            </ul>
		                        </div>
		                    </div>
		                </div>
	            	</c:forEach>
	                </div>
	            </div>
       	</c:forEach>

<!--         <div class="swiper-container box_5"> -->
<!--             <div class="sub_title_box"> -->
               
<!--                     <h2 class="sub_title">우리가게 이벤트 소식</h2> -->
                    
<!--                 <ul class="view_more"> -->
<!--                     <li><a href="">더보기</a></li> -->
<!--                     <li><a href=""><i class="fas fa-chevron-right"></i></a></li> -->
<!--                 </ul> -->
<!--             </div> -->
<!-- 			<div class="swiper-wrapper"> -->
<!--                 <div class="swiper-slide"> -->
<!--                     <div class="sub_box"> -->
<!--                         <div class="pic"></div> -->
<!--                         <div class="info"> -->
<!--                             <ul class="sub_info sub_info_1"> -->
<!--                                 <li>휘연</li> -->
<!--                                 <li>반포면</li> -->
<!--                                 <li>영업중</li> -->
<!--                             </ul> -->
<!--                             <ul class="sub_info sub_info_2"> -->
<!--                                 <li>까페/매일</li><br> -->

<!--                                 <li>11&#58;00&#126;21&#58;00</li> -->
<!--                             </ul> -->
<!--                             <ul class="sub_info sub_info_3"> -->
<!--                                 <li><i class="far fa-comment"></i></li> -->
<!--                                 <li>2</li><br> -->
<!--                                 <li><i class="fas fa-heart"></i></li> -->
<!--                                 <li>0</li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="swiper-slide"> -->
<!--                     <div class="sub_box"> -->
<!--                         <div class="pic"></div> -->
<!--                         <div class="info"> -->
<!--                             <ul class="sub_info sub_info_1"> -->
<!--                                 <li>휘연</li> -->
<!--                                 <li>반포면</li> -->
<!--                                 <li>영업중</li> -->
<!--                             </ul> -->
<!--                             <ul class="sub_info sub_info_2"> -->
<!--                                 <li>까페/매일</li><br> -->

<!--                                 <li>11&#58;00&#126;21&#58;00</li> -->
<!--                             </ul> -->
<!--                             <ul class="sub_info sub_info_3"> -->
<!--                                 <li><i class="far fa-comment"></i></li> -->
<!--                                 <li>2</li><br> -->
<!--                                 <li><i class="fas fa-heart"></i></li> -->
<!--                                 <li>0</li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="swiper-slide"> -->
<!--                     <div class="sub_box"> -->
<!--                         <div class="pic"></div> -->
<!--                         <div class="info"> -->
<!--                             <ul class="sub_info sub_info_1"> -->
<!--                                 <li>휘연</li> -->
<!--                                 <li>반포면</li> -->
<!--                                 <li>영업중</li> -->
<!--                             </ul> -->
<!--                             <ul class="sub_info sub_info_2"> -->
<!--                                 <li>까페/매일</li><br> -->

<!--                                 <li>11&#58;00&#126;21&#58;00</li> -->
<!--                             </ul> -->
<!--                             <ul class="sub_info sub_info_3"> -->
<!--                                 <li><i class="far fa-comment"></i></li> -->
<!--                                 <li>2</li><br> -->
<!--                                 <li><i class="fas fa-heart"></i></li> -->
<!--                                 <li>0</li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->


        <div class="bottom_box">
            <div class="box">
                <div class="pic"><i class="fas fa-home"></i></div>
                <div class="info"><a href="${root}/front/home">홈</a></div>
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
        
        <!-- 지역선택 modal -->
	    <section id="GNB001-JY01" class="content" style="display:none;">
		    <div class="box">
		       <div class="top_box">
		            <h1 class="title">지역선택 <span><a class="closeAreaSelect" href="javascript:void(0)"><i class="fas fa-times"></i></a></span></h1>
		               
		       </div>
		        
		        <ul>
		            <li><a href="${root}/front/shop/shop_promotion_area">공주시 전체</a></li>
		            <li><a href="">유구읍</a></li>
		            <li><a href="">이인면</a></li>
		            <li><a href="">탄천면</a></li>
		            <li><a href="">계룡면</a></li>
		            <li><a href="">반포면</a></li>
		            <li><a href="">의당면</a></li>
		            <li><a href="">정안면</a></li>
		            <li><a href="">우성면</a></li>
		            <li><a href="">사곡면</a></li>
		            <li><a href="">신풍면</a></li>
		            <li><a href="">중학동</a></li>
		            <li><a href="">웅진동</a></li>
		            <li><a href="">금학동</a></li>
		            <li><a href="">옥룡동</a></li>
		            <li><a href="">신관동</a></li>
		            <li><a href="">월송동</a></li>
		            <li><a href="">월송동</a></li>
		        </ul>
		    </div>
		</section>
		
    </section>
    
    
<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${root}/js/main.js"></script>
<script>
	$(function(){
		
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
		
	});
</script>
</body>
</html>