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
                	<form action="${root}/manager_admi/manager_account_register_pro" method="post" id="accountRegisterForm">
                	<input type="hidden" value="false" class="idHidden">
                    <br>
                    
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"> 관리자 설정 > 운영계정 관리 > 운영자 계정등록  </h1>

                    <br><hr><br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">운영자 상세정보</h6>
                        </div>
                        <div class="card-body">
    											<table class="table" style="text-align: center;">
    												<colgroup>
    													<col width="22%">
    													<col width="7.5%">
    													<col width="18.5%">
    													<col width="7.5%">
    													<col width="18.5%">
    													<col width="7.5%">
    													<col width="18.5%">
    												</colgroup>
    												<tbody>
    													<tr>
    														<td rowspan="3"><img src=""></td>
    														<td>가맹사</td>
    														<td><input type="text" class="form-control"></td>
    														<td>닉네임</td>
    														<td><input type="text" class="form-control"></td>
    														<td>회원번호</td>
    														<td><input type="text" class="form-control"></td>
    													</tr>
    												
    												</tbody>
    											</table>
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
    
   <script>
   
   		$(function(){
  			
   			
   			//아이디 중복 체크
   			$('.idCheck').click(function(){
   				let id = $('.idInput').val();
   				$.ajax({
   					url:'${root}/manager/idExistCheck/'+id,
   					type:'get',
   					success:function(data){
   						if(data.trim() == 'true'){
   							alert('중복된 계정이 있습니다 \n 다른 아이디를 입력해주세요.');
   							$('.idHidden').val('false');
   						}else{
   							alert('사용 가능한 아이디입니다');
   							$('.idHidden').val('true');
   						}
   					}
   				});
   			});
   			
   			//비밀번호 검사 
		    $('#pw,#pwChk').keyup(function(){
		        if($('#pw').val() != $('#pwChk').val()){
		        	$('.pwValidity').css('display','block');
		        } else{
		        	$('.pwValidity').css('display','none');
		        }
		    });
   			
		    var regType1 = /^[A-Za-z0-9+]*$/;

   			//아이디 형식 검사
   			$('.idInput').keyup(function(event){
   				
   				if(!regType1.test($(this).val())){
   					$('.idValidity').css('display','block');
   				}else{
   					$('.idValidity').css('display','none');
   				}
 
   			});
   			
   			//가맹사 전체 체크 / 해제
   			$('.franAllChk').click(function(){
   				if($(this).prop('checked')){
   					$('.franChk').prop('checked',true);
   				}else{
   					$('.franChk').prop('checked',false);
   				}
   			});
   			
   			
   			//submit 필수 정보 검사 
   			$('#accountRegisterForm').submit(function(e){
   				
   				//중복검사
   				if($('.idHidden').val() == 'false'){
   					alert('중복 검사를 완료해주세요');
   					e.preventDefault();
   					return;
   				}
   				
   				//아이디 영문 숫자 
   				if($('.idValidity').css('display') == 'block'){
   					alert('입력된 정보가 유효하지 않습니다. \n 다시 확인해주세요.');
   					e.preventDefault();
   					return;
   				}
   				
   				//비밀번호 != 비밀번호 확인
   				if($('.pwValidity').css('display') == 'block'){
   					alert('입력된 정보가 유효하지 않습니다. \n 다시 확인해주세요.');
					alert('1');
   					e.preventDefault();
   					return;
   				}
   				
   				
   				//필수정보 입력
   				if($('.idInput').val() == '' || $('input[name="name"]').val() == ''  
   						|| $('input[name="pw"]').val() == '' || $('input[name="phone"]').val() == '' 
   						|| $('input[name="email"]').val() == ''
   						|| $('input:checkbox[class="franChk"]:checked').length < 1
   						|| $('input:radio[name="excel"]:checked').length < 1){
   					
   					console.log($('input:radio[name="excel"]:checked').length);
   					alert('입력되지 않은 정보가 있습니다. \n 다시 확인해주세요.');
   					e.preventDefault();
   					return;
   					
   				}
   				
   				e.preventDefault();
   				
   				swal({
   	  				title : "fail!",
   	  				text : "등록 하시겠습니까?",
   	  				buttons: {
   	  					cancel : "N",
   	  					defeat : "Y" 
   	  				},
   	  				closeOnClickOutside : false
   	  			}).then(function(value){
   	  				switch(value){
   	  					case "defeat" :
   	  						swal("등록 완료").then(function(){
   	  							$('#accountRegisterForm')[0].submit();
   	  						})
   	  					break;
   	  					default :
   	  						e.preventDefault();
   	  				}
   	  			});
   			})
   			
   			
   		});
   
   </script>
</body>

</html>