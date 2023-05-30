<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<div class="content-wrapper">
		
			<main class="flex-shrink-0">
			<c:import url="../temp/sidebar/professor_lecture.jsp"></c:import>
					<section class="bg-light py-5">
		                <div class="container px-5 my-5">
		                <h1 class="fw-bolder">${main.lectureName}</h1>
		                <form action="./list" method="get">
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
		           </section>
		              
		      </main>
		      </div>
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
</body>
</html>