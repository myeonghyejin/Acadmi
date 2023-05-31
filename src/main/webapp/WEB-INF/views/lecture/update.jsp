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
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<h1>강의 수정</h1>
					<form action="./update" method="post">
	                 <!-- <div class="row gx-5 my-3"> -->
	                <input type="hidden" name="lectureNum" value="${update.lectureNum}">
	                <!-- 필수 -->
	                	<p class="col-6">강의 학기</p>
	                	<select class="form-select" id="semester" name="semester">
		                    	<option name="semester" id="semester">학기 선택</option>
								<option for="semester" value="1" ${update.semester eq '1' ?'selected':''}>1학기</option>
								<option for="semester" value="2" ${update.semester eq '2' ?'selected':''}>2학기</option>
						</select>
						<!-- 필수 -->
						<!-- 학과 수정 필요 -->
	               		<p class="col-6">학과</p>
	               		<%-- <select class="form-select" id="collegeNum" name="collegeNum" onchange="updateDepartments()">
		                    	<option name="collegeNum" id="collegeNum">단과대 선택</option>
		                    	<c:if test="${update.deptNum >='1' && update.deptNum<='2'}">
								<option for="collegeNum" value="1" selected="selected">정보대</option>
								<option for="collegeNum" value="2">인문대</option>
								</c:if>
								<c:if test="${update.deptNum >='3' && update.deptNum<='4'}">
								<option for="collegeNum" value="1">정보대</option>
								<option for="collegeNum" value="2" selected="selected">인문대</option>
								</c:if>
						</select> --%>
						<select class="form-select" id="deptNum" name="deptNum">
		                    	<option name="deptNum" id="deptNum">학과 선택</option>
		                    	<c:forEach items="${department}" var="dept">
		                    		<option for="deptNum" value="${dept.deptNum}" ${update.deptNum == dept.deptNum ?'selected':''}>${dept.deptName}</option>
		                    </c:forEach>
						</select>
						<!-- <script>
							function updateDepartments(){
								const collegeSelect = document.getElementById("collegeNum");
								const departmentSelect = document.getElementById("deptNum");
						        
								const selectedCollege = collegeSelect.value;
						        departmentSelect.innerHTML = ""; 
						        departmentSelect.disabled = true;
						        
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
							</script> -->
						<p class="col-6">강의이름</p>
						<input type="text" name="lectureName" class="form-control" id="lectureName" 
						value="${update.lectureName}" placeholder="강의 이름 입력"><br>
						<p class="col-6">구분</p>
						<select class="form-select" id="category" name="category">
		                    	<option name="category" id="category">구분 선택</option>
								<option for="category" value="전공 필수" ${update.category eq '전공 필수' ?'selected':''}>전공 필수</option>
								<option for="category" value="전공 선택" ${update.category eq '전공 선택' ?'selected':''}>전공 선택</option>
								<option for="category" value="교양 필수" ${update.category eq '교양 필수' ?'selected':''}>교양 필수</option>
								<option for="category" value="교양 선택" ${update.category eq '교양 선택' ?'selected':''}>교양 선택</option>						</select>
						<p class="col-6">대상 학년</p>
						<select class="form-select" id="grade" name="grade">
		                    	<option name="grade" id="grade" value="">학년 선택</option>
								<c:forEach begin="1" end="4" step="1" var="i">
		                    		<option for="grade" value="${i}" ${update.grade == i ?'selected':''} >${i}</option>
		                    	</c:forEach>
						</select>
						<!-- 필수 -->
						<!-- 년도 선택 -->
						<p class="col-6">강의 연도</p>
						<select class="form-select" id="year" name="year">
		                    <option name="year" id="year" value="">강의 연도 선택</option>
		                    <c:forEach items="${period}" var="period">
		                    	<option for="year" value="${period.year}" ${update.year == period.year ?'selected':''}>${period.year}</option>
		                    </c:forEach>
						</select>
						<p class="col-6">강의 요일</p>
						<select class="form-select" id="weekday" name="weekday">
		                    	<option name="weekday" id="weekday" value="">요일 선택</option>
								<option for="weekday" value="월" ${update.weekday eq '월' ?'selected':''}>월</option>
								<option for="weekday" value="화" ${update.weekday eq '화' ?'selected':''}>화</option>
								<option for="weekday" value="수" ${update.weekday eq '수' ?'selected':''}>수</option>
								<option for="weekday" value="목" ${update.weekday eq '목' ?'selected':''}>목</option>
								<option for="weekday" value="금" ${update.weekday eq '금' ?'selected':''}>금</option>
						</select>
						<p class="col-6">시작시간</p>
						<select class="form-select" id="startTime" name="startTime">
		                    	<option name="startTime" id="startTime" value="">시작시간 선택</option>
		                    	<c:forEach begin="1" end="9" step="1" var="i">
		                    		<option for="startTime" value="${i}" ${update.startTime == i ?'selected':''}>${i}</option>
		                    	</c:forEach>
						</select>
						<p class="col-6">종료시간</p>
						<select class="form-select" id="endTime" name="endTime">
		                    	<option name="endTime" id="startTime" value="">종료시간 선택</option>
		                    	<c:forEach begin="1" end="9" step="1" var="i">
		                    		<option for="endTime" value="${i}" ${update.endTime == i ?'selected':''}>${i}</option>
		                    	</c:forEach>
						</select>
						<p class="col-6">학점</p>
						<select class="form-select" id="completionGrade" name="completionGrade">
		                    	<option name="completionGrade" id="completionGrade" value="">학점 선택</option>
		                    	<c:forEach begin="1" end="4" step="1" var="i">
		                    		<option for="completionGrade" value="${i}" ${update.completionGrade == i ?'selected':''}>${i}</option>
		                    	</c:forEach>
						</select>
						<p class="col-6">수강인원</p>
						<select class="form-select" id="personal" name="personal">
		                    	<option name="personal" id="personal" value="">수강 인원 선택</option>
		                    	<c:forEach begin="10" end="45" step="5" var="i">
		                    		<option for="personal" value="${i}" ${update.personal == i ?'selected':''}>${i}</option>
		                    	</c:forEach>
						</select>
						
	                    <div class="my-3">
		                    <button class="btn btn-primary" type="submit" name="buttonType" value="0">임시등록</button>
		                    <button class="btn btn-info" type="submit" name="buttonType" value="1">등록</button>
		                    <button class="btn btn-danger"><a href="./list" style="color: white;">뒤로가기</a></button>
	                    </div>
	                    <!-- </div> -->
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