<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="my-3 mx-5">
        <!-- homeLecture Head start -->
        <div class="row mt-4">
			<div class="col-12">
				<div class="card card-info card-outline">
					<h4 class="my-3 mx-3" style="color:#17a2b8;">진행중인 강의 보기</h4>
				</div>
			</div>
		</div>
		<!-- homeLecture Head end -->
		
		<!-- homeLecture Body start -->
		<div class="card-body" style="padding:0px">
            <div class="card">
            	<c:forEach items="${list}" var="LectureVO">
            		<a href="lecture/main?lectureNum=${LectureVO.lectureNum}" style="color: black;">
	            		<div class="card-header">
	            			[ ${LectureVO.category} ]&nbsp;&nbsp;${LectureVO.lectureName}
	            			
	            			&nbsp;&nbsp;( ${LectureVO.weekday}
	            			<c:if test="${LectureVO.startTime eq 1}"> 09:00</c:if>
							<c:if test="${LectureVO.startTime eq 2}"> 10:00</c:if>
							<c:if test="${LectureVO.startTime eq 3}"> 11:00</c:if>
							<c:if test="${LectureVO.startTime eq 4}"> 12:00</c:if>
							<c:if test="${LectureVO.startTime eq 5}"> 13:00</c:if>
							<c:if test="${LectureVO.startTime eq 6}"> 14:00</c:if>
							<c:if test="${LectureVO.startTime eq 7}"> 15:00</c:if>
							<c:if test="${LectureVO.startTime eq 8}"> 16:00</c:if>
							<c:if test="${LectureVO.startTime eq 9}"> 17:00</c:if>
							<c:if test="${lectureVO.startTime eq 10}"> 18:00</c:if>
	            			~
	            			<c:if test="${LectureVO.endTime eq 1}"> 10:00</c:if>
							<c:if test="${LectureVO.endTime eq 2}"> 11:00</c:if>
							<c:if test="${LectureVO.endTime eq 3}"> 12:00</c:if>
							<c:if test="${LectureVO.endTime eq 4}"> 13:00</c:if>
							<c:if test="${LectureVO.endTime eq 5}"> 14:00</c:if>
							<c:if test="${LectureVO.endTime eq 6}"> 15:00</c:if>
							<c:if test="${LectureVO.endTime eq 7}"> 16:00</c:if>
							<c:if test="${LectureVO.endTime eq 8}"> 17:00</c:if>
							<c:if test="${LectureVO.endTime eq 9}"> 18:00</c:if>
							<c:if test="${LectureVO.endTime eq 10}"> 19:00</c:if>
							)
						</div>
					</a>
				</c:forEach>
            </div>
		</div>
        <!-- homeLecture Body end -->
	</div> 
	
	