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
<script src="${root}/vendor/jquery/jquery.min.js"></script>
</head>
<body>
<!--MY012 -마이페이지 -가게프로필 신청하기(2)-->
<form id="shopRegi" method="post" action="${root}/front/shop/shop_apply_pro" enctype="multipart/form-data">
    <section id="MY012_2" class="content">
        <div class="box top">
            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가게프로필 신청하기</h1>
        </div>
        <div class="inner">
            <div class="big_box btn"><a href="">본인인증하기</a></div>
            <div class="big_box middle_box">
                <h2 class="title">사업자 정보</h2>
                <div class="small_box box_4">
                    <label for="sbox_4">이&nbsp;름</label>
                    <input type="text" id="sbox_4" name="memberName">
                </div>
                <div class="small_box box_5">
                    <label for="sbox_5">사업자 번호</label>
                    <input type="text" id="sbox_5" name="buisnessNum">
                </div>
                <div class="small_box box_6">
                    <label for="sbox_6">사업자 상호</label>
                    <input type="text" id="sbox_6" name="buisnessName">
                </div>
                <div class="small_box box_7">
                    <label for="sbox_7">사업자 주소</label>
                    <input type="text" id="sbox_7" name="buisnessAddress">
                </div>
                <div class="small_box box_8">
                    <label for="sbox_8">업종&nbsp;&#8226;&nbsp;업태</label>
                    <input type="text" id="sbox_8" name="sector">
                </div>
                <p class="txt">&#42;2개 이상인 경우, 대표 1가지만 작성해주세요.</p>
            </div>

            <div class="big_box middle_box_2">
                <input type="text" id="buisinessRegi" placeholder="사업자등록증">
                <input type="file" id="regiFile" name="uploadFile">
            </div>

            <div class="big_box bottom_box">
                <h3 class="title">프로필 정보</h3>
                <div class="small_box box_9">
                    <label for="sbox_9">가게명</label>
                    <input type="text" id="sbox_9" name="shopName">
                </div>
                <div class="small_box box_10">
                    <label for="sbox_10">지역</label>
                    <input type="text" id="sbox_10" name="address">
                </div>
                <div class="small_box box_11">
                    <input type="text" id="keyword">
                    <button id="keywordBtn" type="button">키워드등록</button>
                </div>
                <div class="small_box box_12">
                	
                </div>
                <div class="btn box_12"><button type="submit">신청하기</button></div>
            </div>
        </div>
    </section>
</form>
    <script src="${root}/vendor/jquery/jquery.min.js"></script>
   	<script>
   	
   		$(function(){
   			
   			//파일명 노출 
   			$('#regiFile').on('change',function(){
   				let file = $(this).val().split("\\");
   				let fileName = file[file.length-1];
   				$('#buisinessRegi').val(fileName);
   			});
   			
   			//키워드 등록 
   			$('#keywordBtn').on('click',function(){
   				
   				//최대 다섯개
   				if($('.small_box.box_12 input').length >= 5){
   					alert('키워드는 5개까지 등록 가능합니다');
   					return
   				}
   				
   				let keyword = $('#keyword').val();
   				$('.small_box.box_12').append('<input type="button" name="keyword" class="shopKeyword" value="'+keyword+'">');
   				
   				$('#keyword').val('');
   			});
   			
   			//키워드 클릭시 삭제 
   			$(document).on('click','.shopKeyword',function(){
   				console.log('click');
   				$(this).remove();
   			});
   			
   			//submit 조건 확인 
   			$('#shopRegi').submit(function(e){
				
   				
   				//필수 정보 입력 안하면 submit 불가 
   				if($('#sbox_4').val() == '' || $('#sbox_5').val() == '' || $('#sbox_6').val() == '' || $('#sbox_7').val() == '' || 
				$('#sbox_8').val() == '' || $('#sbox_9').val() == '' || $('#sbox_10').val() == '' || $('#regiFile').val() == ''){
					alert('필수 정보를 모두 입력하세요');
					e.preventDefault();
				}
   				
   			});
   			
   			
   			
   		});
   		
   	</script>
</body>
</html>