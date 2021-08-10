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
<script src="${root}/vendor/jquery/jquery.min.js"></script>
</head>
<body>
<!--MY012 -마이페이지 -가게프로필 신청하기(2)-->
<form id="shopRegi" method="post" action="${root}/front/mypage/shop_apply_pro" enctype="multipart/form-data">
	<section id="MY001-BZRG" class="content">
        <div class="box top">
            <div class="icon_left"><a href="${root}/front/myPage"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가게프로필 신청하기</h1>
        </div>
        <div class="inner">
            <div class="big_box btn_box">
               <h2 class="title">본인인증</h2>
                <div class="btn"><a href="javascript:void(0)">본인 인증하기</a></div>   
            </div>
            
            <div class="big_box middle_box">
                <h2 class="title">사업자 정보</h2>
                <div class="small_box box_4">
                    <label for="sbox_4">사업자 명</label>
                    <input type="text" name="memberName" id="sbox_4" placeholder="사업자 명을 입력해주세요.">
                </div>
                <div class="small_box box_5">
                    <label for="sbox_5">사업자 번호</label>
                    <input type="text" name="buisnessNum" id="sbox_5" placeholder="사업자 번호을 입력해주세요.">
                </div>
                <div class="small_box box_6">
                    <label for="sbox_6">사업자 상호</label>
                    <input type="text" name="buisnessName" id="sbox_6" placeholder="사업자 상호을 입력해주세요.">
                </div>
                <div class="small_box box_7">
                    <label for="sbox_7">사업자 주소</label>
                    <input type="text" name="buisnessAddress" readonly="readonly" id="sbox_7" placeholder="사업자 주소을 입력해주세요.">
                    <img src="${root}/img/search.png" id="address_btn">
                </div>
                <div class="small_box box_8">
                    <label for="sbox_8">업종&nbsp;&#8226;&nbsp;업태</label>
                    <input type="text" id="sbox_8" class="sector" placeholder="업종 업태를 입력해주세요.">
                    <input type="hidden" name="sectorId" value="1">
                </div>
                <p class="txt">&#42;2개 이상인 경우,<br> 대표 1가지만 작성해주세요.</p>
                <div class="small_box box_9">
                    <input id="buisinessRegi" type="text" placeholder="사업자등록증">
                    <button type="button" style="position: relative;">
                    <input type="file" id="regiFile" name="uploadFile" style="position: absolute;top: 3px;left: 23px;opacity: 0;">
                   	첨부</button>
                </div>
            </div>

            

            <div class="big_box bottom_box">
                <h3 class="title">가게프로필 정보</h3>
                <div class="small_box box_9">
                    <label for="sbox_9">가게프로필 명</label>
                    <input type="text" name="shopName" id="sbox_9" placeholder="가게프로필 명을 입력해주세요.">
                </div>
                <div class="small_box box_10">
                    <label for="sbox_10">등록 지역</label>
                    <input type="text" id="sbox_10" placeholder="등록 지역을 입력해주세요." readonly="readonly">
                    <input type="hidden" name="areaId" id="sbox_10_hid">
                    <img src="${root}/img/search.png" class="address_btn">
                </div>
                <div class="small_box box_11">
                    <div class="sub_box">
	                    <label for="keyword">키워드 등록</label>
	                    <input id="keyword"  type="text" placeholder="키워드를 입력해주세요.">
	                    <button type="button" id="keywordBtn">등록</button>
                    </div>
                    <ul class="sub_box_2">
                    
                    </ul>
                </div>
                <div class="btn box_12"><button>신청하기</button></div>
            </div>
        </div>
        
        <!-- 지역 선택 모달 -->
       	<div class="area_box">
	       <div class="top_box">
	            <h1 class="title">지역선택 <span><a class="closeAreaSelect" href="javascript:void(0)"><i class="fas fa-times"></i></a></span></h1>    
	       </div>
	        <ul>
	            <c:forEach items="${areaList}" var="obj">
	            	<li><a href="javacsript:void(0)" data-id="${obj.id}">${obj.area_name}</a></li>
	            </c:forEach>
	        </ul>
	    </div>
	    
	    <!-- 입력정보 부족 모달 -->
	    
	    <div class="break-inner">
            <p>입력정보가 부족합니다.<br>정보 필수값을 모두 입력해주세요.</p>
            <button class="sure">확인</button>
        </div>
	    
	    <!-- 가게 프로필 신청 완료 모달 -->
	     <div class="complete-inner">
            <p><span>[가게프로필명]</span>의<br>가게 프로필이 신청되었습니다.<br>심사는 영업일 기준 <span>3~5일 소요</span>됩니다.</p>
            <button class="sure">확인</button>
        </div>
        
    </section>
