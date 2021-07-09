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
<style>	

	
</style>
</head>
<body>	
	<section id="join_2" class="content">
	    <p>회원 가입이 완료 되었습니다.</p>
	    <button>확인</button>
	</section>
</body>
<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script>
 	
 	$(function(){
 		$('#join_2 button').on('click',function(){
 			
 			location.href='${root}/front/shop/shop_promotion';
 			
 		});
 	});
 
</script>
</html>

