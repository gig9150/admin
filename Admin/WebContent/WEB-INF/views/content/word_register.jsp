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
<form action="${root}/content/word_register_pro" method="get">
	<input type="hidden">
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">금지어 등록</h6>
			</div>
				<div class="card-body">
					<div class="row">
						<div class="col-sm-1">
							<label>적용범위</label>
						</div>
						<div class="col-sm-11">
							<label><input type="checkbox" class="allChk">&nbsp;모두 선택</label>&nbsp;&nbsp;
							<label><input type="checkbox" name="textTitle" class="chk">&nbsp;글 제목</label>&nbsp;&nbsp;
							<label><input type="checkbox" name="textContent" class="chk">&nbsp;글 내용</label>&nbsp;&nbsp;
							<label><input type="checkbox" name="reviewContent" class="chk">&nbsp;후기 내용</label>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-1">
							적용 키워드
						</div>
						<div class="col-sm-6">
							<input type="text" class="form-control key-in" style="width:100%;margin-left:0">
						</div>
						<div class="col-sm-2">
							<button type="button" class="add-key btn btn-primary">키워드 입력</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row key-row">
				
			</div>
			<div class="row">
				<div class="col-sm-12 text-center">
					<button type="button" class="btn btn-secondary add-btn">등&nbsp;&nbsp;록</button>
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
		
		//등록 정보 확인
		$('.add-btn').click(function(){

			if(!$('.chk').prop('checked')){
				alert('적용범위를 선택하여주세요.');
				return;
			}
			
			if($('.key-row').length < 1){
				alert('키워드 입력해주세요.');
				return;
			}
			
			let bool = confirm('등록하시겠습니까?');
			
			if(bool){
				$('form')[0].submit();			
			}
			
		});
		
		//키워드 등록 
		$('.add-key').click(function(){
			
			if($('.key-in').val() == ''){
				
				alert('키워드를 입력해주세요.');
				return;
				
			}
			
			let key = $('.key-in').val();
			$('.key-row').append('<input readonly type="text" class="btn btn-secondary" name="keyword" style="margin-right:15px;" value="'+key+'"></button>');
			
			$('.key-in').val('');
			
		});
		
		$('.key-in').keypress(function(e){
			
			if(e.keyCode == 13){
				
				if($(this).val() == ''){
					
					alert('키워드를 입력해주세요.');
					return;
					
				}
				
				let key = $('.key-in').val();
				$('.key-row').append('<input readonly type="text" class="btn btn-secondary" name="keyword" style="margin-right:15px;" value="'+key+'"></button>');
				
				$(this).val('');
			}
			
		});
		
		$(document).on('click','input[name="keyword"]',function(){
			$(this).remove();
		});
		
	});
	
</script>
</body>
</html>