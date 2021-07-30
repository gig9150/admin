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
<section id="MN000" class="content">
       <div class="top">
            <div class="top_left">   
                <input type="text" placeholder="검색어를 입력해주세요">
                <a href=""><i class="fas fa-search"></i></a>
            </div>
            <div class="top_right">
                <a href="" class="bell_1"><i class="far fa-bell"></i></a>
                <a href="" class="bell_2">20</a>
            </div>
        </div>
        
        <ul id="gnb">
            <li><a href="${root}/front/home">홈</a></li>
            <li><a href="${root}/front/shop/shop_promotion">가게홍보</a></li>
            <li><a href="">산지직거래</a></li>
            <li><a href="">중고장터</a></li>
            <li><a href="">일상</a></li>
        </ul>
        
        <div class="swiper-container box_4">
           <div class="sub_title_box">
                <h2 class="sub_title">공주시 가게를 소개합니다</h2>
                <ul class="view_more">
                    <li><a href="">더보기</a></li>
                    <li><a href=""><i class="fas fa-chevron-right"></i></a></li>
                </ul>
            </div>
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                            <div class="sub_box">
                                <div class="pic"></div>
                                <div class="info">
                                    <ul class="sub_info sub_info_1">
                                        <li>휘연</li>
                                        <li>반포면</li>
                                        <li>영업중</li>
                                    </ul>
                                    <ul class="sub_info sub_info_2">
                                        <li>까페/매일</li><br>
                                        
                                        <li>11&#58;00&#126;21&#58;00</li>
                                    </ul>
                                    <ul class="sub_info sub_info_3">
                                        <li><i class="far fa-comment"></i></li>
                                        <li>000</li><br>
                                        <li><i class="fas fa-heart"></i></li>
                                        <li>000</li>
                                    </ul>
                                </div>
                            </div>
                </div>
                <div class="swiper-slide">
                     <div class="sub_box">
                                <div class="pic"></div>
                                <div class="info">
                                    <ul class="sub_info sub_info_1">
                                        <li>휘연</li>
                                        <li>반포면</li>
                                        <li>영업중</li>
                                    </ul>
                                    <ul class="sub_info sub_info_2">
                                        <li>까페/매일</li><br>
                                        
                                        <li>11&#58;00&#126;21&#58;00</li>
                                    </ul>
                                    <ul class="sub_info sub_info_3">
                                        <li><i class="far fa-comment"></i></li>
                                        <li>000</li><br>
                                        <li><i class="fas fa-heart"></i></li>
                                        <li>000</li>
                                    </ul>
                                </div>
                            </div>
                </div>
                <div class="swiper-slide">
                     <div class="sub_box">
                                <div class="pic"></div>
                                <div class="info">
                                    <ul class="sub_info sub_info_1">
                                        <li>휘연</li>
                                        <li>반포면</li>
                                        <li>영업중</li>
                                    </ul>
                                    <ul class="sub_info sub_info_2">
                                        <li>까페/매일</li><br>
                                        
                                        <li>11&#58;00&#126;21&#58;00</li>
                                    </ul>
                                    <ul class="sub_info sub_info_3">
                                        <li><i class="far fa-comment"></i></li>
                                        <li>000</li><br>
                                        <li><i class="fas fa-heart"></i></li>
                                        <li>000</li>
                                    </ul>
                                </div>
                            </div>
                </div>
            </div>
        </div>
        
        
        <div class="swiper-container box_5">
           <div class="sub_title_box">
                <h2 class="sub_title">농수산물, 신선하게 직거래로</h2>
                <ul class="view_more">
                    <li><a href="">더보기</a></li>
                    <li><a href=""><i class="fas fa-chevron-right"></i></a></li>
                </ul>
            </div>
            <div class="swiper-wrapper">
                <div class="swiper-slide">    
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                    
                    
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                </div>
                   <div class="swiper-slide">
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li class="icon"><i class="fas fa-star"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li class="icon"><i class="far fa-comment"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li class="icon"><i class="fas fa-heart"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                </div>
                 
            </div>
            <div class="swiper-pagination"></div>
        </div>
        
        
        <div class="swiper-container box_6">
           <div class="sub_title_box">
                <h2 class="sub_title">오늘부터 절약하는 중고장터</h2>
                <ul class="view_more">
                    <li><a href="">더보기</a></li>
                    <li><a href=""><i class="fas fa-chevron-right"></i></a></li>
                </ul>
            </div>
            <div class="swiper-wrapper">
                <div class="swiper-slide">    
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                    
                    
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                </div>
                   <div class="swiper-slide">
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li><i class="fas fa-star icon"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="far fa-comment icon"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li><i class="fas fa-heart icon"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                    <div class="sub_box">
                        <div class="pic"></div>
                        <div class="info">
                            <h3 class="info_title">유기농 햅쌀 2kg</h3>
                            <ul class="sub_info sub_info_2">
                                <li>20%</li><br>
                                <li>12,000원</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_3">
                                <li>공주시반포면</li>
                                <li>&#8226;</li><br>
                                <li>1일전</li>
                                
                            </ul>
                            <ul class="sub_info sub_info_4">
                               <li>
                                   <ul>
                                       <li class="icon"><i class="fas fa-star"></i></li>
                                       <li>4.5</li>
                                       <li>/5</li>
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li class="icon"><i class="far fa-comment"></i></li>
                                       <li>2</li>
                                       
                                   </ul>
                               </li>
                               <li>
                                   <ul>
                                       <li class="icon"><i class="fas fa-heart"></i></li>
                                       <li>0</li>
                                       
                                   </ul>
                               </li>
                                
                                
                            </ul>
                        </div>
                        <div class="right_box">
                            <a href=""><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                </div>
                 
            </div>
            <div class="swiper-pagination"></div>
        </div>
        
        <div class="swiper-container box_7">
           <div class="sub_title_box">
                <h2 class="sub_title">시민들과 일상을나눠요</h2>
                <ul class="view_more">
                    <li><a href="">더보기</a></li>
                    <li><a href=""><i class="fas fa-chevron-right"></i></a></li>
                </ul>
            </div>
            <div class="swiper-wrapper">
                <div class="swiper-slide">    
                    <div class="sub_box">
                       <div class="top_box">
                            <div class="pic"><i class="fas fa-user"></i></div>
                            <div class="info">
                                <h3 class="info_title">홍길동</h3>
                                <ul class="sub_info sub_info_2">
                                    <li>반포면</li><br>
                                    <li>&#8226;</li>
                                    <li>1개월 전</li>
                                </ul>

                            </div>
                        </div>
                        <div class="txt_box">
                                <p>공주시 동네사람만 아는 맛집 추천드립니다~<br>진짜 맛있어요 꼭 가세요</p>
                            </div>
                       
                    </div>
                    
                    
                     <div class="sub_box">
                        <div class="top_box">
                            <div class="pic"><i class="fas fa-user"></i></div>
                            <div class="info">
                                <h3 class="info_title">홍길동</h3>
                                <ul class="sub_info sub_info_2">
                                    <li>반포면</li><br>
                                    <li>&#8226;</li>
                                    <li>1개월 전</li>
                                </ul>

                            </div>
                        </div>
                        <div class="txt_box">
                                <p>공주시 동네사람만 아는 맛집 추천드립니다~<br>진짜 맛있어요 꼭 가세요</p>
                            </div>
                       
                    </div>
                </div>
                   <div class="swiper-slide">
                     <div class="sub_box">
                        <div class="top_box">
                            <div class="pic"><i class="fas fa-user"></i></div>
                            <div class="info">
                                <h3 class="info_title">홍길동</h3>
                                <ul class="sub_info sub_info_2">
                                    <li>반포면</li><br>
                                    <li>&#8226;</li>
                                    <li>1개월 전</li>
                                </ul>

                            </div>
                        </div>
                        <div class="txt_box">
                                <p>공주시 동네사람만 아는 맛집 추천드립니다~<br>진짜 맛있어요 꼭 가세요</p>
                            </div>
                       
                    </div>
                     <div class="sub_box">
                        <div class="top_box">
                            <div class="pic"><i class="fas fa-user"></i></div>
                            <div class="info">
                                <h3 class="info_title">홍길동</h3>
                                <ul class="sub_info sub_info_2">
                                    <li>반포면</li><br>
                                    <li>&#8226;</li>
                                    <li>1개월 전</li>
                                </ul>

                            </div>
                        </div>
                         <div class="txt_box">
                                <p>공주시 동네사람만 아는 맛집 추천드립니다~<br>진짜 맛있어요 꼭 가세요</p>
                            </div>
                       
                    </div>
                </div>
                <div class="swiper-slide">
                     <div class="sub_box">
                       <div class="top_box">
                            <div class="pic"><i class="fas fa-user"></i></div>
                            <div class="info">
                                <h3 class="info_title">홍길동</h3>
                                <ul class="sub_info sub_info_2">
                                    <li>반포면</li><br>
                                    <li>&#8226;</li>
                                    <li>1개월 전</li>
                                </ul>

                            </div>
                        </div>
                       <div class="txt_box">
                            <p>공주시 동네사람만 아는 맛집 추천드립니다~<br>진짜 맛있어요 꼭 가세요</p>
                        </div>
                    </div>
                     <div class="sub_box">
                        <div class="top_box">
                            <div class="pic"><i class="fas fa-user"></i></div>
                            <div class="info">
                                <h3 class="info_title">홍길동</h3>
                                <ul class="sub_info sub_info_2">
                                    <li>반포면</li><br>
                                    <li>&#8226;</li>
                                    <li>1개월 전</li>
                                </ul>

                            </div>
                        </div>
                        <div class="txt_box">
                       		<p>공주시 동네사람만 아는 맛집 추천드립니다~<br>진짜 맛있어요 꼭 가세요</p>
                        </div> 
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
        <div class="box bottom_box">
            <div class="box">
                <div class="pic"><i class="fas fa-home"></i></div>
                <div class="info"><a href="${root}/front/shop/shop_promotion">홈</a></div>
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
                <div class="info"><a href="${root}/front/myPage">MY</a></div>
            </div>
        </div>
        
        
    </section>
</body>
</html>