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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="${root}/vendor/jquery/jquery.min.js"></script>
<style>
	select[name="startDate"],select[name="endDate"]{
		float: left;
	    padding: 0 10px;
	    width: 100%;
	    height: 100%;
	    border: 1px solid #bbb;
	    border-radius: 5px;
	
	}
	
	.box7 .txt{
		border:none;
	}
	
	.box .txt textarea{
	    width: 100%;
	    height: 180px;
	    border-radius: 5px;
	    border: 1px solid #bbb;
	
	}


</style>
</head>
<body>
<form action="${root}/front/mypage/shop_update_pro" id="updateShopForm">
	<input type="hidden" value="${shopIdx}" name="shopIdx">
	<!--    84페이지 - #BZ002-TB01-A-2 가게프로필 탭 - 소개 (가게정보관리) - 가게 정보 수정하기-->
   <section id="BZ002-TB01-A-2" class="content">
        <div class="top">
            <div class="icon_left"><a href=""><i class="fas fa-chevron-left"></i></a></div>
            <h1 class="title">가게 정보 수정하기</h1>
        </div>
       <div class="box1 box">
           <label for="">주소</label>
           <input class="address" name="address1" readonly="readonly">
           <i id="addr-btn" class="fas fa-search"></i>
           <input type="text" placeholder="상세 주소를 입력해주세요." name="address2">
       </div>
       <div class="box2 box">
           <label for="">전화번호</label>
           <input type="number" name="phone">
       </div>
       <div class="box3 box">
           <label for="">소개문구</label>
           <input type="text" name="intro">
       </div>
       <div class="box4 box">
           <h3 class="title">영업시간</h3>
            <div class="sub_box">
                <p>요일</p>
                <ul class="day">
                    <li><a href="" class="day_btn">일</a></li>
                    <li><a href="" class="day_btn">월</a></li>
                    <li><a href="" class="day_btn">화</a></li>
                    <li><a href="" class="day_btn">수</a></li>
                    <li><a href="" class="day_btn">목</a></li>
                    <li><a href="" class="day_btn">금</a></li>
                    <li><a href="" class="day_btn">토</a></li>
                </ul>
            </div>
         	<div class="day-div">
         	
         	</div>
            
            <div class="sub_box sub_box_time">
                <p class="time_title">시작 시간</p>
                <div class="time">
                    <select name="startDate">
                    	<option value="">선택</option> 
                    	<option value="0030">00:30</option>
                    	<option value="0100">01:00</option>
                    	<option value="0130">01:30</option>
                    	<option value="0200">02:00</option>
                    	<option value="0230">02:30</option>
                    	<option value="0300">03:00</option>
                    	<option value="0330">03:30</option>
                    	<option value="0400">04:00</option>
                    	<option value="0430">04:30</option>
                    	<option value="0500">05:00</option>
                    	<option value="0530">05:30</option>
                    	<option value="0600">06:00</option>
                    	<option value="0630">06:30</option>
                    	<option value="0700">07:00</option>
                    	<option value="0730">07:30</option>
                    	<option value="0800">08:00</option>
                    	<option value="0830">08:30</option>
                    	<option value="0900">09:00</option>
                    	<option value="0930">09:30</option>
                    	<option value="1000">10:00</option>
                    	<option value="1030">10:30</option>
                    	<option value="1100">11:00</option>
                    	<option value="1130">11:30</option>
                    	<option value="1200">12:00</option>
                    	<option value="1230">12:30</option>
                    	<option value="1300">13:00</option>
                    	<option value="1330">13:30</option>
                    	<option value="1400">14:00</option>
                    	<option value="1430">14:30</option>
                    	<option value="1500">15:00</option>
                    	<option value="1530">15:30</option>
                    	<option value="1600">16:00</option>
                    	<option value="1630">16:30</option>
                    	<option value="1700">17:00</option>
                    	<option value="1730">17:30</option>
                    	<option value="1800">18:00</option>
                    	<option value="1830">18:30</option>
                    	<option value="1900">19:00</option>
                    	<option value="1930">19:30</option>
                    	<option value="2000">20:00</option>
                    	<option value="2030">20:30</option>
                    	<option value="2100">21:00</option>
                    	<option value="2130">21:30</option>
                    	<option value="2200">22:00</option>
                    	<option value="2230">22:30</option>
                    	<option value="2300">23:00</option>
                    	<option value="2330">23:30</option>
                    	<option value="2400">24:00</option>
                    </select>
                </div>
            </div>
            <div class="sub_box sub_box_time">
                <p class="time_title">종료 시간</p>
                <div class="time">
                    <select name="endDate">
                    	<option value="">선택</option>
                    	<option value="0030">00:30</option>
                    	<option value="0100">01:00</option>
                    	<option value="0130">01:30</option>
                    	<option value="0200">02:00</option>
                    	<option value="0230">02:30</option>
                    	<option value="0300">03:00</option>
                    	<option value="0330">03:30</option>
                    	<option value="0400">04:00</option>
                    	<option value="0430">04:30</option>
                    	<option value="0500">05:00</option>
                    	<option value="0530">05:30</option>
                    	<option value="0600">06:00</option>
                    	<option value="0630">06:30</option>
                    	<option value="0700">07:00</option>
                    	<option value="0730">07:30</option>
                    	<option value="0800">08:00</option>
                    	<option value="0830">08:30</option>
                    	<option value="0900">09:00</option>
                    	<option value="0930">09:30</option>
                    	<option value="1000">10:00</option>
                    	<option value="1030">10:30</option>
                    	<option value="1100">11:00</option>
                    	<option value="1130">11:30</option>
                    	<option value="1200">12:00</option>
                    	<option value="1230">12:30</option>
                    	<option value="1300">13:00</option>
                    	<option value="1330">13:30</option>
                    	<option value="1400">14:00</option>
                    	<option value="1430">14:30</option>
                    	<option value="1500">15:00</option>
                    	<option value="1530">15:30</option>
                    	<option value="1600">16:00</option>
                    	<option value="1630">16:30</option>
                    	<option value="1700">17:00</option>
                    	<option value="1730">17:30</option>
                    	<option value="1800">18:00</option>
                    	<option value="1830">18:30</option>
                    	<option value="1900">19:00</option>
                    	<option value="1930">19:30</option>
                    	<option value="2000">20:00</option>
                    	<option value="2030">20:30</option>
                    	<option value="2100">21:00</option>
                    	<option value="2130">21:30</option>
                    	<option value="2200">22:00</option>
                    	<option value="2230">22:30</option>
                    	<option value="2300">23:00</option>
                    	<option value="2330">23:30</option>
                    	<option value="2400">24:00</option>
                    </select>
                </div>
            </div>
       </div>
       <div class="box5 box">
           <label for="">옵션정보</label>
           <!-- 뭐에쓰는거임? -->
           <input type="text" name="option">
       </div>
        <div class="box6 box">
           <label for="">홈페이지</label>
           <input type="text" name="homepageUrl">
       </div>
       <div class="box7 box">
           <label for="">카달로그 서비스 회원 혜택</label>
           <div class="txt"><textarea name="toBenefit" rows="" cols="" style="width:100%;height:100%;padding:10px;"></textarea></div>
       </div>
       <div class="box8 box">
           <label for="">알림</label>
           <div class="txt"><textarea name="noticeInfo" rows="" cols="" style="width:100%;height:100%;padding:10px;"></textarea></div>
       </div>
       <div class="btn"><a id="update-btn" href="javascript:void(0)">저장하기</a></div>
   </section>
