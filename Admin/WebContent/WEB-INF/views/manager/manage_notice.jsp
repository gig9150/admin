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
    
    <style type="text/css">  
    
	    .recruit .hide {display:none;}  
	    .recruit .show {display:table-row;}  
	    .recruit .item .openView {cursor:pointer;}  
    	.notice-modal .row {
    		margin-bottom:20px;
    	}
    	.notice-modal .row label{
    		width: 30%;
    	}
    	
    	.notice-modal .row .col-sm-9 {
    	    border: 1px solid black;
    		padding: 15px;
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
                    <h1 class="h3 mb-2 text-gray-800"> 관리자 설정 > 관리자 공지 관리 </h1>

                    <br><hr><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">검색 </h6>
                        </div>
                        <form method="get" action="${root}/manager/manage_notice">
                        	<input type="hidden" name="selectNum" value="${map.selectNum}">
                        	<input type="hidden" name="page" value="${page}">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-1">등록일</div>
									<div class="col-sm-3 datePick">
										<button type="button" id="date1" class="btn">오늘</button>
										<button type="button" id="date2" class="btn">1주</button>
										<button type="button" id="date3" class="btn">3개월</button>
										<button type="button" id="date4" class="btn">6개월</button>	
									</div>
									<div class="col-sm-4">
										<input type="date" class="form-control" style="width:40%;display:inline-block;" name="startDate" id="startDate" value="${map.startDate}">&nbsp;~&nbsp;
										<input type="date" class="form-control" style="width:40%;display:inline-block;" name="endDate" id="endDate" value="${map.endDate}">
									</div>
									<div class="col-sm-1">가맹사</div>
									<div class="col-sm-2">
										<select name="franchiseId" class="form-control">
											<option value="0">전체</option>
											<c:forEach items="${franchiseList}" var="obj">
												<option value="${obj.franchise_id}" <c:if test="${obj.franchise_id eq map.franchiseId}">selected</c:if>>${obj.franchise_name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-1">키워드</div>
									<div class="col-sm-3">
										<select class="form-control" style="width:84%;" name="select">
											<option value="1"<c:if test="${map.select eq 1}">selected</c:if>>전체</option>
											<option value="2"<c:if test="${map.select eq 2}">selected</c:if>>이름</option>
											<option value="3"<c:if test="${map.select eq 3}">selected</c:if>>제목</option>
											<option value="4"<c:if test="${map.select eq 4}">selected</c:if>>제목 + 내용</option>
										</select>
									</div>
									<div class="col-sm-8">
										<input type="text" class="form-control" style="width:50%;" name="keyWord" value="${map.keyWord }">
									</div>
								</div>
								<div class="row justify-content-center">
									<button type="submit" class="btn btn-primary btn-lg">검  색</button> 
		                            <button type="reset" class="btn btn-secondary btn-lg" style="margin-left:10px;">초기화</button>
								</div>
							</div>
	                    </form>
                    </div>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">조회 결과</h6>
                        </div>
                        <div class="card-body">
                        	<div class="row">
	                        	<div class="col-sm-1">
		                        	<span>목록 총${noticeCnt}개</span>
	                        	</div>
	                        	<div class="col-sm-10">
		                        	<select class="form-control float-right" style="width:12%;" id="selectNum" >
		                        		<option value="10" <c:if test="${map.selectNum eq 10}">selected</c:if>>10개</option>
		                        		<option value="30" <c:if test="${map.selectNum eq 30}">selected</c:if>>30개</option>
		                        		<option value="50" <c:if test="${map.selectNum eq 50}">selected</c:if>>50개</option>
		                        		<option value="100" <c:if test="${map.selectNum eq 100}">selected</c:if>>100개</option>
		                        	</select>
	                        	</div>
	                        	<div class="col-sm-1">
		                        	<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#excelConfirm" >엑셀다운</button>
	                        	</div>
                        	</div>
                            <table class="table recruit" id="franchiseListTable" style="margin-top:1rem;">
                                <thead class="thead-dark">
                                  <tr>
                                    <th>펼쳐보기</th>
                                    <th>No</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>등록일</th>
                                    <th>가맹사</th>
                                    <th>첨부</th>
                                  </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${noticeList}" var="obj">
	                                	<tr class="item">
	                                		<td class="openView">펼쳐보기</td>
	                                		<td>${obj.managerNoticeId}</td>
	                                		<td>${obj.noticeTitle}</td>
	                                		<td>${obj.id}</td>
	                                		<td>${obj.regdate}</td>
	                                		<td>
	                                			<c:forEach items="${obj.franchiseList}" var="obj2">
	                                				${obj2},
	                                			</c:forEach>
	                                		</td>
	                                		<td><a href="${root}/notice/download?fileName=${obj.attachFile}&oriFileName=${obj.oriAttachFile}">파일 다운로드</a></td>
	                                	</tr>
	                                	<tr class="hide">
	                                		<td colspan="5" style="text-align: center"><span>${obj.noticeContent}</span></td>
	                                		<td><a href="javascript:void(0)" data-toggle="modal" 
	                                		data-notice-title="${obj.noticeTitle}" data-notice-content="${obj.noticeContent}" 
	                                		data-manager-notice-id="${obj.managerNoticeId}" data-ori-attach-file="${obj.oriAttachFile}"
	                                		data-target=".notice-modal"  type="button" class="updateBtn btn btn-secondary">수정</a></td>
	                                		<td><a href="javascript:void(0)" data-manager-notice-id="${obj.managerNoticeId}" type="button" class="btn btn-secondary deleteBtn">삭제</a></td>
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
				          				<a class="page-link" href="${root}/manager/manage_notice?page=${pageBean.prevPage}&keyWord=${map.keyWord}&startDate=${map.startDate}&endDate=${map.endDate}&select=${map.select}&selectNum=${map.selectNum}&franchiseId=${map.franchiseId}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/manager/manage_notice?page=${idx}&keyWord=${map.keyWord}&startDate=${map.startDate}&endDate=${map.endDate}&select=${map.select}&selectNum=${map.selectNum}&franchiseId=${map.franchiseId}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/manager/manage_notice?page=${idx}&keyWord=${map.keyWord}&startDate=${map.startDate}&endDate=${map.endDate}&select=${map.select}&selectNum=${map.selectNum}&franchiseId=${map.franchiseId}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/manager/manage_notice?page=${pageBean.nextPage}&keyWord=${map.keyWord}&startDate=${map.startDate}&endDate=${map.endDate}&select=${map.select}&selectNum=${map.selectNum}&franchiseId=${map.franchiseId}" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										      </a>
										    	</li>
				          			</c:otherwise>
				          		</c:choose>
				          	</ul>
				          </div>
				          <br>
 						  <a href="javascript:void(0)" data-toggle="modal" data-target=".notice-modal" type="button" class="btn btn-primary addBtn" style="width:150px;position:relative;margin:-5px -150px;top:50%;left:100%;">등록</a> 
                          <br>
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
    
    <!-- 등록 modal -->
	<div class="modal fade notice-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	  	<form action="${root}/manager/notice_register_pro" method="post" id="registerForm" enctype="multipart/form-data">
	  		<input type="hidden" id="noticeIdInput" name="managerNoticeId"> 
		    <div class="modal-content">
		      <div class="modal-header" style="font-size: 18px;">
		      	관리자 공지 작성
		      </div>
		      <div class="modal-body">
		      	<div class="container-fluid ">
		      		<div class="row">
		      			<div class="col-sm-12"><input type="text" name="noticeTitle" class="form-control" placeholder="제목을 입력해주세요"></div>
		      		</div>
		      		<div class="row">
		      			<div class="col-sm-3">가맹사</div>
		      			<div class="col-sm-9">
		      				<label style="width:100% !important"><input type="checkbox" id="franchiseAllCheck">전체선택</label>
		      				<c:forEach items="${franchiseList}" var="obj">
		      					<label><input type="checkbox" name="franchiseId" value="${obj.franchise_id}">${obj.franchise_name}</label>
		      				</c:forEach>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-sm-12"><textarea rows="5" name="noticeContent" style="width:100%" placeholder="내용을 입력해주세요."></textarea></div>
		      		</div>
		      		<div class="row">
		      			<div class="col-sm-6"><input type="text" id="noticeFileIn" class="form-control" readonly="readonly"></div>
		      			<div class="col-sm-6"><input type="file" name="uploadFile" id="noticeFile"></div>
		      		</div>
		      		<div class="row">
		      			<div class="col-sm-12" style="text-align: center;">
		      				<button class="btn btn-secondary">등록</button>
		      			</div>
		      		</div>
		      	</div>
		      </div>
		    </div>
		</form>
	  </div>
	</div>
	
	
	
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
 
	<!-- 엑셀 다운로드 확인 modal -->
	<div class="modal fade" id="excelConfirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      
	      <div class="modal-body">
	      	<span>개인정보가 포함된 파일입니다.<br>열람 사유를 입력하여 주세요.<br><br></span>
	        <textarea rows="5" style="width:100%" id="readingReason"></textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">cancel</button>
	        <button type="button" class="btn btn-primary" id="excelDown">ok</button>
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
    <script src="${root}/js/bo-script.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
	<script>
		$(function(){
		
   			// 날짜 자동 선택 
   			$('.datePick button').on('click',function(){
   				let id = $(this).attr('id');
   				$('#endDate').val(today());
   				if(id == 'date1'){
   					$('#startDate').val(today());
   					resetDateClass(1);
   				}else if(id == 'date2'){
   					$('#startDate').val(lastWeek());
   					resetDateClass(2);
   				}else if(id == 'date3'){
   					$('#startDate').val(lastThreeMonth());
   					resetDateClass(3);
   				}else{
   					$('#startDate').val(lastSixMonth());
   					resetDateClass(4);
   				}
   			});
   			
   			//시작날짜 선택 시 종료 날짜 자동으로 오늘날짜로 input
   			$('#startDate').on('change',function(){
   				
   				if($('#endDate').val() == ''){
	   				$('#endDate').val(today());
   				}

   			});	
   			
   			//날짜 선택시 오늘 날짜를 넘기면...
   			$('#endDate,#startDate').on('change',function(){
   				$('.datePick button').removeClass('dateOn');
   				if($(this).val() > today()){
   					alert('해당 날짜는 불가합니다.');
   					$(this).val(today());
   				}
   				
   				if($('#startDate').val() > $('#endDate').val()){
   					alert('시작 날짜가 더 클수 없습니다.');
   					$('#startDate').val(today());
   					$('#endDate').val(today());
   				}
   			});
   			
   			//가져올 목록의 갯수 정하기
   			$('#selectNum').on('change',function(){
   				
   				let selectNum = $(this).val();
   				location.href='${root}/manager/manage_franchise?keyWord=${map.keyWord}&startDate=${map.startDate}&endDate=${map.endDate}'+
   				'&select=${map.select}&franchiseId=${map.franchiseId}&selectNum='+selectNum;
   			});
   			
   			//엑셀 다운로드 
   			$('#excelDown').on('click',function(){
   				if($('#readingReason').val() == ''){
   					alert('열람 사유를 입력하여 주세요.');
   					return;
   				}
   				fnExcelReport('franchiseListTable','excel');

   			});
   			
   			//펼쳐 보기
   			var article = (".recruit .show");  
   			
            $(".recruit .item  .openView").click(function() {  
                var myArticle =$(this).parents().next("tr");  
                if($(myArticle).hasClass('hide')) {  
                    $(article).removeClass('show').addClass('hide');  
                    $(myArticle).removeClass('hide').addClass('show');  
                }  
                else {  
                    $(myArticle).addClass('hide').removeClass('show');  
                }  
            });  
            
            //전체 선택 체크시 모두 체크
            $('#franchiseAllCheck').change(function(){
            	if($(this).is(':checked')){
            		$('input:checkbox[name="franchiseId"]').prop('checked',true);
            	}else{
            		$('input:checkbox[name="franchiseId"]').prop('checked',false);
            	}
            });
            
            //파일 선택시 파일명 미리보기
            $('#noticeFile').change(function(){
            	
            	var fileValue = $(this).val().split("\\");
            	var fileName = fileValue[fileValue.length-1];

            	$('#noticeFileIn').val(fileName);
            	
            });
            
            //공지사항 수정(기존 정보 가져오기)
            
            $('.updateBtn').on('click',function(){
            	
            	let managerNoticeId = $(this).data('managerNoticeId');
            	let noticeTitle = $(this).data('noticeTitle');
            	let noticeContent = $(this).data('noticeContent');
            	let oriAttachFile = $(this).data('oriAttachFile');
            	
            	
            	$('input[name="noticeTitle"]').val(noticeTitle);
            	$('textarea[name="noticeContent"]').html(noticeContent);
            	$('#noticeFileIn').val(oriAttachFile);
            	$('#noticeIdInput').val(managerNoticeId);
            	
            	$('#registerForm').attr('action','${root}/manager/manager_notice_update');
            	
//             	$.ajax({
//             		url:'${root}/manager/managerNoticeFranchise/'+managerNoticeId,
//             		type:'get',
//             		success:function(data){

//             		}
//             	});
            	
            });
            
            //공지사항 삭제
            $('.deleteBtn').on('click',function(){
            	
            	let managerNoticeId= $(this).data('managerNoticeId');
            	
           	 	swal({
           			title : "success!",
           			text : "해당글을 삭제하시겠습니까?",
           	    	closeOnClickOutside : false,
           	    	buttons: true,
           	     	dangerMode: true
           	 	}).then(function(willDelete){
					if (willDelete) {
						swal({
							text : "삭제되었습니다."
						}).then(function(){
							location.href = "${root}/manager/manager_notice_delete?managerNoticeId="+managerNoticeId;
						});
						
					} else {
					   swal({
						  text : "취소되었습니다."
					   });
					}
           	 	});
           	 	
            });
            
          //모달 꺼지면 데이터 초기화 
			$('.notice-modal').on('hidden.bs.modal', function () {
				
			   	$('#registerForm')[0].reset();
				$('textarea[name="noticeContent"]').html('');
			});
          
          	$('.addBtn').click(function(){
          		$('#registerForm').attr('action','${root}/manager/notice_register_pro');
          		
          	});

		});
		
		function getDateStr(myDate){
			
			var currentMonth=('0'+(myDate.getMonth()+1)).slice(-2);
			var currentDate=myDate.getDate();
			
			if(currentDate<10) 
			{
				currentDate='0'+currentDate;
			} 
			
			return (myDate.getFullYear() + '-' + currentMonth + '-' + currentDate);
		}

		/* 오늘 날짜를 문자열로 반환 */
		function today() {
		  var d = new Date()
		  return getDateStr(d)
		}
		
		/* 오늘로부터 1주일전 날짜 반환 */
		function lastWeek() {
		  var d = new Date()
		  var dayOfMonth = d.getDate()
		  d.setDate(dayOfMonth - 7)
		  return getDateStr(d)
		}

		/* 오늘로부터 3개월전 날짜 반환 */
		function lastThreeMonth() {
		  var d = new Date()
		  var monthOfYear = d.getMonth()
		  d.setMonth(monthOfYear - 3)
		  return getDateStr(d)
		}
		
		/* 오늘로부터 6개월전 날짜 반환 */
		function lastSixMonth() {
		  var d = new Date()
		  var monthOfYear = d.getMonth()
		  d.setMonth(monthOfYear - 6)
		  return getDateStr(d)
		}
		
		function resetDateClass(num){
			
			$('.datePick button').css('background','#D3D3D3');
			if($('#date'+num).css('background','#D3D3D3')){
				$('#date'+num).css('background','#0abab5');
			}else{
				$('#date'+num).css('background','#D3D3D3');
			}
			
		}
		
		
		//아이디 입력창이 변경될때마다 다시 중복 체크하게끔
   		function resetIdExist(){
   			$('#idExist').val('false');
   			$('#updateIdExist').val('false');
   		}
		
		//엑셀 다운로드
		function fnExcelReport(id, title) {
			var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
			tab_text = tab_text + '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
			tab_text = tab_text + '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
			tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
			tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
			tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
			tab_text = tab_text + "<table border='1px'>";
			var exportTable = $('#' + id).clone();
			exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
			tab_text = tab_text + exportTable.html();
			tab_text = tab_text + '</table></body></html>';
			var data_type = 'data:application/vnd.ms-excel';
			var ua = window.navigator.userAgent;
			var msie = ua.indexOf("MSIE ");
			var fileName = title + '.xls';
			
			//Explorer 환경에서 다운로드
			if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
				if (window.navigator.msSaveBlob) {
				var blob = new Blob([tab_text], {
				type: "application/csv;charset=utf-8;"
				});
				navigator.msSaveBlob(blob, fileName);
				}
				} else {
				var blob2 = new Blob([tab_text], {
				type: "application/csv;charset=utf-8;"
				});
				var filename = fileName;
				var elem = window.document.createElement('a');
				elem.href = window.URL.createObjectURL(blob2);
				elem.download = filename;
				document.body.appendChild(elem);
				elem.click();
				document.body.removeChild(elem);
			}
		}
	</script>    
</body>

</html>