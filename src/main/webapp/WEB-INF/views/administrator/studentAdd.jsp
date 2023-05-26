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
<c:import url="../temp/header.jsp"></c:import>
<body>
	<h1>학생 계정 생성</h1>
	<form action="./studentAdd" method="post">
		입학년도 <input type="text" name="username"><br>
		비밀번호 <input type="text" name="password"><br>
		이메일 <input type="text" name="email"><br>
		학과 
		<!-- 학과 테이블에서 뽑아오기 -->
		<!-- 일단 컴퓨터공학과를 deptNum 1로 넣어주시고 제가 수정할꺼에요~ 일단 계정 생성이 급하다고 하셨으니... -->
		<select name="deptNum">
			<option value="1">컴퓨터공학과</option>
		</select><br>
		이름 <input type="text" name="name"><br>
		전화번호 <input type="text" name="phone"><br>
		생년월일 <input type="text" name="birth"><br>
		주소 <input type="text" name="address"><br>
		<input type="hidden" name="category" value="2">
		
		<button type="submit">학생가입</button>
		
	</form>
</body>
</html>