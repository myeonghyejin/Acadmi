<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
							<!-- 알림의 종류의 네비바 -->
							<div>
								<ul class="navbar navbar-pills nav-fill">
									<li class="nav-item">
										<a class="nav-link" href="./list?notificationKind=1">공지사항</a>
									</li>
									<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
										<li class="nav-item">
											<a class="nav-link" href="./list?notificationKind=2">질의응답</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="./list?notificationKind=7">강의등록</a>
										</li>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_PROFESSOR')">
										<li class="nav-item">
											<a class="nav-link" href="./list?notificationKind=3">질의응답 답글</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="./list?notificationKind=5">강의질의응답</a>
										</li><li class="nav-item">
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_STUDENT')">
										<li class="nav-item">
											<a class="nav-link" href="./list?notificationKind=3">질의응답 답글</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="./list?notificationKind=4">강의공지사항</a>
										</li>
										<li>
											<a class="nav-link" href="./list?notificationKind=6">강의질의응답 답글</a>
										</li>
									</sec:authorize>
								</ul>
							</div>
							<!-- 알림 내용 -->
							<div class="row">
								<table class="table">
									 <thead>
									 	<tr>
									 		<th>번호</th>
									 		<th>알림</th>
									 		<th>날짜</th>
									 		<th></th>
									 	</tr>
									 </thead>
									 <tbody>
									 	<c:forEach items="${list}" var="notificationVO">
									 		<tr>
									 			<td>${notificationVO.notificationNum}</td>
									 			<td>
									 				<!-- 나중에 a링크 경로 바꿔야한다 -->
									 				<c:if test="${notificationVO.notificationKind eq 1}">
									 					<a href="../notice/detail?num=${notificationVO.num}&notificationNum=${notificationVO.notificationNum}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 2}">
									 					<a href="../qna/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 3}">
									 					<a href="../qna/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 4}">
									 					<a href="../lecture/notice/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 5}">
									 					<a href="../lecture/qna/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 6}">
									 					<a href="../lecture/qna/detail?num=${notificationVO.num}">
									 				</c:if>
									 				<c:if test="${notificationVO.notificationKind eq 7}">
									 					<a href="../lecture/detail?num=${notificationVO.lectureNum}">
									 				</c:if>
									 						${notificationVO.notificationMsg}
									 					</a>
												</td>
												<td>${notificationVO.notificationDate}</td>
												<c:if test="${notificationVO.notificationStatus == 0 or notificationVO.notificationStatus == 1}">
													<td><button type="button" class="float-right btn btn-primary saveNotification" data-notification-num="${notificationVO.notificationNum}" data-notification-kind="${notificationVO.notificationKind}">알림저장</button></td>
												</c:if>
												<c:if test="${notificationVO.notificationStatus eq 2}">
													<td><button type="button" class="float-right btn btn-primary cancleNotification" data-notification-num="${notificationVO.notificationNum}" data-notification-kind="${notificationVO.notificationKind}">저장취소</button></td>
												</c:if>
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
		<script src="../js/notification/notificationList.js"></script>
	</div>
<!-- ./wrapper -->
</body>
</html>