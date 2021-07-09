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
<title>Document</title>
</head>
<body>
	<!--    BZ026 - 소식-->
	<section id="BZ026" class="content">
		<div class="box top">
			<div class="icon_left">
				<a href="${root}/front/shop/shop_promotion"><i class="fas fa-times"></i></a>
			</div>
			<h1 class="title">${detailMap.shop_name}</h1>
			<div class="icon_right">
				<a href="javascript:void(0)" id="reportTriger"><i class="fas fa-share-alt"></i></a>
			</div>
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
				<p class="title_bottom">
					<span>${detailMap.sigungu_name}</span><span>&#8226;</span><span>${detailMap.sector}</span>
				</p>
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
			<p>
				<span><i class="fas fa-bullhorn"></i></span>${detailMap.notice_info}
			</p>
		</div>
		
		<c:forEach items="${newsList}" var="obj">
			<div class="box infomation">
				<div class="title_box">
					<div class="pic"></div>
					<div class="info">
						<h4 class="info_title">${detailMap.shop_name}</h4>
						<p class="sub_title">
							${obj.address}<span>&#8226;</span>${obj.regdate}
						</p>
						<a href="javascript:void(0);" class="bar"><i class="fas fa-ellipsis-v"></i></a>
					</div>
				</div>
				<div class="txt_box">
					<div class="info">
						<p class="txt_title">${obj.title}</p>
						<p class="txt">
							${obj.content} <a href="${root}/front/shop/shop_news_extend?shopNewsId=${obj.shop_news_id}">더보기</a>
						</p>
					</div>
<!-- 					<div class="pic"></div> -->
					<img src="${root}/upload/${obj.imageList[0]}" class="pic">
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${fn:length(obj.imageList) == 0}"> --%>
<!-- 							<div class="pic"></div> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${fn:length(obj.imageList) == 1}"> --%>
<!-- 							<div class="pic pic_1"></div> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${fn:length(obj.imageList) == 2}"> --%>
<%-- 							<c:forEach items="${obj.imageList}" var="obj2"> --%>
<!-- 								<div class="pic pic_2"> -->
<%-- 			                    	<div class="small_box"><img src="${root}/upload/${obj2}" ></div> --%>
<%-- 			                    	<div class="small_box"><img src="${root}/upload/${obj2}" ></div> --%>
<!-- 	               				 </div> -->
<%-- 	               			</c:forEach> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
						
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
					
				</div>
			</div>
			<div class="bottom">
				<ul class="good">
					<li><a href=""><i class="far fa-thumbs-up"></i></a></li>
					<li>좋아요</li>
					<li>${obj.like_count}</li>
				</ul>
				<ul class="comment">
					<li><a href=""><i class="far fa-comment"></i></a></li>
					<li>댓글</li>
					<li>${obj.comment_count}</li>
				</ul>
			</div>
		</c:forEach>
		
		
		<!-- 가게 신고 modal -->
		<div class="report_box" style="display:none">
            <p class="report"><a class="reportA" href="">신고하기</a></p>
        </div>
            
        <!-- 팝업 modal -->
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
		            	<div class="btn sure"><a href="${root}/front/shop/shop_bookmark?shopIdx=${detailMap.shop_idx}&nowPage=news">확인</a></div>
                	</c:when>
                	<c:otherwise>
                		<div class="btn sure"><a href="${root}/front/shop/shop_bookmark_cancel?shopIdx=${detailMap.shop_idx}&nowPage=news">확인</a></div>
                	</c:otherwise>
                </c:choose>
            </div>
        </div>
        
	</section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script>
		$(function(){
			
			//가게신고
			$('#reportTriger').on('click',function(){
				$('.reportA').prop('href','${root}/front/shop/shop_report_category?status=shop&shopIdx=${detailMap.shop_idx}');
				if($('.content').hasClass('reviewon')){
					$('.content').removeClass('reviewon');
					$('.report_box').css('display','none');
				}else{
					$('.content').addClass('reviewon');
					$('.report_box').css('display','block');
				}
			});
			
			$('.bar').on('click',function(){
				$('.reportA').prop('href','${root}/front/shop/shop_report_category?status=news&shopIdx=${detailMap.shop_idx}');
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
			
		});
		
	</script>
</body>
</html>