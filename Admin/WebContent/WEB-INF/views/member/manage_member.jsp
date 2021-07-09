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
                    <h1 class="h3 mb-2 text-gray-800"> 회원관리 > 회원관리 </h1>
                    
                    <br><hr><br>
                    <form action="${root}/member/manage_member" method="get">

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
	                        			<th scope="row">
	                        				가입일
	                        			</th>
	                        			<td>
	                        				<input type="date" style="width:50%;display:inline-block;" class="form-control" name="dateData" value="${memberManageBean.dateData}">
	                        			</td>
	                        			<th scope="row">탈퇴상태</th>
	                        			<td>
	                        				<select class="form-control" name="status">
	                        					<option value="0" <c:if test="${memberManageBean.status eq 0}">selected</c:if>>전체</option>
	                        					<option value="1" <c:if test="${memberManageBean.status eq 1}">selected</c:if>>정상</option>
	                        					<option value="2" <c:if test="${memberManageBean.status eq 2}">selected</c:if>>탈퇴</option>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th scope="row">가맹사</th>
	                        			<td>
	                        				<select class="form-control" name="franchiseId">
	                        					<c:forEach items="${franchiseNameList}" var="obj">
		                        					<option value="${obj.franchise_id}" <c:if test="${memberManageBean.franchiseId eq obj.franchise_id}">selected</c:if>>${obj.franchise_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        			<th scope="row">등록 지역 </th>
	                        			<td>
	                        				<select class="form-control" style="width:40%;display:inline-block;margin-right:10px;" id="areaSelect" name="baseArea">
	                        					<c:forEach items="${areaList}" var="obj">
	                        						<option value="${obj.id}" <c:if test="${memberManageBean.baseArea eq obj.id}">selected</c:if>>${obj.area_name}</option>
	                        					</c:forEach>
	                        				</select>
		
	                        				<select name="areaId" class="form-control" style="width:40%;display:inline-block;" id="areaDetailSelect">
	                        					<option value="999" <c:if test="${memberManageBean.areaId eq 999}">selected</c:if>>지역전체</option>
	                        					<option value="998" <c:if test="${memberManageBean.areaId eq 998}">selected</c:if>>전체</option>
	                        					<c:forEach items="${areaSigunguDefaultList}" var="obj">
	                        						<option value="${obj.id}" <c:if test="${memberManageBean.areaId eq obj.id}">selected</c:if>>${obj.sigungu_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th scope="row">닉네임</th>
	                        			<td>
	                        				<input type="text" class="form-control" name="nickName" value="${memberManageBean.nickName}">
	                        			</td>
	                        			<th scope="row">패널티상태</th>
	                        			<td>
	                        				<select class="form-control" name="penalty">
	                        					<option value="0" <c:if test="${memberManageBean.penalty eq 0}">selected</c:if>>전체</option>
	                        					<option value="1" <c:if test="${memberManageBean.penalty eq 1}">selected</c:if>>경고</option>
	                        					<option value="2" <c:if test="${memberManageBean.penalty eq 2}">selected</c:if>>이용정지</option>
	                        					<option value="3" <c:if test="${memberManageBean.penalty eq 3}">selected</c:if>>차단</option>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		<tr>
	                        			<td colspan="4" style="text-align:center">
	                        				<button type="submit" class="btn btn-light">검  색</button>
	                        				<button type="reset" class="btn btn-light">초기화</button>
	                        			</td>
	                        		</tr>
	                        	</tbody>
	                        </table>
	                    </div>
                    </form>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">조회 결과 / <h4><a style="color:red;" href="javascript:void(0)" data-toggle="modal" data-target=".memberInfoModal">수정</a></h4></h6>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead class="thead-dark">
                                  <tr>
                                    <th scope="col">#</th>
                                    <th>가입일</th>
                                    <th>프로필 이미지</th>
                                    <th>가맹사</th>
                                    <th>회원 코드</th>
                                    <th>닉네임</th>
                                    <th>등록 지역</th>
                                    <th>패널티 상태</th>
                                    <th>탈퇴 상태</th>
                                    <th>상세 정보</th>
                                  </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${memberList}" var="obj">
	                               		<tr>
	                               			<td>${obj.member_id}</td>
	                               			<td>${obj.regdate}</td>
	                               			<td><img src="${root}/upload/${obj.profile_image}"/></td>
	                               			<td>${obj.franchise_name}</td>
	                               			<td><a href="javascript:void(0)" data-toggle="modal" data-target=".memberInfoModal">${obj.member_code}</a></td>
	                               			<td><a href="javascript:void(0)" data-toggle="modal" data-target=".memberInfoModal">${obj.name}</a></td>
	                               			<td>${obj.sigungu_name}</td>
	                               			<td>
	                               				<c:choose>
	                               					<c:when test="${obj.panalty_name eq 1}">
	                               						경고
	                               					</c:when>
	                               					<c:when test="${obj.panalty_name eq 2 }">
	                               						정지
	                               					</c:when>
	                               					<c:when test="${obj.panalty_name eq 3}">
	                               						차단
	                               					</c:when>
	                               					<c:otherwise>
	                               						-
	                               					</c:otherwise>
	                               				</c:choose>
	                               			</td>
	                               			<td>
	                               				<c:choose>
	                               					<c:when test="${obj.withdrawal eq 1}">
	                               						정상
	                               					</c:when>
	                               					<c:otherwise>
	                               						탈퇴
	                               					</c:otherwise>
	                               				</c:choose>
	                               			</td>
	                               			<td><a href="javascript:void(0)" data-toggle="modal" data-target=".memberInfoModal">수정</a></td>
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
				          				<a class="page-link" href="${root}/member/manage_member?page=${pageBean.prevPage}&dateData=${memberManageBean.dateData}&
				          					status=${memberManageBean.status}&franchiseId=${memberManageBean.franchiseId}&areaId=${memberManageBean.areaId}&nickName=${memberManageBean.nickName}&
				          					penalty=${memberManageBean.penalty}&baseArea=${memberManageBean.baseArea}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/member/manage_member?page=${idx}&dateData=${memberManageBean.dateData}&
				          					status=${memberManageBean.status}&franchiseId=${memberManageBean.franchiseId}&areaId=${memberManageBean.areaId}&nickName=${memberManageBean.nickName}&
				          					penalty=${memberManageBean.penalty}&baseArea=${memberManageBean.baseArea}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/member/manage_member?page=${idx}&dateData=${memberManageBean.dateData}&
				          					status=${memberManageBean.status}&franchiseId=${memberManageBean.franchiseId}&areaId=${memberManageBean.areaId}&nickName=${memberManageBean.nickName}&
				          					penalty=${memberManageBean.penalty}&baseArea=${memberManageBean.baseArea}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/member/manage_member?page=${pageBean.nextPage}&dateData=${memberManageBean.dateData}&
				          					status=${memberManageBean.status}&franchiseId=${memberManageBean.franchiseId}&areaId=${memberManageBean.areaId}&nickName=${memberManageBean.nickName}&
				          					penalty=${memberManageBean.penalty}&baseArea=${memberManageBean.baseArea}" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										      </a>
										    	</li>
				          			</c:otherwise>
				          		</c:choose>
				          	</ul>
				          </div>

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
		
	</div>
	
	<!-- BO_ZOO2 회원 상세정보 모달  -->
	
	<div class="modal fade memberInfoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLongTitle">회원 정보</h5>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<div class="modal-body">
			<table class="table table-bordered table-dark">
			<colgroup>
				<col scope="col" style="width:15%;">
				<col scope="col" style="width:35%;">
				<col scope="col" style="width:15%;">
				<col scope="col" style="width:35%;">
			</colgroup>	
			  <tbody>
			    <tr>
			      <th scope="row">프로필</th>
			      <td>Mark</td>
			      <th scope="row">가입일</th>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row">가맹사</th>
			      <td>Mark</td>
			      <th scope="row">회원코드</th>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row">닉네임</th>
			      <td>Mark</td>
			      <th scope="row">등록지역</th>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row">등록상태</th>
			      <td>Mark</td>
			      <th scope="row">가입상태</th>
			      <td></td>
			    </tr>
			  </tbody>
			  
			</table>
			
			<table class="table table-bordered table-dark">
			<colgroup>
				<col scope="col">
				<col scope="col">
				<col scope="col">
				<col scope="col">
			</colgroup>	
			<thead>
				<tr>
					<th scope="col">일자</th>
					<th scope="col">수정항목</th>
					<th scope="col">수정 전</th>
					<th scope="col">수정 후</th>					
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>2020-01-01</th>
					<td>이름</td>
					<td>쿠팡맨</td>
					<td>쿠키맨</td>
				</tr>
			</tbody>
			  
			</table>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			  <button type="button" class="btn btn-primary">Save changes</button>
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
    
    <!-- alert 라이브러리 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
   
    
    <script>
		$(function(){
			
			$('#areaSelect').on('change',function(){
				
				$('#areaDetailSelect').empty();
				
				const areaCode = $('#areaSelect option:selected').val();
				
				$.ajax({
					url:'${root}/shop/getAreaDetail/'+areaCode,
					type:'get',
					success:function(data){
						
							$('#areaDetailSelect').append('<option value= "999" <c:if test="${memberManageBean.areaId eq 999}">selected</c:if>>지역전체</option>');
							$('#areaDetailSelect').append('<option value= "998" <c:if test="${memberManageBean.areaId eq 998}">selected</c:if>>전체</option>');
						
						$.each(data,function(index,value){
							
							let areaId = "${memberManageBean.areaId}";
							
							if(areaId == value.id){
								$('#areaDetailSelect').append('<option value='+value.id+' selected>'+value.sigungu_name+'</option>');
							}else{
								$('#areaDetailSelect').append('<option value='+value.id+'>'+value.sigungu_name+'</option>');
							}
						});
					}
				});
			});
			
		});
	</script>
   
</body>

</html>