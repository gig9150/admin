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
                    <form action="${root}/shop/apply" method="get">

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
	                        			<td colspan="3">
	                        				<input type="date" style="width:50%;display:inline-block;" class="form-control" name="dateData">
	                        			</td>
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th scope="row">가맹사</th>
	                        			<td>
	                        				<select class="form-control" name="franchiseId">
	                        					<c:forEach items="${franchiseNameList}" var="obj">
		                        					<option value="${obj.franchise_id}" <c:if test="${shopApplySearchBean.franchiseId eq obj.franchise_id}">selected</c:if>>${obj.franchise_name}</option>
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
	                        					<option value="00" <c:if test="${shopApplySearchBean.areaId == 00}">selected</c:if>>지역전체</option>
	                        					<option value="0" <c:if test="${shopApplySearchBean.areaId == 0}">selected</c:if>>전체</option>
	                        					<c:forEach items="${areaSigunguDefaultList}" var="obj">
	                        						<option value="${obj.id}" <c:if test="${shopApplySearchBean.areaId == obj.id}">selected</c:if>>${obj.sigungu_name}</option>
	                        					</c:forEach>
	                        				</select>
	                        			</td>
	                        		</tr>
	                        		
	                        		<tr>
	                        			<th scope="row">신청자 닉네임</th>
	                        			<td>
	                        				<input type="text" class="form-control" name="nickName" value="${shopApplySearchBean.nickName}">
	                        			</td>
	                        			<th scope="row">대표자명</th>
	                        			<td>
	                        				<input type="text" class="form-control" name="representative" value="${shopApplySearchBean.representative }">
	                        			</td>
	                        		</tr>
	                        		<tr>
	                        			<th>가게명</th>
	                        			<td colspan="3">
	                        				<input type="text" class="form-control" name="shopName" value="${shopApplySearchBean.shopName}">
	                        			</td>
	                        		</tr>
	                        		<tr>
	                        			<th>
	                        				사업자 번호	
	                        			</th>
	                        			<td>
	                        				<input type="text" class="form-control" name="number" value="${shopApplySearchBean.number}">
	                        			</td>
	                        			<th>
	                        				등록 상태
	                        			</th>
	                        			<td>
	                        				<select class="form-control" name="status">
	                        					<option value="1" <c:if test="${shopApplySearchBean.status == 1}">selected</c:if>>전체</option>
	                        					<option value="2" <c:if test="${shopApplySearchBean.status == 2}">selected</c:if>>심사중</option>
	                        					<option value="3" <c:if test="${shopApplySearchBean.status == 3}">selected</c:if>>반려</option>
	                        					<option value="4" <c:if test="${shopApplySearchBean.status == 4}">selected</c:if>>보류</option>
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
                                    <th>신청일</th>
                                    <th>가맹사</th>
                                    <th>신청자 닉네임</th>
                                    <th>가게명</th>
                                    <th>등록지역</th>
                                    <th>대표자명</th>
                                    <th>사업자번호</th>
                                    <th>등록상태</th>
                                    <th>상세 정보</th>
                                  </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${shopApplyList}" var = "obj">
	                               		<tr>
	                               			<th>${obj.shop_idx}</th>
	                               			<td>${obj.regdate}</td>
	                               			<td>${obj.franchise_name}</td>
	                               			<td>${obj.name }</td>
	                               			<td><a href="javascript:void(0)" class="shopApplyUpdate" data-shop-idx="${obj.shop_idx}" data-toggle="modal" data-target=".bd-example-modal-lg">${obj.shop_name}</a></td>
	                               			<td>${obj.sigungu_name }</td>
	                               			<td>${obj.representative }</td>
	                               			<td>${obj.buisness_num }</td>
	                               			<td>${obj.status }</td>
	                               			<td><a href="javascript:void(0)" class="shopApplyUpdate" data-shop-idx="${obj.shop_idx}" data-toggle="modal" data-target=".bd-example-modal-lg">상세 정보</a></td>
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
				          				<a class="page-link" href="${root}/shop/apply?page=${pageBean.prevPage}&baseArea=${baseArea}&
				          					dateData=${shopApplySearchBean.dateData}&franchiseId=${shopApplySearchBean.franchiseId}&areaId=${shopApplySearchBean.areaId}&
				          					nickName=${shopApplySearchBean.nickName}&representative=${shopApplySearchBean.representative}&shopName=${shopApplySearchBean.shopName}&
				          					number=${shopApplySearchBean.number}&status=${shopApplySearchBean.status}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/shop/apply?page=${idx}&baseArea=${baseArea}&
				          					dateData=${shopApplySearchBean.dateData}&franchiseId=${shopApplySearchBean.franchiseId}&areaId=${shopApplySearchBean.areaId}&
				          					nickName=${shopApplySearchBean.nickName}&representative=${shopApplySearchBean.representative}&shopName=${shopApplySearchBean.shopName}&
				          					number=${shopApplySearchBean.number}&status=${shopApplySearchBean.status}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/shop/apply?page=${idx}&baseArea=${baseArea}&
				          					dateData=${shopApplySearchBean.dateData}&franchiseId=${shopApplySearchBean.franchiseId}&areaId=${shopApplySearchBean.areaId}&
				          					nickName=${shopApplySearchBean.nickName}&representative=${shopApplySearchBean.representative}&shopName=${shopApplySearchBean.shopName}&
				          					number=${shopApplySearchBean.number}&status=${shopApplySearchBean.status}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/shop/apply?page=${pageBean.nextPage}&baseArea=${baseArea}&
				          					dateData=${shopApplySearchBean.dateData}&franchiseId=${shopApplySearchBean.franchiseId}&areaId=${shopApplySearchBean.areaId}&
				          					nickName=${shopApplySearchBean.nickName}&representative=${shopApplySearchBean.representative}&shopName=${shopApplySearchBean.shopName}&
				          					number=${shopApplySearchBean.number}&status=${shopApplySearchBean.status}" aria-label="Next">
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
    
    <!-- 가게 신청 정보 modal -->
    
	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"  aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	    	<div class="modal-header">
		        <h5 class="modal-title">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        <span aria-hidden="true">&times;</span>
		        </button>
	      	</div>
	      		<form action="${root}/shop/apply_pro" method="post" id="codeCheck">
		     		<div class="modal-body">
		     			<input type="hidden" id="applyHidden" name="shopIdx">
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
		                   				신청일 
		                   			</th>
		                   			<td>
		                   				<input type="text" class="form-control" readonly="readonly" id="regdate">
		                   			</td>
		                   			<th>
		                   			이름</th>
		                   			<td>
		                   				<input type="text" class="form-control" readonly="readonly" id="member_name">
		                   			</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<th scope="row">생년월일</th>
		                   			<td>
		                   				<input type="text" class="form-control" readonly="readonly" id="date_of_birth">
		                   			</td>
		                   			<th scope="row">휴대폰번호 </th>
		                   			<td>
		                   				<input type="text" class="form-control" readonly="readonly" id="phone">
		                   			</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<th scope="row">대표자명</th>
		                   			<td>
		                   				<input type="text" class="form-control" readonly="readonly" id="representative">
		                   			</td>
		                   			<th scope="row">사업자번호</th>
		                   			<td>
		                   				<input type="text" class="form-control" readonly="readonly" id="buisness_num">
		                   			</td>
		                   		</tr>
		                   		<tr>
		                   			<th>가게명</th>
		                   			<td>
		                   				<input type="text" class="form-control" readonly="readonly" id="shop_name">
		                   			</td>
		                   			<th>
		                   				업종,업태
		                   			</th>
		                   			<td>
		                   				<input type="text" class="form-control" readonly="readonly" id="sector">
		                   			</td>
		                   		</tr>
		                   		<tr>
		                   			<th>지역</th>
		                   			<td colspan="3">
		                   				<input type="text" class="form-control" readonly="readonly" id="area_name">
		                   			</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<td id="keywordTd" colspan="4"></td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<td colspan="4">
		                   				관리자 메모
		                   			</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<td colspan="4" style="position:relative;">
			                   			<textarea class="form-control" rows="5" name="responsibilityMemo"></textarea>
			                   			<button type="button" class="btn btn-info" style="position:absolute;right:10px;bottom:13px;">승인</button>
			                   		</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<td colspan="4">
		                   				가게코드
		                   			</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<td colspan="4" style="position:relative;">
			                   			<textarea id="codeTextArea" class="form-control" rows="5" readonly="readonly" name="shopCode"></textarea>
			                   			<button type="button" id="createCode" class="btn btn-info" style="position:absolute;right:10px;bottom:13px;">코드 생성</button>
			                   		</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<td colspan="4">
		                   				<a href="javascript:void(0)" class="btn btn-info" style="width:100%;" id="imageCon">첨부 이미지 확인 </a>
		                   			</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<td colspan="4" style="text-align:center;">
		                   				<button type="submit" class="btn btn-light" name="ok">승인</button>
		                   				<button type="button" id="returnReasonBtn" class="btn btn-light">반려</button>
		                   				<button type="submit" class="btn btn-light" name="keep">보류</button>
		                   			</td>
		                   		</tr>
		                   		
		                   		<tr>
		                   			<td colspan="4" style="position:relative;display:none" class="returnReasonEle">
			                   			<textarea class="form-control" rows="5" placeholder="반려 사유를 작성해주세요" name="returnReason"></textarea>
			                   			<button type="submit" class="btn btn-info" style="position:absolute;right:10px;bottom:13px;" name="no">반려</button>
			                   		</td>
		                   		</tr>    
		                   		         		
		                   	</tbody>
		                   </table>
		     		</div>
		     	</form>
		    </div>
	  </div>
	</div>
	
	<div id="open-popup" class="mfp-hide white-popup">
		
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
			
			// 지역선택 하면 상세 지역 정보 얻어오기
			$('#areaSelect').on('change',function(){
				
				$('#areaDetailSelect').empty();
				
				const areaCode = $('#areaSelect option:selected').val();
				
				$.ajax({
					url:'${root}/shop/getAreaDetail/'+areaCode,
					type:'get',
					success:function(data){
						
							$('#areaDetailSelect').append('<option value= 00>지역전체</option>');
							$('#areaDetailSelect').append('<option value= 0>전체</option>');
							
						$.each(data,function(index,value){
							
							$('#areaDetailSelect').append('<option value='+value.id+'>'+value.sigungu_name+'</option>');
						
						});
						
					}
					
				});
				
			});
			
			//modal에 가게 신청 정보 올리기
			$('.shopApplyUpdate').on('click',function(){
				
				console.log('test');
				
				const shopIdx = $(this).data('shopIdx');
				$('#applyHidden').val(shopIdx);
				
				$.ajax({
					url:'${root}/shop/getApplyInfo/'+shopIdx,
					type:'get',
					success:function(data){
						$('#regdate').val(data.regdate);
						$('#member_name').val(data.member_name);
						$('#date_of_birth').val(data.date_of_birth);
						$('#phone').val(data.phone);
						$('#representative').val(data.representative);
						$('#buisness_num').val(data.buisness_num);
						$('#shop_name').val(data.shop_name);
						$('#sector').val(data.sector);
						$('#area_name').val(data.area_name + ' ' + data.sigungu_name);
						$('#keywordTd').empty();
						$.each(data.keywordList,function(index,value){
							$('#keywordTd').append('<span>#'+value+'</span>');
						});
					}
				});
				
			});
			
			//가게코드 생성 
			$('#createCode').on('click',function(){
				
				let code = '';
				
				for(let i=0;i<10;i++) {
					code += Math.floor(Math.random() * 10);
				}
				
				$('#codeTextArea').text(code);
				
			});
			
			//반려 버튼 누르면 반려사유 입력하는창 나옴 ㅎ..
			$('#returnReasonBtn').click(function(){
				
				$('.returnReasonEle').toggle();
				
			});
			
			//가게 코드가 입력여부 확인
			$('#codeCheck').submit(function(e){
								
				if($('#codeTextArea').html() == null || $('#codeTextArea').html() == ''){

					swal({
						title : "!",
						text : "가게 코드를 생성해주세요.",
				    	closeOnClickOutside : false
				 	});
					
					e.preventDefault();
					
				}
			});
			
			
		});
		
		$('#imageCon').on('click',function(){
			
			const shopIdx = $('#applyHidden').val();
			
			window.open('image_pop_up?shopIdx='+shopIdx,"_blank","width=800, height=700");
			
		});
		
	</script>
   
</body>

</html>