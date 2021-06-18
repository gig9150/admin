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
                    <h1 class="h3 mb-2 text-gray-800"> 관리자계정 관리 > 관리자 계정관리</h1>

                    <br><hr><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">검색 </h6>
                        </div>
                        <form method="get" action="${root}/manager/manage_account">
	                        <div class="card-body">
	                            <div class="row">
	                                <div class="col-sm-2">
	                                    <select style="width:100%;height:100%;" name="searchOption">
	                                        <option value="f.franchise_name" <c:if test="${searchOption eq 'f.franchise_name'}">selected</c:if>>가맹사</option>
	                                        <option value="m.id" <c:if test="${searchOption eq 'm.id'}">selected</c:if>>아이디</option>
	                                        <option value="m.name" <c:if test="${searchOption eq 'm.name'}">selected</c:if>>이름</option>
	                                        <option value="m.email" <c:if test="${searchOption eq 'm.email'}">selected</c:if>>이메일</option>
	                                        <option value="all" <c:if test="${searchOption eq 'all'}">selected</c:if>>전체 검색</option>
	                                    </select>
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
                                  	<th scope="col">check</th>
                                    <th scope="col">#</th>
                                    <th scope="col">가맹사</th>
                                    <th scope="col">아이디</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">이메일</th>
                                    <th scope="col">운영자 역할</th>
                                    <th scope="col">최근 접속일</th>
                                    <th scope="col">수정</th>
                                    <th scope="col">삭제</th>
                                  </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${managerList}" var="obj">
                                		<tr>
	                           				<td><input type="checkbox"></td>
		                                	<th scope="row">${obj.franchise_manager_id}</th>
	                                    	<td>${obj.franchise_name}</td>
	                                    	<td>${obj.id}</td>
	                                    	<td>${obj.name}</td>
	                                    	<td>${obj.email}</td>
	                                    	<td>
	                                    		<c:choose>
	                                    			<c:when test="${obj.status eq 1}">
	                                    				관리자
	                                    			</c:when>
	                                    			<c:otherwise>
	                                    				매니저
	                                    			</c:otherwise>
	                                    		</c:choose>
	                                    	</td>
	                                    	<td>${obj.access_date}</td>
	                                    	<td><a href="${root}/manager/manage_account_update?franchiseManagerId=${obj.franchise_manager_id}">수정</a></td>
	                                    	<td><a href="${root}/manager/manage_account_delete?franchiseManagerId=${obj.franchise_manager_id}&page=${pageBean.page}&searchOption=${searchOption}&keyWord=${keyWord}">삭제</a></td>
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
				          				<a class="page-link" href="${root}/manager/manage_account?page=${pageBean.prevPage}&searchOption=${searchOption}&keyWord=${keyWord}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/manager/manage_account?page=${idx}&searchOption=${searchOption}&keyWord=${keyWord}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/manager/manage_account?page=${idx}&searchOption=${searchOption}&keyWord=${keyWord}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/manager/manage_account?page=${pageBean.nextPage}&searchOption=${searchOption}&keyWord=${keyWord}" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										      </a>
										    	</li>
				          			</c:otherwise>
				          		</c:choose>
				          	</ul>
				          </div>
				          <br>
                          <a href="${root}/manager/manage_account_register" class="btn btn-primary btn-lg" style="width:300px;position:relative;margin:-5px -150px;top:50%;left:50%;">등록</a>
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

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- apply modal -->

    <div class="modal fade bd-example-modal-lg" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Recipient:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Message:</label>
                        <textarea class="form-control" id="message-text"></textarea>
                        <br>
                        <button type="button" class="btn btn-primary float-right btn-md"  style="width:150px;">등  록</button>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Recipient:</label>
                        <input type="text" class="form-control" id="recipient-name">
                        <br>
                        <button type="button" class="btn btn-primary float-right btn-md"  style="width:150px;">코드 생성</button>
                    </div><br>
                </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-block">첨부이미지 확인</button>
                    <button type="button" class="btn btn-secondary" style="width:120px;">승인</button>
                    <button type="button" class="btn btn-danger" style="width:120px;">반려</button>
                    <button type="button" class="btn btn-primary" style="width:120px;">보류</button>
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
    
</body>

</html>