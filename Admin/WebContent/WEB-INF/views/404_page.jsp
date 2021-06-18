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

	div
	{
		position: absolute;
	    top: 40%;
	    left: 40%;
	}
	
	a
	{
		position: absolute;
    	left: 133px;
	}
	
</style>
</head>
<body>
	<div>
		<h1>서비스 준비중 입니다.</h1>
		<a href="${root}">home</a>
	</div>
</body>
</html>