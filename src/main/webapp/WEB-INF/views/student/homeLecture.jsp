<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div  class="mt-3 mx-5">
	<div class="row mt-4">
			<div class="col-12">
				<div class="card">
					<h5 class="my-3 mx-3" style="color:#17a2b8;">진행중인 강의 보기</h5>
				</div>
			</div>
	</div>
		
	        <div class="card-body" style="padding:0px">
	            <div class="card card-info card-outline">
	                <c:forEach items="${list}" var="LectureVO">
	                    <div class="card-header">
	                        <a href="lecture/main?lectureNum=${LectureVO.lectureNum}" style="color: black;">${LectureVO.lectureName}</a>
	                        &nbsp;[ ${LectureVO.professorVO.name} ]
	                        &nbsp;( ${LectureVO.weekday}${LectureVO.startTime}-${LectureVO.endTime} )
	                    </div>
	                </c:forEach>
	            </div>
	        </div>
		  
        
</div>