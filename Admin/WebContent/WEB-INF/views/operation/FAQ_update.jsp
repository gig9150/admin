<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template -->
    <link href="${root}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
    
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${root}/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${root}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <style>
    	html{
    		padding: 70px;
    		font-size:18px;
    	}
    	
    	td label {
    		width:100%
    	
    	}
    	
    	.row{
    		margin-bottom: 20px;
    	}
    	
    	
    	

    </style>
   

</head>
<body>
<form action="${root}/operation/FAQ_update_pro" method="post">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1">
				<label>카테고리</label>
			</div>
			<div class="col-sm-2">
				<select class="form-control">
					<option>선택</option>
				</select>
			</div>
			<div class="col-sm-2">
				<label>가맹사</label>
			</div>
			<div class="col-sm-4">
				<label><input type="checkbox">&nbsp;모두 선택</label>
				<label><input type="checkbox">&nbsp;A</label>
				<label><input type="checkbox">&nbsp;B</label>
				<label><input type="checkbox">&nbsp;C</label>
			</div>
			<div class="col-sm-1">
				등록일
			</div>
			<div class="col-sm-2">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-1">
				게시글 번호
			</div>
			<div class="col-sm-2">
				<input type="text" class="form-control">
			</div>
			<div class="col-sm-2">
				노출 상태
			</div>
			<div class="col-sm-4">
				<label><input type="radio">&nbsp;Y</label>
				<label><input type="radio">&nbsp;N</label>
			</div>
			<div class="col-sm-1">
				작성자
			</div>
			<div class="col-sm-2">
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-1">
				제목
			</div>
			<div class="col-sm-11">
				<input type="text" class="form-control" style="width:100%;margin-left:0">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-1" style="margin-bottom: 50px;">
				내용
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<textarea rows="10" class="form-control" style="width:100%;margin-left:0"></textarea>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 text-center">
				<button class="btn btn-secondary">등&nbsp;&nbsp;록</button>
			
			</div>
		</div>
	</div>
</form>

<!-- Bootstrap core JavaScript-->
<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${root}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${root}/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${root}/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${root}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${root}/js/demo/datatables-demo.js"></script>

<!-- alert 라이브러리 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>