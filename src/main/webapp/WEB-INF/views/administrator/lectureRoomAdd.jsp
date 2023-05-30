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
<c:import url="../temp/header.jsp"></c:import>
	<h1>강의실 등록</h1>
	
	<form action="./lectureRoomAdd" method="post">
		강의실 건물 
		<select name="lectureBuilding">
			<c:forEach items="${lectureRoom}" var="lectureRoom">
				<option value="${lectureRoom.lectureBuilding}">${lectureRoom.lectureBuilding}
			</c:forEach>
		</select>
		깅의실 호수 <input type="text" name="lectureRoom">
		최대수용인원 <input type="text" name="personal">
		
		<input type="radio" name="status" value="1" checked >사용가능
		<input type="radio" name="status" value="0" disabled> 사용불가
		
		<button type="submit">등록</button>
	</form>
	<script type="text/javascript" src="../js/administrator/lectureRoomAdd.js"></script>
</body>
</html>