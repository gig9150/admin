<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${root}/css/style.css">
<link rel="stylesheet" href="${root}/css/wo.css">
<title>Document</title>
</head>
<body>

<section id="view_more" class="content">
    <div class="box big_pic">
       <div class="swiper-container">
                <div class="swiper-wrapper">
                	<c:choose>
                		<c:when test="${empty detailMap.imageList}">
                			<div class="swiper-slide">
			                    <img src="${root}/img/2.jpg" width="100%" height="100%">
			                </div>
                		</c:when>
                		<c:otherwise>
		                	<c:forEach items="${detailMap.imageList}" var="obj" varStatus="status">
			                    <div class="swiper-slide">
			                       <img src="${root}/upload/${obj}" width="100%" height="100%">
			                    </div>
		                	</c:forEach>
                		</c:otherwise>
                	</c:choose>
                </div>
        </div>
        
    </div>
     <ul class="icon">
        <li><a href="javascript:history.back();"><i class="fas fa-arrow-left"></i></a></li>
        <li><a href=""><i class="fas fa-ellipsis-v"></i></a></li>
        <li><a href=""><i class="fas fa-share-alt"></i></a></li>
    </ul>
    <div class="box box_1">
        <div class="pic">
            
        </div>
        
        <div class="info">
           <div class="small_info">
            <h2 class="sub_title">${detailMap.shop_name}</h2>
            <p class="title_bottom">${detailMap.address}</p>
        </div>
        <div class="regular"><a href=""><span><i class="fas fa-check"></i></span>단골<span>1</span></a></div>
        </div>
    </div>
    <div class="box box_2">
        <p class="txt">${detailMap.content}</p>
        <p class="check">조회 ${detailMap.view_count}</p>
    </div>
      <div class="box box_3">
            <ul class="good">
                <li><a href=""><i class="far fa-thumbs-up"></i></a></li>
                <li>좋아요</li>
                <li>${detailMap.like_count}</li>
            </ul>
            <ul class="comment">
                <li><a href=""><i class="far fa-comment"></i></a></li>
                <li>댓글</li>
                <li>${detailMap.comment_count}</li>
            </ul>
        </div>
        <div class="box input_box">
            <input id="newsComment" type="text" placeholder="댓글을 입력해 주세요.">
            <button id="newsCommentBtn">등록</button>
        </div>
        
        <c:choose>
        	<c:when test="${empty commentsList}">
		        <div class="box no_comment">
		            <li><i class="fas fa-comment-dots"></i></li>
		            <li>아직 댓글이 없어요.</li>
		            <li>가장 먼저 댓글을 남겨보세요.</li>
		        </div>
        	</c:when>
        	<c:otherwise>
	        	<c:forEach items="${commentsList}" var="obj">
	        		<div>
			        	<section id="comment">
						    <div class="box">
						        <div class="pic"><img style="width: 100%;height: 100%;border-radius: 50%;" src="${root}/upload/${obj.profile_image}"></div>
						        <div class="info">
						            <h3 class="title">${obj.name}
							           
						            <c:if test="${obj.name eq detailMap.nickName}">
							            <span>작성자</span>
						            </c:if>
						            </h3>
						            <p class="place">${obj.regdate}<span>&#8226;</span>0초</p>
						            <p class="txt">${obj.content}</p>
						            <a href="">답글쓰기</a>
						        </div>
						        <div class="bar"><a href=""><i class="fas fa-ellipsis-v"></i></a></div>
						    </div>
						</section>
					</div>
	        	</c:forEach>
        	</c:otherwise>
        </c:choose>
        

        <ul class="box inquire">
            <li><a href=""><i class="far fa-heart"></i></a></li>
            <li><a href="">전화문의</a></li>
            <li><a href="">채팅문의</a></li>
        </ul>
        
</section>

<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
$(function(){
    var swiper = new Swiper('#view_more .swiper-container', {
    
    loop: true,
    speed: 1000,
//          autoplay: {
//            delay: 3000,
//            disableOnInteraction: false,
          
//          },

//    pagination: {
//        el: '#view_more .swiper-pagination',
//    },

//    navigation: {
//        nextEl: '#view_more .swiper-button-next',
//        prevEl: '#view_more .swiper-button-prev',
//    },

//   scrollbar: {
//        el: '#view_more .swiper-scrollbar',
//    },
	});
    
    $('#newsCommentBtn').on('click',function(){
    

    	const comment = $('#newsComment').val();

    	if(comment == ''){
    		alert('내용을 입력해주세요!');
    		return;
    	}
    	
    	const shopNewsId = '${detailMap.shop_news_id}';
    	
    	$.ajax({
    		url:'${root}/front/shop/newsinsertComment/'+shopNewsId+'/'+comment,
    		type:'get',
    		success:function(){
    			location.href="${root}/front/shop/shop_news_extend?shopNewsId="+shopNewsId;
    		}
    	});
    });

}); 
</script>

</body>
</html>