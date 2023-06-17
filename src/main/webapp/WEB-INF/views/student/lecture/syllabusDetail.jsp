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
			<c:import url="../../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../../temp/professor_header.jsp"></c:import>
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
					<div class="col">
						<!-- header start -->
						<div class="row" style="padding-top:10px">
							<div class="col-12">
								<div class="card">
									<h3 class="my-3 mx-3">강의계획서 열람</h3>
								</div>
							</div>
						</div>
						<!-- header end -->
					
						<!-- form start -->
						<form action="./add" method="post">
							<div class="card card-default">
	          					<!-- card-header start -->
								<div class="card-body">
									<h3 class="my-3 mx-3" style="text-align:center;margin-top:40px;">${lecture.year}년도 ${lecture.semester}학기 강의계획서</h3>
									<input type="hidden" name="lectureNum" value="${lecture.lectureNum}">
									<div class="row" style="margin-top: 20px">
	              						<!-- table-body start -->
	              						<div class="card-body">
		              						<c:if test="${empty lectureVO.syllabusVO.syllabusNum}">
		              							<div style="vertical-align:middle;text-align:center;">
		              								<h5 style="color:gray;">현재 강의계획서가 작성되지 않았습니다.</h5>
		              							</div>
		              						</c:if>
		              						<c:if test="${not empty lectureVO.syllabusVO.syllabusNum}">
		                						<table class="table table-bordered" style="text-align: center;">
									                <tbody>
									                	<tr>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">강의 이름</th>
									                		<td colspan="3">${lectureVO.lectureName}</td>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">교과 구분</th>
									                		<td colspan="3">${lectureVO.category}</td>
									                	
									                	</tr>
									                	<tr>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">강의 번호</th>
									                		<td>${lectureVO.lectureNum}</td>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">학부(과)</th>
									                		<td>${lectureVO.departmentVO.deptName}</td>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">학년</th>
									                		<td>${lectureVO.grade}학년</td>
									                		
									                	</tr>
									                	<tr>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">수업 시간</th>
									                		<td>${lectureVO.weekday}
									                			(
										                		<c:if test="${lectureVO.startTime eq 1}"> 09:00</c:if>
																<c:if test="${lectureVO.startTime eq 2}"> 10:00</c:if>
																<c:if test="${lectureVO.startTime eq 3}"> 11:00</c:if>
																<c:if test="${lectureVO.startTime eq 4}"> 12:00</c:if>
																<c:if test="${lectureVO.startTime eq 5}"> 13:00</c:if>
																<c:if test="${lectureVO.startTime eq 6}"> 14:00</c:if>
																<c:if test="${lectureVO.startTime eq 7}"> 15:00</c:if>
																<c:if test="${lectureVO.startTime eq 8}"> 16:00</c:if>
																<c:if test="${lectureVO.startTime eq 9}"> 17:00</c:if>
																<c:if test="${lectureVO.startTime eq 10}"> 18:00</c:if>
										                		~
										                		<c:if test="${lectureVO.endTime eq 1}"> 09:00</c:if>
																<c:if test="${lectureVO.endTime eq 2}"> 10:00</c:if>
																<c:if test="${lectureVO.endTime eq 3}"> 11:00</c:if>
																<c:if test="${lectureVO.endTime eq 4}"> 12:00</c:if>
																<c:if test="${lectureVO.endTime eq 5}"> 13:00</c:if>
																<c:if test="${lectureVO.endTime eq 6}"> 14:00</c:if>
																<c:if test="${lectureVO.endTime eq 7}"> 15:00</c:if>
																<c:if test="${lectureVO.endTime eq 8}"> 16:00</c:if>
																<c:if test="${lectureVO.endTime eq 9}"> 17:00</c:if>
																<c:if test="${lectureVO.endTime eq 10}"> 18:00</c:if>
																)
									                		</td>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">수업 장소</th>
									                		<td>${lectureVO.lectureBuilding}${lecture.lectureRoom}</td>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">학점</th>
									                		<td>${lectureVO.completionGrade}학점</td>
									                	</tr>
													</tbody>
												</table>
												
												<table class="table table-bordered" style="text-align: center;margin-top: 20px">
									                <tbody>
									                	<tr>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">교과 개요</th>
									                		<td colspan="3">${lectureVO.syllabusVO.curriculumOutline}</td>
									                	</tr>
									                	<tr>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;vertical-align:middle;" rowspan="2">목표</th>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">수업 방식</th>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">목표</th>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">평가 방법</th>
									                	</tr>
									                	<tr>
									                		<td>${lectureVO.syllabusVO.method}</td>
									                		<td>${lectureVO.syllabusVO.goal}</td>
									                		<td>${lectureVO.syllabusVO.evaluation}</td>
									                	</tr>
													</tbody>
												</table>
												
												<table class="table table-bordered" style="text-align: center;margin-top: 20px">
									                <tbody>
									                	<tr>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;vertical-align:middle;width:210px" rowspan="4">교재 및 참고문서</th>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">교재명</th>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">저자</th>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">출판사</th>
									                	</tr>
									                	<tr>
									                		<td>${lectureVO.syllabusVO.bookName}</td>
									                		<td>${lectureVO.syllabusVO.bookAuthor}</td>
									                		<td>${lectureVO.syllabusVO.bookPublisher}</td>
									                	</tr>
									                	<tr>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">출판년도</th>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">ISBN</th>
									                		<th style="background-color:#f8f9fa;color:#17a2b8;">비고</th>
									                	</tr>
									                	<tr>
									                		<td>${lectureVO.syllabusVO.bookPublicationDate}</td>
									                		<td>${lectureVO.syllabusVO.bookISBN}</td>
									                		<td>${lectureVO.syllabusVO.bookNote}</td>
									                	</tr>
													</tbody>
												</table>
												
												<table class="table table-bordered" style="text-align: center;margin-top: 20px">
		                    						<tbody>
			                    						<tr style="background-color:#f8f9fa;color:#17a2b8;">
			                    							<th>차수</th>
		                    								<th>수업 주제</th>
		                    								<th>주차별 수업 목표</th>
		                    								<th>관련 역량</th>
		                    								<th>비고</th>
			                    						</tr>
				                    					<c:forEach items="${classes}" var="classes">
				                    					<!-- class라는 객체가 java에 있기 때문에 class로 출력이 안됨 -->
				                    						<tr>
				                    							<td style="vertical-align:middle;">${classes.order}차수</td>
			                    								<td>${classes.subject}</td>
			                    								<td>${classes.goal}</td>
			                    								<td>${classes.capability}</td>
			                    								<td>${classes.note}</td>
			                    							</tr>
				                    					</c:forEach>
		                    						</tbody>
		                    					</table>
		                    				</c:if>
										</div>
	              						<!-- table-body end -->
									</div>
								</div>
							</div>
						</form>
						<!-- form end -->
					</div>
					<!-- Contents end -->
				</div>
			</div>
		</div>
		<!-- Main Contents start -->
		
		<!-- Footer 적용 -->
		<c:import url="../../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
	</div>
	<!-- ./wrapper -->
</body>
</html>