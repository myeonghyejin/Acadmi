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
		<c:import url="../temp/professor_header.jsp"></c:import>
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:10px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">강의 등록</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					
					<!-- form start -->
					<form action="./add" method="post">
						<div class="card card-default">
							<div class="card-header">
								<h3 class="card-title" style="color: white;">강의 등록</h3>
          					</div>
          					<!-- card-header start -->
							<div class="card-body">
								<div class="row">
              						<div class="col-6">
                						<label>강의 연도</label>
										<select class="form-control" id="year" name="year" onchange="updateSemester()">
		                    				<option name="year" id="year" value="">연도 선택</option>
		                    				<c:forEach items="${period}" var="period">
		                    					<option for="year" value="${period.year}">${period.year}</option>
		                    				</c:forEach>
										</select>
									</div>
	                				<div class="col-6">
	                					<label>강의 학기</label>
										<select class="form-control" id="semester" name="semester">
											<option name="semester" id="semester" value="">학기 선택</option>
											<option for="semester" value="1" >1학기</option>
											<option for="semester" value="2">2학기</option>
										</select>
									</div>
	              				</div>
	              				<div class="row" style="margin-top: 20px">
	              					<div class="col-4">
						                <label>단과대</label>
	                					<select class="form-control" id="collegeNum" name="collegeNum" onchange="updateDepartment()">
											<option name="collegeNum" id="collegeNum" value="단과대">단과대 선택</option>
							                <c:forEach items="${college}" var="col">
						                    	<option for="collegeNum" value="${col.collegeNum}">${col.collegeName}</option>
						                    </c:forEach>
										</select>
									</div>
              						<div class="col-4">
						                <label>학과</label>
	                					<select class="form-control" id="deptNum" name="deptNum">
											<option name="deptNum" id="deptNum" value="">학과 선택</option>
										</select>
									</div>
                					<div class="col-4">
                						<label>구분</label>
										<select class="form-control" id="category" name="category">
							                <option name="category" id="category" value="">구분 선택</option>
											<option for="category" value="전공 필수" >전공 필수</option>
											<option for="category" value="전공 선택">전공 선택</option>
											<option for="category" value="교양 필수">교양 필수</option>
											<option for="category" value="교양 선택">교양 선택</option>
										</select>
                  					</div>
            					</div>
								<div class="row" style="margin-top: 20px">
									<div class="col-12">
					                  	<label>강의 이름</label>
					                  	<input type="text" name="lectureName" class="form-control" id="lectureName" placeholder="강의 이름 입력"><br>
					              	</div>
					            </div>
								<div class="row"> 
					              	<div class="col-4">
					              		<label>대상 학년</label>
										<select class="form-control" id="grade" name="grade">
						                    <option name="grade" id="grade" value="">학년 선택</option>
											<c:forEach begin="1" end="4" step="1" var="i">
						                    	<option for="grade" value="${i}" >${i}</option>
						                    </c:forEach>
										</select>
									</div>
									<div class="col-4">
						              	<label>수강인원</label>
										<select class="form-control" id="personal" name="personal">
						                    <option name="personal" id="personal" value="">수강 인원 선택</option>
						                    <c:forEach begin="10" end="45" step="5" var="i">
						                    	<option for="personal" value="${i}" >${i}</option>
						                    </c:forEach>
										</select>
									</div>
									<div class="col-4">
						              	<label>학점</label>
										<select class="form-control" id="completionGrade" name="completionGrade">
						                    <option name="completionGrade" id="completionGrade" value="">학점 선택</option>
						                    <c:forEach begin="1" end="4" step="1" var="i">
						                    	<option for="completionGrade" value="${i}" >${i}</option>
						                    </c:forEach>
										</select>
									</div>
								</div>
								<div class="row" style="margin-top: 20px">
									<div class="col-4">
						              	<label>강의 요일</label>
										<select class="form-control" id="weekday" name="weekday">
							            	<option name="weekday" id="weekday" value="">요일 선택</option>
											<option for="weekday" value="월" >월</option>
											<option for="weekday" value="화">화</option>
											<option for="weekday" value="수" >수</option>
											<option for="weekday" value="목">목</option>
											<option for="weekday" value="금" >금</option>
										</select>
									</div>
									<div class="col-4">
						              	<label>시작 시간</label>
										<select class="form-control" id="startTime" name="startTime" onchange="updateEndTime()">
						                    <option name="startTime" id="startTime" value="">시작시간 선택</option>
						                    <c:forEach begin="1" end="9" step="1" var="i">
						                    	<option for="startTime" value="${i}" >${i}</option>
						                    </c:forEach>
										</select>
									</div>
									<div class="col-4">
						              	<label>종료 시간</label>
										<select class="form-control" id="endTime" name="endTime">
						                    <option name="endTime" id="endTime" value="">종료시간 선택</option>
						                    <c:forEach begin="1" end="9" step="1" var="i">
						                    	<option for="endTime" value="${i}" >${i}</option>
						                    </c:forEach>
										</select>
									</div>
								</div>
								<div style="width:auto; float: right; margin-top: 25px">
					            	<button class="btn btn-primary" type="submit" name="buttonType" value="0">임시등록</button>
					                <button class="btn btn-info" type="submit" name="buttonType" value="1">등록</button>
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
	
	<script type="text/javascript">
		function updateDepartment() {
			let college = new Array()
			<c:forEach items = "${college}" var="col" >
	         	/*  console.log(${collegeVO.collegeNum})*/
				college.push(${col.collegeNum})
	        	 /* 1,2,3,4,5,6 */
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
		
	  
	  /*function updateEndTime() {
			let startNum = new Array()
			<c:forEach begin="1" end="9" step="1" var="i">
				startNum.push(${i})
      		</c:forEach>
			for(let i=0; i<startTime.length; i++) {	
				if($("#startTime").val() ==[i]) {
					<c:forEach begin="${startTime+1}" end="9" step="1" var="i">
                		<option for="endTime" value="${i}" >${i}</option>
                	</c:forEach>
	      		}
			}
	  } */
	</script>
</body>
</html>