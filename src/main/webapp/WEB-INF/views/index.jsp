<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="./temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:import url="./temp/administrator_header.jsp"></c:import>
			<div class="content-wrapper">
				<c:import url="./temp/student_index.jsp"></c:import>
			</div>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="./temp/administrator_header.jsp"></c:import>
			<div class="content-wrapper">
				<c:import url="./temp/student_index.jsp"></c:import>
			</div>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="./temp/professor_header.jsp"></c:import>
			<!-- Header 끝 -->
			<div class="content-wrapper row">
				<c:import url="./temp/professor_index.jsp"></c:import>
			</div>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="./temp/student_header.jsp"></c:import>
			<div class="content-wrapper">
				<c:import url="./temp/student_index.jsp"></c:import>
			</div>
		</sec:authorize>

		<!-- Footer 적용 -->
		<c:import url="./temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
</div>
<!-- ./wrapper -->
</body>
</html>