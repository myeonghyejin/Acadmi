<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<sec:authentication property="principal.username" var="userName" />

	<div class="pb-4 pt-4">
		<div class="strongFont3">
			<span class="mr-4">작성자</span>
			<span class="mr-4 fontlight">${reply.writer}</span>
			<span class="mr-4">작성일</span>
			<span class="mr-4 fontlight">${reply.regDate}</span>
			<span class="mr-4">내용</span>
			<span class="mr-4 fontlight">${reply.contents}</span>

			<span class="mr-4 fontlight">
				<c:forEach items="${reply.fileVOs}" var="fileVO">
					<c:if test="${fileVO.oriName ne null}">
						<span class="mr-4">파일</span>
						<img class="fileIcon" src="/images/fileIcon.png">
						<a href="./fileDown?fileNum=${fileVO.fileNum}">${fileVO.oriName}</a>
					</c:if>
				</c:forEach>
			</span>
			
			<c:if test="${userName eq reply.writer}">
				<a href="./update?num=${reply.num}" id="update" class="btn btn-info float-right">수정</a>	
				<a href="./delete?num=${reply.num}" id="delete" class="btn btn-danger float-right">삭제</a>
			</c:if>
		</div>
	</div>

