<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

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
			<div class="container-fluid">
				<div class="row">
					<!-- 2레벨 Sidebar 적용 -->
					<c:import url="../temp/sidebar/administrator_join.jsp"></c:import>
					<!-- 2레벨 Sidebar 끝 -->
					
					<!-- Contents -->
					<div class="col">
					<!-- header start -->
						<div class="row">
							<div class="col-12 mt-3">
								<div class="card">
									<h3 class="my-3 mx-3">교수 계정 생성</h3>
								</div>
							</div>
						</div>
					<!-- header end -->
					<!-- form start -->
						<form  action="./professorAdd" method="post" id="professorForm">
							<div class="card card-default">
								
	          					<!-- card-header start -->
								<div class="card-body">
									<div class="row">
	              						<div class="col-6">
	                						<label for="year">입학 연도</label>
											 <input type="text" id="year" class="form-control" name="year"/>
											  <div class="mt-1 mx-1" id="yearResult"></div>
	                					</div>
	                					
		                				<div class="col-6">
		                					<label for="password">비밀번호</label>
		                					 <input type="password" id="password" class="form-control" name="password"/>
		                					 <div class="mt-1 mx-1" id="passwordResult"></div>
										</div>
									
		              				</div>
		              				<div class="row" style="margin-top: 20px;">
		              					<div class="col-4">
							                 <label for="email">이메일</label>
		                					 <input type="email" id="email" class="form-control" name="email"/>
											<div class="mt-1 mx-1" id="emailResult"></div>
										</div>
	              						<div class="col-4">
							               <label>담당 단과대</label>
							                  <select class="form-control select" style="width: 100%;" name="collegeNum" id="college" onchange="updateDepartmentOptions()">
							                  	<option value="단과대">전체</option>
												<c:forEach items="${college}" var="collegeVO">
													<c:if test="${collegeVO.collegeNum != 1 && collegeVO.collegeNum != 2}">
														<option value="${collegeVO.collegeNum}">${collegeVO.collegeName}</option>
													</c:if>
												</c:forEach>
							                  </select>
							              	<div class="mt-1 mx-1" id="collegeResult"></div>    
										</div>
	                					<div class="col-4">
	                						 <label>학과</label>
							                  	<select  class="form-control select" style="width: 100%;" name="deptNum" id="dept">
							                  		<option value="">전체</option>
												</select>
											<div class="mt-1 mx-1" id="deptResult"></div>
	                  					</div>
	            					</div>
									<div class="row" style="margin-top: 20px;">
										<div class="col-6">
											 <label for="professorRoom">교수 사무실</label>
		             						 <input type="text" id="professorRoom" class="form-control" name="professorRoom"/>
							           	  	<div  class="mt-1 mx-1" id="roomResult"></div>
										</div>
										<div class="col-6">
						                  	<label for="name">이름</label>
					             			<input type="text" id="name" class="form-control" name="name"/>
					             		   <div  class="mt-1 mx-1" id="nameResult"></div>
						              	</div>
						            
									</div>
									<div class="row" style="margin-top:20px;">
										<div class="col-6">
						              		<label for="phone">전화번호</label>
					              			<input type="text" id="phone" class="form-control" name="phone"/>
					              			 <div  class="mt-1 mx-1" id="phoneResult"></div>
										</div>
									
										<div class="col-6">
							              	<label>생년월일</label>
											<input type="date" class="form-control" name="birth" id="birth"/>
											 <div  class="mt-1 mx-1" id="birthResult"></div>
										</div>
									</div>
									<div class="row" style="margin-top: 30px;">
										<div class="col-6">
											<label for="address_kakao">주소</label>
					              			<input type="text" id="address_kakao" readonly class="form-control" name="address"/>
										</div>
										<div class="col-6">
											 <label for="detailAddress">상세주소</label>
					             			 <input type="text" id="detailAddress"  class="form-control" name="addressDetail"/>
										</div>
										
									</div>
									<input type="hidden" name="category" value="1">
									<div style="width:auto; float: right; margin-top : 50px;">
							            <button type="button" class="btn btn-info" id="professorBtn">교수 가입</button> 
							            <button type="button" class="btn btn-danger" id="backBtn">취소</button>
					            	</div>
								</div>
							</div>
						</form>
					
					</div>
				</div>
			</div>
	</div>
	               		
	<!-- Footer 적용 -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- Footer 끝 -->
		
</div>
<!-- ./wrapper -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/administrator/professorAdd.js"></script>
<script type="text/javascript">
//카카오 주소 api	
	//주소 입력
	document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	    //카카오 지도 발생
	    new daum.Postcode({
	        oncomplete: function(data) { //선택시 입력값 세팅
	            document.getElementById("address_kakao").value = data.address; // 주소 넣기
	        }
	    }).open();
	});

/* 단과대에 따른 학과 선택 */
	function updateDepartmentOptions() {
	    let college = new Array()
		let department = new Array()
		<c:forEach items = "${college}" var="collegeVO" >
			/*  console.log(${collegeVO.collegeNum})*/
			college.push(${collegeVO.collegeNum})
			/* 1,2,3,4,5,6 */
		</c:forEach>
		$("#dept option[value='']").remove();	
		$("#dept").empty();

		for(let i=0; i<college.length; i++) {
			if($("#college").val() == college[i]) {
				<c:forEach items="${department}" var="departmentVO">
					if(${departmentVO.collegeNum} == college[i]) {
						$("#dept").append("<option value='${departmentVO.deptNum}'>${departmentVO.deptName}</option>")
					}
					
				</c:forEach>
			}
			if($("#college").val() == "단과대") {
				<c:forEach items="${department}" var="departmentVO">
					<c:if test="${departmentVO.deptNum != 1 && departmentVO.deptNum != 2}">
						$("#dept").append("<option value='${departmentVO.deptNum}'>${departmentVO.deptName}</option>")
					</c:if>
				</c:forEach>
			}
			
		}
		console.log(department)
	}
	

</script>	
</body>
</html>