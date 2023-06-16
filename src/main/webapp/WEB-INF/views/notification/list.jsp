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
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../temp/professor_header.jsp"></c:import>
		</sec:authorize>
			
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->
		
		<!-- Contents -->
		<div class="content-wrapper">
			<div class="col">
				<section class="content">
					<!-- 알림의 종류의 네비바 -->					
					<div class="btn-group w-100 mb-2 my-3">
						<a class="btn btn-info" href="./list?notificationKind=1" id="noticeButton">공지사항</a>
						<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
							<a class="btn btn-info" href="./list?notificationKind=2" id="qnaButton">질의응답</a>
							<a class="btn btn-info" href="./list?notificationKind=7" id="lectureButton">강의등록</a>
						</sec:authorize>
								
						<sec:authorize access="hasRole('ROLE_PROFESSOR')">
							<a class="btn btn-info" href="./list?notificationKind=3" id="qnaReplyButton">질의응답</a>
							<a class="btn btn-info" href="./list?notificationKind=5" id="lectureQnaButton">강의 질의응답</a>
						</sec:authorize>
								
						<sec:authorize access="hasRole('ROLE_STUDENT')">
							<a class="btn btn-info" href="./list?notificationKind=3" id="qnaReplyButton">질의응답</a>
							<a class="btn btn-info" href="./list?notificationKind=4" id="lectureNoticeButton">강의 공지사항</a>
							<a class="btn btn-info" href="./list?notificationKind=6" id="lectureQnaReplyButton">강의 질의응답</a>
						</sec:authorize>
					</div>
				
					<!-- 알림 내용 -->
					<div class="card">
						<div class="card-header">
							<h3 class="card-title" id="cardTitle"></h3>
						</div>
						<div class="card-body p-0" id="allLectureList">
							<table class="table table-hover text-nowrap">
								 <thead>
								 	<tr>
								 		<th style="width: 8%">번호</th>
								 		<th style="width: 8%">알림</th>
								 		<th style="width: 8%">날짜</th>
								 		<th style="width: 8%"></th>
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
								 					<a href="../qna/detail?num=${notificationVO.num}&notificationNum=${notificationVO.notificationNum}">
								 				</c:if>
								 				<c:if test="${notificationVO.notificationKind eq 3}">
								 					<a href="../qna/detail?num=${notificationVO.num}&notificationNum=${notificationVO.notificationNum}">
								 				</c:if>
								 				<c:if test="${notificationVO.notificationKind eq 4}">
								 					<a href="../lectureNotice/detail?num=${notificationVO.num}&notificationNum=${notificationVO.notificationNum}">
								 				</c:if>
								 				<c:if test="${notificationVO.notificationKind eq 5}">
								 					<a href="../lectureQna/detail?num=${notificationVO.num}&notificationNum=${notificationVO.notificationNum}">
								 				</c:if>
								 				<c:if test="${notificationVO.notificationKind eq 6}">
								 					<a href="../lectureQna/detail?num=${notificationVO.num}&notificationNum=${notificationVO.notificationNum}">
								 				</c:if>
								 				<c:if test="${notificationVO.notificationKind eq 7}">
								 					<a href="../administrator/lectureRoomAssignment?lectureNum=${notificationVO.lectureNum}&notificationNum=${notificationVO.notificationNum}">
								 				</c:if>
								 						${notificationVO.notificationMsg}
								 					</a>
											</td>
											<td>${notificationVO.notificationDate}</td>
											<c:if test="${notificationVO.notificationStatus == 0 or notificationVO.notificationStatus == 1}">
												<td><button type="button" class="float-right btn btn-info saveNotification" data-notification-num="${notificationVO.notificationNum}" data-notification-kind="${notificationVO.notificationKind}">알림보관</button></td>
											</c:if>
											<c:if test="${notificationVO.notificationStatus eq 2}">
												<td><button type="button" class="float-right btn btn-danger cancleNotification" data-notification-num="${notificationVO.notificationNum}" data-notification-kind="${notificationVO.notificationKind}">보관취소</button></td>
											</c:if>
								 		</tr>
								 	</c:forEach>
								 </tbody>
							</table>
						</div>
					</div>
				</section>
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