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
                    <h1 class="h3 mb-2 text-gray-800"> 관리자 설정 > 가맹사 관리 > 가맹사 등록  </h1>

                    <br><hr><br>
				<form action="${root}/manager/manage_franchise_update_pro" method="post" id="registerForm" enctype="multipart/form-data">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">기본정보</h6>
                        </div>
                        <div class="card-body basicInfo">
                        	<div class="row">
                        		<div class="col-sm-1">가맹사명</div>
                        		<div class="col-sm-3"><input type="text" class="form-control" name="franchiseName" value="${franchiseMap.franchise_name}"></div>
                        		<div class="col-sm-1">가맹사 번호</div>
                        		<div class="col-sm-3"><input type="text" class="form-control" name="franchiseId" value="${franchiseMap.franchise_id}" readonly="readonly"></div>
                        		<div class="col-sm-1">등록일</div>
                        		<div class="col-sm-3"><input type="text" class="form-control" value="${franchiseMap.regdate}" readonly="readonly"></div>
                        	</div>
                        	<div class="row">
                        		<div class="col-sm-1">운영 메모</div>
                        		<div class="col-sm-3"><input type="text" class="form-control" name="memo" value="${franchiseMap.memo}"></div>
                        		<div class="col-sm-1">주  소</div>
                        		<div class="col-sm-7"><input type="text" class="form-control" name="address" value="${franchiseMap.address}"></div>
                        	</div>
                        	<div class="row">
                        		<div class="col-sm-1">고객센터</div>
                        		<div class="col-sm-3"><input type="text" class="form-control" name="customerService" value="${franchiseMap.customer_service}"></div>
                        		<div class="col-sm-1">운영 여부</div>
                        		<div class="col-sm-7">
                        			<label><input type="radio" name="serviceStatus" value="영업중" <c:if test="${franchiseMap.service_status eq '영업중'}">checked</c:if>>&nbsp;Y</label>
                        			<label><input type="radio" name="serviceStatus" value="휴업중" <c:if test="${franchiseMap.service_status eq '휴업중'}">checked</c:if>>&nbsp;N</label>
                        		</div>
                        	</div>
                        	<div class="row">
                        		<div class="col-sm-2">담당자 정보</div>
                        		<div class="col-sm-1">No</div>
                        		<div class="col-sm-2">담당자명</div>
                        		<div class="col-sm-2">연락처</div>
                        		<div class="col-sm-3">이메일</div>
                        		<div class="col-sm-2"><button type="button" id="addResp"><i class="fas fa-plus"></i></button></div>
                        	</div>
                        	<c:forEach items="${responList}" var="obj" varStatus="status">
	                        	<div class="row responRow">
	                        		<div class="col-sm-2"></div>
	                        		<div class="col-sm-1">${status.count}</div>
	                        		<div class="col-sm-2"><input type="text" name="responName" class="form-control" value="${obj.respon_name}"></div>
	                        		<div class="col-sm-2"><input type="text" name="responPhone" class="form-control" value="${obj.respon_phone}"></div>
	                        		<div class="col-sm-3"><input type="text" name="responEmail" class="form-control" value="${obj.respon_email}"></div>
	                        	</div>
                        	</c:forEach>
                        	
                        </div>
                    </div>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">서비스 컨셉</h6>
                        </div>
                        <div class="card-body">
                        	<div class="row">
                        		<div class="col-sm-1">서비스 컬러</div>
                        		<div class="col-sm-4"><input type="color" name="pointColor" value="${franchiseMap.point_color}"></div>
                        		<div class="col-sm-1">등록 로고</div>
                        		<div class="col-sm-6"><input type="file" name="uploadFile" value="${franchiseMap.logo_file}"></div>
                        	</div>
                        	<div class="row">
                        		<div class="col-sm-1">서비스 명</div>
                        		<div class="col-sm-5"><input type="text" class="form-control" name="serviceName" value="${franchiseMap.service_name}"></div>
                        		
                        	</div>
                        </div>
                    </div>
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">이용 서비스</h6>
                        </div>
                        <div class="card-body">
                        	<table class="table">
                        		<thead class="thead-dark">
                        			<tr>
                        				<th><label><input type="checkbox" class="allServiceChk">&nbsp;&nbsp;이용서비스 선택</label></th>
                        				<th>
                        					사전 승인여부&nbsp;
                        					<label><input type="radio" name="allApproval" class="allApprovalYes">&nbsp;Yes</label>
                        					<label><input type="radio" name="allApproval" class="allApprovalNo">&nbsp;No</label>
                        				</th>
                        			</tr>
                        		</thead>
                        		<tbdoy>
                        			<tr>
                        				<td><label><input type="checkbox" name="shopService" class="serviceChk" <c:if test="${franchiseMap.shop_service eq 1}">checked</c:if>>&nbsp;&nbsp;가게소식</label></td>
                        				<td>
                        					<label><input type="radio" name="shopApproval" value="1" class="approvalYes" <c:if test="${franchiseMap.shop_approval eq 1}">checked</c:if>>&nbsp;Yes</label>
                        					<label><input type="radio" name="shopApproval" value="2" class="approvalNo" <c:if test="${franchiseMap.shop_approval eq 2}">checked</c:if>>&nbsp;No</label>
                        				</td>
                        			</tr>
                        			<tr>
                        				<td><label><input type="checkbox" name="dailyService" class="serviceChk" <c:if test="${franchiseMap.daily_service eq 1}">checked</c:if>>&nbsp;&nbsp;일상</label></td>
                        				<td>
                        					<label><input type="radio" name="dailyApproval" value="1" class="approvalYes" <c:if test="${franchiseMap.daily_approval eq 1}">checked</c:if>>&nbsp;Yes</label>
                        					<label><input type="radio" name="dailyApproval" value="2" class="approvalNo" <c:if test="${franchiseMap.daily_approval eq 2}">checked</c:if>>&nbsp;No</label>
                        				</td>
                        			</tr>
                        			<tr>
                        				<td><label><input type="checkbox" name="usedService" class="serviceChk" <c:if test="${franchiseMap.used_service eq 1}">checked</c:if>>&nbsp;&nbsp;중고거래</label></td>
                        				<td>
                        					<label><input type="radio" name="usedApproval" value="1" class="approvalYes" <c:if test="${franchiseMap.used_approval eq 1}">checked</c:if>>&nbsp;Yes</label>
                        					<label><input type="radio" name="usedApproval" value="2" class="approvalNo" <c:if test="${franchiseMap.used_approval eq 2}">checked</c:if>>&nbsp;No</label>
                        				</td>
                        			</tr>
                        			<tr>
                        				<td><label><input type="checkbox" name="directTradeService" class="serviceChk" <c:if test="${franchiseMap.direct_trade_service eq 1}">checked</c:if>>&nbsp;&nbsp;산지직거래</label></td>
                        				<td>
                        					<label><input type="radio" name="directTradeApproval" value="1" class="approvalYes" <c:if test="${franchiseMap.direct_trade_approval eq 1}">checked</c:if>>&nbsp;Yes</label>
                        					<label><input type="radio" name="directTradeApproval" value="2" class="approvalNo" <c:if test="${franchiseMap.direct_trade_approval eq 2}">checked</c:if>>&nbsp;No</label>
                        				</td>
                        			</tr>
                        			<tr>
                        				<td colspan="2" style="text-align: center"><button class="btn btn-secondary">등록</button></td>
                        			
                        			</tr>
                        		</tbdoy>
                        	</table>
                        </div>
                    </div>
                    </form>
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
    <script src="${root}/js/bo-script.js"></script>
    
	<script>
	
	
		$(function(){
			
			//사전 승인여부 전체 선택 
			$('input[name="allApproval"]').on('click',function(){
				if($(this).hasClass('allApprovalYes') && $(this).prop('checked')){
					$('.approvalYes').prop('checked',true);
				}else if($(this).hasClass('allApprovalNo') && $(this).prop('checked')) {
					$('.approvalNo').prop('checked',true);
				}
			});
			
			//이용서비스 선택 전체 선택
			$('.allServiceChk').on('click',function(){
				if($(this).prop('checked')){
					$('.serviceChk').prop('checked',true);
				}else{
					$('.serviceChk').prop('checked',false);
				}
			});
			
			let num = $('.responRow.row').length + 1;
			
			//담당자 input box 추가 
			$('#addResp').on('click',function(){
			
				
				let str = '';
				
				str += '<div class="row">';
				str += '<div class="col-sm-2"></div>';
				str += '<div class="col-sm-1">'+num+'</div>';
				str += '<div class="col-sm-2"><input type="text" name="responName" class="form-control"></div>';
				str += '<div class="col-sm-2"><input type="text" name="responPhone" class="form-control"></div>';
				str += '<div class="col-sm-3"><input type="text" name="responEmail" class="form-control"></div>';
				str += '</div>';
				
				$('.basicInfo').append(str);
				
				num++;
				
			});
			
			//이용서비스 체크여부
			$('input:radio[name="shopApproval"]').change(function(){
				if(!$('input:checkbox[name="shopService"]').is(':checked')){
					alert('서비스 이용에 먼저 체크해주세요');
					$(this).prop('checked',false);
				}
			});
			
			$('input:radio[name="dailyApproval"]').change(function(){
				if(!$('input:checkbox[name="dailyService"]').is(':checked')){
					alert('서비스 이용에 먼저 체크해주세요');
					$(this).prop('checked',false);
				}
			});
			
			$('input:radio[name="usedApproval"]').change(function(){
				if(!$('input:checkbox[name="usedService"]').is(':checked')){
					alert('서비스 이용에 먼저 체크해주세요');
					$(this).prop('checked',false);
				}
			});
			
			$('input:radio[name="directTradeApproval"]').change(function(){
				if(!$('input:checkbox[name="directTradeService"]').is(':checked')){
					alert('서비스 이용에 먼저 체크해주세요');
					$(this).prop('checked',false);
				}
			});
			
			//필수입력 정보 검사 
			$('#registerForm').submit(function(e){
				
				if($('input[name="franchiseName"]').val() == '' || $('input[name="address"]').val() == '' || 
						$('input[name="customerService"]').val() == '' || !$('input[name="serviceStatus"]').prop('checked') ||
						$('input[name="pointColor"]').val() == '' || $('input[name="uploadFile"]').val() == '' || 
						$('input[name="serviceName"]').val() == ''){
					
					alert('입력되지 않은 정보가 있습니다.');
					e.preventDefault();
					
				}
				
				
				
				if($('input:checkbox[name="shopService"]').is(':checked') && !$('input:radio[name="shopApproval"]').is(':checked')){
					
					alert('입력되지 않은 정보가 있습니다.');
					e.preventDefault();
				}
				
				if($('input:checkbox[name="daliyService"]').is(':checked') && !$('input:radio[name="daliyApproval"]').is(':checked')){
									
					alert('입력되지 않은 정보가 있습니다.');
					e.preventDefault();
				}
				
				if($('input:checkbox[name="usedService"]').is(':checked') && !$('input:radio[name="usedApproval"]').is(':checked')){
					
					alert('입력되지 않은 정보가 있습니다.');
					e.preventDefault();
				}
				
				if($('input:checkbox[name="directTradeService"]').is(':checked') && !$('input:radio[name="directTradeApproval"]').is(':checked')){
					
					alert('입력되지 않은 정보가 있습니다.');
					e.preventDefault();
				}

				
				
				
			});
			
			
			
			
		});
	
	</script>
</body>

</html>