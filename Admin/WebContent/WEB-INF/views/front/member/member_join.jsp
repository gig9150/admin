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
<style>	

	#join{position: relative;}
	#join.idCheck::after{position: absolute; left: 0; top: 0; content:''; display: block; width: 100%; height: 100%; }
	
	
</style>
<title>Document</title>
</head>
<body>		

    <section id="join" class="content">
        <div class="top">
            <div class="icon"><a href=""><img src="./img/left.png" alt=""></a></div>
            <h1 class="profile">회원 가입</h1>
        </div>

		<form action="${root}/front/member/member_join_pro" method="post" id="joinSubmit" enctype="multipart/form-data">
	        <div class="inner">
	            <div class="pic">
	                <label for="file_box"><i class="fas fa-camera"></i></label>
	                <input type="file" id="file_box" name="uploadFile">
	            </div>
	                <fieldset>
	                    <label for="name">닉네임을 설정해주세요.</label>
	                    <input type="text" name="name" id="name" placeholder="닉네임을 입력하세요">
	                </fieldset>
	
	                <fieldset>
	                    <label for="place">지역을 설정해주세요.</label>
	                    <input type="text" value="순천시" id="place" disabled="disabled">
	                    <select name ="id" id="address">
	                    	<c:forEach items="${list}" var="obj">
	                    		<option value="${obj.id}">${obj.area_name}</option>
	                    	</c:forEach>
	                    </select>
	                </fieldset>
	                <button type="submit">가입하기</button>
        	</div>
        </form>
	        
        <section id="join_1" class="content" style="display:none;position: absolute;bottom: 30%;left: 6%;width: 79%;z-index:999">
	        <p>현재 사용중인 닉네임입니다.<br>닉네임을 다시 설정해주세요</p>
	        <button>확인</button>
	    </section>
	    
	    <section id="join_3" class="content" style="display:none;position: absolute;bottom: 30%;left: 6%;width: 79%;z-index:999">
	        <p>가입정보를 모두 입력해주세요.</p>
	        <button>확인</button>
	    </section>
		    
    </section>
	
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
	
		//파일 미리보기 
		function readInputFile(input) {
	        if(input.files && input.files[0]) {
		    	$('.pic img').remove();
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('.pic').append('<img style="width:100%;height: 100%;border-radius: 50%;" src="'+e.target.result+'">');
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	
		$(function(){
			
			$("#file_box").on('change', function(){
		        readInputFile(this);
		    });
			
			
			$('#joinSubmit').submit(function(e) {
				
				//아이디 중복 확인 
				const name = $('#name').val();
				
				
				$.ajax({
					url:'${root}/front/member/checkName/'+name,
					type:'get',
					async: false,
					success:function(data){
						if(data.trim() == 'true'){
							
							$('#join').addClass('idCheck');
							$('#join_1').css('display','block');
							
							e.preventDefault();
							
							
						}
					}
				});
				
				// 글자 제한
				
				if(name.length >= 10){
					
					swal({
						title : "fail!",
						text : "닉네임은 10자 이내로 가능합니다.",
				    	closeOnClickOutside : false
				 	});
					
					e.preventDefault();
				}
				
				//등록 정보 누락했을때 
				const address = $('#address').val();
				
				if(name == '' || address == ''){
					
					$('#join').addClass('idCheck');
					$('#join_3').css('display','block');
					
					e.preventDefault();
				}
				
				
			});
			
			//버튼 클릭시 다시 입력
			$('#join_1 button').on('click',function(){
				$('#join_1').css('display','none');
				$('#join').removeClass('idCheck');
			});
			
			$('#join_3 button').on('click',function(){
				$('#join_3').css('display','none');
				$('#join').removeClass('idCheck');
			});
			
		});
		
	</script>
	
</body>
</html>