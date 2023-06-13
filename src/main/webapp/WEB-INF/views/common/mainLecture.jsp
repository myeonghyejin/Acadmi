<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="col-12" style="width: 70%">
		<div class="card">
			<!-- table-header start -->
			<div class="card-header"style="height: auto;">
				<h2 class="card-title" style="color:#17a2b8;">진행중인 강의 보기</h2>
			</div>
			<!-- table-header end -->
              
            <!-- table-body start -->
            <div class="card-body table-responsive p-0">
            	<table class="table table-hover text-nowrap" style="text-align: center;">
                	<thead>
                    	<tr>
							<th>강의번호</th>
							<th>구분</th>
							<th>학년</th>
							<th>강의이름</th>
							
						</tr>
					</thead>
					<tbody>
			        	<c:forEach items="${list}" var="LectureVO">
			            	<tr>
						    	<td>${LectureVO.lectureNum}</td>
						    	<td>${LectureVO.category}</td>
					 			<td>${LectureVO.grade}</td>
					 			<td><a href="lecture/main?lectureNum=${LectureVO.lectureNum}" style="color: black;">${LectureVO.lectureName}</a></td>
					 			
							</tr>
			        	</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- table-body end -->
		</div>
	</div> 