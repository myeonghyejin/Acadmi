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
<c:import url="../temp/administrator.jsp"></c:import>
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
			<option value="">전체</option>
		</select> <br>
		
		이름 <input type="text" name="name"><br>
		전화번호 <input type="text" name="phone"><br>
		생년월일 
		<input type="date" name="birth"><br>
		주소 <input type="text" name="address" id="address_kakao" readonly><br>
		<input type="hidden" name="category" value="2">
		
		<button type="submit">학생가입</button>
		
	</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
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
	
//선택된 단과대에 따라 학과 옵션 추가

	
	let college = new Array()
	let department = new Array()
	<c:forEach items = "${college}" var="collegeVO" >
		/*  console.log(${collegeVO.collegeNum})*/
		college.push(${collegeVO.collegeNum})
		/* 1,2,3,4,5,6 */
	</c:forEach>
		
	for(let i=0; i<college.length; i++) {
		if($("#college").val() == college[i]) {
			<c:forEach items="${department}" var="departmentVO">
				if(${departmentVO.collegeNum} == college[i]) {
					$("#dept").append("<option value='${departmentVO.deptNum}'>${departmentVO.deptName}</option>")
				}
				
			</c:forEach>
		}
		
	}
	console.log(department)

</script>

</body>
</html>