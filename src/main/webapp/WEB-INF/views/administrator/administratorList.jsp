<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<c:import url="../temp/administrator.jsp"></c:import>
	<h1>직원 목록 조회</h1>
	
	
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
   	 			<c:forEach items="${departmentVO.administratorVOs}" var="administratorVO">
   	 				<c:set var="administratorName" value="${administratorVO.name}"></c:set>
   	 				<c:set var="administratorPhone" value="${administratorVO.phone}"></c:set>
   	 				<c:set var="administratorEmail" value="${administratorVO.email}"></c:set>
   	 				<c:set var="administratorStatus" value="${administratorVO.status}"></c:set>
   	 				<tr>
	   	 				<c:forEach items="${administratorVO.memberFilesVOs}" var="memberFilesVO">
	   	 					<c:set var="memberFiles" value="${memberFilesVO.fileName}"></c:set>
	   	 				</c:forEach>
	   	 			<td></td>
	   	 			<td>
	   	 				<img alt="" src="/file/${board}/${boardFileVO.fileName}" width="500rem" height="500rem">
	   	 			</td>
	   	 			<td><c:out value="${administratorName}"></c:out></td>
	   	 			<td><c:out value="${administratorPhone}"></c:out></td>
	   	 			<td><c:out value="${administratorEmail}"></c:out></td>
	   	 			<td><c:out value="${department}"></c:out></td>
	   	 			<c:if test="${administratorStatus eq 1}">
	   	 				<td>재직</td>
	   	 			</c:if>
	   	 			<c:if test="${administratorStatus eq 2}">
	   	 				<td>휴직</td>
	   	 			</c:if>
	   	 			<c:if test="${administratorStatus eq 3}">
	   	 				<td>퇴직</td>
	   	 			</c:if>
   	 				</tr>
   	 			</c:forEach>
   	 		</tr>	
   	 		</c:forEach>
   	 	</tbody>
	</table>
	
	<c:if test="${pagination.pre}">
		<a href="./administratorList?page=${pagination.startNum-1}">이전</a>
	</c:if>
	<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
   	 	<a href="./administratorList?page=${i}">${i}</a>
   	 </c:forEach>		
   	<c:if test="${pagination.next}">
		<a href="./administratorList?page=${pagination.lastNum+1}">다음</a>
	</c:if> 
</body>
</html>