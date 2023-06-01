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
					<h1>강의 정보</h1>
					<form action="./info" method="get">
						<div class="row gx-5 my-3"> <!-- 이거 했더니 가로로 배치됨 -->
		                	<input type="hidden" name="lectureNum" value="${info.lectureNum}">
	                		<!-- 필수 -->
	                		<p class="col-6">강의 학기</p>
	                		<input type="text" name="lectureName" class="form-control" id="lectureName" 
	                		value="${info.semester}" readonly="readonly"><br>
							<!-- 필수 -->
							<!-- 학과 수정 필요 -->
		               		<p class="col-6">학과</p>
		               		<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.deptNum}" readonly="readonly"><br>
						
							<p class="col-6">강의이름</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
							value="${info.lectureName}" readonly="readonly"><br>
							<p class="col-6">구분</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.category}" readonly="readonly"><br>
							<p class="col-6">대상 학년</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.grade}" readonly="readonly"><br>
							<!-- 필수 -->
							<!-- 년도 선택 -->
							<p class="col-6">강의 연도</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.year}" readonly="readonly"><br>
							<p class="col-6">강의 요일</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.weekday}" readonly="readonly"><br>
							<p class="col-6">수업 시간</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.startTime}- ${info.endTime} 교시" readonly="readonly"><br>
							
							<p class="col-6">학점</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.completionGrade}" readonly="readonly"><br>
							<p class="col-6">수강인원</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.personal}" readonly="readonly"><br>
							<p class="col-6">비고</p>
							<input type="text" name="lectureName" class="form-control" id="lectureName" 
		                	value="${info.note}" readonly="readonly"><br>				
	                    	<button class="btn btn-info"><a href="./main?lectureNum=${info.lectureNum}" style="color: white;">뒤로가기</a></button>
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