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
                	<form action="${root}/manager_admi/manager_account_update_pro" method="post" id="accountUpdateForm">
                	<input type="hidden" name="franchiseManagerId" value="${infoMap.franchise_manager_id}">
                    <br>
                    
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"> 관리자 설정 > 운영계정 관리 > 운영자 상세정보 </h1>

                    <br><hr><br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">운영자 상세정보</h6>
                        </div>
                        <div class="card-body">
    						<table class="table table-borderless">
    							<colgroup>
    								<col width="15%">
    								<col width="35%">
    								<col width="15%">
    								<col width="35%">
    							</colgroup>
    							<tbody>
    								<tr>
    									<td>등록일</td>
    									<td><input type="text" class="form-control" readonly="readonly" value="${infoMap.regdate}"></td>
    									<td>운영자 상태</td>
    									<td>
    										<select name="status" class="form-control">
    											<option value="1" <c:if test="${infoMap.status eq 1}">selected</c:if>>정상</option>
    											<option value="2" <c:if test="${infoMap.status eq 2}">selected</c:if>>정지</option>
    										</select>
    									</td>
    								</tr>
    								<tr>
    									<td>운영자 이름</td>
    									<td><input name="name" type="text" class="form-control" value="${infoMap.name}"></td>
    									<td>비밀번호 재설정</td>
    									<td><input type="password" name="pw" class="form-control" id="pw"></td>
    								</tr>
    								<tr>
    									<td>아이디</td>
    									<td>
    										<input type="text" name="id" class="form-control idInput" readonly="readonly" value="${infoMap.id}">
    									</td>
    									<td>비밀번호 확인</td>
    									<td><input type="password" class="form-control" id="pwChk"></td>
    								</tr>
    								<tr>
    									<td>연락처</td>
    									<td><input type="text" name="phone" class="form-control" value="${infoMap.phone}"></td>
    									<td></td>
    									<td><span style="color:red;display:none;" class="pwValidity">비밀번호가 서로 다릅니다.</span></td>
    								</tr>
    								
    								<tr>
    									<td>이메일</td>
    									<td><input type="text" class="form-control" name="email" value="${infoMap.email}"></td>
    									<td>가맹사 지정</td>
    									<td rowspan="5">
    										<label><input type="checkbox" class="franAllChk">&nbsp;전체선택</label><br>
    										<c:forEach items="${franList}" var="obj">
    											<label><input type="checkbox" name="franchiseId" class="franChk" value="${obj.franchise_id}" 
    												<c:forEach items="${infoMap.franIdList}" var="obj2">
    													<c:if test="${obj2 eq obj.franchise_id}">
    														checked
    													</c:if>
    												</c:forEach>
    											>&nbsp;${obj.franchise_name}</label><br>
    										</c:forEach>
    									</td>
    								</tr>
    								<tr>
    									<td>역할 지정</td>
    									<td>
    										<select class="form-control" name="roleGroupId">
    											<c:forEach items="${roleList }" var="obj">
    												<option value="${obj.role_group_id}" <c:if test="${infoMap.role_group_id eq obj.role_group_id}">selected</c:if>>${obj.role_group_name}</option>
    											</c:forEach>
    										</select>
    									</td>
    								</tr>
    								<tr>
    									<td>엑셀 다운로드 권한</td>
    									<td>
    										<label><input name="excel" value="1" type="radio" <c:if test="${infoMap.excel eq 1}">checked</c:if>>&nbsp;Y</label>
    										<label><input name="excel" value="2" type="radio" <c:if test="${infoMap.excel eq 2}">checked</c:if>>&nbsp;N</label>
    									</td>
    								</tr>
    								<tr>
    									<td>최근 접속일</td>
    									<td><input type="text" class="form-control" readonly="readonly" value="${infoMap.access_date}"></td>
    								</tr>
    								<tr>
    									<td>최근 접속 ip</td>
    									<td><input type="text" class="form-control" readonly="readonly" value="${infoMap.recent_ip}"></td>
    								</tr>
    							</tbody>
    						</table>
    						<div class="text-center" style="margin-top:70px;">
    							<button type="button" data-franchise-manager-id="${infoMap.franchise_manager_id}" class="btn btn-danger delete-btn">삭제</button>
    							<button type="submit" class="btn btn-secondary">수정</button>
    						</div>
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

   			
   			//비밀번호 검사 
		    $('#pw,#pwChk').keyup(function(){
		        if($('#pw').val() != $('#pwChk').val()){
		        	$('.pwValidity').css('display','block');
		        } else{
		        	$('.pwValidity').css('display','none');
		        }
		    });
   			
		    var regType1 = /^[A-Za-z0-9+]*$/;
   			
   			//가맹사 전체 체크 / 해제
   			$('.franAllChk').click(function(){
   				if($(this).prop('checked')){
   					$('.franChk').prop('checked',true);
   				}else{
   					$('.franChk').prop('checked',false);
   				}
   			});
   			
   			//삭제
   			$('.delete-btn').click(function(){
   				
   				let franchiseManagerId = $(this).data('franchiseManagerId');
   				
   				swal({
   	  				title : "fail!",
   	  				text : "해당 운영계정을 삭제 하시겠습니까?",
   	  				buttons: {
   	  					cancel : "N",
   	  					defeat : "Y" 
   	  				},
   	  				closeOnClickOutside : false
   	  			}).then(function(value){
   	  				switch(value){
   	  					case "defeat" :
   	  						swal("삭제되었습니다").then(function(){
   	  							location.href="${root}/manager_admi/manager_account_delete?franchiseManagerId="+franchiseManagerId;
   	  						})
   	  					break;
   	  					default :
   	  						e.preventDefault();
   	  				}
   	  			});
   				
   			});
   			
   			
   			//submit 필수 정보 검사 
   			$('#accountUpdateForm').submit(function(e){
   				
   				
   				
   				//비밀번호 != 비밀번호 확인
   				if($('.pwValidity').css('display') == 'block'){
   					alert('비밀번호가 일치하지 않습니다. \n 다시 확인해주세요.');
   					e.preventDefault();
   					return;
   				}
   				
   				
   				//필수정보 입력
   				if($('.idInput').val() == '' || $('input[name="name"]').val() == ''  
   						|| $('input[name="pw"]').val() == '' || $('input[name="phone"]').val() == '' 
   						|| $('input[name="email"]').val() == ''
   						|| $('input:checkbox[class="franChk"]:checked').length < 1
   						|| $('input:radio[name="excel"]:checked').length < 1){
   					
   					alert('입력되지 않은 정보가 있습니다. \n 다시 확인해주세요.');
   					e.preventDefault();
   					return;
   					
   				}
   				
   				e.preventDefault();
   				
   				swal({
   	  				title : "fail!",
   	  				text : "수정 하시겠습니까?",
   	  				buttons: {
   	  					cancel : "N",
   	  					defeat : "Y" 
   	  				},
   	  				closeOnClickOutside : false
   	  			}).then(function(value){
   	  				switch(value){
   	  					case "defeat" :
   	  						swal("수정 완료").then(function(){
   	  							$('#accountUpdateForm')[0].submit();
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