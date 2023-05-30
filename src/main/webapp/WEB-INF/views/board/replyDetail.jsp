<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="">
	<div class="border-bottom border-dark pb-4 pt-4 wow fadeInUp">
								<div class="strongFont3 wow fadeInUp">
									<span class="mr-4">작성자</span>
									<span class="mr-4 fontlight">${reply.writer}</span>
									<span class="mr-4">작성일</span>
									<span class="mr-4 fontlight">${reply.regDate}</span>
									<span class="mr-4">내용</span>
									<span class="mr-4 fontlight">${reply.contents}</span>
								</div>
							</div>
</c:if>
