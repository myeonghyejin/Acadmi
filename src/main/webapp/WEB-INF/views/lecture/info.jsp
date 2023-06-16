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
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper">
					<c:import url="../temp/sidebar/professor_lecture.jsp"></c:import>
				</div>
				<!-- 2레벨 Sidebar 끝 -->
				
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:20px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">강의 상세</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					<form action="./info" method="get">
						<div class="card card-default">
						<input type="hidden" name="lectureNum" value="${lecture.lectureNum}">
          					<!-- card-header start -->
          					<div class="card-body">
          						<table class="table table-bordered" style="text-align: center;">
							    	<tbody>
							        	<tr>
							            	<th style="background-color:#f8f9fa;color:#17a2b8;">강의 이름</th>
							                <td colspan="5">${lecture.lectureName}</td>
										</tr>
							            <tr>
							            	<th style="background-color:#f8f9fa;color:#17a2b8;">강의연도</th>
							                <td colspan="2">${lecture.year}년</td>
							                <th style="background-color:#f8f9fa;color:#17a2b8;">강의학기</th>
							                <td colspan="2">${lecture.semester}학기</td>
										</tr>
							            <tr>
							            	<th style="background-color:#f8f9fa;color:#17a2b8;">학부(과)</th>
							                <td colspan="2">${lecture.departmentVO.deptName}</td>
							                <th style="background-color:#f8f9fa;color:#17a2b8;">교과구분</th>
							                <td colspan="2">${lecture.category}</td>
										</tr>
							            <tr>
							            	<th style="background-color:#f8f9fa;color:#17a2b8;">강의요일</th>
							                <td>${lecture.weekday}요일</td>
							                <th style="background-color:#f8f9fa;color:#17a2b8;">강의시간</th>
							                <td>${lecture.startTime}교시</td>
							                <th style="background-color:#f8f9fa;color:#17a2b8;">종료시간</th>
											<td>${lecture.endTime}교시</td>
							            </tr>
							            <tr>
							            	<th style="background-color:#f8f9fa;color:#17a2b8;">대상학년</th>
							                <td>${lecture.grade}학년</td>
							                <th style="background-color:#f8f9fa;color:#17a2b8;">수강인원</th>
							                <td>${lecture.personal}명</td>
							                <th style="background-color:#f8f9fa;color:#17a2b8;">학점</th>
							                <td>${lecture.completionGrade}학점</td>
										</tr>
									</tbody>
								</table>
		            		</div>
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