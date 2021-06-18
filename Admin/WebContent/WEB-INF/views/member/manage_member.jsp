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
                    <h1 class="h3 mb-2 text-gray-800"> 가게관리 > 가게 신청 심사 </h1>
                    
                    <br><hr><br>
                    <form action="${root}/manager/manage_member" method="get">

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
	                        				<input type="date" style="width:50%;display:inline-block;" class="form-control" name="dateData">
	                        			</td>
	                        			<th scope="row">탈퇴상태</th>
	                        			<td>
	                        				<select class="form-control" name="status">
	                        					<option value="1">정상</option>
	                        					<option value="2">탈퇴</option>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th scope="row">가맹사</th>
	                        			<td>
	                        				<select class="form-control" name="franchiseId">
	                        					<c:forEach items="${franchiseNameList}" var="obj">
		                        					<option value="${obj.franchise_id}">${obj.franchise_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        			<th scope="row">등록 지역 </th>
	                        			<td>
	                        				<select class="form-control" style="width:40%;display:inline-block;margin-right:10px;" id="areaSelect" name="baseArea">
	                        					<c:forEach items="${areaList}" var="obj">
	                        						<option value="${obj.id}" <c:if test="${baseArea eq obj.id}">selected</c:if>>${obj.area_name}</option>
	                        					</c:forEach>
	                        				</select>
		
	                        				<select name="areaId" class="form-control" style="width:40%;display:inline-block;" id="areaDetailSelect">
	                        					<option value="00">지역전체</option>
	                        					<option value="0">전체</option>
	                        					<c:forEach items="${areaSigunguDefaultList}" var="obj">
	                        						<option value="${obj.id}">${obj.sigungu_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th scope="row">닉네임</th>
	                        			<td>
	                        				<input type="text" class="form-control" name="nickName">
	                        			</td>
	                        			<th scope="row">패널티상태</th>
	                        			<td>
	                        				<select class="form-control" name="panalty">
	                        					<option value="1">경고</option>
	                        					<option value="2">이용정지</option>
	                        					<option value="3">차단</option>
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
                            <h6 class="m-0 font-weight-bold text-primary">조회 결과</h6>
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
                               		<tr>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               			<td></td>
                               		</tr>                                	
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
				          				<a class="page-link" href="${root}/shop/apply?page=${pageBean.prevPage}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/shop/apply?page=${idx}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/shop/apply?page=${idx}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/shop/apply?page=${pageBean.nextPage}" aria-label="Next">
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
		
	</script>
   
</body>

</html>