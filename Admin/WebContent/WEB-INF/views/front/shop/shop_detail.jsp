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
<title>Document</title>
</head>
<body>
<!--    가게 프로필 상세정보-->
    <section id="BZ014" class="content">
  
      
       <div class="box top">
           <div class="icon_left"><a href="${root}/front/shop/shop_promotion"><i class="fas fa-times"></i></a></div>
           <h1 class="title">${detailMap.shop_name}</h1>
           <div class="icon_right"><a href="javascript:void(0)" id="reportTriger"><i class="fas fa-share-alt"></i></a></div>
       </div>
 
          
           <div class="box box_1">
           		<c:choose>
           			<c:when test="${detailMap.main_image != null}">
           				<img src="${root}/upload/${detailMap.main_image}">
           			</c:when>
           			<c:otherwise>
           				<div class="pic">
              			</div>
           			</c:otherwise>
           		</c:choose>
               <div class="info">
                   <h2 class="sub_title">${detailMap.shop_name}</h2>
                   <p class="title_bottom"><span>${detailMap.sigungu_name}</span><span>&#8226;</span><span>${detailMap.sector}</span></p>
                   <!-- 단골 등록 확인  -->
                   <c:choose>
                   	<c:when test="${checkNum eq 1}">
                   		<div class="regular"><a id="regularMember" href="javascript:void(0)"><span><i class="fas fa-check"></i></span>단골<span>${bookmarkCnt}</span></a></div>
                   	</c:when>
                   	<c:otherwise>
                   		<div class="regular" style="background-color:#e78436"><a style="color:#ffffff" id="regularMember" href="javascript:void(0)"><span><i class="fas fa-check"></i></span>단골<span>${bookmarkCnt}</span></a></div>
                   	</c:otherwise>
                   </c:choose>
               </div>
           </div>
           
           <ul class="box box_2">
               <li><a href="" tel><span><i class="fas fa-phone-alt"></i></span>전화문의</a></li>
               <li><a href=""><span><i class="fas fa-comments"></i></span>채팅문의</a></li>
               <li><a href="${root}/front/shop/shop_review_register?shopIdx=${detailMap.shop_idx}"><span><i class="far fa-edit"></i></span>후기작성</a></li>
               <li></li>
           </ul>
           
           <ul class="box box_3">
               <li><a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}">홈</a></li>
               <li><a href="${root}/front/shop/shop_news?shopIdx=${detailMap.shop_idx}">소식</a></li>
               <li><a href="${root}/front/shop/shop_review?shopIdx=${detailMap.shop_idx}">후기</a></li>
           </ul>
           
           <div class="box notice">
             <p><span><i class="fas fa-bullhorn"></i></span>${detailMap.notice_info}</p>
           </div>
           
            <div class="box infomation">
                <h3 class="info_title">정보</h3>
                <p class="icon">${detailMap.introduce_shop}&nbsp;<a href="">더보기</a></p>
                <p class="place"><span><i class="fas fa-map-marker-alt"></i></span>${detailMap.area_name}&nbsp;${detailMap.sigungu_name}&nbsp;${detailMap.area} </p>
                <p class="time"><span><i class="far fa-clock"></i></span>${detailMap.start_date} - ${detailMap.end_date}<span>&nbsp;${detailMap.holiday} 휴무</span></p>
                
				<p class="ex">"${detailMap.to_benefit}"</p>
				
				<div id="map" style="width:100%;height:300px;margin-bottom:15px;z-index: 0;"></div>
                
                <div class="share"><a href="">공유하기</a></div>
                
            </div>
            <c:set var="goodsLoop" value="false"/>
            <div class="box infomation" style="position:relative;">
            
                <h3 class="info_title">가격</h3>
                
	                <c:forEach items="${goodsList}" var="obj" varStatus="status">
	                	<c:if test="${not goodsLoop}">
			                 <div class="testDiv" style="position: relative;">
				             	<p class="icon">${obj.name } &nbsp;</p>
				             	<c:if test="${obj.price != null }">	
				             		<p style="position: absolute;right: 2px;top: -2px;font-weight:700">${obj.price }원</p>
				             	</c:if>
				             	<c:if test="${obj.min_price != null }">	
				             		<p style="position: absolute;right: 2px;top: -2px;font-weight:700">${obj.min_price}원</p>
				             	</c:if>
				             	<c:if test="${obj.additional_info != null }">
					             	<p class="ex" style="height:35px;position:relative;margin-top: 10px;"><span style="position: absolute;bottom: -6px;right: 44%;">${obj.additional_info}</span> </p>			             	
				             	</c:if>
				             </div>
				             <c:if test="${status.count == 5 }">
				             	<c:set var="goodsLoop" value="true"/>
				             </c:if>
	                	</c:if>
	                </c:forEach>
             	
