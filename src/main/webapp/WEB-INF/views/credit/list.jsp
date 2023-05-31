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
					<section class="bg-light py-5">
		                <div class="container px-5 my-5">
		                <h1 class="fw-bolder">성적 관리</h1>
		                <form action="./list" method="get">
		                    <div class="row gx-5 my-3">
		                    	<table class="table table-hover">
		                    		<thead style="background-color: black; color: white;">
			                    		<tr>
			                    			<th>강의번호</th>
			                    			<th>강의이름</th>
			                    			<th>강의년도</th>
			                    			<th>학기</th>
			                    			<th>학년</th>
			                    			<th>구분</th>
			                    			<th>성적 관리</th>
			                    		</tr>
			                    	</thead>
			                    	<tbody>
			                    		<c:forEach items="${list}" var="LectureVO">
			                    			<tr>
			                    				<td>${LectureVO.lectureNum}</td>
			                    				<td>${LectureVO.lectureName}</td>
			                    				<td>${LectureVO.year}</td>
		 										<td>${LectureVO.semester}학기</td>
		 										<td>${LectureVO.grade}</td>
		 										<td>${LectureVO.category}</td>
		 										<td><button class="btn btn-primary">
		 											<a href="./attendee?lectureNum=${LectureVO.lectureNum}" style="color: white;">학생 조회</a>
		 										</button></td>
			                    			</tr>
			                    		</c:forEach>
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