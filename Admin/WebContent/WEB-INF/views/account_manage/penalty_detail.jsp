<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    
    <link href="${root}/css/bo-style.css" rel="stylesheet">
    
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	
	<style>
	
		.crud-col label{
		    margin-right: 70px;		
		}
		
	
	</style>

</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid">
                	<form action="${root}/account_manage/penalty_detail_pro" method="post" id="penaltyUpdateForm">
                		
                		
                    <br>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 정보</h6>
                        </div>
                        <div class="card-body">
							<table class="table table-borderless" style="text-align: center;">
								<colgroup>
									<col width="22%">
									<col width="7.5%">
									<col width="18.5%">
									<col width="7.5%">
									<col width="18.5%">
									<col width="7.5%">
									<col width="18.5%">
								</colgroup>
								<tbody>
									<tr>
										<td rowspan="4"><img src="${root}/upload/${memMap.profile_image}"></td>
										<td>가맹사</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.franchise_name}"></td>
										<td>닉네임</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.name}"></td>
										<td>회원번호</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.member_id }"></td>
									</tr>
									<tr>
										<td>패널티 등록일</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.regdate}"></td>
										<td>등록인</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.register}"></td>
										<td>패널티 번호</td>
										<td><input type="text" class="form-control" readonly="readonly" name="memberPenaltyId" value="${memMap.member_penalty_id}"></td>
									</tr>
									<tr>
										<td>발견 경로</td>
										<td>
											<select class="form-control" name="discoveryPath">
												<option value="1" <c:if test="${memMap.discovery_path eq 1}">selected</c:if>>모니터링</option>
												<option value="2" <c:if test="${memMap.discovery_path eq 2}">selected</c:if>>신고</option>
											</select>
										</td>
										<td>패널티 구분</td>
										<td>
											<select class="form-control" name="penaltySort">
												<option value="1" <c:if test="${memMap.penalty_sort eq 1}">selected</c:if>>계정</option>
												<option value="2" <c:if test="${memMap.penalty_sort eq 2}">selected</c:if>>상품</option>
												<option value="3" <c:if test="${memMap.penalty_sort eq 3}">selected</c:if>>채팅</option>
												<option value="4" <c:if test="${memMap.penalty_sort eq 4}">selected</c:if>>게시글</option>
											</select>
										</td>
										<td>패널티 종류</td>
										<td>
											<select class="form-control" name="penaltyName">
												<option value="1" <c:if test="${memMap.penalty_name eq 1}">selected</c:if>>경고</option>
												<option value="2" <c:if test="${memMap.penalty_name eq 2}">selected</c:if>>이용정지</option>
												<option value="3" <c:if test="${memMap.penalty_name eq 3}">selected</c:if>>차단</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>패널티 적용일</td>
										<td><input type="date" class="form-control" name="startDate" value="${memMap.startDate}"></td>
										<td>패널티 종료일</td>
										<td><input type="date" class="form-control" name="endDate" value="${memMap.tmp_endDate}"></td>
										<td>패널티 상태</td>
										<td>
											<fmt:parseDate value="${memMap.startDate}" var="strPlanDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
											<fmt:parseDate value="${memMap.endDate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${(endPlanDate.time / (1000*60*60*24))}" integerOnly="true" var="endDate"/>
											<select class="form-control" name="state">
												<c:choose>
													<c:when test="${endDate >= strDate}">
														<option value="1" selected>패널티 적용</option>
														<option value="2">패널티 해지</option>
													</c:when>
													<c:otherwise>
														<option value="1">패널티 적용</option>
														<option value="2" selected>패널티 해지</option>
													</c:otherwise>
												</c:choose>
											</select>
										</td>
									</tr>
									<tr>
										<td>
										<td colspan="6">상세 사유</td>
									</tr>
									<tr>
									 	<td rowspan="3"></td>
										<td colspan="6" rowspan="3" style="position:relative;">
								            <sup style="position: absolute;right: 25px;top: 128px;">(<span id="nowByte">0</span>/200bytes)</sup>
											<textarea name="reason" rows="5" class="form-control"
											id="textArea_byteLimit" 
											onkeyup="fn_checkByte(this)"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
                        </div>
                    </div>
                    <div class="text-center"><button class="btn btn-secondary" style="margin-bottom:1.5rem!important">수정</button></div>
                    <div class="card shadow mb-4">
	                    <div class="card-header py-3">
	                   		<h6 class="m-0 font-weight-bold text-primary">패널티 수정 이력</h6>
	                    </div>
	                    <div class="card-body">
	                        <table class="table">
	                        	<thead>
	                        		<tr>
	                        			<th>No.</th>
	                        			<th>수정일</th>
	                        			<th>패널티 종류</th>
	                        			<th>패널티 적용일</th>
	                        			<th>패널티 종료일</th>
	                        			<th>상세사유</th>
	                        			<th>페널티 상태</th>
	                        			<th>처리자</th>
	                        		</tr>
	                        	</thead>
	                        	<tbody>
	                        		<c:forEach items="${list}" var="obj">
		                        		<tr>
		                        			<td>${obj.member_penalty_update_id}</td>
		                        			<td>${obj.regdate}</td>
		                        			<td><c:choose>
		                        				<c:when test="${obj.penalty_name eq 1}">경고</c:when>
		                        				<c:when test="${obj.penalty_name eq 2}">정지</c:when>
		                        				<c:when test="${obj.penalty_name eq 3}">차단</c:when>
		                        			</c:choose></td>
		                        			<td>${obj.startDate}</td>
		                        			<td>${obj.endDate}</td>
		                        			<td style="text-overflow: ellipsis;">${obj.reason}</td>
		                        			<c:choose>
		                        				<c:when test="${obj.state eq 1}">
				                        			<td>적용</td>
		                        				</c:when>
		                        				<c:otherwise>
		                        					<td>해지</td>
		                        				</c:otherwise>
		                        			</c:choose>
		                        			<td>${obj.register}</td>
		                        		</tr>
	                        		</c:forEach>
	                        	</tbody>
	                        </table>
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
				          				<a class="page-link" href="${root}/account_manage/penalty_detail?page=${pageBean.prevPage}&memberPenaltyId=${memberPenaltyId}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/account_manage/penalty_detail?page=${idx}&memberPenaltyId=${memberPenaltyId}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/account_manage/penalty_detail?page=${idx}&memberPenaltyId=${memberPenaltyId}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/account_manage/penalty_detail?page=${pageBean.nextPage}&memberPenaltyId=${memberPenaltyId}" aria-label="Next">
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
	                </form>
                </div>
                <!-- /.container-fluid -->
            </div>
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
    <script src="${root}/js/bo-script.js"></script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
   <script>
   
   		$(function(){
   			
   			
   			//패널티 수정
   			$('#penaltyUpdateForm').submit(function(e){
   				let chk = confirm('수정 하시겠습니까?');
   				if(!chk){
   					e.preventDefault();
   					location.href="${root}/account_manage/penalty_detail?memberPenaltyId=${memberPenaltyId}";
   				}
   			});
  			
  			//패널티 날짜 조건
  			$('input[name="endDate"]').change(function(){
  				if($('input[name="startDate"]').val() > $('input[name="endDate"]').val()){
  					alert('적용일이 더 클수 없습니다.');
  					$('input[name="startDate"]').val('');
  					$('input[name="endDate"]').val('');
  				}
  			});
  			
   		});
   		
   		
   		function fn_checkByte(obj){
   		    const maxByte = 200; //최대 100바이트
   		    const text_val = obj.value; //입력한 문자
   		    const text_len = text_val.length; //입력한 문자수
   		    
   		    let totalByte=0;
   		    for(let i=0; i<text_len; i++){
   		    	const each_char = text_val.charAt(i);
   		        const uni_char = escape(each_char) //유니코드 형식으로 변환
   		        if(uni_char.length>4){
   		        	// 한글 : 2Byte
   		            totalByte += 2;
   		        }else{
   		        	// 영문,숫자,특수문자 : 1Byte
   		            totalByte += 1;
   		        }
   		    }
   		    
   		    if(totalByte>maxByte){
   		    		alert('최대 200Byte까지만 입력가능합니다.');
 		        	document.getElementById("nowByte").innerText = totalByte;
 		            document.getElementById("nowByte").style.color = "red";
 		            document.getE
   		        }else{
   		        	document.getElementById("nowByte").innerText = totalByte;
   		            document.getElementById("nowByte").style.color = "green";
   		        }
   		    }
   
   </script>
</body>

</html>