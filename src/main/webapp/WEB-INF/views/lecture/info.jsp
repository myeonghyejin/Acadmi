<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<c:import url="../temp/header.jsp"></c:import>
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
          						<div class="row" style="margin-top: 10px">
									<div class="col-12">
					                  	<label>강의 이름</label>
					                  	<input type="text" name="lectureName" class="form-control" id="lectureName" 
										value="${lecture.lectureName}" readonly="readonly" style="background-color: white"><br>
					              	</div>
					            </div>
          						<div class="row">
									<div class="col-6">
                						<label>강의 연도</label>
										<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                				value="${lecture.year}" readonly="readonly" style="background-color: white"><br>
									</div>
									<div class="col-6">
	                					<label>강의 학기</label>
										<input type="text" name="lectureName" class="form-control" id="lectureName" 
	                					value="${lecture.semester}" readonly="readonly" style="background-color: white"><br>
									</div>
	              				</div>
	              				<div class="row" >
									<div class="col-6">
						                <label>학과</label>
	                					<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                				value="${lecture.departmentVO.deptName}" readonly="readonly" style="background-color: white"><br>
									</div>
                					<div class="col-6">
                						<label>구분</label>
										<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                				value="${lecture.category}" readonly="readonly" style="background-color: white"><br>
                  					</div>
            					</div>
								<div class="row">
									<div class="col-4">
						              	<label>강의 요일</label>
										<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                				value="${lecture.weekday}" readonly="readonly" style="background-color: white"><br>
									</div>
									<div class="col-4">
						              	<label>시작 시간</label>
										<input type="text" name="startTime" class="form-control" id="startTime" 
		                				value="${lecture.startTime}" readonly="readonly" style="background-color: white"><br>
									</div>
									<div class="col-4">
						              	<label>종료 시간</label>
										<input type="text" name="endTime" class="form-control" id="endTime" 
		                				value="${lecture.endTime}" readonly="readonly" style="background-color: white"><br>
									</div>
								</div>
								<div class="row"> 
					              	<div class="col-4">
					              		<label>대상 학년</label>
										<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                				value="${lecture.grade}" readonly="readonly" style="background-color: white"><br>
									</div>
									<div class="col-4">
						              	<label>수강인원</label>
										<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                				value="${lecture.personal}" readonly="readonly" style="background-color: white"><br>
									</div>
									<div class="col-4">
						              	<label>학점</label>
										<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                				value="${lecture.completionGrade}" readonly="readonly" style="background-color: white"><br>
									</div>
								</div>
								<%-- <div style="width:auto; float: right; margin-top: 25px">
					                <a class="btn btn-info" href="./main?lectureNum=${lecture.lectureNum}" style="color: white;">뒤로가기</a>
				                </div> --%>
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