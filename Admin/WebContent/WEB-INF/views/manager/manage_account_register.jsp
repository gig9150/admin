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
                    <h1 class="h3 mb-2 text-gray-800"> 관리자 계정관리 > 관리자 계정관리 > 등록 </h1>

                    <br><hr><br>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">등록하기</h6>
                        </div>
                        <div class="card-body">
                            <form method="post" action="${root}/manager/manage_account_register_pro" id="managerRegister">
								<div class="form-group">
								  <label for="exampleFormControlSelect1">관리자 지정 가맹사</label>
								  <select class="form-control" id="managerFranchise" name="franchiseId">
								    <c:forEach items="${franchiseList}" var="obj">
								    	<option value="${obj.franchise_id}">${obj.franchise_code} / ${obj.franchise_name}</option>
								    </c:forEach>
								  </select>
								</div>
								<div class="form-group">
									<label for="exampleFormControlSelect1">관리자 역할 그룹</label>
									<select class="form-control" id="managerRoleGroup" name="roleGroupId">
										<c:forEach items="${roleGroupsList}" var="obj">
											<option value="${obj.role_group_id}" data-id="${obj.franchise_id}">${obj.role_group_name}</option>
										</c:forEach>
									</select>
								</div>
								<h6>관리자 추가 권한</h6>
								<c:forEach items="${getAdditionalRole}" var="obj">
								
									<div class="form-check form-check-inline">
									  <label class="form-check-label"><input class="form-check-input" type="checkbox" 
									  id="inlineCheckbox1" name="roleDetail" value="${obj.addtional_role_id}">${obj.additional_role_name}</label>
									</div>
									
								</c:forEach>
								
								<br><br>
								
								<input type="hidden" id="idExist" value="false"/>
								
								<div class="form-group">
								    <label for="exampleInputEmail1">아이디</label>
								    <input type="text" class="form-control" id="managerId" aria-describedby="emailHelp" name="managerId" onkeypress="resetIdExist()" required="required">
							  	</div>
							  	<div class="form-group">
							  		<button type="button" class="btn btn-primary" id="idExistBtn">아이디 중복체크</button>
							  	</div>
							  	<div class="form-group">
								    <label for="exampleInputPassword1">이름</label>
								    <input type="text" class="form-control" id="exampleInputPassword1" name="managerName" required="required">
							  	</div>
								<div class="form-group">
								    <label for="exampleInputPassword1">핸드폰 번호</label>
								    <input type="text" class="form-control" id="exampleInputPassword1" name="managerPhone" required="required">
							  	</div>
							  	<div class="form-group">
								    <label for="exampleInputEmail1">비밀번호</label>
								    <input type="password" class="form-control" id="pw" aria-describedby="emailHelp" name="managerPw" required="required">
							  	</div>
							  	<div class="form-group">
								    <label for="exampleInputEmail1">비밀번호 확인</label>
								    <input type="password" class="form-control" id="pwCheck" aria-describedby="emailHelp" required="required">
							  	</div>
							  	<div class="form-group">
							  		<span id="checkPassword" style="display:none;color:red">비밀번호가 다릅니다.</span>
							  	</div>
								<div class="form-group">
								    <label for="exampleInputPassword1">이메일</label>
								    <input type="text" class="form-control" id="exampleInputPassword1" name="managerEmail">
							  	</div>
							  	<button type="submit" class="btn btn-primary">등록하기</button>
							</form>	
                        </div>
                    </div>
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
    
    <script type="text/javaScript">
    
    	$(function(){
			
			
    		$('#idExistBtn').on('click',function(){
    			
    			const id = $('#managerId').val()
    			
    			if(id.length == 0){
    				alert('아이디를 입력해주세요');
    				return;
    			}
    			
    			//아이디 중복 체크 
    			$.ajax({
    				url:'${root}/manager/idExistCheck/'+id,
    				type:'get',
    				dataType:'text',
    				success:function(data){
    					if(data.trim() == 'true'){
    						alert('이미 아이디가 존재합니다!!');
    						$('#idExist').val('false');
    					}else{
    						alert('사용 가능한 아이디입니다.');
    						$('#idExist').val('true');
    					}
    				}
    			});
    		});
    		
    		//아이디 입력창이 변경될때마다 다시 중복 체크하게끔
    		function resetIdExist(){
    			$('#idExist').val('false');
    		}
    		
    		//비밀번호와 비밀번호 확인이 동일한지 확인
    		setInterval(function(){
    			
    			if($('#pw').val() == $('#pwCheck').val()){
    				$('#checkPassword').css('display','none');
    			}else{
    				$('#checkPassword').css('display','block');
    			}
    			
    		}, 500);
    		
    		// 아이디 중복 체크 여부 및 비밀번호 확인(submit)
    		
    		$('#managerRegister').submit(function(e){
    			
    			if($('#idExist').val() == 'false'){
  					alert('아이디 중복체크를 완료해주세요');
    				e.preventDefault();
    			}
    			
    			if($('#checkPassword').css('display') == 'block'){
    				alert('비밀번호가 서로 다릅니다.');
    				e.preventDefault();
    			}
    			
    			
    			if($('#managerRoleGroup option:selected').data('id') != null && 
    					$('#managerRoleGroup option:selected').data('id') != '' && 
    				$('#managerFranchise').val() != $('#managerRoleGroup > option:selected').data('id') ){
    				alert('해당 역할그룹은 지정한 가맹사만 등록 가능합니다.');
    				e.preventDefault();
    				
    			}
    			
    		});
    	});
    </script>

</body>

</html>