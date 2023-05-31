<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="fw-bolder">내 강의 목록</h1>
	<main class="flex-shrink-0">
			<section class="bg-light py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 my-3">
                    <button><a href="./temporary" style="color: black;">임시 등록 목록</a></button>
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
	                    		</tr>
	                    	</thead>
	                    	<tbody>
	                    		<c:forEach items="${list}" var="LectureVO">
	                    			<tr>
	                    				<td>${LectureVO.lectureNum}</td>
	                    					<td>${LectureVO.year}</td>
 											<td>${LectureVO.semester}학기</td>
 											<td>${LectureVO.grade}</td>
 											<td><a href="./detail?lectureNum=${LectureVO.lectureNum}" style="color: black;">${LectureVO.lectureName}</a></td>
 											<td>${LectureVO.category}</td>
	                    			</tr>
	                    		</c:forEach>
	                    	</tbody>
                    	</table>
                    </div>
                    
                    
                </div>
             </section>
             
            
             
      </main>

</body>
</html>