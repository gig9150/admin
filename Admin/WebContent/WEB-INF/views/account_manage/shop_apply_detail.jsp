<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
		.table tbody td:not('.apply-list'){
			text-align: center;
    		line-height: 38px;
		
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
	                    <br>
	                    
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">운영자 상세정보</h6>
	                        </div>
	                        <div class="card-body">
								<table class="table table-borderless">
									<colgroup>
										<col width="8%">
										<col width="25%">
										<col width="8%">
										<col width="25%">
										<col width="8%">
										<col width="25%">
									</colgroup>
									<tbody>
										<tr>
											<td>신청일</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.regdate}"></td>
											<td>가맹사</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.franchise_name}"></td>
											<td>가게명</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.shop_name}"></td>
										</tr>
										<tr>
											<td>등록지역</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.area_name}"></td>
											<td>이름</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.name}"></td>
											<td>생년월일</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.birth}"></td>
										</tr>
										<tr>
											<td>핸드폰</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.phone}"></td>
											<td>닉네임</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.name}"></td>
											<td>회원 번호</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.member_id}"></td>
										</tr>
										<tr>
											<td colspan="6" class="apply-list">신청이력</td>
										</tr>
									</tbody>
								</table>
	                        </div>
	                    </div>
	                    <div class="card shadow mb-4">
		                    <div class="card-header py-3">
		                   		<h6 class="m-0 font-weight-bold text-primary">운영자 상세정보</h6>
		                    </div>
		                    <div class="card-body">
		                        <table class="table table-borderless">
									<colgroup>
										<col width="8%">
										<col width="25%">
										<col width="8%">
										<col width="25%">
										<col width="8%">
										<col width="25%">
									</colgroup>
									<tbody>
										<tr>
											<td>상호</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.buisness_name}"></td>
											<td>사업자번호</td>
											<td style="position: relative;">
												<input type="text" readonly="readonly" class="form-control" value="${map.buisness_num}">
												<img class="pop-img" data-image = "${map.buisness_image_name}" src="${root}/img/download.png" style="position:absolute;right:17px;top:18px;height:25px;">
											</td>
											<td>사업자명</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.representative}"></td>
										</tr>
										<tr>
											<td>업종 업태</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.sector_content}"></td>
											<td>주소</td>
											<td><input type="text" readonly="readonly" class="form-control" value="${map.address}"></td>
										</tr>
									</tbody>
								</table>
		                    </div>
	                    </div>
	                    <c:if test="${not empty list}">
		                    <div class="card shadow mb-4">
			                    <div class="card-header py-3">
			                   		<h6 class="m-0 font-weight-bold text-primary">운영자 상세정보</h6>
			                    </div>
			                    <div class="card-body">
			                        <table class="table table-borderless">
										<colgroup>
											<col width="25%">
											<col width="25%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<thead class="thead-dark">
											<tr>
												<th>No.</th>
												<th>처리일</th>
												<th>사유</th>
												<th>처리자</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="obj">
												<tr>
													<td>${obj.shop_hold_id}</td>
													<td>${obj.regdate}</td>
													<td>${obj.reason}</td>
													<td>${obj.register}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
			                    </div>
		                    </div>
		                </c:if>
		                <form action="${root}/account_manage/shop_apply_pro" method="get" id="applyProForm">
		                <input type="hidden" name="shopIdx" value="${shopIdx}">
		                    <div class="card shadow mb-4">
			                    <div class="card-header py-3">
			                   		<h6 class="m-0 font-weight-bold text-primary">관리자 메모</h6>
			                    </div>
			                    <div class="card-body">
			                        <sup style="position: absolute;right: 31px;top: 185px;">(<span id="nowByte">0</span>/200bytes)</sup>
			                        <textarea name="memo" rows="5" class="form-control"
												id="textArea_byteLimit" 
												onkeyup="fn_checkByte(this)"></textarea>
			                    </div>
		                    </div>
		                    <div style="text-align: center;margin-bottom:20px;">
		                    	<select class="form-control appro-sel" name="status" style="width:15%;display:inline-block;">
		                    		<option value="1">승인</option>
		                    		<option value="2">반려</option>
		                    		<option value="3">보류</option>
		                    	</select>
		                    	<input type="text" class="form-control appro-in" name="reason" style="display:inline-block;width:20%;">
		                    	<button class="appro-btn btn btn-secondary" type="submit" disabled="disabled">결과 전송</button>
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
   			
   			let chk = 0;
   			
   			//submit 조건 검사 
   			$('#applyProForm').submit(function(e){
   				

   				if(chk == 0){
   					alert('사업자 등록증 파일을 확인하여 주세요.');
   					e.preventDefault();
   					return;
   				}
   				
   				if($('.appro-sel').val() == 1){
   					alert('승인이 완료되었습니다.');
   				}
   				
				if($('.appro-sel').val() == 2){
					confirm('회원에게 안내하시겠습니까?');
   				}
				
				if($('.appro-sel').val() == 3){
					let bool = confirm('처리 후 변경이 불가합니다.\n 반려하시겠습니까?');
					
					if(!bool){
						e.preventDefault();
					}
					
   				}
				
   				
   			});
   			
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
  			
  			$('.appro-sel').change(function(){
  				if($(this).val() == '1'){
  					$(this).next().css('display','inline-block');
  				}else{
  					$(this).next().css('display','none');
  				}
  			});
  			
  			$('.appro-in').change(function(){
  				if($(this).val() == ''){
  					$('.appro-btn').attr('disabled',true);
  				}else{
  					$('.appro-btn').attr('disabled',false);
  				}
  			});
  			
  			$('.pop-img').click(function(){
  				let imageName = $(this).data('image');
  				
  				chk = chk + 1;
  				
  				window.open("${root}/account_manage/buisness_image?imageName="+imageName,"_blank",
   						"toolbar=yes,menubar=yes,width=500,height=400,fullscreen=yes"),focus();
  				
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