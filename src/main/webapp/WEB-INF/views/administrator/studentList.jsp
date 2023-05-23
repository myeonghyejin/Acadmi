<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
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
     	 				<th>학번</th>	
     	 				<th>성명</th>
     	 				<th>연락처</th>
     	 				<th>단과대</th>
     	 				<th>학과</th>
     	 				<th>학년</th>
     	 				<th>학적상태</th>
     	 			</tr>
     	 		</thead>
     	 		<tbody>
     	 		
     	 			<c:forEach items="${list}" var="collegeVO">
     	 				<tr>
     	 				<c:set var="college" value="${collegeVO.collegeName}"></c:set>
     	 					<c:forEach items="${collegeVO.departmentVOs}" var="departmentVO">
     	 						<c:set var="department" value="${departmentVO.deptName}"></c:set>
     	 						<c:forEach items="${departmentVO.studentVOs}" var="studentVO">
     	 							<c:set var="studentName" value="${studentVO.name}"></c:set>
     	 							<c:set var="studentUsername" value="${studentVO.username}"></c:set>
     	 							<c:set var="studentPhone" value="${studentVO.phone}"></c:set>
     	 							<c:set var="studentGrade" value="${studentVO.grade}"></c:set>
     	 							<c:set var="studentStatus" value="${studentVO.status}"></c:set>
     	 						<tr>
     	 							<c:forEach items="${studentVO.memberFilesVOs}" var="memberFilesVO">
     	 								<tr>
											<td><img src="/${memberFilesVO.fileName}"></td>
										</tr>
     	 							</c:forEach>
     	 							<td></td>
     	 							<td></td>
     	 							<td><c:out value="${studentUsername}"></c:out></td>
			     	 				<td><c:out value="${studentName}"></c:out></td>
			     	 				<td><c:out value="${studentPhone}"></c:out></td>
			     	 				<td><c:out value="${college}"></c:out></td>
			     	 				<td><c:out value="${department}"></c:out></td>
			     	 				<td><c:out value="${studentGrade}"></c:out></td>
			     	 				<c:if test="${studentStatus eq 1}">
			     	 					<td>재학</td>
			     	 				</c:if>
			     	 				<c:if test="${studentStatus eq 2 }">
			     	 					<td>휴학</td>
			     	 				</c:if>
			     	 				<c:if test="${studentStatus eq 3 }">
			     	 					<td>퇴학</td>
			     	 				</c:if>
			     	 				<c:if test="${studentStatus eq 4 }">
			     	 					<td>졸업</td>
			     	 				</c:if>
			     	 				<c:if test="${studentStatus eq 5 }">
			     	 					<td>졸업유예</td>
			     	 				</c:if>
     	 						</tr>	
     	 						</c:forEach>
     	 					</c:forEach>
     	 				</tr>
     	 			</c:forEach>
     	 			
     	 		</tbody>
     	 	</table>
</body>
</html>