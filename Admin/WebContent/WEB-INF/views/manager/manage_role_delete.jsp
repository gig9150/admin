<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script>
	alert('역할 그룹 삭제가 완료되었습니다.');
	location.href = '${root}/manager/manage_role?page=${page}&searchOption=${searchOption}&keyWord=${keyWord}'
</script>