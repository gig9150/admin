<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="${root}/css/style.css">
<link rel="stylesheet" href="${root}/css/wo.css">
<title>Document</title>
</head>    
<body>
	<!--MY002 마이페이지 - 회원정보수정 -프로필수정 -->
	<form action="${root}/front/member/member_update_pro" method="Post" id="memberInfoUpdate" enctype="multipart/form-data">
	    <section id="MY002_2" class="content">
	    
	        <div class="box top">
	            <div class="icon_left"><a href="${root}/front/member/myPage"><i class="fas fa-times"></i></a></div>
	            <h1 class="title">프로필 수정</h1>
	        </div>
	        
	        <div class="pic">	
	            <label for="file_box"><i class="fas fa-camera"></i></label>
	            <input type="file" id="file_box" name="uploadFile">
	        </div>
	        
	        <div class="inner">
	            <div class="btn"><input type="text" id="updateName" name="name" ></div>
	        </div>
	        
	        <div class="inner">
	            <div class="btn"><input type="text" id="updateArea" name="address" ></div>
	        </div>
	        
	        <div class="bottom_btn"><button type="submit">완료</button></div>
	        
	    </section>
	</form>
    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    
	 // 등록 이미지 등록 미리보기
	    function readInputFile(input) {
	        if(input.files && input.files[0]) {
		    	$('.pic img').remove();
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('.pic').append('<img src="'+e.target.result+'">');
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	     
		$(function(){
			//회원 이미지가 존재하면 이미지 등록
			
// 			if(){
// 				$('.pic').append('<img src="'++'">');
// 			}
			
			//파일 수정시 미리보기 
		    $("#file_box").on('change', function(){
		        readInputFile(this);
		    });
			
			//submit 조건 걸기
			
			$('#memberInfoUpdate').submit(function(e){
				
				// 중복 닉네임 확인
				const updateName = $('#updateName').val();

				$.ajax({
					url:'${root}/front/member/GetMemberName/'+updateName,
					type:'get',
					success:function(data){
						e.preventDefault();
						if(data.trim() == updateName){
							swal({
								title : "fail!",
								text : "현재 사용중인 닉네임입니다." +
										"닉네임을 다시 설정해주세요",
								buttons: ["확인", "취소"],
						    	closeOnClickOutside : false
						 	});
							e.preventDefault();
						}
					}
				});
				
				//닉네임 변경 or 닉네임 + 지역 변경할 경우
				
				if(updateName != null){
					
					e.preventDefault();
					
					swal({
						title : "fail!",
						text : "닉네임 변경 시 \n 30일동안 닉네임 변경 불가합니다 \n 정보를 변경 하시겠습니까?",
						buttons: {
							cancel : "취소",
							defeat : "확인" 
						},
				    	closeOnClickOutside : false
				 	}).then(function(value){
				 		switch(value){
				 			case "defeat" :
				 				swal("회원 정보가 변경되었습니다.").then(function(){
				 					$('#memberInfoUpdate')[0].submit();
				 				})
				 			break;
				 			default :
				 				e.preventDefault();
				 		}
				 	});
				}
				
				//회원 정보 변경 완료
				swal("회원 정보가 변경되었습니다.").then(function(){
 					$('#memberInfoUpdate')[0].submit();
 				});
			
			})
		});
   
    </script>
</body>
</html>