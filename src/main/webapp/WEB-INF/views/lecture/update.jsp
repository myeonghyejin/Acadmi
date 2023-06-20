<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	<style>
		.redResult{
			color: tomato;
		}
	</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../temp/professor_header.jsp"></c:import>
		</sec:authorize>
			
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->

		<!-- Main Contents -->
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:10px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">강의 수정</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					
					<form action="./update" id="frm" method="post">
	                	<div class="card card-default">
	                	<input type="hidden" name="lectureNum" value="${update.lectureNum}">
          					<div class="card-body">
								<div class="row">
									<div class="col-6">
                						<label>강의 연도</label>
										<input type="text" name="year" class="form-control" id="year" readonly="readonly" value="${update.year}" style="background:white;color:#17a2b8;font-weight:500;">
									</div>
									<div class="col-6">
	                					<label>강의 학기</label>
										<input type="text" name="semester" class="form-control" id="semester" readonly="readonly" value="${update.semester}" style="background:white;color:#17a2b8;font-weight:500;">
									</div>
	              				</div>
	              				<div class="row" style="margin-top: 20px;">
	              					<div class="col-4">
						                <label>단과대</label>&nbsp;<label style="color:#17a2b8;">(필수)</label>
	                					<select class="form-control" id="collegeNum" name="collegeNum"  onchange="updateDepartment()">
											<option name="collegeNum" id="collegeNum" value="">단과대 선택</option>
							                <c:forEach items="${college}" var="col">
						                    	<option for="collegeNum" value="${col.collegeNum}" ${result.collegeName == col.collegeName ?'selected':''}>${col.collegeName}</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="collegeResult"></div>
									</div>
									<div class="col-4">
						                <label>학과</label>&nbsp;<label style="color:#17a2b8;">(필수)</label>
	                					<select class="form-control" id="deptNum" name="deptNum">
											<option name="deptNum" id="deptNum" value="">학과 선택</option>
											<c:forEach items="${department}" var="dept">
						                    	<option for="deptNum" value="${dept.deptNum}" ${update.deptNum == dept.deptNum ?'selected':''}>${dept.deptName}</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="deptResult"></div>
									</div>
                					<div class="col-4">
                						<label>구분</label>&nbsp;<label style="color:#17a2b8;">(필수)</label>
										<select class="form-control" id="category" name="category"">
							                <option name="category" id="category" value="">구분 선택</option>
											<option for="category" value="전공 필수" ${update.category eq '전공 필수' ?'selected':''}>전공 필수</option>
											<option for="category" value="전공 선택" ${update.category eq '전공 선택' ?'selected':''}>전공 선택</option>
											<option for="category" value="교양 필수" ${update.category eq '교양 필수' ?'selected':''}>교양 필수</option>
											<option for="category" value="교양 선택" ${update.category eq '교양 선택' ?'selected':''}>교양 선택</option>
										</select>
										<div class="mt-1 mx-1" id="categoryResult"></div>
                  					</div>
            					</div>
            					<div class="row" style="margin-top: 20px;">
									<div class="col-12">
					                  	<label>강의 이름</label>&nbsp;<label style="color:#17a2b8;">(필수)</label>
					                  	<input type="text" name="lectureName" class="form-control" id="lectureName" placeholder="강의 이름 입력" value="${update.lectureName}">
					              		<div class="mt-1 mx-1" id="nameResult"></div>
					              	</div>
					            </div>
					            <div class="row" style="margin-top: 20px;"> 
					              	<div class="col-4">
					              		<label>대상 학년</label>
										<select class="form-control" id="grade" name="grade"">
						                    <option name="grade" id="grade" value="">학년 선택</option>
											<c:forEach begin="1" end="4" step="1" var="i">
						                    	<option for="grade" value="${i}" ${update.grade == i ?'selected':''}>${i}학년</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="gradeResult"></div>
									</div>
									<div class="col-4">
						              	<label>수강 인원</label>
										<select class="form-control" id="personal" name="personal"">
						                    <option name="personal" id="personal" value="">수강 인원 선택</option>
						                    <c:forEach begin="10" end="45" step="5" var="i">
						                    	<option for="personal" value="${i}" ${update.personal == i ?'selected':''}>${i}명</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="personalResult"></div>
									</div>
									<div class="col-4">
						              	<label>학점</label>
										<select class="form-control" id="completionGrade" name="completionGrade";">
						                    <option name="completionGrade" id="completionGrade" value="">학점 선택</option>
						                    <c:forEach begin="1" end="4" step="1" var="i">
						                    	<option for="completionGrade" value="${i}" ${update.completionGrade == i ?'selected':''}>${i}학점</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="completionGradeResult"></div>
									</div>
								</div>
								<div class="row" style="margin-top: 20px;">
									<div class="col-4">
						              	<label>강의 요일</label>
										<select class="form-control" id="weekday" name="weekday">
							            	<option name="weekday" id="weekday" value="">요일 선택</option>
											<option for="weekday" value="월" ${update.weekday eq '월' ?'selected':''}>월요일</option>
											<option for="weekday" value="화" ${update.weekday eq '화' ?'selected':''}>화요일</option>
											<option for="weekday" value="수" ${update.weekday eq '수' ?'selected':''}>수요일</option>
											<option for="weekday" value="목" ${update.weekday eq '목' ?'selected':''}>목요일</option>
											<option for="weekday" value="금" ${update.weekday eq '금' ?'selected':''}>금요일</option>
										</select>
										<div class="mt-1 mx-1" id="weekdayResult"></div>
									</div>
									<div class="col-4">
						              	<label>시작 시간</label>
										<select class="form-control" id="startTime" name="startTime"">
						                    <option name="startTime" id="startTime" value="">시작 시간 선택</option>
						                    <c:forEach begin="1" end="10" step="1" var="i">
						                    	<option for="startTime" value="${i}" ${update.startTime == i ?'selected':''}>
													<c:if test="${i eq 1}"> 09:00</c:if>
													<c:if test="${i eq 2}"> 10:00</c:if>
													<c:if test="${i eq 3}"> 11:00</c:if>
													<c:if test="${i eq 4}"> 12:00</c:if>
													<c:if test="${i eq 5}"> 13:00</c:if>
													<c:if test="${i eq 6}"> 14:00</c:if>
													<c:if test="${i eq 7}"> 15:00</c:if>
													<c:if test="${i eq 8}"> 16:00</c:if>
													<c:if test="${i eq 9}"> 17:00</c:if>
													<c:if test="${i eq 10}"> 18:00</c:if>
												</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="startTimeResult"></div>
									</div>
									<div class="col-4">
						              	<label>종료 시간</label>
										<select class="form-control" id="endTime" name="endTime"">
						                    <option name="endTime" id="endTime" value="">종료 시간 선택</option>
						                    <c:forEach begin="1" end="10" step="1" var="i">
						                    	<option for="endTime" value="${i}" ${update.endTime == i ?'selected':''}>
						                    		<c:if test="${i eq 1}"> 10:00</c:if>
													<c:if test="${i eq 2}"> 11:00</c:if>
													<c:if test="${i eq 3}"> 12:00</c:if>
													<c:if test="${i eq 4}"> 13:00</c:if>
													<c:if test="${i eq 5}"> 14:00</c:if>
													<c:if test="${i eq 6}"> 15:00</c:if>
													<c:if test="${i eq 7}"> 16:00</c:if>
													<c:if test="${i eq 8}"> 17:00</c:if>
													<c:if test="${i eq 9}"> 18:00</c:if>
													<c:if test="${i eq 10}"> 19:00</c:if>
						                    	</option>
						                    </c:forEach>
										</select>
										<div class="mt-1 mx-1" id="endTimeResult"></div>
									</div>
								</div>
								<div style="width:auto; float: right; margin-top: 50px">
					            	<button class="btn btn-primary" type="button" id="btn0">임시등록</button>
					                <button class="btn btn-info" type="button" id="btn1">등록</button>
					                <a class="btn btn-danger" href="./list" style="color: white;">취소</a>
				                </div>
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
	<script src="/js/professor/lectureForm.js"></script>
	
	<script type="text/javascript">
		function updateDepartment() {
			let college = new Array()
			<c:forEach items = "${college}" var="col" >
				college.push(${col.collegeNum})
			</c:forEach>
			$("#deptNum option[value='전체']").remove();   
			$("#deptNum").empty();
	      
			for(let i=0; i<college.length; i++) {
				if($("#collegeNum").val() == college[i]) {
					$("#deptNum").append("<option value=''>학과 선택</option>")
					<c:forEach items="${department}" var="dept">
						if(${dept.collegeNum} == college[i]) {
							$("#deptNum").append("<option value='${dept.deptNum}'>${dept.deptName}</option>")
						}
					</c:forEach>
				}
				if($("#collegeNum").val() == "단과대") {
	          	}
	          
			}
	       console.log(department)
	    }
	</script>
	<script>
		const startTimeSelect = document.getElementById("startTime");
		const endTimeSelect = document.getElementById("endTime");
	
		startTimeSelect.addEventListener("change", function() {
		    const selectedStartTime = parseInt(startTimeSelect.value);
		
		    endTimeSelect.innerHTML = '<option name="endTime" id="endTime" value="">종료 시간 선택</option>';
		
		    for (let i = selectedStartTime; i <= 10; i++) {
				const option = document.createElement("option");
		      	option.setAttribute("for", "endTime");
		      	option.setAttribute("value", i);
		      	switch(i){
		      	case 1: option.textContent = '10:00';
      					break;
		      	case 2: option.textContent = '11:00';
      					break;
		      	case 3: option.textContent = '12:00';
      					break;
		      	case 4: option.textContent = '13:00';
      					break;
		      	case 5: option.textContent = '14:00';
      					break;
		      	case 6: option.textContent = '15:00';
      					break;
		      	case 7: option.textContent = '16:00';
      					break;
		      	case 8: option.textContent = '17:00';
      					break;
		      	case 9: option.textContent = '18:00';
		      			break;
		      	case 10: option.textContent = '19:00';
		      			break;
		      	}
		      	endTimeSelect.appendChild(option);
		    }
	  	});
		
		/* endTimeSelect.addEventListener("blur", function() {
			const selectedStartTime = parseInt(startTimeSelect.value);
			if(startTimeSelect.value.length!=0){
				endTimeSelect.innerHTML = '<option name="endTime" id="endTime" value="">종료 시간 선택</option>';
			    for (let i = selectedStartTime; i <= 10; i++) {
					const option = document.createElement("option");
			      	option.setAttribute("for", "endTime");
			      	option.setAttribute("value", i);
			      	switch(i){
			      	case 1: option.textContent = '10:00';
	      					break;
			      	case 2: option.textContent = '12:00';
	      					break;
			      	case 3: option.textContent = '12:00';
	      					break;
			      	case 4: option.textContent = '13:00';
	      					break;
			      	case 5: option.textContent = '14:00';
	      					break;
			      	case 6: option.textContent = '15:00';
	      					break;
			      	case 7: option.textContent = '16:00';
	      					break;
			      	case 8: option.textContent = '17:00';
	      					break;
			      	case 9: option.textContent = '18:00';
			      			break;
			      	case 10: option.textContent = '19:00';
			      			break;
			      	}
			      	endTimeSelect.appendChild(option);
			    }
			}
	  	}); */ 
	</script>

</body>
</html>