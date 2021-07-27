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
<form action="${root}/front/mypage/news_regi_pro" method="Post" enctype="multipart/form-data" >
	<input type="hidden" name="shopIdx" value="${map.shop_idx}">
    <!--    96페이지(6/30일 파일) #BZ002-TB02-RG01 가게프로필 탭 - 소개 (소식)-소식글 작성-->
    <section id="BZ002-TB02-RG01" class="content">
        <div class="top">
            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">${map.shop_name}</h1>
        </div>
        <ul class="box box1 imgs_wrap">
            <li><a href="javascript:void(0);">
            <input type="file" multiple="multiple" id="input_imgs" name="uploadFile"
            style="position: absolute;left: -5px;top: 20px;opacity: 0;z-index: 999;">
            <i class="fas fa-camera"></i><span>0/6</span></a></li>
            <li class="plus img-room"><a href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
            <li class="plus img-room"><a href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
            <li class="plus img-room"><a href="javascript:void(0);"><i class="fas fa-plus"></i></a></li>
        </ul>
        <div class="box box2">
            <label for="">소식글 종류</label>
            <div class="select">
				<select class="select" name="cateId">
					<c:forEach items="${list}" var="obj"> 
	                    <option value="${obj.shop_news_category_id}">${obj.cate_content}</option>
                	</c:forEach>
				</select>
                
            </div>
        </div>
        <div class="box box3">
            <label for="">소식글 제목</label>
            <input type="text" name="title">
        </div>
<!--         <div class="box box4"> -->
<!--             <label for="">쿠폰 첨부 (선택)</label> -->
<!--             <div class="coupon_btn"><a href="javascript:void(0)">쿠폰 첨부하기</a></div> -->
<!--         </div> -->
        <div class="box box5">
            <label for="">소식글 내용</label>
            <div class="txt">
            	<textarea name="content" style="padding: 10px;width: 100%;height: 100%;border: 1px solid #bbb;border-radius: 5px;"></textarea>
            </div>
        </div>
        	<div class="btn"><button>소식글 등록하기</button></div>
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
			
			//다중 이미지 처리
			$("#input_imgs").on("change",handleImgsFilesSelect);
			
		});
		
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