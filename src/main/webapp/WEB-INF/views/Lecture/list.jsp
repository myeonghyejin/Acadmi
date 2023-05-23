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

	<main class="flex-shrink-0">
			<section class="bg-light py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 my-3">
                    	<table class="table table-hover">
                    		<thead style="background-color: black; color: white;">
	                    		<tr>
	                    			<th>Num</th>
	                    			<th>Year</th>
	                    			<th>Semester</th>
	                    			<th>Grade</th>
	                    			<th>Name</th>
	                    			<th>Category</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody>
	                    		<c:forEach items="${list}" var="LectureVO">
	                    			<tr>
	                    				<td>${LectureVO.lectureNum}</td>
<%-- 	                    				<td><a href="./detail?num=${boardVO.num}" style="color: black;">${boardVO.title}</a></td>
 --%>	                    				<td>${LectureVO.year}</td>
 											<td>${LectureVO.semester}</td>
 											<td>${LectureVO.grade}</td>
 											<td>${LectureVO.lectureName}</td>
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