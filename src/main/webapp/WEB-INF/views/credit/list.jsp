<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../temp/professor_header.jsp"></c:import>
		</sec:authorize>
			
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->
		
		<!-- Main Contents -->
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:10px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">성적 관리</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					
					<!-- form start -->
					<form action="./list" method="get">
						<div class="row">
							<div class="col-12">
								<div class="card">
              
              						<!-- table-body start -->
              						<div class="card-body table-responsive p-0">
                						<table class="table table-hover" style="text-align: center;">
				                    		<thead>
					                    		<tr>
					                    			<th style="width: 150px">강의번호</th>
					                    			<th>강의 이름</th>
					                    			<th>강의 연도</th>
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
					                    				<td>${LectureVO.year}년도</td>
				 										<td>${LectureVO.semester}학기</td>
				 										<td>${LectureVO.grade}학년</td>
				 										<td>${LectureVO.category}</td>
				 										<td>
				 											<a class="btn btn-info" href="./attendee?lectureNum=${LectureVO.lectureNum}" style="color: white;">학생 조회</a>
				 										</td>
					                    			</tr>
					                    		</c:forEach>
					                    	</tbody>
				                    	</table>
              						</div>
              						<!-- table-body end -->
            					</div>
							</div> 
						</div>
					</form>
					<!-- form end -->
				</div>
			</div>
		
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
	<!-- ./wrapper -->
</body>
</html>