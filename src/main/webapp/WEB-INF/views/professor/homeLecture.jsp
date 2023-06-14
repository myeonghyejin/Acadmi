<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="col-12 mt-2" style="width: 70%">
		
		<!-- 2안 start -->
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
        <!-- 2안 end -->
        
        <!-- 3안 start -->
        <div class="row" style="padding-top:10px">
			<div class="col-12">
				<div class="card">
					<h5 class="my-3 mx-3" style="color:#17a2b8;font-weight:bold;">진행중인 강의 보기</h5>
				</div>
			</div>
		</div>
			<div class="card-body" style="padding:0px">
            	<div class="card card-info card-outline">
            		<c:forEach items="${list}" var="LectureVO">
	            		<div class="card-header">
							<a href="lecture/main?lectureNum=${LectureVO.lectureNum}" style="color: black;font-size: 18px">${LectureVO.lectureName}</a>
	            			&nbsp;[ ${LectureVO.category} ]
	            			&nbsp;( ${LectureVO.weekday}${LectureVO.startTime}-${LectureVO.endTime} )
						</div>
					</c:forEach>
            	</div>
          	</div>
        <!-- 3안 end -->
        
	</div> 
	
	