<!--              	<div class="testDiv" style="position: relative;"> -->
<!-- 	             	<p class="icon">도토리병 &nbsp;</p> -->
<!-- 	                <p style="position: absolute;right: 2px;top: -2px;font-weight:700">111원</p> -->
<!-- 	             	<p class="ex" style="height:35px;position:relative;margin-top: 10px;"><span style="position: absolute;bottom: -6px;right: 44%;">도토리병 1개</span> </p> -->
<!-- 	             </div> -->
	             
<!-- 	             <div class="testDiv" style="position: relative;"> -->
<!-- 	             	<p class="icon">도구리병&nbsp;</p> -->
<!-- 	                <p style="position: absolute;right: 2px;top: -2px;font-weight:700">222원</p> -->
<!-- 	             	<p class="ex" style="height:35px;position:relative;margin-top: 10px;"><span style="position: absolute;bottom: -6px;right: 44%;">도쿠리병 1개</span> </p> -->
<!-- 	             </div> -->
             	
            </div>
            
          <div class="review_top">
			<p class="box_1">
				후기<span>${reviewCnt}</span>
			</p>
			<div class="box_2">
				<c:choose>
					<c:when test="${sort eq 'latest'}">
						<p><span style="color:#e78436">&#8226;</span>
						<a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}&sort=latest" 
						style="font-weight:bold;display:inline-block;font-size:14px;">최신순</a></p>
						<p><span>&#8226;</span><a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}&sort=like" style="color:#bbb;">도움순</a></p>
					</c:when>
					<c:otherwise>
						<p><span>&#8226;</span><a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}&sort=latest" style="color:#bbb;">최신순</a></p>
						<p><span style="color:#e78436">&#8226;</span>
						<a href="${root}/front/shop/shop_detail?shopIdx=${detailMap.shop_idx}&sort=like" 
						style="font-weight: bold;display:inline-block;font-size:14px;">도움순</a></p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="box review_infomation">
			
			<c:set var="reviewLoop" value="false"/>
			<c:forEach items="${reviewList}" var="obj" varStatus="status">
				<c:if test="${not reviewLoop}">
					<div class="title_box">
						<div class="pic"></div>
						<div class="info">
							<h4 class="info_title">${obj.nickName}</h4>
							<p class="sub_title">
								${obj.address}<span>인증 3회</span><span>&#8226;</span>${obj.regdate}
							</p>
							<a href="" class="bar"><i class="fas fa-ellipsis-v"></i></a>
						</div>
					</div>
					<div class="txt_box">
						<div class="info">
							<p class="txt">
								${obj.review_content}
							</p>
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
		</div>
		<c:set var="newsLoop" value="false"/>
		<div class="box news_infomation" style="position:relative;">
	        <h3 class="info_title">소식</h3>
	        <c:forEach items="${newsList}" var="obj" varStatus="status">
	        	<c:if test="${not newsLoop}">
		        	<div style="position:relative; margin-bottom:10px;">
				       	<img src="${root}/upload/${obj.imageList[0]}">
				       	<p>${obj.title}</p>
		       	 	</div>
		       	 	<c:if test="${status.count == 5}">
						<c:set var="newsLoop" value="true"/>
					</c:if>	
		       	</c:if>
	        </c:forEach>

	       	<div class="share"><a href="">공유하기</a></div>
             	
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=721999101124afce77f5e74b66d6552c"></script>
	
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