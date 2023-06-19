<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
			<c:import url="../../temp/student_header.jsp"></c:import>
		</sec:authorize>
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
					<div class="row justify-content-center mx-auto mt-2 mb-4">
						<div class="col-3">
							<label>수강 연도</label>
							<select class="select2" style="width: 100%;" name="year">
								<option value="${year}" ${param.year == year ? 'selected' : ''}>${year}</option>
								<option value="${year - 1}" ${param.year == year - 1 ? 'selected' : ''}>${year - 1}</option>
								<option value="${year - 2}" ${param.year == year - 2 ? 'selected' : ''}>${year - 2}</option>
								<option value="${year - 3}" ${param.year == year - 3 ? 'selected' : ''}>${year - 3}</option>
								<option value="${year - 4}" ${param.year == year - 4 ? 'selected' : ''}>${year - 4}</option>
							</select>
						</div>
						<div class="col-3">
							<label>수강 학기</label>
							<select class="select2" style="width: 100%;" name="semester">
								<option value="1" ${param.semester == '1' ? 'selected' : ''}>1학기</option>
								<option value="2" ${param.semester == '2' ? 'selected' : ''}>2학기</option>
							</select>
						</div>
						<button type="submit" class="btn btn-default" style="height: 50%; margin-top: auto; margin-left: 7px;">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
				
				<!-- Content -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title" style="line-height: 200%;">${year}년 ${semester eq 1 ? '1' : '2'}학기</h3>
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
													<th scope="col" style="width: 15%">월요일</th>
													<th scope="col" style="width: 15%">화요일</th>
													<th scope="col" style="width: 15%">수요일</th>
													<th scope="col" style="width: 15%">목요일</th>
													<th scope="col" style="width: 15%">금요일</th>
												</tr>
											</thead>				
											<tbody>
												<c:forEach begin="1" end="10" var="hour">
													<tr>
														<th scope="row" style="height: 80px;">${hour + 8}:00</th>
															<c:set var="lectureExists" value="false" />
														<c:forEach items="${day}" var="day">
															<c:set var="hasLecture" value="false" />
															<c:forEach items="${list}" var="lectureVO">
																<c:if test="${lectureVO.weekday eq day && lectureVO.startTime <= hour && lectureVO.endTime >= hour}">
																	<td class="timetable-workout" data-lecture-num="${lectureVO.lectureNum}">${lectureVO.lectureName}<br>
																		<small>${lectureVO.professorVO.username}</small><br>
																	<small>${lectureVO.lectureRoomVO.lectureBuilding} ${lectureVO.lectureRoomVO.lectureRoom}</small>
																	</td>
																	<c:set var="hasLecture" value="true" />
																	<c:set var="lectureExists" value="true" />
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
	
    //강의 식별자에 따라 랜덤 색상을 할당하는 함수
    function assignRandomColorToLectures() {
        let blocks = document.getElementsByClassName("timetable-workout");

        //강의 식별자를 저장할 배열
        let ids = [];

        //강의 식별자 수집
        for (let i = 0; i < blocks.length; i++) {
            let num = blocks[i].getAttribute("data-lecture-num");
            ids.push(num);
        }

        //중복 제거를 위해 Set으로 변환 후 다시 배열로 변환
        let unique = [...new Set(ids)];

        //각 강의 식별자에 랜덤 색상 할당
        for (let j = 0; j < unique.length; j++) {
            let num = unique[j];
            let color = generateRandomColor();
            let elements = document.querySelectorAll("[data-lecture-num='" + num + "']");

            for (let k = 0; k < elements.length; k++) {
                elements[k].style.backgroundColor = color;
            }
        }
    }

	//#17a2b8의 hue 값 (192)를 기준으로 랜덤한 hue 값을 생성하는 함수
    function generateSimilarHue() {
      const baseHue = 192;
      const hueRange = 40; //hue 값을 조절할 범위

      const minHue = (baseHue - hueRange + 360) % 360; //기준 hue 값에서 범위를 뺀 최소 hue 값
      const randomHue = Math.floor(Math.random() * (hueRange * 2 + 1)) + minHue; //범위 내에서 랜덤한 hue 값

      return randomHue % 360; //hue 값이 360을 초과하면 360으로 나눈 나머지 값을 반환
    }
    
    //색상 생성을 위한 함수
    function generateRandomColor() {
        let hue = generateSimilarHue();
        let saturation = 50; //채도는 일정한 값으로 설정
        let lightness = 50; //명도는 일정한 값으로 설정

        return "hsl(" + hue + ", " + saturation + "%, " + lightness + "%)";
    }

    //페이지 로드 시에 색상 할당
    window.onload = function() {
        assignRandomColorToLectures();
    };
</script>
</body>
</html>