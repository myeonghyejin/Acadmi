<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>행정 목록 조회</h1>
	
	<table class="table table-hover" border="1">
		<thead>
   	 		`	<tr>
   	 				<th>쪽지</th>
   	 				<th>사진</th>
   	 				<th>성명</th>
   	 				<th>연락처</th>
   	 				<th>이메일</th>
   	 				<th>담당학과</th>
   	 				<th>상태</th>
   	 			</tr>
   	 	</thead>
   	 	<tbody>
   	 		<c:forEach items="${list}" var="departmentVO">
   	 		<tr>
   	 			<c:set var="department" value="${departmentVO.deptName}"></c:set>
   	 			<c:forEach items="${departmentVO.adminIstratorVOs}" var="adminIstratorVO">
   	 				<c:set var="adminIstratorName" value="${adminIstratorVO.name}"></c:set>
   	 				<c:set var="adminIstratorPhone" value="${adminIstratorVO.phone}"></c:set>
   	 				<c:set var="adminIstratorEmail" value="${adminIstratorVO.email}"></c:set>
   	 				<c:set var="adminIstratorStatus" value="${adminIstratorVO.status}"></c:set>
   	 				<tr>
	   	 				<c:forEach items="${adminIstratorVO.memberFilesVOs}" var="memberFilesVO">
	   	 					<c:set var="memberFiles" value="${memberFilesVO.fileName}"></c:set>
	   	 				</c:forEach>
	   	 			<td></td>
	   	 			<td></td>
	   	 			<td><c:out value="${adminIstratorName}"></c:out></td>
	   	 			<td><c:out value="${adminIstratorPhone}"></c:out></td>
	   	 			<td><c:out value="${adminIstratorEmail}"></c:out></td>
	   	 			<td><c:out value="${department}"></c:out></td>
	   	 			<c:if test="${adminIstratorStatus eq 1}">
	   	 				<td>재직</td>
	   	 			</c:if>
	   	 			<c:if test="${adminIstratorStatus eq 2}">
	   	 				<td>휴직</td>
	   	 			</c:if>
	   	 			<c:if test="${adminIstratorStatus eq 3}">
	   	 				<td>퇴직</td>
	   	 			</c:if>
   	 				</tr>
   	 			</c:forEach>
   	 		</tr>	
   	 		</c:forEach>
   	 	</tbody>
	</table>
	
	<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
   	 	<a href="./adminIstratorList?page=${i}">${i}</a>
   	 </c:forEach>		
</body>
</html>