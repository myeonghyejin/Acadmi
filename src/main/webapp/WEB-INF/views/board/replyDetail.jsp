<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<sec:authentication property="principal.username" var="userName" />

	<div style="margin-top: 5px; margin-left: 640px;">
		<div class="row" style="margin-bottom: 20px">
			<h3>댓글</h3>
		</div>
		<div class="strongFont3">
			<span class="mr-4">작성자</span>
			<span class="mr-4 fontlight">${reply.writer}</span>
			<span class="mr-4" style="margin-left: 20px;">작성일</span>
			<span class="mr-4 fontlight">${reply.regDate}</span>
				<span class="mr-4 fontlight">
					<c:forEach items="${reply.fileVOs}" var="fileVO">
						<c:if test="${fileVO.oriName ne null}">
							<span class="mr-4" style="margin-left: 20px;">첨부파일</span>
							<!-- <img class="fileIcon" width="20" height="20" src="/images/fileIcon.png"> -->
							<a href="./fileDown?fileNum=${fileVO.fileNum}">${fileVO.oriName}</a>
						</c:if>
					</c:forEach>
				</span>
			<div class="row" style="margin-top: 70px; margin-left: 5px">
				<span class="mr-4 fontlight"><a href="./detail?num=${reply.num}">${reply.contents}</a></span>
			</div>
			
			<div class="row" style="margin-top: 40px; margin-left: 33px; display: flex; justify-content: center; align-items: center;">
				<c:if test="${userName eq reply.writer}">
					<a href="./update?num=${reply.num}" id="update" class="btn btn-info float-right" style="margin-right: 5px">수정</a>	
					<a href="./delete?num=${reply.num}" id="delete" class="btn btn-danger float-right">삭제</a>
				</c:if>
			</div>	
		</div>
	</div>

