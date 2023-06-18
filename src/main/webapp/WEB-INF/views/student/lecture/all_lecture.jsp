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
	
		<div class="content-wrapper">
			<div class="col">
					
				<!-- header start -->
				<div class="row">
					<div class="col mt-3">
						<div class="card">
							<h3 class="mx-3 mt-3" style="margin-bottom: 0;">${year}년 ${semester}학기 수강 신청</h3>
							<div class="mx-3 mt-1 mb-3">
								<span style="font-size: 14px; color: #17a2b8;"><i class="fa-solid fa-calendar-check"></i>&nbsp;장바구니 기간 : ${period.favoriteStart} ~ ${period.favoriteEnd}</span>&ensp;
								<span style="font-size: 14px; color: #17a2b8;"><i class="fa-solid fa-calendar-check"></i>&nbsp;수강 신청 기간 : ${period.applicationStart} ~ ${period.applicationEnd}</span>
							</div>
						</div>
					</div>
				</div>
				<!-- header end -->
	
				<!-- Default box -->
				<div class="card">
					<div class="card-header">
						<!-- Search -->
						<form action="./all_lecture">
							<input type="hidden" name="year" value="${year}">
							<input type="hidden" name="semester" value="${semester}">
							<input type="hidden" name="page" value="1">
							<div class="row justify-content-center mx-auto my-3">
								<div class="col-md-6">
									<div class="row">
										<div class="col-4">
											<div class="form-group">
												<label>학과</label>
												<select class="select2" style="width: 100%;" name="department">
													<option value="">전체</option>
													<c:forEach items="${department}" var="departmentVO" begin="2">
														<option value="${departmentVO.deptNum}" ${param.department == departmentVO.deptNum ? 'selected' : ''}>${departmentVO.deptName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-4">
											<div class="form-group">
												<label>구분</label>
												<select class="select2" style="width: 100%;" name="category">
													<option value="">전체</option>
													<option value="전공 필수" ${param.category == '전공 필수' ? 'selected' : ''}>전공 필수</option>
													<option value="전공 선택" ${param.category == '전공 선택' ? 'selected' : ''}>전공 선택</option>
													<option value="교양 필수" ${param.category == '교양 필수' ? 'selected' : ''}>교양 필수</option>
													<option value="교양 선택" ${param.category == '교양 선택' ? 'selected' : ''}>교양 선택</option>
												</select>
											</div>
										</div>
										<div class="col-4">
											<div class="form-group">
												<label>학년</label>
												<select class="select2" style="width: 100%;" name="grade">
													<option value="">전체</option>
													<option value="1" ${param.grade == 1 ? 'selected' : ''}>1학년</option>
													<option value="2" ${param.grade == 2 ? 'selected' : ''}>2학년</option>
													<option value="3" ${param.grade == 3 ? 'selected' : ''}>3학년</option>
													<option value="4" ${param.grade == 4 ? 'selected' : ''}>4학년</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group input-group-lg">
											<input type="text" class="form-control form-control-lg" placeholder="강의 이름을 입력하세요." name="search" value="${pagination.search}">
											<div class="input-group-append">
												<button type="submit" class="btn btn-lg btn-default" id="submit">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
									
					<div class="card-body p-0" id="allLectureList">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr style="text-align: center;">
									<th style="width: 8%">강의 번호</th>
									<th style="width: 8%">강의 이름</th>
									<th style="width: 8%">학년</th>
									<th style="width: 8%">구분</th>
									<th style="width: 8%">학과</th>
									<th style="width: 8%">학점</th>
									<th style="width: 8%">요일</th>
									<th style="width: 8%">시작 시간</th>
									<th style="width: 8%">종료 시간</th>
									<th style="width: 8%">강의실</th>
									<th style="width: 8%">수강 인원</th>
									<th style="width: 12%"></th>
								</tr>
							</thead>
						<tbody>
							<c:forEach items="${list}" var="lectureVO">
								<tr style="text-align: center;">
									<td>${lectureVO.lectureNum}</td>
									<td><a>${lectureVO.lectureName}</a><br/><small>${lectureVO.professorVO.name}</small></td>
									<td>${lectureVO.grade}학년</td>
									<td>
										<c:if test="${lectureVO.category eq '전공 필수'}">전공 필수</c:if>										<c:if test="${lectureVO.category eq '전공 선택'}">전공 선택</c:if>
										<c:if test="${lectureVO.category eq '교양 필수'}">교양 필수</c:if>
										<c:if test="${lectureVO.category eq '교양 선택'}">교양 선택</c:if>
									</td>
									<td>${lectureVO.departmentVO.deptName}</td>
									<td>${lectureVO.completionGrade}</td>
									<td>${lectureVO.weekday}요일</td>
									<td>
										<c:if test="${lectureVO.startTime eq 1}">09:00</c:if>
										<c:if test="${lectureVO.startTime eq 2}">10:00</c:if>
										<c:if test="${lectureVO.startTime eq 3}">11:00</c:if>
										<c:if test="${lectureVO.startTime eq 4}">12:00</c:if>
										<c:if test="${lectureVO.startTime eq 5}">13:00</c:if>
										<c:if test="${lectureVO.startTime eq 6}">14:00</c:if>
										<c:if test="${lectureVO.startTime eq 7}">15:00</c:if>
										<c:if test="${lectureVO.startTime eq 8}">16:00</c:if>
										<c:if test="${lectureVO.startTime eq 9}">17:00</c:if>										<c:if test="${lectureVO.startTime eq 10}">PM 18:00</c:if>
									</td>
									<td>
										<c:if test="${lectureVO.endTime eq 1}">10:00</c:if>
										<c:if test="${lectureVO.endTime eq 2}">11:00</c:if>
										<c:if test="${lectureVO.endTime eq 3}">12:00</c:if>
										<c:if test="${lectureVO.endTime eq 4}">13:00</c:if>
										<c:if test="${lectureVO.endTime eq 5}">14:00</c:if>
										<c:if test="${lectureVO.endTime eq 6}">15:00</c:if>
										<c:if test="${lectureVO.endTime eq 7}">16:00</c:if>
										<c:if test="${lectureVO.endTime eq 8}">17:00</c:if>
										<c:if test="${lectureVO.endTime eq 9}">18:00</c:if>
										<c:if test="${lectureVO.endTime eq 10}">19:00</c:if>
									</td>
									<td>${lectureVO.lectureRoomVO.lectureBuilding} ${lectureVO.lectureRoomVO.lectureRoom}</td>
									<td>${lectureVO.subscription}/${lectureVO.personal}명</td>
									<td class="project-actions text-right">
										<c:choose>
											<c:when test="${lectureVO.subscription ge lectureVO.personal}">
												<button class="btn btn-secondary btn-sm" id="mli" type="button" disabled>
													<i class="fas fa-circle-xmark"></i>
													마감
												</button>
											</c:when>
											<c:otherwise>
												<button class="btn btn-info btn-sm" id="mli" type="button"
												data-mli-num="${lectureVO.lectureNum}"
												data-year="${lectureVO.periodVO.year}"
												data-semester="${lectureVO.periodVO.semester}"
												data-weekday="${lectureVO.weekday}"
												data-start-time="${lectureVO.startTime}"
												data-end-time="${lectureVO.endTime}"
												data-completion-grade="${lectureVO.completionGrade}">
													<i class="fas fa-circle-check"></i>
													신청
												</button>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${lectureVO.favorite eq 1}">
												<button class="btn btn-secondary btn-sm" id="mfi" type="button" disabled>
													<i class="fas fa-solid fa-heart"></i>
													담김
												</button>
											</c:when>
											<c:otherwise>
												<button class="btn btn-primary btn-sm" id="mfi" type="button"
												data-mfi-num="${lectureVO.lectureNum}"
												data-year="${lectureVO.periodVO.year}"
												data-semester="${lectureVO.periodVO.semester}">
													<i class="fa-regular fa-heart"></i>
													담기
												</button>
											</c:otherwise>
										</c:choose>				
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
						
				<!-- Pagination -->
				<div class="row g-3 mt-3 justify-content-center">
					<ul class="pagination pagination-sm mx-auto" style="width: 200px;">
						<c:if test="${pagination.pre}">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous" data-all-page="1" style="color:#17a2b8;">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="page">
							<li class="page-item">
								<a class="page-link" href="#" data-all-page="${page}" style="color:#17a2b8;">${page}</a>
							</li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next" data-all-page="${pagination.totalPage}" style="color:#17a2b8;">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					</ul>
				</div>
				
				</div>
				<!-- /.card -->
				
				
				<div class="row">
					<div class="col">
						<div class="card">
							<h6 class="my-3 mx-3">신청 학점 : ${not empty credit ? credit : 0}점&emsp;|&emsp;잔여 학점 : ${20 - credit}점&emsp;|&emsp;수강 가능한 총 학점 : 20점</h6>
						</div>
					</div>
				</div>
					
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
</script>
<script src="/js/student/lecture/all_lecture.js"></script>
</body>
</html>