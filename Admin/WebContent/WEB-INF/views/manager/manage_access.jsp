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
                    <h1 class="h3 mb-2 text-gray-800"> 관리자계정 관리 > 계정 접속 내역 </h1>

                    <br><hr><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">검색 </h6>
                        </div>
                        <form method="get" action="${root}/manager/manage_access">
	                        <div class="card-body">
	                            <div class="row">
	                                <div class="col-sm-6">
	                                    <input style="width:45%;display:inline-block;" type="date" name="startDate" class="form-control" value="${startDate}">
	                                    <input style="width:45%;display:inline-block;" type="date" name="endDate" class="form-control" value="${endDate}">
	                                </div>
	                                <div class="col-sm-6">
	                                	<label for="keywordInput"><span>가맹사 :</span></label>&nbsp;
	                                    <input style="width:70%;display:inline-block; value="${keyword}" type="text" id="keywordInput" name="keyWord" class="form-control" aria-label="Text input with dropdown button">
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
                                    <th>가맹사</th>
                                    <th>아이디</th>
                                    <th>처리결과</th>
                                  </tr>
                                </thead>
                                <tbody>
                               		<c:forEach items="${accessList}" var="obj">
                               			<tr>
		                                	<th scope="row">${obj.franchise_manager_id}</th>
	                                    	<td>${obj.access_date}</td>
	                                    	<td>${obj.franchise_name}</td>
	                                    	<td>${obj.id}</td>
	                                    	<td>1</td>
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
				          				<a class="page-link" href="${root}/manager/manage_access?page=${pageBean.prevPage}&startDate=${startDate}&endDate=${endDate}&keyWord=${keyWord}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/manager/manage_access?page=${idx}&startDate=${startDate}&endDate=${endDate}&keyWord=${keyWord}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/manager/manage_access?page=${idx}&startDate=${startDate}&endDate=${endDate}&keyWord=${keyWord}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/manager/manage_access?page=${pageBean.nextPage}&startDate=${startDate}&endDate=${endDate}&keyWord=${keyWord}" aria-label="Next">
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
    
   
</body>

</html>