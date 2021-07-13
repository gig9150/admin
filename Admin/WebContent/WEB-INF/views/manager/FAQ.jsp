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
    
    <style>
    	.question-table tr{
    		cursor: pointer;
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
                    <h1 class="h3 mb-2 text-gray-800"> Home >> 운영관리 >> FAQ 관리  </h1>

                    <br><hr><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">검색 </h6>
                        </div>
                        <form method="get" action="${root}/operation/report">
                        	<input type="hidden" name="selectNum" value="${selectNum}">
                        	<input type="hidden" name="page" value="${page}">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-1">
									</div>
									<div class="col-sm-3 datePick">
										<button type="button" id="date1" class="btn">오늘</button>
										<button type="button" id="date2" class="btn">1주</button>
										<button type="button" id="date3" class="btn">3개월</button>
										<button type="button" id="date4" class="btn">6개월</button>	
									</div>
								</div>
								<div class="row">
									<div class="col-sm-1">등록일</div>
									<div class="col-sm-3">
										<input type="date" class="form-control" style="width:45%;display:inline-block;" name="startDate" id="startDate" value="${bean.startDate}">&nbsp;~&nbsp;
										<input type="date" class="form-control" style="width:45%;display:inline-block;" name="endDate" id="endDate" value="${bean.endDate}">
									</div>
									<div class="col-sm-1">가맹사</div>
									<div class="col-sm-2">
										<select class="form-control" name="franchiseId">
											<option value="0" <c:if test="${bean.franchiseId eq 0}">selected</c:if>>전체</option>
											<c:forEach items="${franchiseList}" var="obj">
												<option value="${obj.franchise_id}" <c:if test="${bean.franchiseId eq obj.franchise_id}">selected</c:if>>${obj.franchise_name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-1">문의종류</div>
									<div class="col-sm-2">
										<select class="form-control" name="reportCategoryId">
											<option value="0" <c:if test="${bean.reportCategoryId eq 0}">selected</c:if>>전체</option>
											<option value="1" <c:if test="${bean.reportCategoryId eq 1}">selected</c:if>>계정</option>
											<option value="2" <c:if test="${bean.reportCategoryId eq 2}">selected</c:if>>게시글</option>
											<option value="3" <c:if test="${bean.reportCategoryId eq 3}">selected</c:if>>상품</option>
										</select>
									</div>
									<div class="col-sm-1">처리상태</div>
									<div class="col-sm-1">
										<select class="form-control" name="status">
											<option value="0" <c:if test="${bean.status eq 0}">selected</c:if>>전체</option>
											<option value="1" <c:if test="${bean.status eq 1}">selected</c:if>>확인 중</option>
											<option value="2" <c:if test="${bean.status eq 2}">selected</c:if>>처리 완료</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-1">작성자</div>
									<div class="col-sm-2">
										<select class="form-control" name="writer">
											<option value="all" <c:if test="${bean.writer eq 'all'}">selected</c:if>>전체</option>
											<option value="num" <c:if test="${bean.writer eq 'num'}">selected</c:if>>회원번호</option>
											<option value="name" <c:if test="${bean.writer eq 'name'}">selected</c:if>>닉네임</option>
										</select>
									</div>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="writerInput" value="${bean.writerInput}">
									</div>
									<div class="col-sm-1">
										키워드
									</div>
									<div class="col-sm-2">
										<select class="form-control" name="keyWord">
											<option value="all" <c:if test="${bean.keyWord eq 'all'}">selected</c:if>>전체</option>
											<option value="num" <c:if test="${bean.keyWord eq 'num'}">selected</c:if>>문의번호</option>
											<option value="content" <c:if test="${bean.keyWord eq 'content'}">selected</c:if>>내용</option>
										</select>
									</div>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="keyWordInput" value="${bean.keyWordInput}">
									</div>
								</div>
								<div class="row justify-content-center">
		                            <button type="reset" class="btn btn-secondary btn-lg">초기화</button>
									<button type="submit" class="btn btn-primary btn-lg" style="margin-left:10px;">검  색</button> 
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
		                        	<span>목록 총${reportCnt}개</span>
	                        	</div>
	                        	<div class="col-sm-10">
		                        	<select class="form-control float-right" style="width:12%;" id="selectNum" >
		                        		<option value="10" <c:if test="${selectNum eq 10}">selected</c:if>>10개</option>
		                        		<option value="30" <c:if test="${selectNum eq 30}">selected</c:if>>30개</option>
		                        		<option value="50" <c:if test="${selectNum eq 50}">selected</c:if>>50개</option>
		                        		<option value="100" <c:if test="${selectNum eq 100}">selected</c:if>>100개</option>
		                        	</select>
	                        	</div>
	                        	<div class="col-sm-1">
		                        	<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#excelConfirm" >엑셀다운</button>
	                        	</div>
                        	</div>
                            <table class="table question-table" id="franchiseListTable" style="margin-top:1rem;">
                                <thead class="thead-dark">
                                  <tr>
                                  	<th><input type="checkbox"></th>
                                    <th scope="col">NO</th>
                                    <th>등록일</th>
                                    <th>가맹사</th>
                                    <th>문의번호</th>
                                    <th>작성자</th>
                                    <th></th>
									<th>신고종류</th>
                                    <th>신고내용</th>
                                    <th>답변여부</th>
                                    <th>처리자</th>
                                    <th>처리완료일</th>
                                  </tr>
                                </thead>
                                <tbody>
                                	<tr data-faq-id = '1'>
                                		<td>1</td>
                                		<td>1</td>
                                		<td>1</td>
                                		<td>1</td>
                                		<td>1</td>
                                		<td>1</td>
                                		<td>1</td>
                                		<td>1</td>
                                	</tr>
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
				          				<a class="page-link" href="${root}/operation/report?page=${pageBean.prevPage}&selectNum=${selectNum}&startDate=${bean.startDate}&endDate=${bean.endDate}&franchiseId=${bean.franchiseId}&reportCategoryId=${bean.reportCategoryId}&status=${bean.status}&writer=${bean.writer}&writerInput=${bean.writerInput}&keyWord=${bean.keyWord}&keyWordInput=${bean.keyWordInput}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/operation/report?page=${idx}&selectNum=${selectNum}&startDate=${bean.startDate}&endDate=${bean.endDate}&franchiseId=${bean.franchiseId}&reportCategoryId=${bean.reportCategoryId}&status=${bean.status}&writer=${bean.writer}&writerInput=${bean.writerInput}&keyWord=${bean.keyWord}&keyWordInput=${bean.keyWordInput}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/operation/report?page=${idx}&selectNum=${selectNum}&startDate=${bean.startDate}&endDate=${bean.endDate}&franchiseId=${bean.franchiseId}&reportCategoryId=${bean.reportCategoryId}&status=${bean.status}&writer=${bean.writer}&writerInput=${bean.writerInput}&keyWord=${bean.keyWord}&keyWordInput=${bean.keyWordInput}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/operation/report?page=${pageBean.nextPage}&selectNum=${selectNum}&startDate=${bean.startDate}&endDate=${bean.endDate}&franchiseId=${bean.franchiseId}&reportCategoryId=${bean.reportCategoryId}&status=${bean.status}&writer=${bean.writer}&writerInput=${bean.writerInput}&keyWord=${bean.keyWord}&keyWordInput=${bean.keyWordInput}" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										      </a>
										    	</li>
				          			</c:otherwise>
				          		</c:choose>
				          	</ul>
				          </div>
						  <div style="position: relative;">
						  	<select class="form-control" style="width:120px;position: absolute;left:0">
						  		<option>노출상태</option>
						  	</select>
						  	<button class="btn btn-info" style="position: absolute;left:140px;">일괄처리</button>
						  	<button class="btn btn-info addFAQ" style="position:absolute;right:0;">등록 </button>
						  </div>
				          <br>
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
   				location.href='${root}/operation/report?startDate=${bean.startDate}&endDate=${bean.endDate}&franchiseId=${bean.franchiseId}&reportCategoryId=${bean.questionCategoryId}&status=${bean.status}&writer=${bean.writer}&writerInput=${bean.writerInput}&keyWord=${bean.keyWord}&keyWordInput=${bean.keyWordInput}&selectNum='+selectNum;
   			});
   			
   			//엑셀 다운로드 
   			$('#excelDown').on('click',function(){
   				if($('#readingReason').val() == ''){
   					alert('열람 사유를 입력하여 주세요.');
   					return;
   				}
   				fnExcelReport('franchiseListTable','excel');
   				
   			});
   			
   			//등록 페이지 이동
   			$('.addFAQ').on('click',function(){
   				window.open("${root}/operation/FAQ_register","_blank",
   						"toolbar=yes,menubar=yes,width="+screen.width+",height="+screen.height+"fullscreen=yes"),focus();
   			});
   			
   			//수정 페이지 이동
   			$('.question-table tr').on('click',function(){
   				let FAQId = $(this).data('faqId');
   				window.open("${root}/operation/FAQ_update?FAQId="+FAQId,"_blank",
   						"toolbar=yes,menubar=yes,width="+screen.width+",height="+screen.height+"fullscreen=yes"),focus();
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