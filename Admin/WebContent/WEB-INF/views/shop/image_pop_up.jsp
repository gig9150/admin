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
	<div id="imageDiv">
	
	</div>
</body>

<!-- Bootstrap core JavaScript-->
<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${root}/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
	
	$(function(){
		
		$.ajax({
			url:"${root}/shop/getImageInfo/"+ ${shopIdx},
			type:'get',
			success:function(data){
				$.each(data,function(index,value){
					$('#imageDiv').append('<img src="${root}/upload/'+value+'">');
				});
			}
		});
		
	});
	
</script>
</html>