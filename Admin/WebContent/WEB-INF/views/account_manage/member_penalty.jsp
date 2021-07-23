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
                	<form action="${root}/account_manage/member_penalty_register" method="post" id="penaltyRegiForm">
                    <br>
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">운영자 상세정보</h6>
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
										<td rowspan="3"><img src=""></td>
										<td>가맹사</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.franchiseName}"></td>
										<td>닉네임</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.name}"></td>
										<td>회원번호</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.memberId}" name="memberId"></td>
									</tr>
									<tr>
										<td>등록지역</td>
										<td><input type="text" class="form-control" readonly="readonly" value="${memMap.areaName}"></td>
										<td>발견 경로</td>
										<td>
											<select class="form-control" name="discoveryPath">
												<option value="1">모니터링</option>
												<option value="1">신고</option>
											</select>
										</td>
										<td>패널티 구분</td>
										<td>
											<select class="form-control" name="penaltySort">
												<option value="1">계정</option>
												<option value="2">상품</option>
												<option value="3">채팅</option>
												<option value="4">게시글</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>패널티 종류</td>
										<td>
											<select class="form-control" name="penaltyName">
												<option value="1">경고</option>
												<option value="2">이용정지</option>
												<option value="3">차단</option>
											</select>
										</td>
										<td>패널티 적용일</td>
										<td><input type="date" class="form-control" name="startDate"></td>
										<td>패널티 종료일</td>
										<td><input type="date" class="form-control" name="endDate"></td>
									</tr>
									<tr>
										<td>
										<td colspan="6">상세 사유</td>
									</tr>
									<tr>
									 	<th style="vertical-align: middle;" rowspan="3">
								            
								            <sup>(<span id="nowByte">0</span>/200bytes)</sup>
								        </th>
										<td colspan="6" rowspan="3">
											<textarea name="reason" rows="5" class="form-control"
											id="textArea_byteLimit" 
											onkeyup="fn_checkByte(this)"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
                        </div>
                    </div>
                    <div class="text-center"><button type="button" class="btn btn-secondary penalty-add" style="margin-bottom:1.5rem!important">패널티 적용</button></div>
                    <div class="card shadow mb-4">
	                    <div class="card-header py-3">
	                   		<h6 class="m-0 font-weight-bold text-primary">운영자 상세정보</h6>
	                    </div>
	                    <div class="card-body">
	                        <table class="table">
	                        	<thead>
	                        		<tr>
	                        			<th>No.</th>
	                        			<th>등록일</th>
	                        			<th>패널티 적용일</th>
	                        			<th>패널티 종료일</th>
	                        			<th>발견 경로</th>
	                        			<th>패널티 구분</th>
	                        			<th>패널티 종류</th>
	                        			<th>패널티 상태</th>
	                        			<th>처리자</th>
	                        			<th>패널티 해지</th>
	                        		</tr>
	                        	</thead>
	                        	<tbody>
	                        		<c:forEach items="${peList}" var="obj">
		                        		<tr>
		                        			<td>${obj.member_penalty_id}</td>
		                        			<td>${obj.regdate}</td>
		                        			<td>${obj.startDate}</td>
		                        			<td>${obj.endDate}</td>
		                        			<td><c:choose>
		                        				<c:when test="${obj.discovery_path eq 1}">모니터링</c:when>
		                        				<c:when test="${obj.discovery_path eq 2}">신고</c:when>
		                        			</c:choose></td>
		                        			<td><c:choose>
		                        				<c:when test="${obj.penalty_sort eq 1}">계정</c:when>
		                        				<c:when test="${obj.penalty_sort eq 2}">상품</c:when>
		                        				<c:when test="${obj.penalty_sort eq 3}">채팅</c:when>
		                        				<c:when test="${obj.penalty_sort eq 4}">게시글</c:when>
		                        			</c:choose></td>
		                        			<td><c:choose>
		                        				<c:when test="${obj.penalty_name eq 1}">경고</c:when>
		                        				<c:when test="${obj.penalty_name eq 2}">정지</c:when>
		                        				<c:when
		                        				 test="${obj.penalty_name eq 3}">차단</c:when>
		                        			</c:choose></td>
		                        			<td><c:choose>
		                        				<c:when test="${obj.state eq 1}">적용</c:when>
		                        				<c:when test="${obj.state eq 2}">해지</c:when>
		                        			</c:choose></td>
		                        			<td>${obj.register}</td>
		                        			<td>
		                        			<c:choose>
		                        				<c:when test="${obj.state eq 1}"><button class="btn btn-secondary penalty-del">패널티 해지</button></c:when>
		                        				<c:when test="${obj.state eq 2}"></c:when>
		                        			</c:choose>	
		                        			</td>
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
				          				<a class="page-link" href="${root}/account_manage/member_penalty?page=${pageBean.prevPage}&memberId=${memMap.memberId}&franchiseName=${memMap.franchiseName}&name=${memMap.name}&areaName=${memMap.areaName}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/account_manage/member_penalty?page=${idx}&memberId=${memMap.memberId}&franchiseName=${memMap.franchiseName}&name=${memMap.name}&areaName=${memMap.areaName}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/account_manage/member_penalty?page=${idx}&memberId=${memMap.memberId}&franchiseName=${memMap.franchiseName}&name=${memMap.name}&areaName=${memMap.areaName}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/account_manage/member_penalty?page=${pageBean.nextPage}&memberId=${memMap.memberId}&franchiseName=${memMap.franchiseName}&name=${memMap.name}&areaName=${memMap.areaName}" aria-label="Next">
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
   			
   			//패널티 등록
  			$('.penalty-add').click(function(){
  				
  				swal({
  					icon : "info",
  					text : "패널티 적용하시겠습니까?",
  					buttons: {
  						cancel : "N",
  						defeat : "Y" 
  					},
  					closeOnClickOutside : false
  				}).then(function(value){
  					switch(value){
  						case "defeat" :
  							swal("패널티가 적용되었습니다.").then(function(){
  								$('#penaltyRegiForm')[0].submit();
  							});
  						break;
  						default :
  							location.reload();
  					}
  				});
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