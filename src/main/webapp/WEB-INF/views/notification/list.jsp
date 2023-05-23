<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		 	<tr>
		 		<c:forEach items="${list}" var="notificationVO">
		 			<td>${notificationVO.notificationNum}</td>
		 			<td>
		 				<c:if test="${notificationVO.notificationKind eq 1}">
		 					[공지]${notificationVO.notificationMsg}
		 				</c:if>
		 				<c:if test="${notificationVO.notificationKind eq 2}">
		 					[답글]${notificationVO.notificationMsg}
		 				</c:if>
					</td>
					<td>${notificationVO.notificationDate}</td>
		 		</c:forEach>
		 	</tr>
		 </tbody>
	</table>
	
</body>
</html>