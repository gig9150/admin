<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="root" value="${pageContext.request.contextPath}" />
<jsp:useBean id="toDay" class="java.util.Date" />
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
    	.question-table tbody tr{
    	
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
                    <h1 class="h3 mb-2 text-gray-800"> Home >> 관리자 설정 >> 운영자 역할 관리  </h1>

                    <br><hr><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">검색 </h6>
                        </div>
                        <form method="get" action="${root}/account_manage/shop_list">
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
									<div class="col-sm-1">
										<select class="form-control" name="franchiseId">
											<option value="0">전체</option>
											<c:forEach items="${franList}" var="obj">
												<option value="${obj.franchise_id}" <c:if test="${obj.franchise_id eq bean.franchiseId}">selected</c:if>>${obj.franchise_name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-1">등록지역</div>
									<div class="col-sm-2">
										<input type="text"  class="form-control" id="regi-area">
										<input type="hidden" name="id" value="0">
									</div>
									<div class="col-sm-1">업종</div>
									<div class="col-sm-2">
										<input type="text"  class="form-control" id="sector">
										<input type="hidden" name="sectorId" value="0">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-1">가입상태</div>
									<div class="col-sm-4">
										<select class="form-control" name="activityStatus">
											<option value="100" <c:if test="${bean.activityStatus eq 100}">selected</c:if>>전체</option>
											<option value="1" <c:if test="${bean.activityStatus eq 1}">selected</c:if>>정상</option>
											<option value="2" <c:if test="${bean.activityStatus eq 2}">selected</c:if>>탈퇴</option>
										</select>
									</div>
									<div class="col-sm-1">
										가게 정보
									</div>
									<div class="col-sm-2">
										<select class="form-control" name="select">
											<option value="100" <c:if test="${bean.select eq 100}">selected</c:if>>전체</option>
											<option value="1" <c:if test="${bean.select eq 1}">selected</c:if>>닉네임</option>
											<option value="2" <c:if test="${bean.select eq 2}">selected</c:if>>가게 번호</option>
											<option value="3" <c:if test="${bean.select eq 3}">selected</c:if>>가게명</option>
										</select>
									</div>
									<div class="col-sm-3">
										<input type="text" class="form-control" name="keyWord" value="${bean.keyWord}">
									</div>
									<div class="col-sm-1">
										<label><input type="checkbox" name="penalty" <c:if test="${bean.penalty eq 'on'}"> checked </c:if> >&nbsp;패널티 상태</label>
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
		                        	<span>목록 총${memberCnt}개</span>
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
		                        	<button type="button" class="btn btn-secondary excel-btn" >엑셀다운</button>
	                        	</div>
                        	</div>
                            <table class="table question-table" id="franchiseListTable" style="margin-top:1rem;">
                                <thead class="thead-dark">
                                  <tr>
                                  	<th><input type="checkbox" class="tableAllChk"></th>
                                    <th scope="col">NO</th>
                                    <th>승인일</th>
                                    <th>가맹사</th>
                                    <th>가게명</th>
									<th>가게 번호</th>
                                    <th>등록 지역</th>
                                    <th>업종 업태</th>
                                    <th>관리자</th>
                                    <th>패널티 상태</th>
                                    <th>가입 상태</th>
                                    <th>패널티 등록</th>
                                  </tr>
                                </thead>
                                <tbody>
                              	    <fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="today_"></fmt:parseNumber>
                                	<c:forEach items="${list}" var="obj" varStatus="status"> 
                                		<c:set var="bool" value="false"/>
                                		<c:set var="num" value="0"/>
	                                	<tr data-shop-idx="${obj.shop_idx}">
	                                		<td class="tableTd"><input type="checkbox" class="tableChk"></td>
	                                		<th>${status.count}</th>
	                                		<td>${obj.approve_date}</td>
	                                		<td>${obj.franchise_name}</td>
	                                		<td>${obj.shop_name}</td>
	                                		<td>${obj.shop_idx }</td>
	                                		<td>${obj.area_name}</td>
	                                		<td>${obj.sector_content}</td>
	                                		<td>${obj.member_id} / ${obj.name}</td>
                                			<c:if test="${empty obj.peList}">
                                				<td>-</td>
                                			</c:if>
	                                		<c:forEach items="${obj.peList}" var="obj2">
		                                		<fmt:parseDate value="${obj2.start_date}" var="strPlanDate" pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
												<fmt:parseDate value="${obj2.end_date}" var="endPlanDate" pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${(endPlanDate.time / (1000*60*60*24))}" integerOnly="true" var="endDate"/>
	                                			<c:if test="${not bool}">
		                                			<c:choose>
		                                				<c:when test="${today_ <= endDate}">
		                                					<td>Y</td>
		                                					<c:set var ="bool" value="true"/>
		                                				</c:when>
		                                				<c:otherwise>
		                                					<c:set var="num" value="${num + 1}"/>
		                                				</c:otherwise>
		                                			</c:choose>
			                                		<c:if test="${fn:length(obj.peList) eq num}">
			                                			<td> - </td>
			                                		</c:if>
		                                		</c:if>
	                                		</c:forEach>
	                                		<td>
	                                			<c:choose>
	                                				<c:when test="${obj.activity_status eq 1}">
	                                					정상
	                                				</c:when>
	                                				<c:otherwise>
	                                					탈퇴
	                                				</c:otherwise>
	                                			</c:choose>
	                                		</td>
	                                		<td class="penaltyTd">
	                                			<button class="btn btn-secondary penalty-btn" data-franchise-name="${obj.franchise_name}"
	                                			data-shop-name = "${obj.shop_name}" data-shop-idx = "${obj.shop_idx }"
	                                			data-area-name = "${obj.area_name}">패널티 등록</button>
	                                		</td>
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
				          				<a class="page-link" href="${root}/account_manage/shop_list?page=${pageBean.prevPage}&selectNum=${selectNum}&startDate=${bean.startDate}&endDate=${bean.endDate}&select=${bean.select}&keyWord=${bean.keyWord}&franchiseId=${bean.franchiseId}&id=${bean.id}&sectorId=${bean.sectorId}&penalty=${bean.penalty}&activityStatus=${bean.activityStatus}" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										        <span class="sr-only">Previous</span>
									      	</a></li>
				          			</c:otherwise>
				          		</c:choose>
				          		<c:forEach var="idx" begin="${pageBean.min}" end="${pageBean.max}">
				          			<c:choose>
				          				<c:when test="${idx == pageBean.page}">
				          					<li class="page-item active"><a class="page-link" href="${root}/account_manage/shop_list?page=${idx}&selectNum=${selectNum}&startDate=${bean.startDate}&endDate=${bean.endDate}&select=${bean.select}&keyWord=${bean.keyWord}&franchiseId=${bean.franchiseId}&id=${bean.id}&sectorId=${bean.sectorId}&penalty=${bean.penalty}&activityStatus=${bean.activityStatus}">${idx}</a></li>
				          				</c:when>
				          				<c:otherwise>
				          					<li class="page-item"><a class="page-link" href="${root}/account_manage/shop_list?page=${idx}&selectNum=${selectNum}&startDate=${bean.startDate}&endDate=${bean.endDate}&select=${bean.select}&keyWord=${bean.keyWord}&franchiseId=${bean.franchiseId}&id=${bean.id}&sectorId=${bean.sectorId}&penalty=${bean.penalty}&activityStatus=${bean.activityStatus}">${idx}</a></li>
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
										      <a class="page-link" href="${root}/account_manage/shop_list?page=${pageBean.nextPage}&selectNum=${selectNum}&startDate=${bean.startDate}&endDate=${bean.endDate}&select=${bean.select}&keyWord=${bean.keyWord}&franchiseId=${bean.franchiseId}&id=${bean.id}&sectorId=${bean.sectorId}&penalty=${bean.penalty}&activityStatus=${bean.activityStatus}" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										        <span class="sr-only">Next</span>
										      </a>
										    	</li>
				          			</c:otherwise>
				          		</c:choose>
				          	</ul>
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
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    
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
   				location.href='${root}/account_manage/shop_list?startDate=${bean.startDate}&endDate=${bean.endDate}&select=${bean.select}&keyWord=${bean.keyWord}&franchiseId=${bean.franchiseId}&id=${bean.id}&sectorId=${bean.sectorId}&penalty=${bean.penalty}&activityStatus=${bean.activityStatus}&selectNum='+selectNum;
   			});
   			
   			//가게 상세 페이지 이동
   			$('.question-table tbody tr td').not('.tableTd,.penaltyTd').on('click',function(){
   				
   				let shopIdx = $(this).parent().data('shopIdx');
   				window.open("${root}/account_manage/shop_detail?shopIdx="+shopIdx,"_blank",
   						"toolbar=yes,menubar=yes,width="+screen.width+",height="+screen.height+"fullscreen=yes"),focus();
   				
   			});
   			
   			//패널티 등록 페이지 이동
   			$('.penalty-btn').click(function(){
   				let franchiseName = $(this).data('franchiseName');
		 		let shopName = $(this).data('shopName');
		 		let shopIdx = $(this).data('shopIdx');
		 		let areaName = $(this).data('areaName');
   				window.open("${root}/account_manage/shop_penalty?shopIdx="+shopIdx+"&franchiseName="+franchiseName+"&shopName="+shopName+"&areaName="+areaName,"_blank",
   						"toolbar=yes,menubar=yes,width="+screen.width+",height="+screen.height+"fullscreen=yes"),focus();
   			});
   			
   			
   			//테이블 체크박스 전체선택 , 해제
   			$('.tableAllChk').click(function(){
   				if($(this).prop('checked')){
   					$('.tableChk').prop('checked',true);
   					$.each($('#franchiseListTable tr'),function(i,v){
	   					$(this).addClass('selectedTd');
   					});
   				}else{
   					$('.tableChk').prop('checked',false);
   					$.each($('#franchiseListTable tr'),function(i,v){
	   					$(this).removeClass('selectedTd');
   					});
   				}
   			});
   			
   			$('.tableChk').click(function(){
   				if($(this).prop('checked')){
   					$(this).parent().parent().addClass('selectedTd');
   				}else{
   					$(this).parent().parent().removeClass('selectedTd');
   				}
   			})
   			
   			//체크박스 체크 안되있으면 이벤트 막기
   			$('.excel-btn').click(function(e){
   				
   				if(!$('.tableChk').prop('checked')){
   					alert('다운로드할 목록을 선택하여 주세요.');
   					return ;
   				}
   				
   				$('#excelConfirm').modal('show');
   				
   				
   			});
   			
   			//엑셀 다운로드 
   			$('#excelDown').on('click',function(){
   				
   				if($('#readingReason').val() == ''){
   					alert('열람 사유를 입력하여 주세요.');
   					return;
   				}
   				
   				fnExcelReport('franchiseListTable','excel');
   				
   			});
   			
   			
   			//등록지역 자동완성
   			var jsonArray = new Array();	
   			
   			<c:forEach items="${areaList}" var="obj">
   			
   				var jsonObj		= new Object();
   					
   				jsonObj.label	= '${obj.area_name}';
   				jsonObj.value	= '${obj.area_name}';
   				jsonObj.val = '${obj.id}';
   					
   				jsonObj = JSON.stringify(jsonObj);
   				
   				jsonArray.push(JSON.parse(jsonObj));
   				
   			</c:forEach>
   			
   			$('#regi-area').autocomplete({
   				source: jsonArray,
   				select : function(event, ui) {
   					$('input[name="id"]').val(ui.item.val);
   		        }
   			});
   			
   			//업종 자동완성 
			var jsonArraySec = new Array();	
   			
   			<c:forEach items="${secList}" var="obj">
   			
   				var jsonObj		= new Object();
   					
   				jsonObj.label	= '${obj.sector_content}';
   				jsonObj.value	= '${obj.sector_content}';
   				jsonObj.val = '${obj.sector_id}';
   					
   				jsonObj = JSON.stringify(jsonObj);
   				
   				jsonArraySec.push(JSON.parse(jsonObj));
   				
   			</c:forEach>
   			
   			$('#sector').autocomplete({
   				source: jsonArraySec,
   				select : function(event, ui) {
   					$('input[name="sectorId"]').val(ui.item.val);
   		        }
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
			exportTable.find('tr:not(.selectedTd)').each(function (index, elem) { $(elem).remove(); });
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