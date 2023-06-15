<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="mt-3 mx-5">
		
		<%-- <!-- 2안 start -->
		<div class="card card-row card-info">
			<div class="card-header">
				<h3 class="card-title">진행중인 강의 보기</h3>
			</div>
			<div class="card-body">
            	<div class="card card-info card-outline">
            		<c:forEach items="${list}" var="LectureVO">
	            		<div class="card-header">
							<a href="lecture/main?lectureNum=${LectureVO.lectureNum}" style="color: black;">${LectureVO.lectureName}</a>
							&nbsp;[ ${LectureVO.category} ]
	            			&nbsp;( ${LectureVO.weekday}${LectureVO.startTime}-${LectureVO.endTime} )
						</div>
					</c:forEach>
            	</div>
          	</div>
        </div>
        <!-- 2안 end --> --%>
        
        <!-- 3안 start -->
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
	            			[ ${LectureVO.category} ]&nbsp;&nbsp;
							<a href="lecture/main?lectureNum=${LectureVO.lectureNum}" style="color: black;">${LectureVO.lectureName}</a>
	            			
	            			&nbsp;&nbsp;( ${LectureVO.weekday}
	            			<c:if test="${LectureVO.startTime eq 1}">AM 09:00</c:if>
							<c:if test="${LectureVO.startTime eq 2}">AM 10:00</c:if>
							<c:if test="${LectureVO.startTime eq 3}">AM 11:00</c:if>
							<c:if test="${LectureVO.startTime eq 4}">PM 12:00</c:if>
							<c:if test="${LectureVO.startTime eq 5}">PM 13:00</c:if>
							<c:if test="${LectureVO.startTime eq 6}">PM 14:00</c:if>
							<c:if test="${LectureVO.startTime eq 7}">PM 15:00</c:if>
							<c:if test="${LectureVO.startTime eq 8}">PM 16:00</c:if>
							<c:if test="${LectureVO.startTime eq 9}">PM 17:00</c:if>										<c:if test="${lectureVO.startTime eq 10}">PM 18:00</c:if>
	            			~
	            			<c:if test="${LectureVO.endTime eq 1}">AM 10:00</c:if>
							<c:if test="${LectureVO.endTime eq 2}">AM 11:00</c:if>
							<c:if test="${LectureVO.endTime eq 3}">PM 12:00</c:if>
							<c:if test="${LectureVO.endTime eq 4}">PM 13:00</c:if>
							<c:if test="${LectureVO.endTime eq 5}">PM 14:00</c:if>
							<c:if test="${LectureVO.endTime eq 6}">PM 15:00</c:if>
							<c:if test="${LectureVO.endTime eq 7}">PM 16:00</c:if>
							<c:if test="${LectureVO.endTime eq 8}">PM 17:00</c:if>
							<c:if test="${LectureVO.endTime eq 9}">PM 18:00</c:if>
							<c:if test="${LectureVO.endTime eq 10}">PM 19:00</c:if>
							)
						</div>
					</c:forEach>
            	</div>
          	</div>
        <!-- 3안 end -->
        
	</div> 
	
	