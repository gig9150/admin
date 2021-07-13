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
    	td label {
    		width:100%
    	
    	}
    	
    	.form-control{
    		width:70%;
    		margin-left: 5%;
   		 	display: inline-block;
    	}
    	
    	#questionContent,#questionReply{
    		margin: 0;
   			width: 100%;
    	}
    	
    	.table{
    		margin-top: 70px;
    
    	}
    	
    	#quImageSlider{
    		height: 300px;
    	}
    	
    	.carousel-inner,.carousel-item{
    		height:100% !important;

    	}
    	
    	.carousel-inner .carousel-item img{
    		height:100% !important;
    	}
    	

    </style>
   

</head>
<body>
<form action="${root}/operation/question_register_pro" method="post">
	<div class="container-fluid">
		<table class="table">
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<tbody>
				<tr>
					<td rowspan="4">
						<div id="quImageSlider" class="carousel slide" data-ride="carousel">
						  <div class="carousel-inner">
						  	<c:forEach items="${quMap.imageList}" var="obj" varStatus="status">
						  		<c:choose>
						  			<c:when test="${status.count eq 1}">
							  			<div class="carousel-item active">
									      <img class="d-block w-100" src="${root}/upload/${obj}">
									    </div>		
						  			</c:when>
						  			<c:otherwise>
						  				<div class="carousel-item">
									      <img class="d-block w-100" src="${root}/upload/${obj}">
									    </div>
						  			</c:otherwise>
						  		</c:choose>
						  	</c:forEach>
						   
						  </div>
						  <a class="carousel-control-prev" href="#quImageSlider" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#quImageSlider" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
					</td>
					<td>
						<label>가맹사<input type="text" class="form-control" value="${quMap.franchise_name}" readonly="readonly"></label>
					</td>
					<td>
						<label>닉네임<input type="text" class="form-control" value="${quMap.name }" readonly="readonly"></label>
					</td>
					<td>
						<label>회원번호<input type="text" class="form-control" value="${quMap.member_id}" readonly="readonly"></label>
					</td>
				</tr>
				<tr>
					<td>
						<label>문의종류<input type="text" class="form-control" value="${quMap.content}" readonly="readonly"></label>
					</td>
					<td>
						<label>문의번호<input type="text" name="questionId" class="form-control" value="${quMap.question_id}" readonly="readonly"></label>
					</td>
					<td>
						<label>등록일<input type="text" class="form-control" value="${quMap.regdate}" readonly="readonly"></label>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<label for="questionContent">문의 내용</label>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input id="questionContent" value="${quMap.question_content}" type="text" class="form-control">
					</td>
				</tr>
			</tbody>
		</table>
		
		<span class="border">
			<table class="table">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<label>처리상태<input type="text" class="form-control"
							<c:choose>
								<c:when test="${quMap.answer_status eq 1}">
									value = "확인 중"
								</c:when>
								<c:otherwise>
									value = "처리 완료"
								</c:otherwise>
							</c:choose>
							></label>
						</td>
						<td>
							<label>알림 톡 발송<input type="radio" name="sendMessage" value="1">Y&nbsp;<input type="radio" name="sendMessage" value="2">N</label> 
						</td>
						<td>
							<label>처리자<input type="text" value="${managerId}" class="form-control"></label>
						</td>
						<td>
							<label>처리일<input type="text" class="form-control"></label>
						</td>
					</tr>
					<tr>
						<td colspan="4"><label for="questionReply">답변 내용</label></td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea id="questionReply" name="content" class="form-control" rows="5" cols=""></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center">
							<button class="btn btn-info">등  록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</span>
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
</body>
</html>