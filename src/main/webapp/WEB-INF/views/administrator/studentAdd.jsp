<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
</head>
<c:import url="../temp/header.jsp"></c:import>
<body>
	<h1>학생 계정 생성</h1>
	<form action="./studentAdd" method="post">
		입학년도 <input type="text" name="year"><br>
		비밀번호 <input type="text" name="password"><br>
		이메일 <input type="text" name="email"><br>
		단과대	<select name="collegeNum" id="college" onchange="updateDepartmentOptions()">
				<option>전체</option>
			<c:forEach items="${college}" var="collegeVO">
				<option value="${collegeVO.collegeNum}">${collegeVO.collegeName}</option>
			</c:forEach>
			
		</select><br>
		학과 
		<select name="deptNum" id="dept">
			<option value="1">컴퓨터공학과</option>
		</select> <br>
		
		이름 <input type="text" name="name"><br>
		전화번호 <input type="text" name="phone"><br>
		생년월일 <input type="text" name="birth"><br>
		주소 <input type="text" name="address"><br>
		<input type="hidden" name="category" value="2">
		
		<button type="submit">학생가입</button>
		
	</form>
	<!-- <script type="text/javascript">
	function updateDepartmentOptions() {

	    //선택된 단과대에 따라 학과 옵션 추가
	    //배열에 넣어서 저장해서 꺼내오기
	    if($("#college").val() == 1) {
	    	<c:forEach items="${department}" var="departmentVO">
	    		if("${departmentVO.collegeNum}" == 1) {
	    			console.log("${departmentVO.deptName}")
	    			$("#dept").append("<option value=''>${departmentVO.deptName}</option>")
	    		}
	    	</c:forEach>
			
	    }
	}
	</script> -->
</body>
</html>