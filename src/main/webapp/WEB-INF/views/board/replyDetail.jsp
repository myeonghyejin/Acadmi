<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<sec:authentication property="principal.username" var="userName" />

	<div style="margin-left: 20px;">
		<div class="row" style="margin-bottom: 20px">
			<img class="fileIcon" src="/images/chatImg.png" style="margin-right: 5px; transform: scale(0.6);">
			<h3><a href="./detail?num=${reply.num}" style="color: black; font-size: 20px;">답글</a></h3>
			<h3 style="color: red; margin-left: 5px; margin-top: 7px; font-size: 20px;">1</h3>
			<h3 style="margin-left: 5px; color: black; margin-top: 8px; font-size: 20px;">개</h3>
		</div>
		
		<div class="strongFont3">
			<span class="mr-4 fontlight" style="font-size: 1.1em;">${reply.writer}</span>
			<span class="mr-4 fontlight" style="margin-left: 100px; font-size: 1.1em;">${reply.regDate}</span>
			<div class="row" style="margin-top: 10px;">
				<span class="mr-4 fontlight">
					<c:forEach items="${reply.fileVOs}" var="fileVO">
						<c:if test="${fileVO.oriName ne null}">
							<img class="fileIcon" src="/images/fileIcon.png" style="margin-right: 3px; transform: scale(0.6);">
							<a href="./fileDown?fileNum=${fileVO.fileNum}" style="font-size: 20px">${fileVO.oriName}</a>
						</c:if>
					</c:forEach>
				</span>
			</div>
				
			<div class="row" style="margin-top: 70px; margin-left: 5px">
				<span class="mr-4 fontlight"><a href="./detail?num=${reply.num}" style="color: black">${reply.contents}</a></span>
			</div>
		</div>
		
		<div class="row justify-content-end" style="margin-top: 100px;"> 
			<c:if test="${userName eq reply.writer}">
				<a href="./update?num=${reply.num}" id="update" class="btn btn-info" style="margin-right: 5px;">수정</a>
				<a id="replyDelete" data-board-num="${reply.num}" data-board-lectureNum="${reply.lectureNum}" class="btn btn-danger">삭제</a>                                    
			</c:if>
		</div>	
	</div>
