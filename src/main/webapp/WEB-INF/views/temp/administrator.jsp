<%@page import="com.acadmi.department.DepartmentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Preloader -->
<div class="preloader flex-column justify-content-center align-items-center">
	<img class="animation__shake" src="/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
</div>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
		</li>		
	</ul>
	
	

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
	<!-- 알림 -->
		<li class="nav-item dropdown">
			<a class="nav-link" data-toggle="dropdown" href="#">
				<i class="far fa-bell"></i>
				<span class="badge badge-warning navbar-badge" id="notification"></span>
			</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<span class="dropdown-item dropdown-header" id="allNotification"></span>
					<div class="dropdown-divider"></div>
						<a href="/notification/list?notificationKind=1" class="dropdown-item">
							<i class="fas fa-envelope mr-2"></i> 
							<span id="noticeNotification"></span>
						</a>
					<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
					<div class="dropdown-divider"></div>
						<a href="/notification/list?notificationKind=2" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							<span id="qnaNotification"></span>
						</a>
					<div class="dropdown-divider"></div>
						<a href="/notification/list?notificationKind=7" class="dropdown-item">
							<i class="fas fa-file mr-2"></i>
							<span id="lectureNotification"></span>
						</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_PROFESSOR')">
						<a href="/notification/list?notificationKind=3" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							<span id="qnaReplyNotification"></span>
						</a>
						<a href="/notification/list?notificationKind=5" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							<span id="lectureQnaNotification"></span>
						</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_STUDENT')">
						<a href="/notification/list?notificationKind=4" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							<span id="lectureNoticeNotification"></span>
						</a>
						<a href="/notification/list?notificationKind=3" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							<span id="qnaReplyNotification"></span>
						</a>
						<a href="/notification/list?notificationKind=6" class="dropdown-item">
							<i class="fas fa-users mr-2"></i>
							<span id="lectureQnaReplyNotification"></span>
						</a>
					</sec:authorize>
					<div class="dropdown-divider"></div>
				<a href="/notification/list?notificationKind=1" class="dropdown-item dropdown-footer">알림 전체보기</a>
			</div>
		</li>
	
		

		<!-- 채팅 -->
		<li class="nav-item dropdown">
			<a class="nav-link" data-toggle="dropdown" href="#">
				<i class="far fa-comments"></i>
				<span class="badge badge-danger navbar-badge">3</span>
			</a>
		<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
			<a href="#" class="dropdown-item">
				<!-- Message Start -->
				<div class="media">
					<img src="/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
					<div class="media-body">
						<h3 class="dropdown-item-title">
							Brad Diesel
							<span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
						</h3>
						<p class="text-sm">Call me whenever you can...</p>
						<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
					</div>
				</div>
				<!-- Message End -->
			</a>
			<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item">
					<!-- Message Start -->
					<div class="media">
						<img src="/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								John Pierce
								<span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">I got your message bro</p>
							<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
						</div>
					</div>
					<!-- Message End -->
				</a>
			<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item">
					<!-- Message Start -->
					<div class="media">
						<img src="/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Nora Silvester
								<span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                			</h3>
							<p class="text-sm">The subject goes here</p>
							<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
						</div>
					</div>
					<!-- Message End -->
				</a>
			<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
			</div>
		</li>

		<!-- 전체 보기 -->
		<li class="nav-item">
			<a class="nav-link" data-widget="fullscreen" href="#" role="button">
				<i class="fas fa-expand-arrows-alt"></i>
			</a>
		</li>
		
		<!-- 로그아웃 -->
		<li class="nav-item">
			<a class="nav-link" href="/member/logout" role="button">
				<i class="fas fa-right-to-bracket"></i>
			</a>
		</li>
	</ul>
</nav>
	<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="/" class="brand-link">
		<img src="/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">Acadmi!</span>
    </a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block">Alexander Pierce</a>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
			<!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
			
				<!-- 게시판 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-chalkboard"></i>
						<p>
							게시판
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/notice/list" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>공지사항</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>질의 응답</p>
							</a>
						</li>
					</ul>
				</li>
				
				<!-- 강의 관리 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-chalkboard-user"></i>
						<p>
							강의 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>강의 목록</p>
							</a>
						</li>
					</ul>
				</li>
	
				<!-- 회원 관리 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-comment-dots"></i>
						<p>
							회원 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>계정 관리</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>회원 조회</p>
							</a>
						</li>
					</ul>
				</li>
				
				<!-- 기간 관리 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-comment-dots"></i>
						<p>
							기간 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>기간 관리</p>
							</a>
						</li>
					</ul>
					
				</li>
				
				<!-- 강의실 관리 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-comment-dots"></i>
						<p>
							강의실 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>강의실 목록</p>
							</a>
						</li>
					</ul>
					
				</li>
				
				<!-- 학사 관리 -->
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-comment-dots"></i>
						<p>
							학사 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/notice/list" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>단과대 관리</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>학과 관리</p>
							</a>
						</li>
					</ul>
				</li>
				
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>

<style>
.fa-circle {
	margin: 0 8px;
}
</style>
</body>
</html>