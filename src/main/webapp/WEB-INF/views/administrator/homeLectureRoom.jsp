<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div class="mt-5 mb-3 mx-5">
	<div class="row mt-4 ">
		<div class="col-12">
				<div class="card card-info card-outline">
					<div class="row">
						<h4 class="my-3 ml-4 mr-2" style="color: #17a2b8;">강의실 배정</h4>
						<div style="display: inline-block; margin-top: 16px; margin-left : 13px;">
							<a class="btn btn-info btn-sm"  href="/administrator/lectureList">더 보기</a>
						</div>
					</div>
					<hr class="mx-3" style="margin:0px;">
            		<c:forEach items="${list}" var="lectureVO">
						<a class="title ml-1"  style="color:black;">
							<c:if test="${lectureVO.lectureBuilding eq null}">
		            		<div class="card-header mx-3 row" style="padding-left:0px;">
		            			<div class="col-5">
			            			${lectureVO.lectureName}
		            			</div>
		            			<div class="col-1">
			            			${lectureVO.weekday}요일
		            			</div>
		            			<div class="col-1">
		            				${lectureVO.startTime}교시
		            			</div>
		            			<div class="col-1">
		            				${lectureVO.endTime}교시
		            			</div>
		            			<div class="col-2">
		            				${lectureVO.personal}명
		            			</div>
		            			
		            		</div>
		            		</c:if>
						</a>
					</c:forEach>
				</div>
			</div>
	</div>
</div>
