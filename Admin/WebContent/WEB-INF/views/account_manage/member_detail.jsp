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
    
    <link href="${root}/css/bo-style.css" rel="stylesheet">
    
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	
	<style>
	
		.crud-col label{
		    margin-right: 70px;		
		}
		
	
	</style>

</head>
<body>
<div class="container-fluid">

     <br><hr><br>
     <div class="card shadow mb-4">
         <div class="card-header py-3">
             <h6 class="m-0 font-weight-bold text-primary">회원 상세정보</h6>
         </div>
         <div class="card-body">
			<table class="table" style="text-align:center">
				<colgroup>
					<col width="15%">
					<col width="10%">
					<col width="16%">
					<col width="10%">
					<col width="16%">
					<col width="10%">
					<col width="23%">
				</colgroup>
				<tbody>
					<tr>
						<td rowspan="3"></td>
						<th>닉네임</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
						<th>회원번호</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
						<th>등록지역</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
					</tr>
					<tr>
						<th>가입상태</th>
						<td>
							<select class="form-control">
								<option>정상</option>
								<option>탈퇴</option>
							</select>
						</td>
						<th>가맹사</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
						<th>가입일</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
					</tr>
					<tr>
						<th>관리자 메모</th>
						<td colspan="3"><input type="text" class="form-control" readonly="readonly"></td> 
						<th>최근 접속일</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
					</tr>
				</tbody>
			</table>
         </div>
	</div>
	
	<div class="card shadow mb-4">
         <div class="card-header py-3">
             <h6 class="m-0 font-weight-bold text-primary">회원 활동 정보</h6>
         </div>
         <div class="card-body">
			<table class="table" style="text-align:center">
				<colgroup>
					<col width="12%">
					<col width="21%">
					<col width="12%">
					<col width="21%">
					<col width="12%">
					<col width="22%">
				</colgroup>
				<tbody>
					<tr>
						<th>로그인</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
						<th>판매상품</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
						<th>신고</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
					</tr>
					<tr>
						<th>단골 목록</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
						<th>게시글</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
						<th>패널티</th>
						<td><input type="text" class="form-control" readonly="readonly"></td>
					</tr>
				</tbody>
			</table>
         </div>
	</div>
	
	
</div>

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
	<script src="${root}/js/bo-script.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>