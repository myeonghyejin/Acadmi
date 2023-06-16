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
                            <a href="lecture/main?lectureNum=${lectureVO.lectureNum}" style="color: black;">${lectureVO.lectureName}</a>
                            &nbsp;[ ${lectureVO.professorVO.name} ]
                            &nbsp;( ${lectureVO.weekday}${lectureVO.startTime}-${lectureVO.endTime} )
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>