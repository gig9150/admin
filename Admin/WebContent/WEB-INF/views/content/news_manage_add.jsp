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
    
    <style>
    	html{
    		padding: 70px;
    		font-size:18px;
    	}
    	
    	td label {
    		width:100%
    	
    	}
    	
    	.row{
    		margin-bottom: 20px;
    	}
    	
    	
    	

    </style>
   

</head>
<body>
<c:if test="${map.post_stage eq 1}">
	<form>
		<div class="row">
			<div class="col-sm-6"></div>
			<div class="col-sm-1" style="text-align: center;line-height: 42px;">게시</div>
			<div class="col-sm-2">
				<select class="form-control stage-select">
					<option value="1">승인</option>
					<option value="2">반려</option>
				</select>
			</div>
			<div class="col-sm-2 stage-div" style="display:none;"><input type="text" class="form-control"></div>
			<div class="col-sm-1"><button class="btn btn-secondary stage-btn" disabled="disabled">결과 전송</button></div>
		</div>
	</form>
</c:if>


<form action="${root}/content/word_register_pro" method="get">
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">작성 정보</h6>
			</div>
			<div class="card-body">
				<table class="table">
					<colgroup>
						<col width="25%">
						<col width="8">
						<col width="17%">
						<col width="8">
						<col width="17%">
						<col width="8">
						<col width="17%">
					</colgroup>
					<tbody>
						<tr>
							<td rowspan="4"><img src="${root}/upload/${map.main_image}" style="width:100%;"></td>
							<td>가맹사</td>
							<td><input type="text" class="form-control" value="${map.franchise_name}"></td>
							<td>가게명</td>
							<td><input type="text" class="form-control" value="${map.shop_name}"></td>
							<td>가게번호</td>
							<td><input type="text" class="form-control" value="${map.shop_idx}"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" class="form-control" value="${map.nick_name}"></td>
							<td>노출상태</td>
							<td>
								<select class="form-control">
									<option <c:if test="${map.post_status eq 1}">selected</c:if>>진열</option>
									<option <c:if test="${map.post_status eq 2}">selected</c:if>>미진열</option>
								</select>
							</td>
							<td>관리자 삭제</td>
							<td>
								<c:choose>
									<c:when test="${map.manager_del eq 1}">
										<input type="text" class="form-control" value="Y">
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control" value="N">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>패널티 상태</td>
							<td><input type="text" class="form-control"></td>
							<td>게시 심사</td>
							<td>
								<c:choose>
									<c:when test="${map.status eq 1}">
										<input type="text" class="form-control" value="승인">
									</c:when>
									<c:when test="${map.status eq 2}">
										<input type="text" class="form-control" value="대기">
									</c:when>
									<c:when test="${map.status eq 3}">
										<input type="text" class="form-control" value="반려">
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control" value="보류">
									</c:otherwise>
								</c:choose>
							</td>
							<td>삭제일</td>
							<td><input type="text" class="form-control" value="${map.del_regdate}"></td>
						</tr>
						<tr>
							<td>관리자 메모</td>
							<td colspan="5"><input type="text" class="form-control" value="${map.responsibility_memo}"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">게시글 정보</h6>
			</div>
			<div class="card-body">
				<table class="table">
					<colgroup>
						<col width="25%">
						<col width="8">
						<col width="17%">
						<col width="8">
						<col width="17%">
						<col width="8">
						<col width="17%">
					</colgroup>
					<tbody>
						<tr>
							<td rowspan="5">
								<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
								  <div class="carousel-inner">
								  	<c:forEach items="${map.imageList}" var="obj" varStatus="status">
								  		<c:choose>
								  			<c:when test="${status.count eq 1}">
											    <div class="carousel-item active">
											      <img class="d-block w-100" src="${root}/upload/${obj}" alt="Second slide">
											    </div>
								  			</c:when>
								  			<c:otherwise>
							  				    <div class="carousel-item">
											      <img class="d-block w-100" src="${root}/upload/${obj}" alt="Second slide">
											    </div>
								  			</c:otherwise>
								  		</c:choose>
								  		
								  	</c:forEach>
								  	
<!-- 								    <div class="carousel-item active"> -->
<%-- 								      <img class="d-block w-100" src="${root}/img/2.jpg" alt="First slide"> --%>
<!-- 								    </div> -->
<!-- 								    <div class="carousel-item"> -->
<%-- 								      <img class="d-block w-100" src="${root}/img/2.jpg" alt="Third slide"> --%>
<!-- 								    </div> -->
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
							</td>
							<td>게시글 번호</td>
							<td><input type="text" class="form-control" value="${map.shop_news_id}"></td>
							<td>등록일</td>
							<td><input type="text" class="form-control" value="${map.regdate}"></td>
							<td>수정일</td>
							<td><input type="text" class="form-control" value="${map.update_date}"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" class="form-control" value="${map.title}"></td>
							<td>조회수</td>
							<td><input type="text" class="form-control" value="${map.view_count}"></td>
							<td>좋아요</td>
							<td><input type="text" class="form-control" value="${map.like_count}"></td>
						</tr>
						<tr>
							<td>쿠폰 첨부</td>
							<td><input type="text" class="form-control"></td>
							<td>키워드</td>
							<td>
								<c:forEach items="${map.keywordList}" var="obj">
									<input type="text" class="form-control" value="${obj}" style="width:20%;">								
								</c:forEach>
							</td>
							<td>신고여부</td>
							<td>
								<c:choose>
									<c:when test="${not empty map.report_id}">
										<input type="text" class="form-control" value="Y">
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control" value="-">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>내용</td>
						</tr>
						<tr>
							<td colspan="6">
								<textarea rows="5" class="form-control">${map.content}</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">게시글 수정 이력 </h6>
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th>No</th>
							<th>게시글 번호</th>
							<th>수정일</th>
							<th>수정항목 </th>
							<th>수정 전</th>
							<th>수정 후</th>
							<th>노출 상태 </th>
							<th>관리자 삭제</th>
							<th>처리자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="obj" varStatus="status">
							<tr>
								<th>${status.count}</th>
								<td>${obj.news_update_list_id}</td>
								<td>${obj.update_date}</td>
								<td>${obj.update_category}</td>
								<td>${obj.update_before}</td>
								<td>${obj.update_after}</td>
								<c:choose>
									<c:when test="${obj.post_status eq 1}">
										<td>진열</td>
									</c:when>
									<c:otherwise>
										<td>미 진열</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${obj.manager_del eq 1}">
										<td>관리자 삭제</td>
									</c:when>
									<c:otherwise>
										<td>정상</td>
									</c:otherwise>
								</c:choose>
								<td>${obj.handler}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 text-center">
			<button type="button" class="btn btn-secondary add-btn">삭제 / 복구</button>
			<button type="button" class="btn btn-secondary add-btn">수  정</button>
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

<!-- alert 라이브러리 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	$(function(){
		
		
		$('.stage-select').change(function(){
			if($(this).val() == 1){
				$('.stage-btn').prop('disabled',true);
				$('.stage-div').css('display','none');
			}else{
				$('.stage-div').css('display','block');
				$('.stage-btn').prop('disabled',false);
			}
		});
		
	});
	
</script>
</body>
</html>