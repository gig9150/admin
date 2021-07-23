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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<title>Document</title>
</head>
<body>

	<!--58페이지 - #MY001-QA01-2  마이페이지_1:1문의_문의 작성하기-->
	<form action="${root}/front/mypage/question_register_pro" method="post" enctype="multipart/form-data">
	    <section id="MY001-QA01-2" class="content">
	        <div class="box top">
	            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
	            <h1 class="title">1:1 문의 작성하기</h1>
	        </div>
	        
	            <div class="box box_1">
	                <div class="pic">
	                	<img src="${memberMap.profile_image}">
	                </div>
	                <div class="info">
	                    <div class="sub_box"><p>${memberMap.name}</p></div>
	                    <div class="sub_box"><p>${memberMap.area_name}</p></div>
	                </div>
	            </div>
	        <div class="inner">
	            <div class="box box_2">
	                <select name="questionCategoryId">
	                    <c:forEach items="${categoryList}" var="obj">
	                    	<option value="${obj.question_category_id}">${obj.content }</option>
	                    </c:forEach>
	                </select>
	            </div>
	            <div class="box box_3">
					<textarea name="questionContent" rows="" cols="" style="height:100%;width:100%"></textarea>
	            </div>
	
	            <ul class="box box_4 imgs_wrap">
	                <li><a style="position: relative;" href="javascript:void(0);"><input multiple="multiple" type="file" 
	                name="questionImg" id="input_imgs" style="opacity: 0">
	                <i style="position: absolute;top: 5px;left: 35px;"  class="fas fa-camera"></i>
	                <span style="position: absolute;left: 32px;top: 16px;">0/6</span>
	                </a></li>
	                <li><a class="img-room" href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
	                <li><a class="img-room" href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
	                <li><a class="img-room" href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
	                <li><a class="img-room" href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
	            </ul>
	            <div class="box btn_box">
	                <button>문의 등록하기</button>
	            </div>
	        </div>
	    </section>
	</form>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
	
	<script>
	
		// 다중 파일 업로드 코드 
		
		var sel_files = [];
	
		$(function(){
			$("#input_imgs").on("change",handleImgsFilesSelect);
		});
		
		function handleImgsFilesSelect(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			if($('.imgs_wrap').children().length > 6){
				alert('사진은 10장까지만 가능합니다.');
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
					
					var img_html = '<img src="' + e.target.result + '" style="width:100%;height:100%"/>';
					
					$.each($('.img-room'),function(i,v){
						console.log($(this).children('img').length);
						if($(this).children('img').length < 1){
							$(this).empty();
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