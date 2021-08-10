<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<style>

   	.two-collapse span{
   		position: relative;
   	
   	}
        
   	.two-collapse span::after {
	   content: '';
	    width: 10px;
	    height: 10px;
	    border-top: 5px solid;
	    border-right: 5px solid #121212;
	    display: inline-block;
	    transform: rotate(
			135deg
			);
	    position: absolute;
	   	top: 2px;
    	left: 90px;
	}
	
</style>
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${root}">
<!--                 <div class="sidebar-brand-icon rotate-n-15"> -->
<!--                     <i class="fas fa-laugh-wink"></i> -->
<!--                 </div> -->
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>전시관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="buttons.html">추천 메인페이지 관리</a>
                        <a class="collapse-item" href="${root}/exhibition/promotion_account">가게홍보 큐레이션 관리</a>
                        <a class="collapse-item" href="${root}/exhibition/curation_list">전시 등록 관리</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>관리자계정 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${root}/manager/manage_franchise">가맹사 관리</a>
                        <a class="collapse-item" href="${root}/manager/manage_notice">관리자 공지관리</a>
                        <a class="collapse-item" href="${root}/manager_admi/manager_account">운영계정 관리</a>
                        <a class="collapse-item" href="${root}/manager_admi/manager_role">운영자 역할관리</a>
                        <a class="collapse-item" href="${root}/manager/manager_activity">운영자 활동 내역</a>
                        <a class="collapse-item" href="${root}/manager/manager_access">운영자 접속 내역</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#c"
                    aria-expanded="true" aria-controls="c">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>계정 관리</span>
                </a>
                <div id="c" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    	<a class="collapse-item" href="${root}/account_manage/member">일반회원 관리</a>
                        <a class="collapse-item" href="${root}/account_manage/shop_list">가게 리스트</a>
                        <a class="collapse-item" href="${root}/account_manage/shop_apply_list">가게 신청 심사</a>
                        <a class="collapse-item" href="${root}/account_manage/penalty">패널티관리</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#h"
                    aria-expanded="true" aria-controls="g">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>이벤트 관리</span>
                </a>
                <div id="h" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="">쿠폰 관리</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#d"
                    aria-expanded="true" aria-controls="d">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>콘텐츠 관리</span>
                </a>
                <div id="d" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${root}/content/news_manage">가게 콘텐츠 관리</a>
                        <a class="collapse-item" href="register.html">회원 콘텐츠 관리</a>
                        <a class="collapse-item two-collapse" href="javascript:void(0);">거래관리<span></span></i></a>
                        <a class="collapse-item two-collapse-item" style="display:none;padding-left: 35px;" href="">거래내역</a>
                        <a class="collapse-item two-collapse-item" style="display:none;padding-left: 35px;" href="">후기내역</a>
                        <a class="collapse-item" href="${root}/content/prohibited_word">금지어 관리</a>
                    </div>
                </div>
            </li>


            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#e"
                    aria-expanded="true" aria-controls="e">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>운영 관리</span>
                </a>
                <div id="e" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${root}/operation/question">1:1문의 관리</a>
                        <a class="collapse-item" href="${root}/operation/report">신고문의 관리</a>
                        <a class="collapse-item" href="${root}/operation/FAQ">FAQ 관리</a>
                        <a class="collapse-item" href="${root}/operation/notice">공지사항 관리</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#g"
                    aria-expanded="true" aria-controls="e">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>마케팅 관리</span>
                </a>
                <div id="g" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">Push 알림</a>
                        <a class="collapse-item" href="register.html">채팅 설정</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#f"
                    aria-expanded="true" aria-controls="f">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>통계</span>
                </a>
                <div id="f" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">가계 통계</a>
                        <a class="collapse-item" href="register.html">회원 통계</a>
                        <a class="collapse-item" href="forgot-password.html">가게 콘텐츠 통계</a>
                        <a class="collapse-item" href="404.html">회원 콘텐츤 통계</a>
                        <a class="collapse-item" href="blank.html">거래 통계</a>
                        <a class="collapse-item" href="blank.html">쿠폰 통계</a>
                        <a class="collapse-item" href="blank.html">신고/문의 통계</a>
                        <a class="collapse-item" href="blank.html">패널티 통계</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->
        
        
 <script>

// 	$(function(){
		
// 		$('.two-collapse').on('click',function(){
// 			$('.two-collapse-item').slideToggle("slow", function() {
				
// 			})
// 		});
		
// 	});
	
</script>
       