<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<c:import url="../temp/header.jsp"></c:import>
	<h1>학과 관리</h1>
	
	<table class="table table-hover" border="1">
		<thead>
			<tr>
				<th>학과번호</th>
				<th>단과대학</th>
				<th>학과</th>
				<th>사용여부</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="collegeVO">
				<c:set value="${collegeVO.collegeName}" var="collegeName"></c:set>
				<c:forEach items="${collegeVO.departmentVOs}" var="departmentVO">
					<c:set value="${departmentVO.deptNum}" var="deptNum"></c:set>
					<c:set value="${departmentVO.deptName}" var="deptName"></c:set>
					<c:set value="${departmentVO.status}" var="status"></c:set>
					<tr>
						<td><c:out value="${deptNum}"></c:out></td>
						<td><c:out value="${collegeName}"></c:out></td>
						<td><c:out value="${deptName}"></c:out></td>
						<c:if test="${status eq 0 }">
							<td style="color:red;">비활성화</td>
						</c:if>
						<c:if test="${status eq 1 }">
							<td>활성화</td>
						</c:if>
						<td></td>
					</tr>
				</c:forEach>
				
			</c:forEach>
		</tbody>
	</table>
	
	<c:if test="${pagination.pre}">
		<a href="./departmentList?page=${pagination.startNum-1}">이전</a>
	</c:if>
	<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
   	 	<a href="./departmentList?page=${i}">${i}</a>
   	 </c:forEach>		
   	<c:if test="${pagination.next}">
		<a href="./departmentList?page=${pagination.lastNum+1}">다음</a>
	</c:if> 
</body>
</html>