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


<script src="${root}/vendor/jquery/jquery.min.js"></script>

<script>
	$(function(){
		
		opener.document.location.reload();
		window.open('','_self').close(); 
		
	});
</script>
</body>
</html>