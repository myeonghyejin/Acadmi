<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<h1>강의 등록</h1>
					<form action="./add" method="post">
	                	<p class="col-6">강의 학기</p>
	                	<select class="form-select" id="semester" name="semester">
							<option name="semester" id="semester">학기 선택</option>
							<option for="semester" value="1" >1학기</option>
							<option for="semester" value="2">2학기</option>
						</select>

	               		<p class="col-6">학과</p>
	               		<select class="form-select" id="collegeNum" name="collegeNum" onchange="updateDepartments()">
		                    <option name="collegeNum" id="collegeNum">단과대 선택</option>
							<c:forEach items="${college}" var="col">
		                    	<option for="collegeNum" value="${col.collegeNum}">${col.collegeName}</option>
		                    </c:forEach>
						</select>
						<select class="form-select" id="deptNum" name="deptNum">
		                    	<!-- <option name="deptNum" id="deptNum">학과 선택</option> -->
								<!-- <option for="deptNum" value="1" >국어국문학과</option>
								<option for="deptNum" value="2" >영어영문학과</option> -->
						</select>
						<script>
							function updateDepartments(){
								const collegeSelect = document.getElementById("collegeNum");
								const departmentSelect = document.getElementById("deptNum");
						        
								const selectedCollege = collegeSelect.value;
						        departmentSelect.innerHTML = ""; 
						        departmentSelect.disabled = false;
						        
						        if (selectedCollege !== "none") {
						            if (selectedCollege == "1") {
						                addOption(departmentSelect, "1", "컴퓨터공학과");
						                addOption(departmentSelect, "2", "정보통신학과");
						                // 나머지 학과 옵션들 추가
						            } else if (selectedCollege == "2") {
						                addOption(departmentSelect, "3", "국어국문학과");
						                addOption(departmentSelect, "4", "영어영문학과");
						                // 나머지 학과 옵션들 추가
						            }
						            departmentSelect.disabled = false; // 학과 Select Box 활성화
						        }
							}
							function addOption(selectElement, value, text) {
								const option = document.createElement("option");
						        option.value = value;
						        option.text = text;
						        selectElement.appendChild(option);
						    }
						</script>
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
						
						<p class="col-6">강의 연도</p>
						<select class="form-select" id="year" name="year">
		                    <option name="year" id="year" value="">강의 연도 선택</option>
		                    <c:forEach items="${period}" var="year">
		                    	<option for="year" value="${period.year}">${period.year}</option>
		                    </c:forEach>
						</select>
						
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
		                    <option name="endTime" id="endTime" value="">종료시간 선택</option>
		                    <c:forEach begin="1" end="9" step="1" var="i">
		                    	<option for="endTime" value="${i}" >${i}</option>
		                    </c:forEach>
						</select>
						
						<script>
							// 첫 번째 select 박스의 변경 이벤트를 처리하는 함수
							function handleFirstSelectChange() {
							  // 첫 번째 select 박스에서 선택한 숫자 가져오기
							  const selectedNumber = parseInt(document.getElementById('startTime').value);
							  
							  // 두 번째 select 박스 초기화
							  const secondSelect = document.getElementById('endTime');
							  secondSelect.innerHTML = ''; // 기존 옵션 제거
							  
							  // 선택한 숫자보다 작은 숫자를 필터링하여 두 번째 select 박스에 옵션 추가
							  for (var i > selectedNumber; i <=9; i++) {
								  addOption(secondSelect, i, i);
							  }
							}
							
							// 첫 번째 select 박스의 변경 이벤트에 이벤트 리스너 등록
							document.getElementById('startTime').addEventListener('change', handleFirstSelectChange);
							
							// 초기화 시 첫 번째 select 박스에 대한 초기 설정
							handleFirstSelectChange();
						</script>
						<p class="col-6">학점</p>
						<select class="form-select" id="completionGrade" name="completionGrade">
		                    <option name="completionGrade" id="completionGrade" value="">학점 선택</option>
		                    <c:forEach begin="1" end="4" step="1" var="i">
		                    	<option for="completionGrade" value="${i}" >${i}</option>
		                    </c:forEach>
						</select>
						
						<p class="col-6">수강인원</p>
						<select class="form-select" id="personal" name="personal">
		                    <option name="personal" id="personal" value="">수강 인원 선택</option>
		                    <c:forEach begin="10" end="45" step="5" var="i">
		                    	<option for="personal" value="${i}" >${i}</option>
		                    </c:forEach>
						</select>
						
						<p class="col-6">비고</p>
						<input type="text" name="note" class="form-control" id="note" placeholder="비고 입력"><br>
	                    <button class="btn btn-primary mx-2" type="submit" name="buttonType" value="0">임시등록</button>
	                    <button class="btn btn-info" type="submit" name="buttonType" value="1">등록</button>
	                    <button class="btn btn-danger mx-2"><a href="./list" style="color: white;">뒤로가기</a></button>
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