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

        <!-- Sidebar -->
        <c:import url="/WEB-INF/views/include/sidebar.jsp"/>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <c:import url="/WEB-INF/views/include/topbar.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">
                	<form action="${root}/manager_admi/manager_role_register_pro" method="post" id="roleRegisterForm">
					<input type="hidden" name="read" value="보기">
                    <br>
                    
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"> 관리자 설정 > 가맹사 관리 > 가맹사 등록  </h1>

                    <br><hr><br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">운영</h6>
                        </div>
                        <div class="card-body">
                        	<div class="row">
                        		<div class="col-sm-2">
                        			운영자 그룹명
                        		</div>
                        		<div class="col-sm-4">
                        			<input type="text" class="form-control" name="roleGroupName">
                        		</div>
<!--                         		<div class="col-sm-1">등록일</div> -->
<!--                         		<div class="col-sm-2"><input type="text" class="form-control" name="regdate"></div> -->
<!--                         		<div class="col-sm-1">등록인</div> -->
<!--                         		<div class="col-sm-2"><input type="text" class="form-control" name="registrar"></div> -->
                        	</div>
                        	<div class="row">
                        		<div class="col-sm-2">운영자 그룹 설명</div>
                        		<div class="col-sm-10">
                        			<input type="text" class="form-control" name="roleGroupInfo">
                        		</div>
                        	</div>
                        	<div class="row">
                        		<div class="col-sm-2">CRUD 권한</div>
                        		<div class="col-sm-10 crud-col">
                        			<label><input type="checkbox" id="crudAll">&nbsp;전체</label>
                        			<label><input type="checkbox" name="crud" value="1" class="crudChk">&nbsp;Create</label>
                        			<label><input type="checkbox" name="crud" value="2" class="crudChk" checked readonly="readonly">&nbsp;Read</label>
                        			<label><input type="checkbox" name="crud" value="3" class="crudChk">&nbsp;Update</label>
                        			<label><input type="checkbox" name="crud" value="4" class="crudChk">&nbsp;Delete</label>
                        		</div>
                        	</div>
                    		<table class="table" style="margin-top:100px;">
                    			<colgroup>
                    				<col width="10%">
                    				<col width="15%">
                    				<col width="75%">
                    			</colgroup>
                    			<thead class="thead-dark">
                    				<tr>
                    					<th>메뉴</th>
                    					<th>권한 부여</th>
                    					<th>상세 부여</th>
                    				</tr>
                    			</thead>
                    			<tbody>
                    				<tr>
                    					<th>전시관리</th>
                    					<td>
                    						<select class="form-control" id="detailSelect1">
                    							<option value="1">권한부여</option>
                    							<option value="2">미부여</option>
                    						</select>
                    					</td>
                    					<td class="detailRole1">
                    						<label><input type="checkbox" class="menuAll1">&nbsp;전체 선택</label>
                    						<label><input type="checkbox" name="role" value="1" class="menu1">&nbsp;메인 홈페이지 관리</label>
                    						<label><input type="checkbox" name="role" value="2" class="menu1">&nbsp;가게 홍보페이지 관리</label>
                    						<label><input type="checkbox" name="role" value="3" class="menu1">&nbsp;기획전 등록 관리</label>
                    					</td>
                    				</tr>
                    				<tr>
                    					<th>관리자 설정</th>
                    					<td>
                    						<select class="form-control" id="detailSelect2">
                    							<option value="1">권한부여</option>
                    							<option value="2">미부여</option>
                    						</select>
                    					</td>
                    					<td class="detailRole2">
                    						<label><input type="checkbox" class="menuAll2">&nbsp;전체 선택</label>
                    						<label><input type="checkbox" name="role" value="4" class="menu2">&nbsp;가맹사 관리</label>
                    						<label><input type="checkbox" name="role" value="5" class="menu2">&nbsp;관리자 공지관리</label>
                    						<label><input type="checkbox" name="role" value="6" class="menu2">&nbsp;운영계정 관리</label>
                    						<label><input type="checkbox" name="role" value="7" class="menu2">&nbsp;운영자 역할 관리</label>
                    						<label><input type="checkbox" name="role" value="8" class="menu2">&nbsp;운영자 활동내역</label>
                    						<label><input type="checkbox" name="role" value="9" class="menu2">&nbsp;운영자 접속내역</label>
                    					</td>
                    				</tr>
                    				<tr>
                    					<th>계정 관리</th>
                    					<td>
                    						<select class="form-control" id="detailSelect3">
                    							<option value="1">권한부여</option>
                    							<option value="2">미부여</option>
                    						</select>
                    					</td>
                    					<td class="detailRole3">
                    						<label><input type="checkbox" class="menuAll3">&nbsp;전체 선택</label>
                    						<label><input type="checkbox" name="role" value="10" class="menu3">&nbsp;일반회원 관리</label>
                    						<label><input type="checkbox" name="role" value="11" class="menu3">&nbsp;가게 리스트</label>
                    						<label><input type="checkbox" name="role" value="12" class="menu3">&nbsp;패널티 관리</label>
                    					</td>
                    				</tr>
                    				<tr>
                    					<th>이벤트 관리</th>
                    					<td>
                    						<select class="form-control" id="detailSelect4">
                    							<option value="1">권한부여</option>
                    							<option value="2">미부여</option>
                    						</select>
                    					</td>
                    					<td class="detailRole4">
                    						<label><input type="checkbox" class="menuAll4">&nbsp;전체 선택</label>
                    						<label><input type="checkbox" name="role" value="13" class="menu4">&nbsp;쿠폰관리</label>
                    					</td>
                    				</tr>
                    				<tr>
                    					<th>콘텐츠 관리</th>
                    					<td>
                    						<select class="form-control" id="detailSelect5">
                    							<option value="1">권한부여</option>
                    							<option value="2">미부여</option>
                    						</select>
                    					</td>
                    					<td class="detailRole5">
                    						<label><input type="checkbox" class="menuAll5">&nbsp;전체 선택</label>
                    						<label><input type="checkbox" name="role" value="14" class="menu5">&nbsp;가게 콘텐츠 관리</label>
                    						<label><input type="checkbox" name="role" value="15" class="menu5">&nbsp;회원 콘텐츠 관리</label>
                    						<label><input type="checkbox" name="role" value="16" class="menu5">&nbsp;거래 관리</label>
                    						<label><input type="checkbox" name="role" value="17" class="menu5">&nbsp;후기 내역</label>
                    					</td>
                    				</tr>
                    				<tr>
                    					<th>운영 관리</th>
                    					<td>
                    						<select class="form-control " id="detailSelect6"> 
                    							<option value="1">권한부여</option>
                    							<option value="2">미부여</option>
                    						</select>
                    					</td>
                    					<td class="detailRole6" >
                    						<label><input type="checkbox" class="menuAll6">&nbsp;전체 선택</label>
                    						<label><input type="checkbox" name="role" value="18" class="menu6">&nbsp;1:1 문의</label>
                    						<label><input type="checkbox" name="role" value="19" class="menu6">&nbsp;신고문의 관리</label>
                    						<label><input type="checkbox" name="role" value="20" class="menu6">&nbsp;FAQ 관리</label>
                    						<label><input type="checkbox" name="role" value="21" class="menu6">&nbsp;공지사항 관리</label>
                    					</td>
                    				</tr>
                    				<tr>
                    					<th>마케팅 관리</th>
                    					<td>
                    						<select class="form-control" id="detailSelect7">
                    							<option value="1">권한부여</option>
                    							<option value="2">미부여</option>
                    						</select>
                    					</td>
                    					<td class="detailRole7">
                    						<label><input type="checkbox" class="menuAll7">&nbsp;전체 선택</label>
                    						<label><input type="checkbox" name="role" value="22" class="menu7">&nbsp;push 알림</label>
                    						<label><input type="checkbox" name="role" value="23" class="menu7">&nbsp;채팅 설정</label>
                    					</td>
                    				</tr>
                    				<tr>
                    					<th>통계</th>
                    					<td>
                    						<select class="form-control" id="detailSelect8">
                    							<option value="1">권한부여</option>
                    							<option value="2">미부여</option>
                    						</select>
                    					</td>
                    					<td class="detailRole8">
                    						<label><input type="checkbox" class="menuAll8">&nbsp;전체 선택</label>
                    						<label><input type="checkbox" name="role" value="24" class="menu8">&nbsp;가게 통계</label>
                    						<label><input type="checkbox" name="role" value="25" class="menu8">&nbsp;회원 통계</label>
                    						<label><input type="checkbox" name="role" value="26" class="menu8">&nbsp;가게 콘텐츠 통계</label>
                    						<label><input type="checkbox" name="role" value="27" class="menu8">&nbsp;회원 콘텐츠 통계</label>
                    						<label><input type="checkbox" name="role" value="28" class="menu8">&nbsp;거래통계</label>
                    						<label><input type="checkbox" name="role" value="29" class="menu8">&nbsp;쿠폰통계</label>
                    						<label><input type="checkbox" name="role" value="30" class="menu8">&nbsp;신고/문의통계</label>
                    						<label><input type="checkbox" name="role" value="31" class="menu8">&nbsp;패널티 통계</label>
                    					</td>
                    				</tr>
                    			</tbody>
                    		
                    		</table>
                    		
                    		<div class="text-center">
                    			<button type="button" class="btn btn-info addAlert">등&nbsp;&nbsp;록</button>
                    		</div>
                    		
                    		
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
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script>
    	$(function(){
    		
    		
    		
    		//crud checkbox 전체선택/해제
    		
    		$("#crudAll").click(function(){
    	        //클릭되었으면
    	        if($("#crudAll").prop("checked")){
    	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
    	            $(".crudChk").prop("checked",true);
    	            //클릭이 안되있으면
    	        }else{
    	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
    	            $(".crudChk").prop("checked",false);
    	        }
    	    });

    		//권한 부여 / 미부여 에 따른 상세부여 display 변경 
			for(let i = 1 ; i<=8 ; i++){
				$("#detailSelect"+i).change(function() {
					if($(this).val() == '1'){
						$(".detailRole"+i).css('display','block');
					}else{
						$(".detailRole"+i).css('display','none');
					}
				});	
			}
    		
    		$('.addAlert').click(function(){
    			swal({
					title : "fail!",
					text : "등록 하시겠습니까??",
					buttons: {
						cancel : "N",
						defeat : "Y" 
					},
			    	closeOnClickOutside : false
			 	}).then(function(value){
			 		switch(value){
			 			case "defeat" :
			 				swal("등록완료.").then(function(){
			 					$('#roleRegisterForm')[0].submit();
			 				})
			 			break;
			 			default :
			 				e.preventDefault();
			 		}
			 	});
    		});
    		
    		//상세부여 checkbox 전체선택 / 해제
    		for(let i = 1;i<=8;i++){
    			$(".menuAll"+i).click(function(){
        	        //클릭되었으면
        	        if($(".menuAll"+i).prop("checked")){
        	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
        	            $(".menu"+i).prop("checked",true);
        	            
        	         	switch (i) {
							case 1:$(this).append('<input type="hidden" name="menu1" value="전시">');break;
							case 2:$(this).append('<input type="hidden" name="menu2" value="전시">');break;
							case 3:$(this).append('<input type="hidden" name="menu3" value="전시">');break;
							case 4:$(this).append('<input type="hidden" name="menu4" value="전시">');break;
							case 5:$(this).append('<input type="hidden" name="menu5" value="전시">');break;
							case 6:$(this).append('<input type="hidden" name="menu6" value="전시">');break;
							case 7:$(this).append('<input type="hidden" name="menu7" value="전시">');break;
							default:$(this).append('<input type="hidden" name="menu8" value="전시">');break;
						}
        	            //클릭이 안되있으면
        	        }else{
        	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
        	            $(".menu"+i).prop("checked",false);
        	            
        	            switch (i) {
							case 1:$('input[name="menu1"]').remove();break;
							case 2:$('input[name="menu2"]').remove();break;
							case 3:$('input[name="menu3"]').remove();break;
							case 4:$('input[name="menu4"]').remove();break;
							case 5:$('input[name="menu5"]').remove();break;
							case 6:$('input[name="menu6"]').remove();break;
							case 7:$('input[name="menu7"]').remove();break;
							default:$('input[name="menu8"]').remove();break;
						}
        	        }
        	    });
    		}
    		
 
   				
			$('.menu1').on('click',function(){
				if($(this).prop('checked')){
					$(this).append('<input type="hidden" name="menu1" value="전시">');
				}else{
					$('input[name="menu1"]').remove();
				}
			});
   				
			$('.menu2').on('click',function(){
				if($(this).prop('checked')){
					$(this).append('<input type="hidden" name="menu2" value="관리자">');
				}else{
					$('input[name="menu2"]').remove();
				}
			});
 				
			$('.menu3').on('click',function(){
				if($(this).prop('checked')){
					$(this).append('<input type="hidden" name="menu3" value="계정">');
				}else{
					$('input[name="menu3"]').remove();
				}
			});
			
			$('.menu4').on('click',function(){
				if($(this).prop('checked')){
					$(this).append('<input type="hidden" name="menu4" value="이벤트">');
				}else{
					$('input[name="menu4"]').remove();
				}
			});
			
			$('.menu5').on('click',function(){
				if($(this).prop('checked')){
					$(this).append('<input type="hidden" name="menu5" value="콘텐츠">');
				}else{
					$('input[name="menu5"]').remove();
				}
			});
			
			$('.menu6').on('click',function(){
				if($(this).prop('checked')){
					$(this).append('<input type="hidden" name="menu6" value="운영">');
				}else{
					$('input[name="menu6"]').remove();
				}
			});
			
			$('.menu7').on('click',function(){
				if($(this).prop('checked')){
					$(this).append('<input type="hidden" name="menu7" value="마케팅">');
				}else{
					$('input[name="menu7"]').remove();
				}
			});
			
			$('.menu8').on('click',function(){
				if($(this).prop('checked')){
					$(this).append('<input type="hidden" name="menu8" value="통계">');
				}else{
					$('input[name="menu8"]').remove();
				}
			});
    	});    
    </script>
</body>

</html>