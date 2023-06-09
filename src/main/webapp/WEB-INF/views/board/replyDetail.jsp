<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<sec:authentication property="principal.username" var="userName" />

	<div style="margin-left: 20px;">
		<div class="row" style="margin-bottom: 20px">
			<img class="fileIcon" src="/images/chatImg.png" style="margin-right: 5px; transform: scale(0.8);">
			<h3><a href="./detail?num=${reply.num}" style="color: black">댓글</a></h3>
			<h3 style="color: red; margin-left: 5px;">1</h3>
			<h3 style="margin-left: 5px; color: black;">개</h3>
		</div>
		<div class="strongFont3">
			<span class="mr-4 fontlight" style="font-size: 1.5em;">${reply.writer}</span>
			<span class="mr-4 fontlight" style="margin-left: 100px; font-size: 1.5em;">${reply.regDate}</span>
				<span class="mr-4 fontlight">
					<c:forEach items="${reply.fileVOs}" var="fileVO">
						<c:if test="${fileVO.oriName ne null}">
							<span class="mr-4" style="margin-left: 20px;">첨부파일</span>
							<a href="./fileDown?fileNum=${fileVO.fileNum}">${fileVO.oriName}</a>
						</c:if>
					</c:forEach>
				</span>
			<div class="row" style="margin-top: 70px; margin-left: 5px">
				<span class="mr-4 fontlight"><a href="./detail?num=${reply.num}" style="color: black">${reply.contents}</a></span>
			</div>
			
			<div class="row" style="margin-top: 40px; margin-left: 33px; display: flex; justify-content: center; align-items: center;">
				<c:if test="${userName eq reply.writer}">
					<a href="./update?num=${reply.num}" id="update" class="btn btn-info float-right" style="margin-right: 5px">수정</a>
					<a href="./delete?num=${reply.num}" id="delete" class="btn btn-danger float-right">삭제</a>
				</c:if>
			</div>	
		</div>
	</div>
