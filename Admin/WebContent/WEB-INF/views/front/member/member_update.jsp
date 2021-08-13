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

	 <!--54페이지 #MY001-PI01 마이페이지-회원정보수정-->
    <section id="MY001-PI01" class="content">
        <div class="top">
            <div class="icon"><a href="javascript:history.back();"><img src="${root}/img/left.png" alt=""></a></div>
            <h1 class="profile">회원 정보 수정</h1>
        </div>
		<form action="${root}/front/member/member_update_pro" method="Post" id="memberInfoUpdate" enctype="multipart/form-data">
	        <div class="inner">
	            <div class="pic">
	                <label for="file_box"><i class="fas fa-camera"></i></label>
	                <input type="file" id="file_box" name="uploadFile">
	                <a class="pic_cancel" href="javascript:void(0)"><i class="fas fa-times"></i></a>
	            </div>
	                <fieldset>
	                    <label for="updateName">닉네임을 설정해주세요.</label>
	                    <input type="text" id="updateName" name="name" placeholder="닉네임을 입력하세요">
	                </fieldset>
	
	                <fieldset>
	                    <label for="place">지역을 설정해주세요.</label>
	                    <select name="place" id="place">
	                        <option value="">공주시</option>
	                    </select>
	                    <div class="search_box">
	                        <input type="text" class="search_input" placeholder="군/구" id="updateArea" readonly="readonly">
	                        <span class="search"><a href="javascript:void(0)"><i class="fas fa-search"></i></a></span>
	                        <input type="hidden" name="id" id="updateAreaHid">
	                    </div>
	                </fieldset>

	                <button>프로필 수정하기</button>
	            </form>
	        </div>
		</form>
		
		<div class="inner2">
            <p>현재 사용중인 닉네임입니다.<br>닉네임을 다시 설정해주세요</p>
            <button>확인</button>
        </div>
 
       <div class="inner3">
            <p>닉네임 변경 시<br>30일동안 닉네임 변경 불가합니다.<br>정보를 변경하시겠습니까?</p>
            <div class="btn_box">
                <div class="btn cancel"><a href="">취소</a></div>
                <div class="btn sure"><a href="javascript:void(0)">확인</a></div>
            </div>
        </div>

       <div class="inner4">
            <p>정보 수정이 완료되었습니다.</p>
            <button>확인</button>
        </div>
        
        <div class="box">
	       <div class="top_box">
	            <h1 class="title">지역선택 <span><a class="closeAreaSelect" href="javascript:void(0)"><i class="fas fa-times"></i></a></span></h1>   
	       </div>
	        <ul class="area-ul">
	            <c:forEach items="${areaList}" var="obj">
	            	<li><a data-id="${obj.id}">${obj.area_name}</a></li>
	            </c:forEach>
	        </ul>
	    </div>
    </section>

    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    
	 // 등록 이미지 등록 미리보기
	    function readInputFile(input) {
	        if(input.files && input.files[0]) {
		    	$('.pic img').remove();
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('.pic').append('<img src="'+e.target.result+'" style="width:100%;height:100%;border-radius:inherit">');
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	     
		$(function(){
			
			// 이미지 등록 취소 
			$('.pic_cancel').click(function(){
				$(this).parent().find('img').remove();
				$('#file_box').val('');
			});
			
			$('.search').click(function(){
				$('#MY001-PI01').addClass('on4');
			});
			
			$('.area-ul li a').click(function(){
				let id = $(this).data('id');
				$('#updateAreaHid').val(id);
				$('#updateArea').val($(this).html());
				$('#MY001-PI01').removeClass('on4');
			});
				
			
			//파일 수정시 미리보기 
		    $("#file_box").on('change', function(){
		        readInputFile(this);
		    });
			
			//submit 조건 걸기
			
			$('#memberInfoUpdate').submit(function(e){
				
				
				// 중복 닉네임 확인
				const updateName = $('#updateName').val();
				
				if(updateName == '' && $('#updateArea').val() == ''){
					
					alert('수정하실 정보를 입력해주세요.');
					e.preventDefault();
					
				}
				
				$.ajax({
					url:'${root}/front/member/GetMemberName/'+updateName,
					type:'get',
					async: false,
					success:function(data){
						if(data.trim() == updateName){
							
							$('#MY001-PI01').addClass('on1');
							e.preventDefault();
							
						}
					}
				});
				
				if(updateName != '' && $('#updateArea').val() != ''){
					$('#MY001-PI01').addClass('on2');
					e.preventDefault();
				}else if($('#updateArea').val() != ''){
					$('#MY001-PI01').addClass('on3');
					e.preventDefault();
				}else if(updateName != ''){
					$('#MY001-PI01').addClass('on2');
					e.preventDefault();
				}

				
			});
			
			$('.inner2 button').click(function(){
				$('#MY001-PI01').removeClass('on1');
			});
			
			$('.inner3 .sure').click(function(){
				$('#memberInfoUpdate')[0].submit();
			});
			
			$('.inner4 button').click(function(){
				$('#memberInfoUpdate')[0].submit();
			});
			
		});
   
    </script>
</body>
</html>