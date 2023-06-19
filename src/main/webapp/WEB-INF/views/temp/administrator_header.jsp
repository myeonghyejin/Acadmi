<%@page import="com.acadmi.department.DepartmentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
					<div class="dropdown-divider"></div>
				<a href="/notification/list" class="dropdown-item dropdown-footer">알림 전체보기</a>
			</div>
		</li>
	
		

		<!-- 채팅 -->
		<li class="nav-item dropdown">
			<a class="nav-link" href="/chat/list">
				<i class="far fa-comments"></i>
				<span class="badge badge-danger navbar-badge" id="chat"></span>
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
<aside class="main-sidebar sidebar-dark-info elevation-4">
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
				
				<img src="/images/profile.jpg" class="img-circle elevation-2" alt="User Image">
				
				<sec:authentication property="Principal" var="user"/>
				<a href="/member/administratorPage?username=${user.username}" style="margin-left: 8px">${user.username}</a>
			</div>
		</div>
		

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
			<!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
			
				<!-- 게시판 -->
				<li class="nav-item" id="boardItem">
					<a href="#" class="nav-link" id="boardLink">
						<i class="nav-icon fas fa-comment-dots"></i>
						<p>
							게시판
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/notice/list" class="nav-link" id="noticeLink">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>공지사항</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="/qna/list" class="nav-link" id="qnaLink">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>질의 응답</p>
							</a>
						</li>
					</ul>
				</li>
				
				<!-- 강의 관리 -->
				<li class="nav-item" id="administratorLectureItem">
					<a href="#" class="nav-link" id="administratorLectureLink">
						<i class="nav-icon fas fa-chalkboard"></i>
						<p>
							강의 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/administrator/lectureList" class="nav-link" id="administratorLectureList">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>강의 목록</p>
							</a>
						</li>
					</ul>
				</li>
	
				<!-- 회원 관리 -->
				<li class="nav-item" id="memberItem">
					<a href="#" class="nav-link" id="memberLink">
						<i class="nav-icon fa-solid fa-user-group"></i>
						<p>
							회원 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/administrator/studentAdd" class="nav-link" id="acountLink">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>계정 관리</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="/administrator/studentList" class="nav-link" id="acountList">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>회원 목록</p>
							</a>
						</li>
					</ul>
				</li>
				
				<!-- 기간 관리 -->
				<li class="nav-item" id="periodItem">
					<a href="#" class="nav-link" id="periodLink">
						<i class="nav-icon fa-regular fa-clock"></i>
						<p>
							기간 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/administrator/periodAdd" class="nav-link" id="periodAddLink">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>기간 설정</p>
							</a>
						</li>
					</ul>
					
				</li>
				
				<!-- 강의실 관리 -->
				<li class="nav-item" id="lectureRoomItem">
					<a href="#" class="nav-link" id="lectureRoomLink">
						<i class="nav-icon fa-solid fa-door-open"></i>
						<p>
							강의실 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/administrator/lectureRoomList" class="nav-link" id="lectureRoomList">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>강의실 목록</p>
							</a>
						</li>
					</ul>
					
				</li>
				
				<!-- 학사 관리 -->
				<li class="nav-item" id="departmentItem">
					<a href="#" class="nav-link" id="departmentLink">
						<i class="nav-icon fa-regular fa-address-card"></i>
						<p>
							학과 관리
							<i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						
						<li class="nav-item">
							<a href="/administrator/departmentList" class="nav-link" id="departmentList">
								<i class="fa-solid fa-circle fa-2xs"></i>
								<p>학과 목록</p>
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