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
	
	


</head>
<body>
<form action="${root}/account_manage/shop_update" method="post" id="shopUpdateForm">
<div class="container-fluid" style="margin-top:40px;">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	  <li class="nav-item">
	    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#basic" role="tab" aria-controls="home" aria-selected="true">기본 정보</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#activity" role="tab" aria-controls="profile" aria-selected="false">활동 내역</a>
	  </li>
	</ul>
	
	<div class="tab-content" id="myTabContent" >
	  <div class="tab-pane fade show active" id="basic" role="tabpanel" aria-labelledby="home-tab">
		<div class="row">
		  <div class="col-sm-4">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
				    <h6 class="m-0 font-weight-bold text-primary">회원정보 수정 이력</h6>
				</div>
				<div class="card-body">		
				    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img class="d-block w-100" src="${root}/upload/${map.main_image}" alt="First slide">
					    </div>
					    <c:forEach items="${map.imageList}" var="obj">
						    <div class="carousel-item">
						      <img class="d-block w-100" src="${root}/upload/${obj.image_name}" alt="Second slide">
						    </div>
					    </c:forEach>
					  </div>
					  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
		  		</div>
		  	</div> 
		  </div>
		  <div class="col-sm-8">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
				    <h6 class="m-0 font-weight-bold text-primary">회원정보 수정 이력</h6>
				</div>
				<div class="card-body">		
				   	<div class="row">
				   		<div class="col-sm-1">가맹사</div>
				   		<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.franchise_name}" readonly="readonly"></div>
				   		<div class="col-sm-1">가게명</div>
				   		<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.shop_name}" name="shopName"></div>
				   		<div class="col-sm-1">가게번호</div>
				   		<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.shop_idx}" name="shopIdx" readonly="readonly"></div>
				   	</div>
				   	<div class="row">
				   		<div class="col-sm-1">등록지역</div>
				   		<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.area_name}" readonly="readonly"></div>
				   		<div class="col-sm-1">신청일</div>
				   		<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.regdate}" readonly="readonly"></div>
				   		<div class="col-sm-1">승인일</div>
				   		<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.approve_date}" readonly="readonly"></div>
				   	</div>
				   	<div class="row">
				   		<div class="col-sm-1">가입상태</div>
				   		<div class="col-sm-3">
				   			<select class="form-control" name="activityStatus">
				   				<option value="1" <c:if test="${deMap.activity_status eq 1}">selected</c:if>>정상</option>
				   				<option value="2" <c:if test="${deMap.activity_status eq 2}">selected</c:if>>탈퇴</option>
				   			</select>
				   		</div>
				   		<div class="col-sm-1">최근접속</div>
				   		<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.recent_access}" readonly="readonly"></div>
				   		<div class="col-sm-1">처리자</div>
				   		<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.register}" name="register"></div>
				   	</div>
				   	<div class="row">
				   		<div class="col-sm-1">키워드</div>
				   		<div class="col-sm-11">
				   			<c:forEach items="${deMap.keywordList}" var="obj">
					   			<button class="btn btn-secondary">${obj.keyword}</button>
				   			</c:forEach>
				   		</div>
				   	</div>
				   	<div class="row">
				   		<div class="col-sm-12">관리자 메모</div>
				   	</div>
				   	<div class="row">
				   	<div class="col-sm-12"><textarea rows="" cols="" class="form-control" name="memo">${deMap.responsibility_memo}</textarea></div>
				   	</div>
		  		</div>
		  	</div>
		  </div>
		</div>
		<div class="row">
		  <div class="col-sm-4">
		    <div class="card shadow mb-4">
				<div class="card-header py-3">
				    <h6 class="m-0 font-weight-bold text-primary">회원정보 수정 이력</h6>
				</div>
				<div class="card-body">
				    <div class="row">
				    	<div class="col-sm-3">주소</div>
				    	<div class="col-sm-9"><input type="text" class="form-control" value="${map.address}" readonly="readonly"></div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">전화번호</div>
				    	<div class="col-sm-9"><input type="text" class="form-control" value="${map.phone}" readonly="readonly"></div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">영업시간</div>
				    	<div class="col-sm-9"><input type="text" class="form-control" value="${map.start_date} ~ ${map.end_date}" readonly="readonly"></div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">홈페이지</div>
				    	<div class="col-sm-9"><a href="${map.homepage_url}" readonly="readonly">홈페이지로 이동</a></div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">소개문구</div>
				    	<div class="col-sm-9"><input type="text" class="form-control" value="${map.intro_ph}" readonly="readonly"></div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">회원혜택</div>
				    	<div class="col-sm-9"><input type="text" class="form-control" value="${map.to_benefit}" readonly="readonly"></div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">알림</div>
				    	<div class="col-sm-9"><input type="text" class="form-control" value="${map.notice_info}" readonly="readonly"></div>
				    </div>
		  		</div>
		  	</div>
		  	<div class="card shadow mb-4">
				<div class="card-header py-3">
				    <h6 class="m-0 font-weight-bold text-primary">회원정보 수정 이력</h6>
				</div>
				<div class="card-body">		
					<span>제품/판매가 추가 설명</span>
					<input type="text" class="form-control" readonly="readonly">
				</div>
			</div>
		  </div>
		  <div class="col-sm-8">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
				    <h6 class="m-0 font-weight-bold text-primary">회원정보 수정 이력</h6>
				</div>
				<div class="card-body">		
					<div class="row">
						<div class="col-sm-1">상호</div>
						<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.buisness_name}" name="buisnessName"></div>
						<div class="col-sm-1">사업자 번호</div>
						<div class="col-sm-3">
							<input type="text" class="form-control" value="${deMap.buisness_num}" name="buisnessNum">
							<a href="${root}/notice/download?fileName=${deMap.buisess_image_name}">
							<img src="${root}/img/download.png" style="width: 20px;
																    height: 20px;
																    position: absolute;
																    right: 20px;
																    top: 8px;"></a>
						</div>
						<div class="col-sm-1">업종 / 업태</div>
						<div class="col-sm-3">
							<input type="text" class="form-control" value="${deMap.sector_content}" id="sectorIn">
							<input type="hidden" name="sectorId" value="${deMap.sector_id}">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-1">닉네임</div>
						<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.name}" name="name"></div>
						<div class="col-sm-1">회원번호</div>
						<div class="col-sm-3"><input type="text" class="form-control" value="${deMap.member_id}" name="memberId" readonly="readonly"></div>
					</div>
				</div>
			</div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
				    <h6 class="m-0 font-weight-bold text-primary">활동 정보</h6>
				</div>
				<div class="card-body">		
					<div class="row">
						<div class="col-sm-2">단골 수</div>
						<div class="col-sm-4">${deMap.bookCnt}</div>
					</div>
					<div class="row">
						<div class="col-sm-2">소식</div>
						<div class="col-sm-4">${deMap.newsCnt} 건</div>
						<div class="col-sm-2">신고</div>
						<div class="col-sm-4">${deMap.reportCnt} 건</div>
					</div>
					<div class="row">
						<div class="col-sm-2">산지 직거래</div>
						<div class="col-sm-4">${deMap.directCnt} 건</div>
						<div class="col-sm-2">패널티</div>
						<div class="col-sm-4">${deMap.penaltyCnt} 건</div>
					</div>
				</div>
			</div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
				    <h6 class="m-0 font-weight-bold text-primary">매니저 등록 내역</h6>
				</div>
				<div class="card-body">		
					<table class="table">
						<thead>
							<tr>
								<th>No.</th>
								<th>요청일</th>
								<th>등록일</th>
								<th>최근 접속일</th>
								<th>닉네임</th>
								<th>회원번호</th>
								<th>활성상태</th>
								<th>상태 변경</th>
								<th>처리자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="obj" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${obj.regdate}</td>
									<td>${obj.appro_date}</td>
									<td>${obj.recent_access}</td>
									<td>${obj.name}</td>
									<td>${obj.member_id }</td>
									<td>
										<c:choose>
											<c:when test="${obj.active_status eq 1}">활성</c:when>
											<c:otherwise>삭제</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${obj.active_status eq 1}"><button class="btn btn-secondary">삭제</button></c:when>
											<c:otherwise><button class="btn btn-secondary">활성</button></c:otherwise>
										</c:choose>
									</td>
									<td>${obj.prosessor}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>			    
		  </div>
		</div>
		<div class="text-center"><button type="button" class="btn btn-info update-btn" style="margin-bottom:20px;">수&nbsp;정</button></div>
	  </div>
	  
	  <!-- 활동 내역 -->
	  <div class="tab-pane fade" id="activity" role="tabpanel" aria-labelledby="profile-tab">
	  
	  	<div class="card shadow mb-4">
			<div class="card-header py-3">
			    <h6 class="m-0 font-weight-bold text-primary">매니저 등록 내역</h6>
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th>No.</th>
							<th>수정 일자</th>
							<th>수정 항목</th>
							<th>종류</th>
							<th>수정 전</th>
							<th>수정 후</th>
							<th>처리자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${upList}" var="obj">
							<tr>
								<th>${obj.shop_update_list_id}</th>
								<td>${obj.regdate}</td>
								<td>
									<c:choose>
										<c:when test="${obj.update_category eq 1}">가입상태</c:when>
										<c:when test="${obj.update_category eq 2}">가게프로필</c:when>
										<c:when test="${obj.update_category eq 3}">기본정보</c:when>
										<c:when test="${obj.update_category eq 4}">가격표</c:when>
										<c:when test="${obj.update_category eq 5}">매니저</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${obj.update_kind eq 1}">정상 / 탈퇴</c:when>
										<c:when test="${obj.update_kind eq 2}">가게명</c:when>
										<c:when test="${obj.update_kind eq 3}">등록지역</c:when>
										<c:when test="${obj.update_kind eq 4}">키워드</c:when>
										<c:when test="${obj.update_kind eq 5}">대표 이미지</c:when>
										<c:when test="${obj.update_kind eq 6}">주소</c:when>
										<c:when test="${obj.update_kind eq 7}">전화번호</c:when>
										<c:when test="${obj.update_kind eq 8}">영업시간</c:when>
										<c:when test="${obj.update_kind eq 9}">홈페이지</c:when>
										<c:when test="${obj.update_kind eq 10}">소개문구</c:when>
										<c:when test="${obj.update_kind eq 11}">회원혜택</c:when>
										<c:when test="${obj.update_kind eq 12}">알림</c:when>
										<c:when test="${obj.update_kind eq 13}">추가 / 삭제</c:when>
										<c:when test="${obj.update_kind eq 14}">추가 / 삭제</c:when>
									</c:choose>
								</td>
								<td>${obj.update_before}</td>
								<td>${obj.update_after}</td>
								<td>${obj.register}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>	
		
		<div class="card shadow mb-4">
			<div class="card-header py-3">
			    <h6 class="m-0 font-weight-bold text-primary">매니저 등록 내역</h6>
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th>No.</th>
							<th>패널티 적용일</th>
							<th>발견 경로</th>
							<th>패널티 구분</th>
							<th>패널티 종류</th>
							<th>적용 여부</th>
							<th>처리자</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach items="${peList}" var="obj">
							<fmt:parseDate value="${obj.startDate}" var="strPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<fmt:parseDate value="${obj.endDate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${(endPlanDate.time / (1000*60*60*24))}" integerOnly="true" var="endDate"></fmt:parseNumber>
							<tr>
								<th>${obj.shop_penalty_id}</th>
								<td>${obj.startDate}</td>
								<td>
									<c:choose>
										<c:when test="${obj.discovery_path eq 1}">모니터링</c:when>
										<c:when test="${obj.discovery_path eq 2}">신고</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${obj.penalty_sort eq 1}">계정</c:when>
										<c:when test="${obj.penalty_sort eq 2}">상품</c:when>
										<c:when test="${obj.penalty_sort eq 3}">채팅</c:when>
										<c:when test="${obj.penalty_sort eq 4}">게시글</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${obj.penalty_name eq 1}">경고</c:when>
										<c:when test="${obj.penalty_name eq 2}">이용정지</c:when>
										<c:when test="${obj.penalty_name eq 3}">차단</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${endDate - strDate >= 0}">적용</c:when>
										<c:otherwise>해지</c:otherwise>
									</c:choose>
								</td>
								<td></td>
							</tr>
							
						</c:forEach>
					</tbody>
				</table>
			</div>
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
	<script src="${root}/js/bo-script.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
	
		$(function(){
			
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
   			
   			$('#sectorIn').autocomplete({
   				source: jsonArraySec,
   				select : function(event, ui) {
   					$('input[name="sectorId"]').val(ui.item.val);
   		        }
   			});
			
   			//업데이트 
			$('.update-btn').click(function(){
				swal({
					title : "fail!",
					text : "수정완료",
					closeOnClickOutside : false
				}).then(function(){
					$('#shopUpdateForm')[0].submit();
				});
			});
			
		});
		
	</script>
</body>
</html>