<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../../temp/style.jsp"></c:import>
	<link rel="stylesheet" href="/css/timetable.css">
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<c:import url="../../temp/header.jsp"></c:import>
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="content-wrapper">
			<div class="col">

				<!-- header start -->
				<div class="row">
					<div class="col mt-3">
						<div class="card">
							<h3 class="my-3 mx-3">시간표 조회</h3>
						</div>
					</div>
				</div>
				<!-- header end -->
				
				<!-- Search -->					
				<form action="./timetable" method="get">
					<div class="row mx-3 mt-2 mb-4">
						<div class="col-3">
							<label>수강 연도</label>
							<select class="select2" style="width: 100%;" name="year">
								<option value="${year - 2}">${year - 2}</option>
								<option value="${year - 1}">${year - 1}</option>
								<option value="${year}" selected>${year}</option>
								<option value="${year + 1}">${year + 1}</option>
								<option value="${year + 2}">${year + 2}</option>
							</select>
						</div>
						<div class="col-3">
							<label>수강 학기</label>
							<select class="select2" style="width: 100%;" name="semester">
								<option value="1" ${semester eq 1 ? 'selected' : ''}>1학기</option>
								<option value="2" ${semester eq 2 ? 'selected' : ''}>2학기</option>
							</select>
						</div>
						<button type="submit" class="btn btn-default">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
				
				<!-- Content -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title" style="line-height: 200%;">${year}년 ${semester eq 1 ? '1' : '2'}학기</h3>
						<div class="card-tools">
							
							<div class="btn-group">
								<button type="button" class="btn btn-info" id="pre">
									<span aria-hidden="true">&laquo;</span>
								</button>
								<button type="button" class="btn btn-info" id="next">
									<span aria-hidden="true">&raquo;</span>
								</button>
							</div>
						</div>
					</div>
				
					<div class="card-body p-0">
						<!-- time-table -->
						<div class="content">
							<div class="container">
								<div class="row">
									<div class="table-responsive">
										<table class="timetable table table-striped mt-3">
											<thead>
												<tr class="text-center">
													<th scope="col" style="width: 10%"></th>
													<th scope="col" style="width: 15%">Monday</th>
													<th scope="col" style="width: 15%">Tuesday</th>
													<th scope="col" style="width: 15%">Wednesday</th>
													<th scope="col" style="width: 15%">Thursday</th>
													<th scope="col" style="width: 15%">Friday</th>
												</tr>
											</thead>				
											<tbody>
												<c:forEach begin="1" end="10" var="hour">
													<tr>
														<th scope="row">${hour + 8}:00</th>
															<c:set var="lectureExists" value="false" />
														<c:forEach items="${day}" var="day">
															<c:set var="hasLecture" value="false" />
															<c:forEach items="${list}" var="lectureVO">
																<c:if test="${studentLectureVO.year eq year && studentLectureVO.semester eq semester}">
																	<c:if test="${lectureVO.weekday eq day && lectureVO.startTime <= hour && lectureVO.endTime >= hour}">
																		<td class="timetable-workout">${lectureVO.lectureName}<br>
																			<small>${lectureVO.professorVO.username}</small><br>
																		<small>${lectureVO.lectureRoomVO.lectureBuilding} ${lectureVO.lectureRoomVO.lectureRoom}</small>
																		</td>
																		<c:set var="hasLecture" value="true" />
																		<c:set var="lectureExists" value="true" />
																	</c:if>
																</c:if>
															</c:forEach>
															<c:if test="${not hasLecture}">
																<td></td>
															</c:if>
														</c:forEach>	
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								<!-- timetable -->
								</div>
							</div>
						</div>
						<!-- /.time-table -->
						</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
					
				<!-- the events -->
				<div id="external-events"></div>
			
			</div>
		</div>
		
	</div>
	<!-- ./wrapper -->

	<!-- Footer 적용 -->
	<c:import url="../../temp/footer.jsp"></c:import>
	<!-- Footer 끝 -->
<script>
	$(function () {
	    $('.select2').select2()
	  });
	
    const year = ${year}
	const semester = ${semester}
	
	$("#pre").on("click", function(){
		if(semester == 2) {
			location.href="./timetable?year="+year+"&semester=1";
		} else {
			location.href="./timetable?year="+(year-1)+"&semester=2";
		}
	})
	
	$("#next").on("click", function(){
		if(semester == 2) {
			location.href="timetable?year="+(year+1)+"&semester=1"
		} else {
			location.href="timetable?year="+year+"&semester=2"
		}
	})
</script>
</body>
</html>