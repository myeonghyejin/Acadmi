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
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../../temp/professor_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../../temp/student_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
				<!-- 2레벨 Sidebar 적용 -->
			<div class="container-fluid">
				<div class="row">
					<div class="content-wrapper">
							<c:import url="../../temp/sidebar/student_lecture_main.jsp"></c:import>
					</div>
					<!-- 2레벨 Sidebar 끝 -->'
					<!-- Contents -->
					<div class="col" style="padding-top:80px">
					<form action="./main" method="get">
		            	<table class="table table-bordered" style="text-align: center;">
		            		
							                <tbody>
							                	<tr>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;vertical-align:middle;" rowspan="2">담당교수</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">성명</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">전화번호</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">연구실</th>
							                		<th style="background-color:#f8f9fa;color:#17a2b8;">이메일</th>
							                	</tr>
							                	<tr>
							                		<td>${lecture.professorVO.name}</td>
							                		<td>${lecture.professorVO.phone}</td>
							                		<td>${lecture.professorVO.professorRoom}</td>
							                		<td>${lecture.professorVO.email }</td>
							                	</tr>
							                	
											</tbody>
										</table>
	                	<div class="card">
							<!-- table-header start -->
							<div class="card-header"style="background-color:#f8f9fa;">
					        	<h3 class="card-title" style="font-weight:normal;">강의 개요</h3>
					        </div>
              				<div class="card-body">
              					<div row>
	              					<div class="column">
	              						<i class="fas fa-microphone"></i>
	                					<a href="#">공지사항</a>
	                				</div>
	                				<div class="column">
	                				<i class="fas fa-question"></i>
	                					<a href="#">질의응답</a>
	                				</div>
                				</div>
              				</div>
              				<!-- table-body end -->
            			</div>
            			<div class="card">
									<!-- table-header start -->
									<div class="card-header" style="height:60px;background-color: #17a2b8;">
					                	<h3 class="card-title" style="font-weight:normal;color:white;margin-top: 10px">주차별 학습목표</h3>
									</div>
					              	<!-- table-header end -->
              
              						<!-- table-body start -->
              						<div class="card-body table-responsive p-0">
                						<table class="table table-hover text-nowrap">
                  							<thead>
                    					
											</thead>
								            <tbody>
									            <c:if test="${not empty classes}">
									            	<c:forEach items="${classes}" var="classes">
				                    				<tr>
				                    					<td><h5>${classes.order}주차 학습목표</h5><br>${classes.subject}</td>
				                    				 </tr>
				                    				 </c:forEach>	
			                    				 </c:if>
			                    				 <c:if test="${empty classes}">
				                    				<tr>
				                    					<td><h6 style="margin-top: 10px; color: gray;">현재 학습 목표가 없습니다</h6></td>
				                    				 </tr>
			                    				 </c:if>		
			                    			</tbody>
                						</table>
              						</div>
              						<!-- table-body end -->
            					</div>

					</form>
				</div>
				</div>
			</div>
	</div>
	
</body>
</html>