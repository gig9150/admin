<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
	
	.swal-modal {
		zoom:1.5;	
	}
	
	.swal-text{
		font-size:25px
	}
	
	.swal-button.swal-button--confirm{
	    width: 80px;
    	height: 40px;
	}
	
	.swal-button.swal-button--confirm{
	    background-color: #e78436;
		color: #ffffff;
	}
	
	.swal-button.swal-button--confirm:active{
		background-color: #e78436;
		color: #ffffff;
	}
	
</style>
</head>
<body>

</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
 	
 	swal({
		text : "회원 탈퇴가 완료되었습니다.",
    	closeOnClickOutside : false
 	}).then(function(){
 		location.href = "${root}/front/shop/shop_promotion";
 	});
 	
</script>
</html>

