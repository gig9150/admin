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
</head>
<body>
<!--    109페이지 - #BZ002-DE01-2 가게프로필 - 가게프로필 삭제-->
    <section id="BZ002-DE01-2" class="content">
        <div class="top">
            <div class="icon_left"><a href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가게프로필 삭제</h1>
        </div>
        <form action="${root}/front/mypage/profile_delete_pro" method="get" id="shopWithForm">
        	<input type="hidden" name="shopIdx" value="${map.shop_idx}">
	        <div class="inner">
	            <div class="box box1">
	                <span>[${map.shop_name}]</span>을 삭제하시겠습니까?<br>삭제시, 활동하였던 정보 못두 삭제되며<br>복구 불가합니다.
	            </div>
	            <div class="box box2">
	                <h3>삭제 사유</h3>
	                <select class="select" name="id">
	                	<c:forEach items="${list}" var="obj">
	                		<option value="${obj.shop_with_category_id}">${obj.content}</option>
	                	</c:forEach>
	                	
	                </select>
					<textarea rows="" cols="" class="txt" name="content"></textarea>
	            </div>
	            <div class="box btn_box">
	                <div class="btn btn1"><a href="javascript:void(0)">삭제 하기</a></div>
	                <div class="btn btn2"><a href="">삭제 취소</a></div>
	            </div>
	        </div>
		</form>
		

        <div class="pop_up_box">
            <p class="ask"><span>[${map.shop_name}]</span> 계정을<br>정말 삭제하시겠습니까?<br>삭제된 계정과 관련 데이터는<br> 복구 불가합니다.</p>
            <div class="btn_box">
                <div class="btn cancel"><a href="">취소</a></div>
                <div class="btn sure"><a href="javascript:void(0);">확인</a></div>
            </div>
        </div>
        
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
			$('.btn1 a').click(function(){
				$('#BZ002-DE01-2').addClass('on');
			});
			
			$('.sure').click(function(){
				
				$('#shopWithForm')[0].submit();
				
			});
		});
	
	</script>
</body>
</html>