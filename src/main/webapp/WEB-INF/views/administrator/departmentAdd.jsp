<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>

<c:import url="../temp/administrator.jsp"></c:import>
	<h1>학과 등록</h1>
	
	<form action="./departmentAdd" method="post">
		<input type="hidden" name="deptNum" >
		단과대학
		<select name="collegeNum">
			<c:forEach items="${list}" var="collegeVO">
				<option value="${collegeVO.collegeNum}">${collegeVO.collegeName }</option>
			</c:forEach>
		</select><br>
		학과이름  <input type="text" name="deptName" ><br>
		
		<input type="radio" name="status" value="1" checked >사용가능
		<input type="radio" name="status" value="0"> 사용불가
		
		<button type="submit" >등록</button>
	</form>
</body>
</html>