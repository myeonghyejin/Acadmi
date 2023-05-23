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
							<c:forEach items="${professorVO.memberFilesVOs}" var="memberFilesVO">
								<c:set var="memberFiles" value="${memberFilesVO.fileName}"></c:set>
							</c:forEach>
						</c:forEach>
					</c:forEach>
					<td></td>
					<td><img src="/file/member/${memberFiles.fileName}"></td>
					<td><c:out value="${professorName}"></c:out></td>
					<td><c:out value="${collegeName}"></c:out></td>	
					<td><c:out value="${department}"></c:out></td>
					<td><c:out value="${professorPhone}"></c:out></td>
					<td><c:out value="${professorEmail}"></c:out></td>
					<td>
					<c:out value="${collegeBuilding} "></c:out><c:out value="${professorRoom}"></c:out>
					</td>
					<td><c:out value="${professorStatus}"></c:out></td>
				</tr>		
   	 			</c:forEach>
   	 		</tbody>
   	 </table>		
</body>
</html>