</form>
    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   	<script>
   	
   		$(function(){
   			
   			//지역 선택 모달
   			$('.address_btn').click(function(){
   				$('#MY001-BZRG').addClass('area');
   			});
   			
   			$('.closeAreaSelect').click(function(){
   				$('#MY001-BZRG').removeClass('area');
   			})
   			
   			$('.area_box li').click(function(){
   				$('#MY001-BZRG').removeClass('area');
   				let areaName = $(this).find('a').html();
   				let id = $(this).find('a').data('id');
   				$('#sbox_10').val(areaName);
   				$('#sbox_10_hid').val(id);
   			});
   			
   			//submit 조건 확인 
   			$('#shopRegi').submit(function(e){
   				
   				//필수 정보 입력 안하면 submit 불가 
   				if($('#sbox_4').val() == '' || $('#sbox_5').val() == '' || $('#sbox_6').val() == '' || $('#sbox_7').val() == '' || 
				$('#sbox_8').val() == '' || $('#sbox_9').val() == '' || $('#sbox_10').val() == '' || $('#regiFile').val() == ''){
   					
 					$('#MY001-BZRG').toggleClass("bre");
 					$('.break-inner').css('display','block');
					e.preventDefault();
					return;
				}
	   			
   				$('#MY001-BZRG').addClass('complete');
   				e.preventDefault();
   				
   			});
   			
   			//입력 내용 부족 모달
//    			$(document).on('click','.break-inner button',function(){		
//    				$('#MY001-BZRG').toggleClass("bre");			
//    			});
   			
   			$('.break-inner button').click(function(){
   				
   				$('.break-inner').css('display','none');
   				$('#MY001-BZRG').toggleClass("bre");
   				
   			});
   			
   			
   			//가게 신청 완료 모달 
   			$('.complete-inner button').click(function(){
   				$('#shopRegi')[0].submit();
   			});
   			
   			
   			//주소 검색
   			$('#address_btn').click(function(){
	   			new daum.Postcode({
	   		        oncomplete: function(data) {
	   		            $('#sbox_7').val(data.address);
	   		        }
	   		    }).open();
   			});
   			
   			//등록 지역 검색 
   			
   			
   			//파일명 노출 
   			$('#regiFile').on('change',function(){
   				let file = $(this).val().split("\\");
   				let fileName = file[file.length-1];
   				$('#buisinessRegi').val(fileName);
   			});
   			
   			//키워드 등록 
   			$('#keywordBtn').on('click',function(){
   				
   				if($('#keyword').val() == ''){
   					alert('키워드를 입력해주세요.');
   					return;
   				}
   				
   				//최대 다섯개
   				if($('.sub_box_2 div').length >= 5){
   					alert('키워드는 5개까지 등록 가능합니다');
   					return;
   				}
   				
   				let keyword = $('#keyword').val();
   				$('.small_box.box_11 .sub_box_2').append('<div><input name="keyword" readonly value="'+keyword+'"><span class="shopKeyword"><i class="fas fa-times"></i></span></div>');
   				$('#keyword').val('');
   				
   			});
   			
   			//키워드 클릭시 삭제 
   			$(document).on('click','.shopKeyword',function(){
   				$(this).parent().remove();
   			});
   			
   			
			//업종 자동완성 
			var jsonArraySec = new Array();	
   			
   			<c:forEach items="${secList}" var="obj">
   			
   				var jsonObj		= new Object();
   				
   				jsonObj.label	= '${obj.sector_content}';
   				jsonObj.value	= '${obj.sector_content}';
   				jsonObj.val = '${obj.sector_id}';
   					
   				jsonObj = JSON.stringify(jsonObj);
   				
   				jsonArraySec.push(JSON.parse(jsonObj));
   				
   			</c:forEach>
   			
   			$('.sector').autocomplete({
   				source: jsonArraySec,
   				select : function(event, ui) {
   					console.log(ui.item.val);
   					$('input[name="sectorId"]').val(ui.item.val);
   		        }
   			});
   			
   			
   
   			
   		});
   		
   	</script>
</body>
</html>