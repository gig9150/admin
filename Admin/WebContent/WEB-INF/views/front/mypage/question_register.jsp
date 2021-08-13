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
	     <!--58페이지 - #MY001-QA01-2  마이페이지_1:1문의_문의 작성하기-->
	    <section id="MY001-QA01-2" class="content">
	        <div class="box top">
	            <div class="icon_left"><a href="javascript:history.back();"><i class="fas fa-chevron-left"></i></a></div>
	            <h1 class="title">1:1 문의 작성하기</h1>
	            <div class="icon_right"><a href="${root}/front/myPage"><i class="fas fa-times"></i></a></div>
	        </div>
	        <div class="box box_1">
	            <div class="pic">
	            	<img src="${memberMap.profile_image}">
	            </div>
	            <div class="info">
	                <div class="sub_box">
	                    <p>${memberMap.name}</p>
	                </div>
	                <div class="sub_box">
	                    <p>${memberMap.area_name}</p>
	                </div>
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
	            <textarea name="questionContent" id="" cols="30" rows="10" placeholder="문의 내용을 입력해주세요." class="box box_3"></textarea>
	            <div class="big_add">
	                <div class="add_box">
	                    <div class="pic"><a href="javascript:void(0)"><input multiple="multiple" type="file" 
	                	name="questionImg" id="input_imgs" style="opacity: 0;position: absolute;left: 0;top: 20px;"><i class="fas fa-camera"></i></a></div>
	                    <div class="txt">0/10</div>
	                </div>
	                <div class="add_box_bubble">
	                    <p>사진을 첨부해주세요! <a href="javascript:void(0)"><i class="fas fa-times"></i></a></p>
	                </div>
	            </div>
	            <div class="box imgs_wrap" style="margin-bottom: 20px;">
	            	
	            </div>
	            <div class="box btn_box">
	                <a id="submit_tag">문의 등록하기</a>
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
			
			
			$('#submit_tag').click(function(){
				$('form')[0].submit();
			});
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
					
					var img_html = '<img src="' + e.target.result + '" style="width:18%;height:60px;border-radius:50%;margin-right:1%;"/>';
					$('.imgs_wrap').append(img_html);
					
// 					$.each($('.img-room'),function(i,v){
// 						if($(this).children('img').length < 1){
// 							$(this).empty();
// 							$(this).append(img_html);
// 							return false;
// 						}
// 					});
				}
				
				$('.add_box .txt').html((parseInt($(".add_box .txt").html().charAt(0)) + 1) + "/10");
				
				reader.readAsDataURL(f);
				
			});
		}
	</script>
</body>
</html>