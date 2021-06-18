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
                    <h1 class="h3 mb-2 text-gray-800"> 관리자계정 관리 > 관리자 역할 관리 > 역할 그룹 등록/수정 </h1>

                    <br><hr><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">역할 그룹 등록/수정</h6>
                        </div>
                        <div class="card-body">
                            <form method="post" action="${root}/manager/manage_role_register_pro">
								<div class="form-group">
								    <label for="exampleInputEmail1">역할 그룹 이름</label>
								    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="roleGroupName">
							  	</div>
							  	<div class="form-group">
							    	<label for="exampleFormControlTextarea1">역할 그룹 설명 </label>
							    	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="roleGroupInfo"></textarea>
							  	</div>
								<div class="form-group">
								    <label for="exampleInputPassword1">가맹점 코드</label>
								    <input type="text" class="form-control" id="exampleInputPassword1" name="franchiseManagerCode" placeholder="등록시 해당 가맹사만 등록 가능합니다.">
							  	</div>
							  	<c:forEach items="${roleDetailList}" var="obj">
							  		<div class="form-check form-check-inline">
									  <label class="form-check-label"><input class="form-check-input" type="checkbox" 
									  id="inlineCheckbox1" name="roleDetail" value="${obj.role_detail_id}">
									  ${obj.name}</label>
									</div>
							  	</c:forEach><br><br>
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