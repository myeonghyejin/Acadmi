<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mt-3 mx-5">
    <div class="row mt-4">
        <div class="col-12">
            <div class="card">
                <h5 class="my-3 mx-3" style="color:#17a2b8;">진행중인 강의 보기</h5>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${empty list}">
            <div class="card-body" style="padding:0px">
                <div class="card card-info card-outline" style="padding: 15px;">
                    진행중인 강의가 없습니다.
                </div>
            </div>
        </c:when>

        <c:otherwise>
            <div class="card-body" style="padding:0px">
                <div class="card card-info card-outline">
                    <c:forEach items="${list}" var="lectureVO">
                        <div class="card-header">
                            <a href="student/lecture/main?lectureNum=${lectureVO.lectureNum}" style="color: black;">${lectureVO.lectureName}</a>
                            &nbsp;[ ${lectureVO.professorVO.name} ]
                            &nbsp;&nbsp;( ${lectureVO.weekday}
	            			<c:if test="${lectureVO.startTime eq 1}"> 09:00</c:if>
							<c:if test="${lectureVO.startTime eq 2}"> 10:00</c:if>
							<c:if test="${lectureVO.startTime eq 3}"> 11:00</c:if>
							<c:if test="${lectureVO.startTime eq 4}"> 12:00</c:if>
							<c:if test="${lectureVO.startTime eq 5}"> 13:00</c:if>
							<c:if test="${lectureVO.startTime eq 6}"> 14:00</c:if>
							<c:if test="${lectureVO.startTime eq 7}"> 15:00</c:if>
							<c:if test="${lectureVO.startTime eq 8}"> 16:00</c:if>
							<c:if test="${lectureVO.startTime eq 9}"> 17:00</c:if>
							<c:if test="${lectureVO.startTime eq 10}"> 18:00</c:if>
	            			~
	            			<c:if test="${lectureVO.endTime eq 1}"> 10:00</c:if>
							<c:if test="${lectureVO.endTime eq 2}"> 11:00</c:if>
							<c:if test="${lectureVO.endTime eq 3}"> 12:00</c:if>
							<c:if test="${lectureVO.endTime eq 4}"> 13:00</c:if>
							<c:if test="${lectureVO.endTime eq 5}"> 14:00</c:if>
							<c:if test="${lectureVO.endTime eq 6}"> 15:00</c:if>
							<c:if test="${lectureVO.endTime eq 7}"> 16:00</c:if>
							<c:if test="${lectureVO.endTime eq 8}"> 17:00</c:if>
							<c:if test="${lectureVO.endTime eq 9}"> 18:00</c:if>
							<c:if test="${lectureVO.endTime eq 10}"> 19:00</c:if>
							)
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>