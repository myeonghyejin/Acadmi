<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<c:import url="../temp/header.jsp"></c:import>
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper">
					<c:import url="../temp/sidebar/professor_lecture.jsp"></c:import>
				</div>
				<!-- 2레벨 Sidebar 끝 -->
				
				<!-- Contents -->
				<div class="col">
					<h1>${main.lectureName} 메인 페이지</h1>
					<form action="./main" method="get">
		            	<div class="row gx-5 my-3">
		                	<table class="table table-hover">
		                    	<thead style="background-color: black; color: white;">
			                    	<tr>
			                    		<th>교수명</th>
			                    		<th>사무실</th>
			                    		<th>전화번호</th>
			                    		<th>이메일</th>
			                    	</tr>
			                    </thead>
			                    <tbody>
			                    	<tr>
			                    		<td>${main.professorVO.name}</td>
			                    		<td>${main.professorVO.professorRoom}</td>
		 								<td>${main.professorVO.phone}</td>
		 								<td>${main.professorVO.email}</td>
			                    	</tr>
			                    </tbody>
		                    </table>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
</body>
</html>