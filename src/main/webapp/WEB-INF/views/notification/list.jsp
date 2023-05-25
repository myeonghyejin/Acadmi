<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<c:import url="../temp/header.jsp"></c:import>
		<!-- Header 끝 -->
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- 2레벨 Sidebar 적용 -->
					<!-- <div class="content-wrapper">
					</div> -->
					<!-- 2레벨 Sidebar 끝 -->
					
					<!-- Contents -->
					<div class="col">
						<div class=layout>
							<div>
								<ul class="navbar navbar-pills nav-fill">
									<li class="nav-item">
										<a class="nav-link" href="./list?notificationKind=1">공지사항</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./list?notificationKind=2">질의응답</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./list?notificationKind=3">질의응답 답글</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./list?notificationKind=4">강의공지사항</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./list?notificationKind=5">강의질의응답</a>
									</li><li class="nav-item">
										<a class="nav-link" href="./list?notificationKind=6">강의질의응답 답글</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="./list?notificationKind=7">강의등록</a>
									</li>
								</ul>
							</div>
							<div class="row">
								<table class="table">
									 <thead>
									 	<tr>
									 		<th>번호</th>
									 		<th>알림</th>
									 		<th>날짜</th>
									 	</tr>
									 </thead>
									 <tbody>
									 	<c:forEach items="${list}" var="notificationVO">
									 		<tr>
									 			<td>${notificationVO.notificationNum}</td>
									 			<td>
									 				<c:if test="${notificationVO.notificationKind eq 1}">
									 					[공지]
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 2}">
									 					[답글]
									 				</c:if>
									 				${notificationVO.notificationMsg}
												</td>
												<td>${notificationVO.notificationDate}</td>
									 		</tr>
									 	</c:forEach>
									 </tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
	<script src="../js/notification/notificationList.js"></script>
</body>
</html>