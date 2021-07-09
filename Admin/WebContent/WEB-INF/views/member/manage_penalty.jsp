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
                    <h1 class="h3 mb-2 text-gray-800"> 회원관리 > 패널티관리 </h1>
                    
                    <br><hr><br>
                    <form action="${root}/member/manage_penalty" method="get">

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
	                        				적용일
	                        			</th>
	                        			<td colspan="3">
	                        				<input type="date" style="width:70%;display:inline-block;" class="form-control" name="regdate">
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
	                        						<option value="${obj.id}" <c:if test="${memberPenaltyBean.baseArea eq obj.id}">selected</c:if>>${obj.area_name}</option>
	                        					</c:forEach>
	                        				</select>
		
	                        				<select name="areaId" class="form-control" style="width:40%;display:inline-block;" id="areaDetailSelect">
	                        					<option value="999" <c:if test="${memberPenaltyBean.areaId eq 999}">selected</c:if>>지역전체</option>
	                        					<option value="998" <c:if test="${memberPenaltyBean.areaId eq 998}">selected</c:if>>전체</option>
	                        					<c:forEach items="${areaSigunguDefaultList}" var="obj">
	                        						<option value="${obj.id}" <c:if test="${memberPenaltyBean.areaId eq obj.id}">selected</c:if>>${obj.sigungu_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th scope="row">닉네임</th>
	                        			<td>
	                        				<input type="text" class="form-control" name="name" value="${memberPenaltyBean.name}">
	                        			</td>
	                        			<th scope="row">패널티상태</th>
	                        			<td>
	                        				<select class="form-control" name="penalty">
	                        					<option value="1" <c:if test="${memberPenaltyBean.penalty eq 1}">selected</c:if>>전체</option>
	                        					<option value="2" <c:if test="${memberPenaltyBean.penalty eq 2}">selected</c:if>>경고</option>
	                        					<option value="3" <c:if test="${memberPenaltyBean.penalty eq 3}">selected</c:if>>이용정지</option>
	                        					<option value="4" <c:if test="${memberPenaltyBean.penalty eq 4}">selected</c:if>>차단</option>
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
                            <h6 class="m-0 font-weight-bold text-primary">조회 결과 / <a style="color:red;" href="javascript:void(0)" data-toggle="modal" data-target=".memberInfoModal">회원 정보</a>
                            / <a style="color:red;" href="javascript:void(0)" data-toggle="modal" data-target=".memberPenaltyModal">회원 패널티</a></h6>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead class="thead-dark">
                                  <tr>
                                    <th scope="col">#</th>
                                    <th>일자</th>
                                    <th>가맹사</th>
                                    <th>회원 코드</th>
                                    <th>닉네임</th>
                                    <th>게시물삭제 현황</th>
                                    <th>회원패널티 현황</th>
                                    <th>최근 패널티</th>
                                    <th>패널티 적용</th>
                                  </tr>
                                </thead>
                                <tbody>	
                                	<c:forEach items="${penaltyList}" var="obj" varStatus="status">
                                		<tr>
	                                		<th>${status.count}</th>
	                                		<td>${obj.regdate}</td>
	                                		<td>${obj.franchise_name}</td>
	                                		<td>${obj.member_code}</td>
	                                		<td>${obj.name}</td>
	                                		<td>${obj.category_penalty_name}</td>
	                                		<td>${obj.penalty_name}</td>
	                                		<td>${obj.penalty_date}</td>
	                                		<td><a href="javascript:void(0)" data-franchise-name="${obj.franchise_name}" id="panaltyApply" 
	                                		data-member-code = "${obj.member_code}" data-name = "${obj.name}">적용</a></td>
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
				          				<a class="page-link" href="${root}/member/manage_penalty?page=${pageBean.prevPage}&regdate=${memberPenaltyBean.regdate}&
				          					baseArea=${memberPenaltyBean.baseArea}&franchiseId=${memberManageBean.franchiseId}&areaId=${memberManageBean.areaId}&name=${memberPenaltyBean.name}&
				          					penalty=${memberPenaltyBean.penalty}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/member/manage_penalty?page=${idx}&regdate=${memberPenaltyBean.regdate}&
				          					baseArea=${memberPenaltyBean.baseArea}&franchiseId=${memberManageBean.franchiseId}&areaId=${memberManageBean.areaId}&name=${memberPenaltyBean.name}&
				          					penalty=${memberPenaltyBean.penalty}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/member/manage_penalty?page=${idx}&regdate=${memberPenaltyBean.regdate}&
				          					baseArea=${memberPenaltyBean.baseArea}&franchiseId=${memberManageBean.franchiseId}&areaId=${memberManageBean.areaId}&name=${memberPenaltyBean.name}&
				          					penalty=${memberPenaltyBean.penalty}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/member/manage_penalty?page=${pageBean.nextPage}&regdate=${memberPenaltyBean.regdate}&
				          					baseArea=${memberPenaltyBean.baseArea}&franchiseId=${memberManageBean.franchiseId}&areaId=${memberManageBean.areaId}&name=${memberPenaltyBean.name}&
				          					penalty=${memberPenaltyBean.penalty}" aria-label="Next">
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
	
	<!-- BO_D002_T1-P01 회원 패널티 적용 모달   -->
	<form action="${root}" method="get">
	
		<div class="modal fade memberPenaltyModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl modal-dialog-centered">
		    <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="exampleModalLongTitle">회원 패널티 적용 </h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered">
						<colgroup>
							<col scope="col" style="width:10%">
							<col scope="col" style="width:23%">
							<col scope="col" style="width:10%">
							<col scope="col" style="width:23%">
							<col scope="col" style="width:10%">
							<col scope="col" style="width:24%">
						</colgroup>	
					  <tbody>
						<tr>
							<th>가맹사</th>
							<td><input type="text" class="form-control" id="franchiseName"></td>
							<th>닉네임</th>
							<td><input type="text" class="form-control" id="nickName"></td>
							<th>회원코드</th>
							<td><input type="text" class="form-control" id="memberCode"></td>
						</tr>
						
						<tr>
							<th colspan="6" style="text-align:center">
								설정값 
							</th>
						</tr>
						<tr>
							<th>발견 경로</th>
							<td>
								<select class="form-control">
									<option>신고</option>
									<option>모니터링</option>
								</select>
							</td>
							<th>패널티 적용 대상</th>
							<td>
								<select class="form-control">
									<option>상품</option>
								</select>
							</td>
							<th>패널티 종류</th>
							<td><select class="form-control"><option>1</option></select></td>
						</tr>
						<tr>
							<th>패널티 적용기간(횟수)</th>
							<td colspan="5"><textarea rows="5" cols="" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th>패널티 적용 사유 </th>
							<td colspan="5"><textarea rows="5" cols="" class="form-control"></textarea></td>
						</tr>
						<tr>
							<td colspan="6" style="text-align:center">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">패널티 적용</button>
							</td>
						</tr>
					  </tbody>
					  
					</table>
					
					<table class="table table-bordered">
						<thead>
							<tr>
	                          <th scope="col">#</th>
	                          <th>일자</th>
	                          <th>가맹사</th>
	                          <th>회원 코드</th>
	                          <th>닉네임</th>
	                          <th>발견경로</th>
	                          <th>패널티 적용대상</th>
	                          <th>패널티 종류</th>
	                          <th>패널티 적용 기간</th>
	                          <th>패널티 내용</th>
	                          <th>처리자</th>
	                          <th>적용 여부</th>
	                          <th>패널티 해지</th>
	                        </tr>
						</thead>
						<tbody>
							<tr>
								<th>1</th>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>0</td>
								<td>-</td>
								<td>=</td>
								<td>\</td>
							</tr>
						</tbody>
					</table>
				</div>
		    </div>
		  </div>
		</div>
	</form>

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
						
							$('#areaDetailSelect').append('<option value= "999" <c:if test="${memberPenaltyBean.areaId eq 999}">selected</c:if>>지역전체</option>');
							$('#areaDetailSelect').append('<option value= "998" <c:if test="${memberPenaltyBean.areaId eq 998}">selected</c:if>>전체</option>');
						
						$.each(data,function(index,value){
							
							let areaId = "${memberPenaltyBean.areaId}";
							
							if(areaId == value.id){
								$('#areaDetailSelect').append('<option value='+value.id+' selected>'+value.sigungu_name+'</option>');
							}else{
								$('#areaDetailSelect').append('<option value='+value.id+'>'+value.sigungu_name+'</option>');
							}
						});
					}
				});
			});
			
			
			$('#panaltyApply').on('click',function(){
				
				const franchiseName = $(this).data('franchiseName');
				const nickName = $(this).data('name');
				const memberCode = $(this).data('memberCode');
				
				$('#nickName').val('');
				$('#memberCode').val('');
				$('#franchiseName').val('');
				
				$('#nickName').val(nickName);
				$('#memberCode').val(memberCode);
				$('#franchiseName').val(franchiseName);
				
				
			});
		});
	</script>
   
</body>

</html>