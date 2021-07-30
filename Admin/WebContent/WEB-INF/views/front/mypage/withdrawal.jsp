<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="HHmm" /></c:set> 
<c:set var="day"><fmt:formatDate value="${today}" pattern="E"/></c:set>
<fmt:parseNumber var="date_N" value="${date}" integerOnly="true"/>
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
	<!--    62페이지 - #withdraw - 마이페이지 - 회원탈퇴-->
	<form action="${root}/front/mypage/withdrawal_pro" type="post" id="withRegiForm">
	   <section id="withdraw" class="content">
	       <div class="top">
	            <div class="icon_left"><a href="${root}/front/myPage"><i class="fas fa-chevron-left"></i></a></div>
	            <h1 class="title">회원 탈퇴</h1>
	        </div>
	        <p class="txt">
	           <span>[${name}]</span>님 탈퇴하시겠습니까?<br>탈퇴 시, 활동하였던 정보 모두 삭제되며<br>복구 불가합니다.   
	        </p>
	        <div class="reason">
	            <h2 class="reason_title">탈퇴 사유</h2>
	            <select id="reason" name="withCategoryId">
	                <option value="">선택해주세요</option>
	            </select>
	            <div class="text_box" style="padding:0">
	            <textarea name="withContent" rows="" cols="" style="width:100%;height:100%" placeholder="탈퇴 사유를 적어주세요."></textarea>
	            </div>
	        </div>
	        <div class="btn_box">
	            <div class="btn btn1"><a href="javascript:void(0)">탈퇴 취소</a></div>
	            <div class="btn btn2"><a id="with-btn" href="javascript:void(0);">탈퇴 하기</a></div>
	        </div>
	        
	        <div class="pop_up">
	            <div class="top">
	                <div class="icon_right"><a id="reason-cancel" href="javascript:void(0)"><i class="fas fa-times"></i></a></div>
	                <h1 class="title">탈퇴 사유 선택</h1>
	            </div>
	            <c:forEach items="${cateList}" var="obj">
		            <div class="box">
		               <a href="javascript:void(0);" data-id="${obj.with_category_id}">${obj.with_content}</a>
		            </div>
	            </c:forEach>
	        </div>
	        
	        <div class="confirm_box">
		        <p class="ask"><span>[${name}]</span>님 정말로 탈퇴하시겠습니까?<br>탈퇴 후 30일동안 재가입이 불가합니다.</p>
		        <div class="btn_box">
		            <div class="btn cancel"><a href="javascript:void(0)">취소</a></div>
		            <div class="btn sure"><a href="javascript:void(0)">확인</a></div>
		        </div>
		    </div>
	   </section>
	</form>
	
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/js/main.js"></script>
	
	<script>
		$(function(){
			
			//select box 클릭시 모달
			$('#reason').on('click',function(e){ 
				$('.content').addClass("out");
			});
			
			//x 버튼 클릭시 모달창 종료
			$('#reason-cancel').click(function(){
				$('.content').removeClass('out');
			});
			
			$('#withdraw .pop_up .box a').click(function(){
				let content = $(this).html();
				let id = $(this).data('id');
				$('#reason option').html(content);
				$('#reason option').val(id);
				$('.content').removeClass('out');
			});
			
			//탈퇴 확인 모달 
			$('#with-btn').click(function(){
				$('#withdraw').addClass('confirm');
				console.log('dd');
			});
			
			$('#withdraw .confirm_box .cancel').click(function(){
				$('#withdraw').removeClass('confirm');
			});
			
			$('#withdraw .confirm_box .sure').click(function(){
				$('#withRegiForm')[0].submit();
			})
		});
	
	</script>
</body>
</html>