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
	<style type="text/css">
	.sidebar-dropdown{
	height:87.5vh !important
	}
	</style>
	
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../temp/lecture_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->

		<!-- Main Contents start -->
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- 2레벨 Sidebar 적용 -->
					<c:import url="../temp/sidebar/professor_lecture.jsp"></c:import>
					<!-- 2레벨 Sidebar 끝 -->
				
					<!-- Contents start -->
					<div class="col">
						<!-- header start -->
						<div class="row" style="padding-top:10px">
							<div class="col-12">
								<div class="card">
									<h3 class="my-3 mx-3">강의 상세</h3>
								</div>
							</div>
						</div>
						<!-- header end -->
						
						<!-- body start -->
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
								            	<th style="background-color:#f8f9fa;color:#17a2b8;">강의 연도</th>
								                <td colspan="2">${lecture.year}년</td>
								                <th style="background-color:#f8f9fa;color:#17a2b8;">강의 학기</th>
								                <td colspan="2">${lecture.semester}학기</td>
											</tr>
								            <tr>
								            	<th style="background-color:#f8f9fa;color:#17a2b8;">학부(과)</th>
								                <td colspan="2">${lecture.departmentVO.deptName}</td>
								                <th style="background-color:#f8f9fa;color:#17a2b8;">교과 구분</th>
								                <td colspan="2">${lecture.category}</td>
											</tr>
								            <tr>
								            	<th style="background-color:#f8f9fa;color:#17a2b8;">강의 요일</th>
								                <td>${lecture.weekday}요일</td>
								                <th style="background-color:#f8f9fa;color:#17a2b8;">시작 시간</th>
								                <td>
								                	${lecture.startTime}교시(
									                <c:if test="${lecture.startTime eq 1}"> 09:00</c:if>
													<c:if test="${lecture.startTime eq 2}"> 10:00</c:if>
													<c:if test="${lecture.startTime eq 3}"> 11:00</c:if>
													<c:if test="${lecture.startTime eq 4}"> 12:00</c:if>
													<c:if test="${lecture.startTime eq 5}"> 13:00</c:if>
													<c:if test="${lecture.startTime eq 6}"> 14:00</c:if>
													<c:if test="${lecture.startTime eq 7}"> 15:00</c:if>
													<c:if test="${lecture.startTime eq 8}"> 16:00</c:if>
													<c:if test="${lecture.startTime eq 9}"> 17:00</c:if>
													<c:if test="${lecture.startTime eq 10}"> 18:00</c:if>
													)
								                </td>
								                <th style="background-color:#f8f9fa;color:#17a2b8;">종료 시간</th>
												<td>
								                	${lecture.endTime}교시(
									                <c:if test="${lecture.endTime eq 1}"> 09:00</c:if>
													<c:if test="${lecture.endTime eq 2}"> 10:00</c:if>
													<c:if test="${lecture.endTime eq 3}"> 11:00</c:if>
													<c:if test="${lecture.endTime eq 4}"> 12:00</c:if>
													<c:if test="${lecture.endTime eq 5}"> 13:00</c:if>
													<c:if test="${lecture.endTime eq 6}"> 14:00</c:if>
													<c:if test="${lecture.endTime eq 7}"> 15:00</c:if>
													<c:if test="${lecture.endTime eq 8}"> 16:00</c:if>
													<c:if test="${lecture.endTime eq 9}"> 17:00</c:if>
													<c:if test="${lecture.endTime eq 10}"> 18:00</c:if>
													)
								                </td>
								            </tr>
								            <tr>
								            	<th style="background-color:#f8f9fa;color:#17a2b8;">대상 학년</th>
								                <td>${lecture.grade}학년</td>
								                <th style="background-color:#f8f9fa;color:#17a2b8;">수강 인원</th>
								                <td>${lecture.personal}명</td>
								                <th style="background-color:#f8f9fa;color:#17a2b8;">학점</th>
								                <td>${lecture.completionGrade}학점</td>
											</tr>
										</tbody>
									</table>
			            		</div>
							</div>
						</form>
						<!-- body end -->
					</div>
					<!-- Contents end -->
				</div>
			</div>
		</div>
		<!-- Main Contents end -->
		
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
		
	</div>
	<!-- ./wrapper -->
</body>
</html>