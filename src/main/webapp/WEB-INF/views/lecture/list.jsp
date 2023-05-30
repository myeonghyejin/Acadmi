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
		                <h1 class="fw-bolder">내 강의 목록</h1>
		                <form action="./list" method="get">
		                    <div class="row gx-5 my-3">
		                    <select class="form-select" id="temporary" name="temporary" onchange="this.form.submit()">
		                    	<option name="temporary" id="temporary" value=" ">강의 조회</option>
								<option for="temporary" value=" " >전체</option>
								<option for="temporary" value="1" ${temporary.value == 1 ? 'selected' : ''}>등록</option>
								<option for="temporary" value="0" ${temporary.value == 0 ? 'selected' : ''}>미등록</option>
							</select>
		                    <button><a href="./add" style="color: black;">강의 등록</a></button>
		                    	<table class="table table-hover">
		                    		<thead style="background-color: black; color: white;">
			                    		<tr>
			                    			<th>강의번호</th>
			                    			<th>강의년도</th>
			                    			<th>학기</th>
			                    			<th>학년</th>
			                    			<th>강의이름</th>
			                    			<th>구분</th>
			                    			<th>등록 상태</th>
			                    			<th>관리</th>
			                    		</tr>
			                    	</thead>
			                    	<tbody>
			                    		<c:forEach items="${list}" var="LectureVO">
			                    			<tr>
			                    				<td>${LectureVO.lectureNum}</td>
			                    					<td>${LectureVO.year}</td>
		 											<td>${LectureVO.semester}학기</td>
		 											<td>${LectureVO.grade}</td>
		 											<c:if test="${LectureVO.temporary eq 0}">
		 												<td>${LectureVO.lectureName}</td>
		 											</c:if>
		 											<c:if test="${LectureVO.temporary eq 1}">
		 												<td><a href="./main?lectureNum=${LectureVO.lectureNum}" style="color: black;">${LectureVO.lectureName}</a></td>
		 											</c:if>
		 											
		 											<td>${LectureVO.category}</td>
		 											<td>
		 												<c:if test="${LectureVO.temporary eq 1}">등록</c:if> 
		 												<c:if test="${LectureVO.temporary eq 0}">미등록</c:if> 
		 											</td>
		 											<c:if test="${LectureVO.temporary eq 0}">
			 											<td>
			 												<button class="btn btn-primary"><a href="./update?lectureNum=${LectureVO.lectureNum}" style="color: white;">수정</a></button>
			 												<button class="btn btn-danger"><a href="./delete?lectureNum=${LectureVO.lectureNum}" style="color: white;">삭제</a></button>
			 											</td>
			 										</c:if>
			 										<c:if test="${LectureVO.temporary eq 1}">
			 											<td> </td>
			 										</c:if>
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