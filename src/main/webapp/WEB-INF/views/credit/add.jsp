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
		                <h1 class="fw-bolder">성적 입력 | ${detail.lectureName}</h1>
		                <form action="./list" method="get">
		                    <div class="row gx-5 my-3">
		                    <button class="btn btn-primary">등록</a></button>
		                    <button class="btn btn-danger">취소</a></button>
		                    	<table class="table table-hover">
		                    		<thead style="background-color: black; color: white;">
			                    		<tr>
			                    			<th>학번</th>
			                    			<th>학과</th>
			                    			<th>이름</th>
			                    			<th>학년</th>
			                    			<th>중간</th>
			                    			<th>기말</th>
			                    			<th>과제</th>
			                    			<th>출석</th>
			                    			<th>총점</th>
			                    		</tr>
			                    	</thead>
			                    	<tbody>
			                    		<c:forEach items="${attendee}" var="attendee">
			                    			<tr>
			                    				<td>${attendee.username}</td>
			                    				<td>${attendee.deptNum}</td>
			                    				<td>${attendee.name}</td>
			                    				<td>${attendee.grade}</td>
			                    				
			                    				<td><input type="text" name="semiGrade" id="semiGrade" placeholder="중간 점수"></td>
			                    				<td><input type="text" name="finalGrade" id="finalGrade" placeholder="기말 점수"></td>
			                    				<td><input type="text" name="reportGrade" id="reportGrade" placeholder="과제 점수"></td>
			                    				<td><input type="text" name="attendance" id="attendance" placeholder="출석 점수"></td>
			                    				<td><input type="text" name="credit" id="credit" placeholder="총점"></td>
			                    			</tr>
			                    		</c:forEach>
			                    	</tbody>
		                    	</table>
		                    </div>
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