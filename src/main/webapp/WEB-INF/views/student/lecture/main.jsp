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
	<c:import url="../../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
<title>Insert title here</title>
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
			<c:import url="../../temp/lecture_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->
		
		<!-- Main Contents start -->
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- 2레벨 Sidebar 적용 -->
					<c:import url="../../temp/sidebar/student_lecture_main.jsp"></c:import>
					<!-- 2레벨 Sidebar 끝 -->
					
					<!-- Contents start -->
					<div class="col" style="padding-top:80px">
						<form action="./main" method="get">
							<!-- 교수 정보 start -->
			            	<table class="table table-bordered" style="text-align: center;background-color:white;">
								<tbody>
									<tr>
								    	<th style="background-color:#ECEFF1;color:#17a2b8;vertical-align:middle;" rowspan="2">담당 교수</th>
										<th style="background-color:#ECEFF1;color:#17a2b8;">이름</th>
								        <th style="background-color:#ECEFF1;color:#17a2b8;">전화번호</th>
								        <th style="background-color:#ECEFF1;color:#17a2b8;">연구실</th>
								        <th style="background-color:#ECEFF1;color:#17a2b8;">이메일</th>
									</tr>
								    <tr>
								    	<td>${lecture.professorVO.name}</td>
								        <td>0${lecture.professorVO.phone}</td>
								        <td>${lecture.professorVO.professorRoom}</td>
								        <td>${lecture.professorVO.email}</td>
									</tr>
								</tbody>
							</table>
							<!-- 교수 정보 start -->
							
							<!-- 게시판 start -->
		                	<div class="card">
								<div class="card-header"style="background-color:#ECEFF1;color:#17a2b8;">
						        	<h3 class="card-title" style="font-size: 1.1rem;">강의 개요</h3>
						        </div>
	              				<div class="card-body">
		              				<div>
		              					<i class="fas fa-microphone"></i>
		                				<a href="/lectureNotice/list?lectureNum=${lecture.lectureNum}">공지사항</a>
		                			</div>
		                			<div>
		                				<i class="fas fa-question"></i>
		                				<a href="/lectureQna/list?lectureNum=${lecture.lectureNum}">질의응답</a>
		                			</div>
	                			</div>
	            			</div>
	            			<!-- 게시판 end -->
	            			
	            			<!-- 차수별 강의 목표 start -->
	            			<div class="card">
								<div class="card-header" style="height:60px;background-color: #17a2b8;">
						        	<h3 class="card-title" style="color:white;margin-top: 10px">주차별 학습 목표</h3>
								</div>
	              				<div class="card-body table-responsive p-0">
	                				<table class="table table-hover text-nowrap">
										<tbody>
											<c:if test="${not empty classes}">
										    	<c:forEach items="${classes}" var="classes">
					                    			<tr>
					                    				<td style="color:gray;"><h5 style="color:black;font-size: 1.1rem">${classes.order}주차 학습목표</h5>${classes.subject}</td>
					                    			</tr>
					                    		</c:forEach>	
				                    		</c:if>
				                    		<c:if test="${empty classes}">
					                    		<tr>
					                    			<td><h6 style="margin-top: 10px; color: gray;">현재 학습 목표가 없습니다.</h6></td>
					                    		</tr>
				                    		</c:if>		
				                    	</tbody>
	                				</table>
	              				</div>
	            			</div>
	            			<!-- 차수별 강의 목표 end -->
						</form>
					</div>
					<!-- Contents end -->
				</div>
			</div>
		</div>
		<!-- Main Contents end -->
		
		<!-- Footer 적용 -->
		<c:import url="../../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
	</div>
	<!-- ./wrapper -->
</body>
</html>