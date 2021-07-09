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
    
    <style>
	   	.curation-list input[type="radio"]{
	   		 margin-right: 10px;
	   		
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
                    <h1 class="h3 mb-2 text-gray-800"> 전시관리 > 기획전 등록 관리 </h1>
                    
                    <br><hr><br>
                    
                    <form action="${root}/exhibition/curation_list" id="curationListForm" method="get" >

	                    <!-- DataTales Example -->
	                    <div class="card shadow mb-4 curation-list" style="padding-top: 50px;position:relative;">
	                    	<span style="position: absolute;top: 15px;left: 13px;font-size: 18px;font-weight: 500;">검색</span>
	                        <table class="table"> 
	                        	<colgroup>
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        	</colgroup>
	                        	
	                        	<tbody>
	                        		
	                        		<tr>
	                        			<th scope="row">
	                        				가맹사
	                        			</th>
	                        			<td>
	                        				<select class="form-control" name="franchiseId">
	                        					<option value="0">전체</option>
	                        					<c:forEach items="${franchiseList}" var="obj">
	                        						<option value="${obj.franchise_id}" <c:if test='${curationSearchBean.franchiseId eq obj.franchise_id}'>selected</c:if>>${obj.franchise_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        			<th>
	                        				기획전 구분
	                        			</th>
	                        			<td colspan="2">
	                        				<select class="form-control" name="section">
	                        					<option value="all" <c:if test='${curationSearchBean.section eq "all"}'>selected</c:if>>전체</option>
	                        					<option value="promotion" <c:if test='${curationSearchBean.section eq "promotion"}'>selected</c:if>>가게 홍보</option>
	                        					<option value="used" <c:if test='${curationSearchBean.section eq "used"}'>selected</c:if>>중고 장터</option>
	                        					<option value="direct" <c:if test='${curationSearchBean.section eq "direct"}'>selected</c:if>>산지직거래</option>
	                        				</select>
	                        			</td>  
	                        			<th>
	                        				기획전 타이틀
	                        			</th>	    
	                        			<td colspan="4">
	                        				<input type="text" class="form-control" name="curationTitle" value="${curationSearchBean.curationTitle}">
	                        			</td>         			
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th>진행상태</th>
	                        			<td colspan="3">
	                        				<label><input type="radio" name="proStatus" value="all" <c:if test='${curationSearchBean.proStatus eq "all"}'>checked</c:if>>전체</label>
	                        				<label><input type="radio" name="proStatus" value="probe" <c:if test='${curationSearchBean.proStatus eq "probe"}'>checked</c:if>>미진행</label>
	                        				<label><input type="radio" name="proStatus" value="proing" <c:if test='${curationSearchBean.proStatus eq "proing"}'>checked</c:if>>진행중</label>
	                        				<label><input type="radio" name="proStatus" value="com" <c:if test='${curationSearchBean.proStatus eq "com"}'>checked</c:if>>진행완료</label>
	                        			</td>
	                        			<th>공개유무</th>
	                        			<td colspan="2">
	                        				<label><input type="radio" name="open" value="all" <c:if test='${curationSearchBean.open eq "all"}'>checked</c:if>>전체</label>
	                        				<label><input type="radio" name="open" value="open" <c:if test='${curationSearchBean.open eq "open"}'>checked</c:if>>공개</label>
	                        				<label><input type="radio" name="open" value="notOpen" <c:if test='${curationSearchBean.open eq "notOpen"}'>checked</c:if>>비공개</label>
	                        			</td>
	                        		</tr>
									<tr>
	                        			<td colspan="10" style="text-align:center">
	                        				<button type="submit" class="btn btn-info">검  색</button>
	                        				<input type="reset" class="btn btn-light" id="curationReset">
	                        			</td>
	                        		</tr>
	                        	</tbody>
	                        </table>
	                    </div>
                    </form>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">조회 결과 &nbsp; <small>총 ${curationCnt}개</small></h6>
                        </div>
                        <div class="card-body">
                            <table class="table">
                            
<%--                             	<colgroup> --%>
<%-- 	                        		<col scope="col" style="width:5%;"> --%>
<%-- 	                        		<col scope="col" style="width:10%;"> --%>
<%-- 	                        		<col scope="col" style="width:10%;"> --%>
<%-- 	                        		<col scope="col" style="width:20%;"> --%>
<%-- 	                        		<col scope="col" style="width:10%;"> --%>
<%-- 	                        		<col scope="col" style="width:10%;"> --%>
<%-- 	                        		<col scope="col" style="width:10%;"> --%>
<%-- 	                        		<col scope="col" style="width:10%;"> --%>
<%-- 	                        		<col scope="col" style="width:15%;"> --%>
<%-- 	                        		<col scope="col" style="width:%;"> --%>
<%-- 	                        		<col scope="col" style="width:5%;"> --%>
<%-- 	                        	</colgroup> --%>
                                <thead class="thead-dark">
                                  <tr>
                                    <th scope="col" >#</th>
                                    <th>가맹사</th>
                                    <th>기획전 구분</th>
                                    <th>기획전 타이틀</th>
                                    <th>이벤트코드</th>
                                    <th>URL</th>
                                    <th>진행상태</th>
                                    <th>공개유무</th>
                                    <th>진행기간</th>
                                    <th>등록일</th>
                                    <th>수정</th>
                                  </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${curationList}" var="obj">
                                	<tr>
                                		<th><input type="checkbox"></th>
                                		<td>${obj.franchise_name}</td>
                                		<c:choose>
                                			<c:when test="${obj.exhi_section eq 1}">
                                				<td>가게 홍보</td>
                                			</c:when>
                                			<c:when test="${obj.exhi_section eq 2}">
                                				<td>중고 거래</td>
                                			</c:when>
                                			<c:otherwise>
                                				<td>산지 직거래</td>
                                			</c:otherwise>
                                		</c:choose>
                                		<td>${obj.exhi_name}</td>
                                		<td>${obj.event_code}</td>
                                		<td>${obj.url}</td>
                                		<c:choose>
                                			<c:when test="${obj.pro_status eq 1}">
                                				<td>미진행</td>
                                			</c:when>
                                			<c:when test="${obj.pro_status eq 2}">
                                				<td>진행중</td>
                                			</c:when>
                                			<c:otherwise>
                                				<td>진행 완료</td>
                                			</c:otherwise>
                                		</c:choose>
                                		<c:choose>
                                			<c:when test="${obj.open_status eq 1}">
                                				<td>공개</td>
                                			</c:when>
                                			<c:otherwise>
                                				<td>비공개</td>
                                			</c:otherwise>
                                		</c:choose>
                                		<td>${obj.start_date} &nbsp; ${obj.end_date }</td>
                                		<td>${obj.regdate}</td>
                                		<td><a href="${root}/exhibition/curation_update?shopExhiId=${obj.shop_exhi_id}" class="btn btn-light">수정</a></td>
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
				          				<a class="page-link" href="${root}/exhibition/curation_list?page=${pageBean.prevPage}&franschiseId=${curationSearchBean.franchiseId}&
				          				section=${curationSearchBean.section}&curationTitle=${curationSearchBean.curationTitle}&proStatus=${curationSearchBean.proStatus}&
				          				open=${curationSearchBean.open}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/exhibition/curation_list?page=${idx}&franschiseId=${curationSearchBean.franchiseId}&
				          				section=${curationSearchBean.section}&curationTitle=${curationSearchBean.curationTitle}&proStatus=${curationSearchBean.proStatus}&
				          				open=${curationSearchBean.open}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/exhibition/curation_list?page=${idx}&franschiseId=${curationSearchBean.franchiseId}&
				          				section=${curationSearchBean.section}&curationTitle=${curationSearchBean.curationTitle}&proStatus=${curationSearchBean.proStatus}&
				          				open=${curationSearchBean.open}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/exhibition/curation_list?page=${pageBean.nextPage}&franschiseId=${curationSearchBean.franchiseId}&
				          				section=${curationSearchBean.section}&curationTitle=${curationSearchBean.curationTitle}&proStatus=${curationSearchBean.proStatus}&
				          				open=${curationSearchBean.open}" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										      </a>
										    	</li>
				          			</c:otherwise>
				          		</c:choose>
				          	</ul>
					          <a href="${root}/exhibition/curation_apply" class="btn btn-info" style="position: absolute;right: 26px;width: 150px;">등록 </a>
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
    <script src="${root}/js/custom.js"></script>
    
    
   
</body>

</html>