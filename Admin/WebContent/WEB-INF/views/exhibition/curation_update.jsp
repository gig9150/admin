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
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    
    <style>
    	.card-body .row{
    		margin:15px 0 15px 0;
    	
    	}
    	
    	.card-body .row input[type="radio"]{
    		margin-right:10px;
    	}
    </style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:import url="/WEB-INF/views/include/sidebar.jsp"/>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <c:import url="/WEB-INF/views/include/topbar.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <br>
                    
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"> 전시관리 > 기획전 등록 관리 > 기획전 수정   </h1>
                    
                    <form action="${root}/exhibition/curation_update_pro" method="post" enctype="multipart/form-data" id="curationUpdateForm">
                    
                    <input type="hidden" name="shopExhiId" value="${shopExhiId}">
                    <input type="hidden" id="urlChk" value="false">
                    
                    <br><hr><br>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">수정</h6>
                        </div>
                        <div class="card-body">
	                   		<div class="row">
							    <div class="col-sm-1">
							      	가맹사
							    </div>
							    <div class="col-sm-2">
							        <select class="form-control" name="franchiseId">
	                   					<c:forEach items="${franchiseList}" var="obj">
	                   						<option value="${obj.franchise_id}"<c:if test="${obj.franchise_id eq exhiMap.franchise_id}">selected</c:if>>${obj.franchise_name}</option>
	                   					</c:forEach>
	                   				</select>
							    </div>
							    <div class="col-sm-1">
							      	기획전 구분
							    </div>
							    <div class="col-sm-2">
							        <select class="form-control" name="section">
	                   					<option value="1" <c:if test="${exhiMap.section eq 1}">selected</c:if>>가게 홍보</option>
	                   					<option value="2" <c:if test="${exhiMap.section eq 2}">selected</c:if>>중고 장터</option>
	                   					<option value="3" <c:if test="${exhiMap.section eq 3}">selected</c:if>>산지직거래</option>
	                   				</select>
							    </div>
							    <div class="col-sm-1">
							      	기획전 기간
							    </div>
							    <div class="col-sm-5">
							      <input type="date" style="width:30%;display: inline-block;" class="form-control" name="startDate" value="${exhiMap.start_date}">
							      <input type="text" style="width:17%;display: inline-block;" class="form-control" name="startAclock" value="${exhiMap.start_aclock}">
							      ~
							      <input type="date" style="width:30%;display: inline-block;" class="form-control" name="endDate" value="${exhiMap.end_date}">
							      <input type="text" style="width:17%;display: inline-block;" class="form-control" name="endAclock" value="${exhiMap.end_aclock}">
							    </div>
						  	</div>
						  	<div class="row">
						  		<div class="col-sm-1">기획전 타이틀</div>
						  		<div class="col-sm-5"><input type="text" class="form-control" name="curationTitle" value="${exhiMap.exhi_name}"></div>
						  		<div class="col-sm-1">진행 상태</div>
						  		<div class="col-sm-5">
						  			<label><input name="proStatus" type="radio" value="1" <c:if test="${exhiMap.pro_status eq 1}">checked</c:if>>미진행</label>
						  			<label><input name="proStatus" type="radio" value="2" <c:if test="${exhiMap.pro_status eq 2}">checked</c:if>>진행중</label>
						  			<label><input name="proStatus" type="radio" value="3" <c:if test="${exhiMap.pro_status eq 3}">checked</c:if>>진행완료</label>
						  		</div>
						  	</div>
	                    	<div class="row">
	                    		<div class="col-sm-1">기획전 서브멘트</div>
						  		<div class="col-sm-5"><input type="text" class="form-control" name="curationSub" value="${exhiMap.exhi_sub}"></div>
						  		<div class="col-sm-1">공개 여부</div>
						  		<div class="col-sm-5">
						  			<label><input name="openStatus" type="radio" value="1" <c:if test="${exhiMap.open_status eq 1}">checked</c:if>>공개 </label>
						  			<label><input name="openStatus" type="radio" value="2" <c:if test="${exhiMap.open_status eq 2}">checked</c:if>>비공개 </label>
						  		</div>
	                    	</div>
	                    	
	                    	<div class="row">
	                    		<div class="col-sm-1">배너 이미지</div>
						  		<div class="col-sm-5"><input type="file" class="form-control" name="uploadFile" id="bannerImageBox" required="required"></div>
						  		<div class="col-sm-1">URL 등록 </div>
						  		<div class="col-sm-5">
						  			<input type="text" class="form-control urlInput" name="url" style="width:70%;display:inline-block;margin-right: 13px;" value="${exhiMap.url}">
						  			<button type="button" class="btn btn-danger text-right urlCheck">중복 검사</button>
						  		</div>
	                    	</div>
	                    	<div class="row banner-image-prev">
	                    		<img src="${root}/upload/${exhiMap.banner_image}" style="width:100px;height:100px;border-radius:50%;">
	                    	</div>
	                   	</div>
	                  </div>
	                  <div class="card shadow mb-4">
	                  	<div class="card-body">
	                  		<div class="row">
	                  			<div class="col-sm-1">기획전 설명</div>
	                  			<div class="col-sm-11">
	                  				<textarea id="summernote" name="curationInfo">${exhiMap.exhi_explain}</textarea>
	                  			</div>
	                  		</div>
	                  	</div>
	                  </div>
	                  <div class="card shadow mb-4">
	                  	<div class="card-body">
	                  		<div class="row">
	                  			<div class="col-sm-1"></div>
	                  			<div class="col-sm-11">
	                  				<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".items-add">전시품 추가</button>
	                  				<button type="button" class="btn btn-info items-del">전체 삭제</button>
	                  			</div>
	                  		</div>
	                  		<div class="row curation-items">
	                  			
	                  		</div>
	                  	</div>
	                  	<div class="card-footer text-right">
	                  		<button type="submit" class="btn btn-info" style="width:120px;">수정</button>
	                  	</div>
	                  </div>
	                  
                  </form>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <c:import url="/WEB-INF/views/include/footer.jsp"/>
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    <!-- 전시품 등록 modal -->
    <div class="modal fade bd-example-modal-lg items-add" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	     	<div class="modal-header">
	     	
	     	</div>
	     	<div class="modal-body">
	     		
	     	</div>
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
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src="${root}/js/custom.js"></script>
    
    <script>
    	$(function(){
    		
    		//summernote editor
    		$('#summernote').summernote({
				height: 300,                 
			  	minHeight: null,             
			  	maxHeight: null         
    		});
    		
    		//url 중복 검사 
    		$('.urlCheck').on('click',function(){
    			
    			
    			const url = $('.urlInput').val();
    			
    			if(url.length == 0){
    				alert('url울 입력해주세요.');
    				return;
    			}
    			
    			$.ajax({
    				url:'${root}/exhibition/urlCheck/'+url,
    				type:'get',
    				success:function(data){
    					if(data.trim() == 'true'){
    						alert('사용 가능한 url 입니다.');
    						$('#urlChk').val('true');
    					}else{
    						alert('이미 사용중인 url 입니다.');
    						$('#urlChk').val('false');
    					}
    				}
    			});
    			
    		});
    		
    		//url 재입력 할때마다 url 중복 검사 다시 체크하게끔
    		$('.urlInput').keypress(function(){
    			$('#urlChk').val('false');
    		});
    		
    		//submit 조건 
    		$('#curationUpdateForm').submit(function(e){
    			
    			//url 중복 체크 미진행 
    			if($('#urlChk').val() == 'false'){
    				alert('url 중복체크를 완료해주세요');
    				e.preventDefault();
    			}
    			
    		});
    		
    	
    			
   			$("#bannerImageBox").on('change', function(){
   		        readInputFile(this);
   		    });
   			
   			//전시품 추가
   			
   			//전시품 전체삭제
   			
   			
    	});
    	
    	//파일이미지 미리보기 
   		function readInputFile(input) {
   	        if(input.files && input.files[0]) {
   		    	$('.banner-image-prev img').remove();
   	            var reader = new FileReader();
   	            reader.onload = function (e) {
   	                $('.banner-image-prev').append('<img style="width:100px;height:100px;border-radius: 50%;" src="'+e.target.result+'">');
   	            }
   	            reader.readAsDataURL(input.files[0]);
   	        }
   	    }
    	
    	
    </script>

</body>

</html>