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
                    <h1 class="h3 mb-2 text-gray-800"> 가게관리 > 가게리스트 </h1>
                    
                    <br><hr><br>
                    <form action="${root}/shop/list" method="get">

	                    <!-- DataTales Example -->
	                    <div class="card shadow mb-4">
	                        <table class="table table-bordered"> 
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
	                        		<col scope="col" style="width:10%;">
	                        		<col scope="col" style="width:10%;">
	                        	</colgroup>
	                        	
	                        	<tbody>
	                        		<tr>
	                        			<th scope="row">
	                        				가맹사
	                        			</th>
	                        			<td colspan="2">
	                        				<select class="form-control">
	                        					<option value = "1">승인일</option>
	                        					<option value = "2">신청일</option>
	                        					<option value = "3">탈퇴일</option>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		<tr>
	                        			<th scope="row" colspan="2"> 기획전 구분</th>
	                        			<td>
	                        				<select class="form-control" name="franchiseId">
	                        					<c:forEach items="${franchiseNameList}" var="obj">
		                        					<option value="${obj.franchise_id}" <c:if test="${shopSearchBean.franchiseId eq obj.franchise_id}">selected</c:if>>${obj.franchise_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        			<th scope="row">등록 지역 </th>
	                        			<td>
	                        				<select class="form-control" style="width:40%;display:inline-block;margin-right:10px;" id="areaSelect" name="baseArea">
	                        					<c:forEach items="${areaList}" var="obj">
	                        						<option value="${obj.id}" <c:if test="${shopSearchBean.baseArea eq obj.id}">selected</c:if>>${obj.area_name}</option>
	                        					</c:forEach>
	                        				</select>
		
	                        				<select name="areaId" class="form-control" style="width:40%;display:inline-block;" id="areaDetailSelect">
	                        					<option value = "999" <c:if test="${shopSearchBean.areaId == 999}">selected</c:if>>지역전체</option>
	                        					<option value = "998" <c:if test="${shopSearchBean.areaId == 998}">selected</c:if>>전체</option>
	                        					<c:forEach items="${areaSigunguDefaultList}" var="obj">
	                        						<option value="${obj.id}" <c:if test="${shopSearchBean.areaId == obj.id}">selected</c:if>>${obj.sigungu_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th scope="row">업종,업태</th>
	                        			<td>
	                        				<input type="text" class="form-control" name="sector" value="${shopSearchBean.sector}">
	                        			</td>
	                        			<th scope="row">가게명</th>
	                        			<td>
	                        				<input type="text" class="form-control" name="shopName" value="${shopSearchBean.shopName}">
	                        			</td>
	                        		</tr>
	                        		<tr>
	                        			<th>키워드</th>
	                        			<td colspan="3">
	                        				<input type="text" class="form-control" name="keyword" value="${shopSearchBean.keyword}">
	                        			</td>
	                        		</tr>
	                        		<tr>
	                        			<th>
	                        				활동상태	
	                        			</th>
	                        			<td>
	                        				<select class="form-control" name="status">
	                        					<option value="1" <c:if test="${shopSearchBean.status eq '1'}">selected</c:if>>전체</option>
	                        					<option value="2" <c:if test="${shopSearchBean.status eq '2'}">selected</c:if>>활동중</option>
	                        					<option value="3" <c:if test="${shopSearchBean.status eq '3'}">selected</c:if>>중지</option>
	                        					<option value="4" <c:if test="${shopSearchBean.status eq '4'}">selected</c:if>>탈퇴</option>
	                        				</select>
	                        			</td>
	                        			<th>
	                        				패널티 상태
	                        			</th>
	                        			<td>
	                        				<select class="form-control" name="panalty">
	                        					<option value="1" <c:if test="${shopSearchBean.panalty eq 1}">selected</c:if>>전체</option>
	                        					<option value="2" <c:if test="${shopSearchBean.panalty eq 2}">selected</c:if>>경고</option>
	                        					<option value="3" <c:if test="${shopSearchBean.panalty eq 3}">selected</c:if>>정지</option>
	                        					<option value="4" <c:if test="${shopSearchBean.panalty eq 4}">selected</c:if>>차단</option>
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
                            <h6 class="m-0 font-weight-bold text-primary">조회 결과 &nbsp; <small>총 ${shopListCnt}개</small></h6>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead class="thead-dark">
                                  <tr>
                                    <th scope="col" class="orderbyBtn">#</th>
                                    <th class="orderbyBtn">승인일</th>
                                    <th class="orderbyBtn">가맹사</th>
                                    <th class="orderbyBtn">프로필 사진</th>
                                    <th class="orderbyBtn">가게코드</th>
                                    <th class="orderbyBtn">가게명</th>
                                    <th class="orderbyBtn">신청자 닉네임</th>
                                    <th class="orderbyBtn">등록지역</th>
                                    <th class="orderbyBtn">신청일</th>
                                    <th class="orderbyBtn">활동 상태</th>
                                    <th class="orderbyBtn">패널티 상태</th>
                                    <th class="orderbyBtn">처리자명</th>
                                    <th class="orderbyBtn">상세정보</th>
                                  </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${shopList}" var="obj">
                               		<tr>
                               			<th>${obj.shop_idx}</th>
                               			<td>${obj.approve_date}</td>
                               			<td>${obj.franchise_name}</td>
                               			<td class="imgScale"><img width="120" height="120" src="${root}/upload/${obj.main_image}"></td>
                               			<td>${obj.shop_code}</td>
                               			<td>${obj.shop_name}</td>
                               			<td>${obj.name}</td>
                               			<td>${obj.sigungu_name}</td>
                               			<td>${obj.regdate}</td>
                               			<td>${obj.activity_status}</td>
                               			<c:choose>
                               				<c:when test="${obj.panalty_name != null}">
                               					<td>${obj.panalty_name}</td>
                               				</c:when>
                               				<c:otherwise>
                               					<td> - </td>
                               				</c:otherwise>
                               			</c:choose>
                               			<td>${obj.register}</td>
                               			<td><a href="#">수정</a></td>
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
				          				<a class="page-link" href="${root}/shop/list?page=${pageBean.prevPage}&baseArea=${baseArea}
				          					&dataSelect=${shopSearchBean.dateSelect}&dateData=${shopSearchBean.dateData}&franchiseId=${shopSearchBean.franchiseId}
				          					&areaId=${shopSearchBean.areaId}&sector=${shopSearchBean.sector}&shopName=${shopSearchBean.shopName}&keyword=${shopSearchBean.keyword}
				          					&status=${shopSearchBean.status}&panalty=${shopSearchBean.panalty}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/shop/list?page=${idx}&baseArea=${baseArea}
				          					&dataSelect=${shopSearchBean.dateSelect}&dateData=${shopSearchBean.dateData}&franchiseId=${shopSearchBean.franchiseId}
				          					&areaId=${shopSearchBean.areaId}&sector=${shopSearchBean.sector}&shopName=${shopSearchBean.shopName}&keyword=${shopSearchBean.keyword}
				          					&status=${shopSearchBean.status}&panalty=${shopSearchBean.panalty}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/shop/list?page=${idx}&baseArea=${baseArea}&
				          					dataSelect=${shopSearchBean.dateSelect}&dateData=${shopSearchBean.dateData}&franchiseId=${shopSearchBean.franchiseId}&
				          					areaId=${shopSearchBean.areaId}&sector=${shopSearchBean.sector}&shopName=${shopSearchBean.shopName}&keyword=${shopSearchBean.keyword}&
				          					status=${shopSearchBean.status}&panalty=${shopSearchBean.panalty}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/shop/list?page=${pageBean.nextPage}&baseArea=${baseArea}&
				          					dataSelect=${shopSearchBean.dateSelect}&dateData=${shopSearchBean.dateData}&franchiseId=${shopSearchBean.franchiseId}&
				          					areaId=${shopSearchBean.areaId}&sector=${shopSearchBean.sector}&shopName=${shopSearchBean.shopName}&keyword=${shopSearchBean.keyword}&
				          					status=${shopSearchBean.status}&panalty=${shopSearchBean.panalty}" aria-label="Next">
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