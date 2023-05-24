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
			<h1>중요 공지사항</h1>
			<table>
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
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
</body>
</html>