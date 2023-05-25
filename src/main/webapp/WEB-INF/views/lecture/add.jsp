<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<div class="content-wrapper">

	<main class="flex-shrink-0">
	
			<section class="bg-light py-5">
                <div class="container px-5 my-5">
                <h1 class="fw-bolder">강의 등록</h1>
	                <form action="./add" method="post">
	                <!-- 필수 -->
	                	<p class="col-6">강의 학기</p>
	                	<select class="form-select" id="semester" name="semester">
		                    	<option name="semester" id="semester">학기 선택</option>
								<option for="semester" value="1" >1학기</option>
								<option for="semester" value="2">2학기</option>
						</select>
						<!-- 필수 -->
						<!-- 학과 수정 필요 -->
	               		<p class="col-6">학과</p>
	               		<!-- <select class="form-select" id="deptNum" name="deptNum">
		                    	<option name="deptNum" id="semester">건물 선택</option>
								<option for="deptNum" value="1" >정보대</option>
								<option for="deptNum" value="2">인문대</option>
								
						</select> -->
						<select class="form-select" id="deptNum" name="deptNum">
		                    	<option name="deptNum" id="deptNum">학과 선택</option>
								<option for="deptNum" value="1" >국어국문학과</option>
								<option for="deptNum" value="2">영어영문학과</option>
						</select>
						<p class="col-6">강의이름</p>
						<input type="text" name="lectureName" class="form-control" id="lectureName" placeholder="강의 이름 입력"><br>
						<p class="col-6">구분</p>
						<select class="form-select" id="category" name="category">
		                    	<option name="category" id="category" value="">구분 선택</option>
								<option for="category" value="전공" >전공</option>
								<option for="category" value="교양">교양</option>
						</select>
						<p class="col-6">대상 학년</p>
						<select class="form-select" id="grade" name="grade">
		                    	<option name="grade" id="grade" value="">학년 선택</option>
								<c:forEach begin="1" end="4" step="1" var="i">
		                    		<option for="grade" value="${i}" >${i}</option>
		                    	</c:forEach>
						</select>
						<!-- 필수 -->
						<!-- 년도 선택 -->
						<p class="col-6">강의 연도</p>
						<input type="text" name="year" class="form-control" id="year" placeholder="강의 이름 입력"><br>
						<p class="col-6">강의 요일</p>
						<select class="form-select" id="weekday" name="weekday">
		                    	<option name="weekday" id="weekday" value="">요일 선택</option>
								<option for="weekday" value="월" >월</option>
								<option for="weekday" value="화">화</option>
								<option for="weekday" value="수" >수</option>
								<option for="weekday" value="목">목</option>
								<option for="weekday" value="금" >금</option>
						</select>
						<p class="col-6">시작시간</p>
						<select class="form-select" id="startTime" name="startTime">
		                    	<option name="startTime" id="startTime" value="">시작시간 선택</option>
		                    	<c:forEach begin="1" end="9" step="1" var="i">
		                    		<option for="startTime" value="${i}" >${i}</option>
		                    	</c:forEach>
						</select>
						<p class="col-6">종료시간</p>
						<select class="form-select" id="endTime" name="endTime">
		                    	<option name="endTime" id="startTime" value="">종료시간 선택</option>
		                    	<c:forEach begin="1" end="9" step="1" var="i">
		                    		<option for="endTime" value="${i}" >${i}</option>
		                    	</c:forEach>
						</select>
						<p class="col-6">수강인원</p>
						<input type="text" name="personal" class="form-control" id="personal" placeholder="personal 입력"><br>
						<p class="col-6">학점</p>
						<input type="text" name="completionGrade" class="form-control" id="completionGrade" placeholder="completionGrade 입력"><br>
						<p class="col-6">비고</p>
						<input type="text" name="note" class="form-control" id="note" placeholder="note 입력"><br>
						
	                    <button type="submit" name="buttonType" value="0">임시등록</button>
	                    <button type="submit" name="buttonType" value="1">등록</button>
	                    <button><a href="./list" style="color: black;">뒤로가기</a></button>
	                 </form>
                </div>
             </section>
             
            
             
      </main>
</div>
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
</body>
</html>