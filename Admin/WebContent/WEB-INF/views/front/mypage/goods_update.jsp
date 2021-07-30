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
<style>

	.price_btn li.on{
		background-color: #4472c4
	}
	
	.price_btn li.on a{
		color: #fff;
	}
		
	.price_btn li:not(.on){
		background-color: #fff;
		border: 1px solid #4472c4;
	}
	
	.price_btn li:not(.on) a{
		color: #4472c4;
	}
	
</style>

</head>
<body>

	<!--    86페이지(6/30일 파일) - #BZ002-TB01-B-2 - 가게프로필 탭 – 소개 (가격표) _ 가격표생성하기-->
<form action="${root}/front/mypage/goods_update_pro" method="get" id="goodsAddForm">
	<input type="hidden" name="goodsId" value="${goodsId}">
	<input type="hidden" name="shopIdx" value="${shopIdx}">
    <section id="BZ002-TB01-B-2" class="content">
        <div class="top">
            <div class="icon_left"><a href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가격표 수정하기</h1>
        </div>
        <div class="box box1">
            <label for="">판매제품(서비스)</label>
            <input type="text" name="name" value="${map.name}">
        </div>
        <div class="box box2">
        	<c:choose>
        		<c:when test="${map.best eq 1}">
		        	<input type="checkbox" id="box2" name="best" checked="checked">
		            <label for="box2"><em style="background-position: right"></em>베스트 제품으로 선택</label>
        		</c:when>
        		<c:otherwise>
        			<input type="checkbox" id="box2" name="best">
		            <label for="box2"><em></em>베스트 제품으로 선택</label>
        		</c:otherwise>
        	</c:choose>
        </div>
        <div class="box box3">
            <label for="">판매가격</label>
            
            
       	<c:choose>
       		<c:when test="${map.state eq 1}">
       			<ul class="price_btn">
             <li class="on"><a href="javascript:void(0)">정가</a></li>
             <li><a href="javascript:void(0)">최소금액</a></li>   
              </ul>
               <input type="text"  id="price-in" name="price" value="${map.price}" placeholder="가격입력( 00,000원 )">   
       		</c:when>
       		<c:otherwise>
   				<ul class="price_btn">
       			<li><a href="javascript:void(0)">정가</a></li>
             <li class="on"><a href="javascript:void(0)">최소금액</a></li>  
              </ul>
              <input type="text"  id="price-in" name="minPrice" value="${map.min_price}" placeholder="가격입력( 00,000원 ~ )">
       		</c:otherwise>
       	</c:choose>
           	
            
           
        </div>
        <div class="box box4">
            <label for="">추가설명(선택)</label>
            <div class="txt" style="padding:0;border:none;"><textarea name="additionalInfo" rows="" cols="" placeholder="판매제품에 대한 설명을 작성해주세요." 
            style="padding: 10px;width: 100%;height: 230px;border: 1px solid #bbb;border-radius: 5px;font-size: 14px;color: #777;">${map.additional_info }</textarea></div>
        </div>
        <div class="btn regi-btn"><a href="javascript:void(0)">가격표 수정하기</a></div>
    </section>
</form>
    
    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="${root}/js/main.js"></script>
	<script>
	
		$(function(){
			
			//베스트 제품 checkbox
			$('em').click(function(){
				
				if($(this).css('background-position-x') == '100%'){
					
					$(this).css('background-position','left');
					$('input[name="best"]').prop("checked",false);
					
				}else{
					
					$(this).css('background-position','right');
					$('input[name="best"]').prop("checked",true);
					
				}
				
			});
			
			//정가,최소금액 toggle
			$('.price_btn li').click(function(){
				
				if(!$(this).hasClass('on')){
					
					$('.price_btn li').not($(this)).removeClass('on');
					
					if($('.price_btn li').index($(this)) == 1){
						$('#price-in').attr('name','minPrice');
						$('#price-in').attr('placeholder','가격입력 ( 00,000원 ~ )');
					}else{
						$('#price-in').attr('name','price');
						$('#price-in').attr('placeholder','가격입력( 00,000원 )');
					}
					
					$(this).addClass('on');
					
				}else{
					
					
					if($('.price_btn li').index($(this)) == 1){
						$('#price-in').attr('name','minPrice');
						$('#price-in').attr('placeholder','가격입력 ( 00,000원 ~ )');
					}else{
						$('#price-in').attr('name','price');
						$('#price-in').attr('placeholder','가격입력( 00,000원 )');
						$('#price-hid-in').attr('name','price');
					}
					
				}
				
			});
			
			$('.regi-btn').click(function(e){

				swal({
					
					text : "가격표 수정이 완료되었습니다.",
					closeOnClickOutside : false
					
				}).then(function(value){
					
					$('#goodsAddForm')[0].submit();
					
				});
				
			});
			
			
		});
		
	</script>
	
</body>
</html>