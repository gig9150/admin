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
                    <h1 class="h3 mb-2 text-gray-800"> 관리자계정 관리 > 가맹사 관리 </h1>

                    <br><hr><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">검색 </h6>
                        </div>
                        <form method="get" action="${root}/manager/manage_franchise">
	                        <div class="card-body">
	                            <div class="row">
	                                <div class="col-sm-2">
	                                    <span>가맹사 명</span>
	                                </div>
	                                <div class="col-sm-10">
	                                    <input type="text" name="keyWord" class="form-control" aria-label="Text input with dropdown button" value="${keyWord}">
	                                </div>
	                            </div>
	                            <br><br>
	                            <div class="row text-right">
	                                <div class="col">
	                                    <button type="submit" class="btn btn-primary btn-lg">검  색</button>
	                                    <button type="reset" class="btn btn-secondary btn-lg">초기화</button>
	                                </div>
	                            </div>
	                        </div>
	                    </form>
                    </div>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">조회 결과</h6>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead class="thead-dark">
                                  <tr>
                                    <th scope="col">#</th>
                                    <th>일자</th>
                                    <th>가맹사명</th>
                                    <th>서비스명</th>
                                    <th>가맹사 아이디</th>
                                    <th>서비스 상태</th>
                                    <th>메인 도메인</th>
                                    <th>수정</th>
                                  </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${franchiseList}" var="obj">
	                               		<tr>
		                                	<th scope="row">${obj.franchiseId}</th>
	                                    	<td>${obj.regdate}</td>
	                                    	<td>${obj.franchiseName}</td>
	                                    	<td>${obj.serviceName}</td>
	                                    	<td>${obj.id}</td>
	                                    	<td>${obj.serviceStatus}</td>
	                                    	<td>${obj.mainDomain}</td>
	                                    	<td><button type="button" class="btn btn-primary updateBtn" data-toggle="modal" data-target=".bd-example-modal-lg-update" 
	                                    	data-franchise-id="${obj.franchiseId}" data-subdomain-list = "${obj.subDomainList}" data-service-name="${obj.serviceName }" 
	                                    	data-main-domain = "${obj.mainDomain}" data-franchise-name = "${obj.franchiseName}" data-logo-file="${obj.logoFile}" 
	                                    	data-point-color="${obj.pointColor}" data-representative-name = "${obj.representativeName}" data-business-number="${obj.businessNumber}" 
	                                    	data-address="${obj.address}" data-phone-number="${obj.phone_number}" data-fax="${obj.fax}" 
	                                    	data-responsibility-name="${obj.responsibilityName}" data-responsibility-depa="${obj.responsibilityDepa}" 
	                                    	data-responsibility-position="${obj.responsibilityPosition}" data-responsibility-number="${obj.responsibilityNumber}" 
	                                    	data-responsibility-phone="${obj.responsibilityPhone}" data-responsibility-email="${obj.responsibilityEmail}" 
	                                    	data-memo = "${obj.memo}" data-id="${obj.id}" >수정</button></td>
	                          			</tr>         	                                	
                                	</c:forEach>
                                </tbody>
                              </table>
                              <br>
                              <div class="row justify-content-md-center">
				          		<ul class="pagination">
				          		<c:choose>
				          			<c:when test="${pageBean.prevPage <= 0}">
				          				<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									     </a></li>
				          			</c:when>
				          			<c:otherwise>
				          				<li class="page-item">
				          				<a class="page-link" href="${root}/manager/manage_franchise?page=${pageBean.prevPage}&keyWord=${keyWord}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/manager/manage_franchise?page=${idx}&keyWord=${keyWord}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/manager/manage_franchise?page=${idx}&keyWord=${keyWord}">${idx}</a></li>
				          				</c:otherwise>
				          			</c:choose>	
				          		</c:forEach>
				          		<c:choose>
				          			<c:when test="${pageBean.max >= pageBean.pageCnt}">
				          				<li class="page-item">
										      <a class="page-link" href="#" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										      </a>
										    	</li>
				          			</c:when>
				          			<c:otherwise>
				          				<li class="page-item">
										      <a class="page-link" href="${root}/manager/manage_franchise?page=${pageBean.nextPage}&keyWord=${keyWord}" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										      </a>
										    	</li>
				          			</c:otherwise>
				          		</c:choose>
				          	</ul>
				          </div>
				          <br>
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg" style="width:300px;position:relative;margin:-5px -150px;top:50%;left:50%;">등록</button>
                          <br>
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
    
    <!-- 수정 modal  -->
	
	<div class="modal fade bd-example-modal-lg-update" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"  aria-hidden="true">
	  <div class="modal-dialog modal-lg" style="margin-right: 714px !important;" >
	  	<form method="post" action="${root}/manager/manage_franchise_update_pro" id="managerUpdate" enctype="multipart/form-data">
		  <div class="modal-content" style="width:160%;">
			<div class="modal-header">
				가맹사 등록 및 수정
			</div>
			<div class="modal-body">
			<input type="hidden" id="updateIdExist" value="false">
			<input type="hidden" name="franchiseId" id="franchise_id">
		  <!-- DataTales Example -->
          	<div class="card shadow mb-4">
              <table class="table table-bordered"> 
              	<colgroup>
              		<col scope="col" style="width:10%;">
              		<col scope="col" style="width:40%;">
              		<col scope="col" style="width:10%;">
              		<col scope="col" style="width:40%;">
              	</colgroup>
              	<tbody>
              		<tr>
              			<th scope="row" >
              				아이디:
              			</th>
              			
              			<td colspan="2">
              				<input type="text" class="form-control" id="updateManagerId" name="id" onkeydown="resetIdExist()">
              			</td>
              			
              			<td>
              				<button type="button" class="btn btn-primary" id="updateIdExistBtn" style="width:100%">아이디 중복체크</button>
              			</td>
              			
              		</tr>
              		<tr>
              			<th scope="row">
              				비밀번호
              			</th>
              			
              			<td>
              				<input type="text" name="pw" class="form-control" id="updatePw">
              			</td>
              			
              			<th scope="row">
              				비밀번호확인
              			</th>
              			
              			<td>
              				<input type="text" class="form-control" id="updatePw2">
              			</td>
              			
              		</tr>
              		<tr>
              			<th scope="row">
              				서비스 명:
              			</th>
              			<td>
              				<input type="text" name="serviceName" id="service_name" class="form-control">
              			</td>
              			<th>
              				메인 도메인 
              			</th>
              			<td>
              				<input type="text" name="mainDomain" id="main_domain" class="form-control" >
              			</td>
              		</tr>
              		
              		<tr>
              			<th>
              				서브 도메인 
              			</th>
              			<td colspan="3">
              				<input type="text" class="form-control" id="updateDomainInput" style="display:inline-block;width:93%;" >
							<button type="button" class="btn btn-secondary" id="updateDomainBtn" style="display:inline-block;margin-left: 13px;
    						margin-bottom: 4px;">추가</button>
              			</td>
              		</tr>
              		<tr>
              			<td class="updateDomainGroup" colspan="4">
              				
              			</td>
              		</tr>
     				<tr>
     					<th>
     						가맹사명
     					</th>
     					<td>
     						<input type="text" class="form-control" name="franchiseName" id="franchise_name">
     					</td>
     					<th>
     						대표자명
     					</th>
     					<td>
     						<input type="text" class="form-control" name="representativeName" id="representative_name">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						사업자번호
     					</th>
     					<td>
     						<input type="text" class="form-control" name="businessNumber" id="business_number">
     					</td>
     					<th>
     						주소	
     					</th>
     					<td>
     						<input type="text" class="form-control" name="address" id="address" >
     					</td>
     				</tr>
     				<tr>
     					<th>
     						전화번호
     					</th>
     					<td>
     						<input type="text" class="form-control" name="phone_number" id="phone_number">
     					</td>
     					<th>
     						FAX
     					</th>
     					<td>
     						<input type="text" class="form-control" name="fax" id="fax">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						담당자명
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityName" id="responsibility_name">
     					</td>
     					<th>
     						담당자 부서
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityDepa" id="responsibility_depa">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						 담당자 직책 
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityPosition" id="responsibility_position">
     					</td>
     					<th>
     						전화번호
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityNumber" id="responsibility_number">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						휴대전화번호
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityPhone" id="responsibility_phone">
     					</td>
     					<th>
     						이메일
     					</th>
     					<td colspan="3">
     						<input type="text" class="form-control" name="responsibilityEmail" id="responsibility_email">
     					</td>
     					
     				</tr>
     				
     				<tr>
     					<th colspan="4">
     						관리자 메모
     					</th>
     				</tr>
     				<tr>
     					<td colspan="4"> 
     						<textarea class="form-control" name="memo" id="memo" rows="3"></textarea>
     					</td>
     				</tr>
              		<tr>	
              			<th>
              				현재 파일
              			</th>
              			
     					<td id="presentFile">
     						
     					</td>
     					
     					<th>
     						파일등록 및 포인트컬러 지정 
     					</th>
     					
     					<td>
     						<span>포인트 컬러 :</span>
     						<input type="color" name="pointColor" style="display:inline-block;margin-bottom:30px;margin-top: 16px;" id="point_color">
     						<input type="file" name="uploadFile" id="logo_file" style="display:block;" accept="image/*">
     						
     					</td>
     				</tr>
              		<tr>
              			<td colspan="4" style="text-align:center">
              				<button type="submit" class="btn btn-light">수정 하기</button>
              				<button type="reset" class="btn btn-light">다시 작성</button>
              			</td>
              		</tr>
              	</tbody>
              </table>
          	</div>
          	</div>
          </div>
		</form>
	  </div>
	</div>
    
    
	
	<!-- 등록 modal -->
	
	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" style="margin-right: 714px !important;">
	  	<form method="post" action="${root}/manager/manage_franchise_register_pro" id="managerRegister" enctype="multipart/form-data">
		  <div class="modal-content" style="width:160%;">
			<div class="modal-header">
				가맹사 등록 및 수정
			</div>
			<div class="modal-body">
			<input type="hidden" id="idExist" value="false">
		 		 DataTales Example
          	<div class="card shadow mb-4">
              <table class="table table-bordered"> 
              	<colgroup>
              		<col scope="col" style="width:10%;">
              		<col scope="col" style="width:40%;">
              		<col scope="col" style="width:10%;">
              		<col scope="col" style="width:40%;">
              	</colgroup>
              	<tbody>
              		<tr>
              			<th scope="row" >
              				아이디:
              			</th>
              			
              			<td colspan="2">
              				<input type="text" class="form-control" id="managerId" name="id" onkeydown="resetIdExist()">
              			</td>
              			
              			<td>
              				<button type="button" class="btn btn-primary" id="idExistBtn" style="width:100%">아이디 중복체크</button>
              			</td>
              			
              		</tr>
              		<tr>
              			<th scope="row">
              				비밀번호
              			</th>
              			
              			<td>
              				<input type="text" name="pw" class="form-control" id="registerPw">
              			</td>
              			
              			<th scope="row">
              				비밀번호확인
              			</th>
              			
              			<td>
              				<input type="text" class="form-control" id="registerPw2">
              			</td>
              			
              		</tr>
              		<tr>
              			<th scope="row">
              				서비스 명:
              			</th>
              			<td>
              				<input type="text" name="serviceName" class="form-control">
              			</td>
              			<th>
              				메인 도메인 
              			</th>
              			<td>
              				<input type="text" name="mainDomain" class="form-control" >
              			</td>
              		</tr>
              		
              		<tr>
              			<th>
              				서브 도메인 
              			</th>
              			<td colspan="3">
              				<input type="text" class="form-control" id="additionalDomainInput" style="display:inline-block;width:93%;" >
							<button type="button" class="btn btn-secondary" id="additionalDomainBtn" style="display:inline-block;margin-left: 13px;
    						margin-bottom: 4px;">추가</button>
              			</td>
              		</tr>
              		<tr>
              			<td class="additionalDomainGroup" colspan="4">
              				
              			</td>
              		</tr>
     				<tr>
     					<th>
     						가맹사명
     					</th>
     					<td>
     						<input type="text" class="form-control" name="franchiseName">
     					</td>
     					<th>
     						대표자명
     					</th>
     					<td>
     						<input type="text" class="form-control" name="representativeName">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						사업자번호
     					</th>
     					<td>
     						<input type="text" class="form-control" name="businessNumber">
     					</td>
     					<th>
     						주소	
     					</th>
     					<td>
     						<input type="text" class="form-control" name="address">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						전화번호
     					</th>
     					<td>
     						<input type="text" class="form-control" name="phone_number">
     					</td>
     					<th>
     						FAX
     					</th>
     					<td>
     						<input type="text" class="form-control" name="fax">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						담당자명
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityName">
     					</td>
     					<th>
     						담당자 부서
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityDepa">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						 담당자 직책 
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityPosition">
     					</td>
     					<th>
     						전화번호
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityNumber">
     					</td>
     				</tr>
     				<tr>
     					<th>
     						휴대전화번호
     					</th>
     					<td>
     						<input type="text" class="form-control" name="responsibilityPhone">
     					</td>
     					<th>
     						이메일
     					</th>
     					<td colspan="3">
     						<input type="text" class="form-control" name="responsibilityEmail">
     					</td>
     					
     				</tr>
     				
     				<tr>
     					<th colspan="4">
     						관리자 메모
     					</th>
     				</tr>
     				<tr>
     					<td colspan="4"> 
     						<textarea class="form-control" name="memo" rows="3"></textarea>
     					</td>
     				</tr>
              		<tr>	
              			<th>
              				현재 파일
              			</th>
              			
              			<td>
              				
              			</td>
              			
     					<th>
     						파일등록 및 포인트컬러 지정 
     					</th>
     					
     					<td>
     						<span>포인트 컬러 :</span>
     						<input type="color" name="pointColor" style="display:inline-block;margin-bottom:30px;margin-top: 16px;">
     						<input type="file" name="uploadFile" style="display:block;" accept="image/*">
     						
     					</td>
     				</tr>
              		<tr>
              			<td colspan="4" style="text-align:center">
              				<button type="submit" class="btn btn-light">수정 하기</button>
              				<button type="reset" class="btn btn-light">다시 작성</button>
              			</td>
              		</tr>
              	</tbody>
              </table>
         	 </div>
         	</div>
          </div>
		</form>
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
    
	<script>
		$(function(){
			
			//추가 도메인 입력 (입력할때마다 추가)
			$('#additionalDomainBtn').on('click',function(){
				
				if($('#additionalDomainInput').val() == null || $('#additionalDomainInput').val() == ''){
					alert('도메인을 입력해 주세요.');
					return;
				}
				
				const domain = $('#additionalDomainInput').val();
				
				$('.addtionalDomainGroup').append('<input type="text" name="additionalDomain" class="form-control-sm" style="width:30%;" value="'+ domain + '">');
				$('#additionalDomainInput').val('');
				
			});
			
			$('#idExistBtn').on('click',function(){
   			
	   			const id = $('#managerId').val()
	   			
	   			if( id.length == 0 ){
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
   			
   			$('#updateIdExistBtn').on('click',function(){
   	   			
   	   			const updateId = $('#updateManagerId').val();
   	   			console.log(updateId);
   	   			
   	   			if( updateId.length == 0 ){
   	   				alert('아이디를 입력해주세요');
   	   				return;
   	   			}
   	   			
   	   			//아이디 중복 체크 
   	   			$.ajax({
   	   				url:'${root}/manager/idExistCheck/'+updateId,
   	   				type:'get',
   	   				dataType:'text',
   	   				success:function(data){
   	   					if(data.trim() == 'true'){
   	   						alert('이미 아이디가 존재합니다!!');
   	   						$('#updateIdExist').val('false');
   	   					}else{
   	   						alert('사용 가능한 아이디입니다.');
   	   						$('#updateIdExist').val('true');
   	   					}
   	   				}
   	   			});
   			});
   		
   		//아이디 입력창이 변경될때마다 다시 중복 체크하게끔
   		function resetIdExist(){
   			$('#idExist').val('false');
   			$('#updateIdExist').val('false');
   		}
   		
   		//아이디 중복 체크가 완료 되지않으면 넘어가지 않게끔..
   		$('#managerRegister').submit(function(e){
			
			if($('#idExist').val() == 'false'){
				alert('아이디 중복체크를 완료해주세요');
				e.preventDefault();
			}
			
			if($('#registerPw').val() != $('#registerPw2').val()){
				alert('비밀번호가 서로 다릅니다.');
				e.preventDefault();
			}
		});
   		
		$('#managerUpdate').submit(function(e){
			
			if($('#updateIdExist').val() == 'false'){
				alert('아이디 중복체크를 완료해주세요');
				e.preventDefault();
			}
			
			if($('#updatePw').val() != $('#updatePw2').val()){
				alert('비밀번호가 서로 다릅니다.');
				e.preventDefault();
			}
		});
   		
   		
   		
   		// 수정 클릭 시 모달에 필요한 데이터들 넘기기 
   		
   			$('.updateBtn').on('click',function(){
   
				$('#service_name').val($(this).data('serviceName'));
   				$('#main_domain').val($(this).data('mainDomain'));
   				$('#franchise_name').val($(this).data('franchiseName'));
   				$('#point_color').val($(this).data('pointColor'));
   				$('#representative_name').val($(this).data('representativeName'));
   				$('#business_number').val($(this).data('businessNumber'));
   				$('#address').val($(this).data('address'));
   				$('#phone_number').val($(this).data('phoneNumber'));
   				$('#fax').val($(this).data('fax'));
   				$('#responsibility_name').val($(this).data('responsibilityName'));
   				$('#responsibility_depa').val($(this).data('responsibilityDepa'));
   				$('#responsibility_position').val($(this).data('responsibilityPosition'));
   				$('#responsibility_number').val($(this).data('responsibilityNumber'));
   				$('#responsibility_phone').val($(this).data('responsibilityPhone'));
   				$('#responsibility_email').val($(this).data('responsibilityEmail'));
   				$('#memo').val($(this).data('memo'));
   				$('#updateManagerId').val($(this).data('id'));
   				$('#franchise_id').val($(this).data('franchiseId'));
   				
   				// 파일 
   				$('#presentFile').append('<img width:"300" height="120" src="${root}/upload/'+$(this).data('logoFile')+'">');
   				
   				if($(this).data('subdomainList') != null && $(this).data('subdomainList') != ''){
	   				const subDomain = $(this).data('subdomainList');
	   				const splitSubDomain = subDomain.trim().replace('[','').replace(']','').split(',');
	   				for(let i = 0;i<splitSubDomain.length;i++){
	   					$('.updateDomainGroup').append('<input type="text" name="additionalDomain" class="form-control" style="display:inline-block;width:20%;" readonly value="'+ splitSubDomain[i] + '">');	
	   				}
   				}
   				
   			});
   		
   			//(수정모달)추가 도메인 입력 (입력할때마다 추가)
			$('#updateDomainBtn').on('click',function(){
				
				if($('#updateDomainInput').val() == null || $('#updateDomainInput').val() == ''){
					alert('도메인을 입력해 주세요.');
					return;
				}
				
				const domain = $('#updateDomainInput').val();
				
				$('.updateDomainGroup').append('<input type="text" name="additionalDomain" class="form-control" readonly style="display:inline-block;width:20%;" value="'+ domain + '">');
				$('#updateDomainInput').val('');
				
			});
   			
   			//모달 꺼지면 데이터 초기화 
   			$('#myModal').on('hidden.bs.modal', function () {
   				
   			   	$('#managerUpdate')[0].reset();
   			   	$('.updateDomainGroup').empty();
   			   	$('#presentFile').empty();
   			   	
   			});
   		
		});
	</script>    
</body>

</html>