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
<form action="${root}/front/mypage/profile_update_pro" method="Post" enctype="multipart/form-data" id="proUpdateForm">
	<input type="hidden" name="shopIdx" value="${shopIdx}">
	<!--    99페이지(6/30파일) #BZ002-PF01 가게프로필 – 가게 프로필 수정-->
    <section id="BZ002-PF01" class="content">
        <div class="top">
            <div class="icon_left"><a href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가게프로필 수정</h1>
            <div class="icon_right"><a href="javascript:history.back();"><i class="fas fa-times"></i></a></div>
        </div>
        <div class="pic">
        	<img src="${root}/upload/${map.main_image}" style="width: 100%;height: 100%;border-radius: 50%;">
            <label for="file_box"><i class="fas fa-camera"></i></label>
            <input type="file" id="file_box" name="uploadFile">
        </div>
        <div class="inner">
            <div class="box box1">
                <h4>가게 대표이미지</h4>
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                    	<c:forEach items="${imgList}" var="obj">
	                        <div class="swiper-slide">
                        		<img src="${root}/upload/${obj}" style="width: 100%;height: 100%;">
	                        </div>
                    	</c:forEach>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <ul class="box box2 imgs_wrap">
                <li><a href="javascript:void(0);">
                <input type="file" multiple="multiple" id="input_imgs" name="mulUploadFile"
                style="position: absolute;left: -5px;top: 20px;opacity: 0;z-index: 999;">
                <i class="fas fa-camera"></i><span>0/6</span></a></li>
                <li class="plus img-room"><a href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
                <li class="plus img-room"><a href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
                <li class="plus img-room"><a href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
            </ul>
            
            <div class="box box3">
                <label for="">가게프로필명</label>
                <input type="text" placeholder="가게 프로필명을 입력해주세요." name="shopName" value="${map.shop_name}">
            </div>
            
            <div class="box box4">
                <label for="">지역 설정</label>
                <select name="area">
                	<c:forEach items="${areaList}" var="obj">
	                	<option value="${obj.id}" <c:if test="${map.id eq obj.id}">selected</c:if>>${obj.area_name}</option>
                	</c:forEach>
                </select>
            </div>
            
            <div class="box box5">
                <label for="">키워드 입력</label>
                <div class="input_box">
                    <input type="text" placeholder="키워드를 입력해주세요" id="keyIn">
                    <button type="button" id="keyBtn">등록</button>
                    <c:forEach items="${keyList}" var="obj">
                    	<input type="hidden" name="keyword" value="${obj}">
                    </c:forEach>	
                </div>
                <ul>
                	<c:forEach items="${keyList}" var="obj">
	                    <li>${obj}<span><a href="javascript:void(0)"><i class="fas fa-times"></i></a></span></li>
                	</c:forEach>
                </ul>
            </div>
            <div class="btn regi-btn"><a href="javascript:void">프로필 수정하기</a></div>
        </div>
        
        <div class="name-inner">
            <p>현재 사용중인 가게명입니다.<br>가게명을 다시 설정해주세요</p>
            <button type="button" class="name-btn">확인</button>
        </div>
        
        <div class="pop_up_box">
            <p class="ask">가게명 변경 시<br>30일동안 가게명 변경 불가합니다.<br>정보를 변경하시겠습니까?</p>
            <div class="btn_box">
                <div class="btn cancel"><a href="">취소</a></div>
                <div class="btn sure"><a href="javascript:void(0)">확인</a></div>
            </div>
        </div>
        
        <div class="input-inner">
            <p>[가게프로필명] or [지역설정]은<br>필수 입력 항목입니다.<br>필수 항목을 입력해주세요.</p>
            <button type="button">확인</button>
        </div>
        
        <div class="final-inner">
            <p>가게 정보가 변경되었습니다.</p>
            <button type="button">확인</button>
        </div>

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
		
		var sel_files = [];
	
		$(function(){
			

			//등록된 이미지 갯수 미리 추가
			$('.imgs_wrap span').html('${fn:length(imgList)}' + "/6");
			
			//프로필 이미지
			$("#file_box").on('change', function(){
		        readInputFile(this);
		    });
			
			//다중 이미지 처리
			$("#input_imgs").on("change",handleImgsFilesSelect);
			
			//키워드 추가 
			$('#keyBtn').on('click',function(){
				
				let content = $('#keyIn').val();
				
				if(content == ''){
					
					alert('키워드를 입력해주세요');
					return;
					
				}
				
				$('.box5 ul').append('<li>'+content+'<span><a href="javascript:void(0)"><i class="fas fa-times"></i></a></span></li>');
				$('#keyIn').val('');
				
				$('.box5 .input_box').append('<input type="hidden" name="keyword" value="'+content+'">');
				
			});
			
			//키워드 삭제
			$('.box5 ul li i').click(function(){
				
				$(this).parent().parent().parent().remove();
				
			});
			
			$('.regi-btn').click(function(){
				
				let shopName = $('input[name="shop_name"]').val();
				
				$.ajax({
					url:'${root}/front/mypage/chkShopName/'+shopName,
					type:'get',
					success:function(data){
						if(data.trim() == 'false'){
							$('#BZ002-PF01').addClass('on1');
							return;
						}
					}
				});
				
				if($('input[name="shop_name"]').val() == '' || $('input[name="area"]').val() == ''){
					$('#BZ002-PF01').addClass('on3');
					return;
				}
				
				$('#BZ002-PF01').addClass('on2');
				
			});

			$('.name-btn').click(function(){
				$('#BZ002-PF01').removeClass('on1');
			});
			
			$('.input-inner button').click(function(){
				$('#BZ002-PF01').removeClass('on3');
			});
			
			$('.pop_up_box .sure').click(function(){
				$('#BZ002-PF01').removeClass('on2');
				$('#BZ002-PF01').addClass('on4');
			});

			
			$('.final-inner button').click(function(){
				$('#proUpdateForm')[0].submit();
			});

			
			
// 			$('.box2 li.plus').after().click(function () {});

// 			const dt = new DataTransfer(); // Permet de manipuler les fichiers de l'input file

// 			$("#input_imgs").on('change', function(e){
				
// 				// Ajout des fichiers dans l'objet DataTransfer
// 				for (let file of this.files) {
// 					dt.items.add(file);
// 				}
				
// 				// Mise à jour des fichiers de l'input file après ajout
// 				this.files = dt.files;

// 				// EventListener pour le bouton de suppression créé
				
// 			});
			
// 			$('.box2 li.plus').after().click(function(){
// 				let name = $(this).files.item($('.box2 li.plus').after().index($(this))).name;
// 				// Supprimer l'affichage du nom de fichier
// 				$(this).parent().remove();
// 				for(let i = 0; i < dt.items.length; i++){
// 					// Correspondance du fichier et du nom
// 					if(name === dt.items[i].getAsFile().name){
// 						// Suppression du fichier dans l'objet DataTransfer
// 						dt.items.remove(i);
// 						continue;
// 					}
// 				}
// 				// Mise à jour des fichiers de l'input file après suppression
// 				document.getElementById('input_imgs').files = dt.files;
// 			});
		
		
		
			
			
			
			
		});
		
		// 프로필 이미지
		function readInputFile(input) {
	        if(input.files && input.files[0]) {
		    	$('.pic img').remove();
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('.pic').append('<img src="'+e.target.result+'" style="width: 100%;height: 100%;border-radius: 50%;">');
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
		
		// 이미지 다중 등록 
		function handleImgsFilesSelect(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			if(parseInt($(".imgs_wrap span").html().charAt(0)) > 5){
				alert('사진은 6장까지만 가능합니다.');
				return;
			}
			
			filesArr.forEach(function(f){
				
				if(!f.type.match("image.*")){
					alert('확장자는 이미지 확장자만 가능합니다.');
					return;
				}
				
				sel_files.push(f);
				var reader = new FileReader();
				reader.onload = function(e){
					
					var img_html = '<img src="' + e.target.result + '" style="width:100%;height:100%;position:absolute;top: 0;left: 0;"/>';
					
					$.each($('.img-room'),function(i,v){
						if($(this).children('img').length < 1){
							$(this).append(img_html);
							return false;
						}
					});
				}
				
				$('.imgs_wrap span').html((parseInt($(".imgs_wrap span").html().charAt(0)) + 1) + "/6");
				
				reader.readAsDataURL(f);
				
				
			});
		}
		
	</script>

</body>
</html>