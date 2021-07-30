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
    	
    	.form-control{
    		width:70%;
    		margin-left: 5%;
   		 	display: inline-block;
    	}
    	
    	.row{
    		margin-bottom: 20px;
    	}
    	
    	
    	

    </style>
   

</head>
<body>
<form action="${root}/operation/FAQ_register_pro" method="post">
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">검색</h6>
			</div>
				<div class="card-body">
					<div class="row">
						<div class="col-sm-1">
							<label>카테고리</label>
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="categoryId">
								<c:forEach items="${cateList}" var="obj">
									<option value="${obj.frequent_question_category_id}">${obj.content}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-2">
							<label>가맹사</label>
						</div>
						<div class="col-sm-4">
							<label><input type="checkbox" class="allChk">&nbsp;모두 선택</label>&nbsp;
							<c:forEach items="${franchiseList}" var="obj">
								<label><input type="checkbox" class="chk" value="${obj.franchise_id}" name="franchiseId">&nbsp;${obj.franchise_name}</label>&nbsp;		
							</c:forEach>
						</div>
						<div class="col-sm-1">
							노출 상태
						</div>
						<div class="col-sm-2">
							<label><input type="radio" required="required" value="1" name="viewStatus">&nbsp;Y</label>
							<label><input type="radio" required="required" value="2" name="viewStatus">&nbsp;N</label>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-1">
							제목
						</div>
						<div class="col-sm-11">
							<input type="text" required="required" class="form-control" style="width:100%;margin-left:0" name="title">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-1" style="margin-bottom: 50px;">
							내용
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<textarea rows="10" required="required" class="form-control" style="width:100%;margin-left:0" name="content"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 text-center">
							<button type="button" class="btn btn-secondary add-btn">등&nbsp;&nbsp;록</button>
						</div>
					</div>
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

<script>
	$(function(){
		
		
		$('.allChk').click(function() {
			if ($(this).prop('checked')) {
				$('.chk').prop('checked',true);
			} else {
				$('.chk').prop('checked',false);
			}
		});
		
		$('.add-btn').click(function(){
			alert('등록 완료');
			$('form')[0].submit();
		});
		
	});

</script>
</body>
</html>