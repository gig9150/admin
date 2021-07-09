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
 <!-- 27페이지 - #BZ001-TB01 - 가게 프로필 (일반 회원 진입 시)-->
    <section id="BZ001-TB01" class="content">
        <div class="box top">
            <div class="icon_left"><a href=""><i class="fas fa-times"></i></a></div>
            <h1 class="title">라루체</h1>
            <div class="icon_right"><a href=""><i class="fas fa-ellipsis-v"></i></a></div>
        </div>
        <ul id="gnb">
            <li><a href="">소개</a></li>
            <li><a href="">소식</a></li>
            <li><a href="">상품<span>8</span></a></li>
            <li><a href="">후기<span>9</span></a></li>
        </ul>
        <div class="profile_top"><img src="" alt=""></div>
        <div class="profile_bottom">
            <ul class="left_box">
                <li>라루체</li>
                <li>반포면</li>
                <li>매일 11:30 ~ 22:00</li>
            </ul>

            <ul class="right_box">
                <li><a href=""><i class="fas fa-plus"></i></a></li>
                <li id="regularMember">단골</li>
                <li>0</li>
            </ul>

        </div>

        <div class="call">
            <div class="call_left"><a href=""><span><i class="fas fa-phone"></i></span>전화문의</a></div>
            <div class="call_right"><a href=""><span><i class="fas fa-edit"></i></span>후기작성</a></div>
        </div>

        <ul class="tab">
            <li><a href="">홈</a></li>
            <li><a href="">소식</a></li>
            <li><a href="">후기1</a></li>
        </ul>

        <div class="box notice">
            <p><span><i class="fas fa-bullhorn"></i></span>알림 없어용</p>
        </div>

        <div class="box infomation">
            <h3 class="box_title">정보</h3>
            <p class="icon"><i class="far fa-smile-wink"></i><i class="far fa-grin-stars"></i><i class="far fa-grin-stars"></i><i class="far fa-grin-stars"></i><i class="far fa-grin-stars"></i>...<a href="">더보기</a></p>
            <p class="place"><span><i class="fas fa-map-marker-alt"></i></span>인천광역시 연수구 동춘동 929 연수2차풍림아파트</p>
            <p class="time"><span><i class="far fa-clock"></i></span>09:02 - 09:30<span>평일휴무</span></p>


            <p class="ex">"당근마켓에서 보고왔어요" 라고 말해보세요!</p>
        </div>

        <div class="box price">
            <h3 class="box_title">가격</h3>
            <div class="price_top">
                <div class="sub_box_top">
                    <p>소수잔</p>
                    <p>10,900원</p>
                </div>
                <div class="sub_box_bottom">
                    <p>직접 디자인하고 제작까지한 소주잔</p>
                </div>
            </div>

            <div class="price_bottom">
                <div class="sub_box_top">
                    <p>소수잔</p>
                    <p>10,900원</p>
                </div>
                <div class="sub_box_bottom">
                    <p>직접 디자인하고 제작까지한 소주잔</p>
                </div>
            </div>
        </div>

        <div class="box news">
            <h3 class="box_title">소식</h3>
            <div class="sub_box">
                <div class="pic"></div>
                <div class="info">
                    <p class="sub_title">다용도 볼이에요</p>
                    <p>따끈따근 다용도 볼이에요XD<br>샐러드,씨리얼,국그릇,덮밥그릇 활용도...</p>
                </div>
            </div>
            <div class="btn"><a href="">소식 더보기</a></div>
        </div>

        <div class="box review">
            <h3 class="box_title">후기<span>2</span></h3>
            <div class="title_box">
                <div class="pic"></div>
                <div class="info">
                    <h4 class="info_title">멍멍멍</h4>
                    <p class="sub_title">동촌동<span>&#8226;</span>1개월전</p>
                    <a href="" class="bar"><i class="fas fa-ellipsis-v"></i></a>
                </div>
            </div>
            <div class="txt_box">
                <div class="info">
                    <p class="txt"><i class="far fa-smile-wink"></i><i class="far fa-smile-wink"></i></p>
                    <ul class="tag">
                        <li>
                            <p>친절해요</p>
                        </li>
                        <li>
                            <p>만족스러워요</p>
                        </li>
                    </ul>
                </div>
                <ul class="recom">
                    <li><i class="far fa-thumbs-up"></i></li>
                    <li>도움이 돼요</li>
                    <li>0</li>
                </ul>
            </div>
            <div class="btn"><a href="">소식 더보기</a></div>
        </div>
        
        <div class="box map">
            <h3 class="box_title">찾아가는 길</h3>
            <div class="sub_box"></div>
            <p class="txt">충남 공주시 반포면 계룡대로 1392</p>
        </div>
        
        <div class="box bottom_box">
            <div class="box">
                <div class="pic"><i class="fas fa-home"></i></div>
                <div class="info"><a href="">홈</a></div>
            </div>
            <div class="box">
                <div class="pic"><i class="far fa-heart"></i></div>
                <div class="info"><a href="">찜</a></div>
            </div>
            <div class="box">
                <div class="pic"><i class="far fa-edit"></i></div>
                <div class="info"><a href="">글쓰기</a></div>
            </div>
            <div class="box">
                <div class="pic"><i class="far fa-comment-dots"></i></div>
                <div class="info"><a href="">채팅</a></div>
            </div>
            <div class="box">
                <div class="pic"><i class="far fa-user"></i></div>
                <div class="info"><a href="">MY</a></div>
            </div>
        </div>
        
        <div class="report_box" style="display:none">
        	<p class="report"><a class="reportA" href="${root}/front/shop/shop_report_category?status=shop&shopIdx=${detailMap.shop_idx}">신고하기</a></p>
        </div>   
        
         <div class="pop_up_box">
         	<c:choose>
         		<c:when test="${checkNum eq 1}">
         			<p class="ask">단골로 추가하시겠습니까&nbsp;?</p>
         		</c:when>
         		<c:otherwise>
         			<p class="ask">단골로 해제하시겠습니까&nbsp;?</p>
         		</c:otherwise>
         	</c:choose>

            <div class="btn_box">
                <div class="btn cancel"><a href="">취소</a></div>
                <c:choose>
                	<c:when test="${checkNum eq 1}">
		            	<div class="btn sure"><a href="${root}/front/shop/shop_bookmark?shopIdx=${detailMap.shop_idx}&nowPage=detail">확인</a></div>
                	</c:when>
                	<c:otherwise>
                		<div class="btn sure"><a href="${root}/front/shop/shop_bookmark_cancel?shopIdx=${detailMap.shop_idx}&nowPage=detail">확인</a></div>
                	</c:otherwise>
                </c:choose>
            </div>
        </div>

    </section>
            
            




    </section>
	<script src="${root}/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=721999101124afce77f5e74b66d6552c"></script>
	
	<script>
		$(function() {
			
			
			$('#reportTriger').on('click',function(){ 
				if($('.content').hasClass('reviewon')){
					$('.content').removeClass('reviewon');
					$('.report_box').css('display','none');
				}else{
					$('.content').addClass('reviewon');
					$('.report_box').css('display','block');
				}
			});
			
			$('#regularMember').on('click',function(){
				if($('.content').hasClass('on')){
					$('.content').removeClass('on');
					$('.pop_up_box').css('display','none');
				}else{
					$('.content').addClass('on');
					$('.pop_up_box').css('display','block');
				}
			});
			
			//카카오맵 
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);
			
		});
		
	</script>
</body>
</html>