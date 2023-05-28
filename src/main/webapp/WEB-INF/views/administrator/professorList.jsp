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
<c:import url="../temp/header.jsp"></c:import>
<body>
	<h1>교수 목록 조회</h1>
	<table class="table table-hover" border="1">
		<thead>
   	 		`	<tr>
   	 				<th>쪽지</th>
   	 				<th>사진</th>
   	 				<th>성명</th>
   	 				<th>담당대학</th>
   	 				<th>담당학과</th>
   	 				<th>연락처</th>
   	 				<th>이메일</th>
   	 				<th>사무실</th>
   	 				<th>상태</th>
   	 			</tr>
   	 		</thead>
   	 		<tbody>
   	 			<c:forEach items="${list}" var="collegeVO">
   	 			<tr>
					<c:set var="collegeName" value="${collegeVO.collegeName}"></c:set>
					<c:set var="collegeBuilding" value="${collegeVO.building}"></c:set>
					<c:forEach items="${collegeVO.departmentVOs}" var="departmentVO">
						<c:set var="department" value="${departmentVO.deptName}"></c:set>
						<c:forEach items="${departmentVO.professorVOs}" var="professorVO">
							<c:set var="professorName" value="${professorVO.name}"></c:set>
							<c:set var="professorPhone" value="${professorVO.phone}"></c:set>
							<c:set var="professorEmail" value="${professorVO.email}"></c:set>
							<c:set var="professorRoom" value="${professorVO.professorRoom}"></c:set>
							<c:set var="professorStatus" value="${professorVO.status}"></c:set>
							<tr>
								<c:forEach items="${professorVO.memberFilesVOs}" var="memberFilesVO">
									<td><img src="/file/member/${memberFiles.fileName}"></td>
								</c:forEach>
							<td></td>
							<td></td>
							<td><c:out value="${professorName}"></c:out></td>
							<td><c:out value="${collegeName}"></c:out></td>	
							<td><c:out value="${department}"></c:out></td>
							<td><c:out value="${professorPhone}"></c:out></td>
							<td><c:out value="${professorEmail}"></c:out></td>
							<td>
							<c:out value="${collegeBuilding} "></c:out><c:out value="${professorRoom}호"></c:out>
							</td>
							<c:if test="${professorStatus eq 1}">
								<td>재직</td>
							</c:if>
							<c:if test="${professorStatus eq 2}">
								<td>휴직</td>
							</c:if>
							<c:if test="${professorStatus  eq 3}">
								<td>퇴임</td>
							</c:if>
							</tr>
						</c:forEach>
					</c:forEach>
				</tr>		
   	 			</c:forEach>
   	 		</tbody>
   	 </table>
   	 <c:if test="${pagination.pre}">
		<a href="./professorList?page=${pagination.startNum-1}">이전</a>
	</c:if>
   	 
   	 <c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
   	 	<a href="./professorList?page=${i}">${i}</a>
   	 </c:forEach>		
   	  <c:if test="${pagination.next}">
		<a href="./professorList?page=${pagination.lastNum+1}">다음</a>
	</c:if>
</body>
</html>