</form>

    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="${root}/js/main.js"></script>
	
	<script>
		
	$(function(){
		
		$('#addr-btn').click(function(){
			
			new daum.Postcode({
   		        oncomplete: function(data) {
   		            $('.address').val(data.address);
   		        }
   		    }).open();
			
		});
		
		$('#update-btn').click(function(){
			
			
			$.each($('.day_btn'),function(i,v){
				if(!$(this).hasClass('on')){
					switch (i) {
						case 0:$('.day-div').append('<input type="hidden" name="day" value="일">');break;
						case 1:$('.day-div').append('<input type="hidden" name="day" value="월">');break;
						case 2:$('.day-div').append('<input type="hidden" name="day" value="화">');break;
						case 3:$('.day-div').append('<input type="hidden" name="day" value="수">');break;
						case 4:$('.day-div').append('<input type="hidden" name="day" value="목">');break;
						case 5:$('.day-div').append('<input type="hidden" name="day" value="금">');break;
						case 6:$('.day-div').append('<input type="hidden" name="day" value="토">');break;
					}
				}
			});
			
			swal({
				text : "수정 하시겠습니까?",
				buttons: {
					cancel : "취소",
					defeat : "확인" 
				},
				closeOnClickOutside : false
			}).then(function(value){
				switch(value){
					case "defeat" :
						swal("수정 완료!").then(function(){
							$('#updateShopForm')[0].submit();
						})
					break;
					default :
						e.preventDefault();
				}
			});
			
		});
		
	});
	
	</script>
</body>
</html>