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
	<!--BZ027-후기-상세페이지-->
<form action="${root}/front/shop/shop_review_register_pro" method="Post" enctype="multipart/form-data">
	<input type="hidden" value="${shopIdx}" name="shopIdx">
	<section id="CH001-05" class="content">
		<div class="box top">
			<div class="icon_left">
				<a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a>
			</div>
			<h1 class="title">후기 작성</h1>
		</div>
		<div class="inner">
			<h2 class="ques">상품은 어떠셨나요?</h2>
			<div class="check_big_box">
			
				<c:forEach items="${categoryList}" var="obj">
					<div class="check_box">
						 <label><input type="checkbox" name="reviewKeywordCategoryId" value="${obj.review_keyword_category_id}" >&nbsp;${obj.content}</label>
					</div>
				</c:forEach>
			</div>

				<textarea name="content" id="text_box" cols="43" rows="10"
					placeholder="후기를 남겨주세요!" style="width:100%" required="required"></textarea>
			<div class="big_add">
				<div class="add_box">
					<div class="pic" style="position:relative;">
						<input type="file" style="opacity:0;height: 23px;" multiple="multiple" name="reviewImg" id="input_imgs"><i class="fas fa-camera" style="position: absolute;top:10px;right:17px;"></i>
					</div>
					<div class="txt"><span>0</span>/10</div>
				</div>
				<div class="add_box_bubble">
					<p>
						사진을 추가해 보세요! <a href="javascript:void(0)"><i class="fas fa-times"></i></a>
					</p>
				</div>
			</div>
			<div class="imgs_wrap">
				
			</div>
			<div class="btn">
				<button>후기작성 완료</a>
			</div>
		</div>
	</section>
</form>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script>
	
		// 다중 파일 업로드 코드 
		
		var sel_files = [];
	
		$(function(){
			$("#input_imgs").on("change",handleImgsFilesSelect);
		});
		
		function handleImgsFilesSelect(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			if($('.imgs_wrap').children().length > 9){
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
					var img_html = '<img src="' + e.target.result + '" style="width:100px;"/>';
					$('.imgs_wrap').append(img_html);
				}
				reader.readAsDataURL(f);
				
				$('.txt span').html(parseInt($(".txt span").html()) + 1);
				
			});
		}
	</script>
</body>
</html>