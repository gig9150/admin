<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
 	
 	swal({
		title : "success!",
		text : "등록이 완료되었습니다.",
    	closeOnClickOutside : false
 	}).then(function(){
 		
 		window.close();
 		window.opener.location.href = "${root}/operation/question";
 	});
 	
</script>
</html>

