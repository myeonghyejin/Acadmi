<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:forEach items="${importantList}" var="importantList">
	<tr style="background-color: #ffefb9;">
		<td class="noticeNum" data-num-id="${importantList.num}">${importantList.num}</td>
		<td class="d-flex align-items-center">
			<a class="title" href="./detail?num=${importantList.num}">${importantList.title}</a>
			<c:forEach items="${importantList.fileVOs}" var="fileVO">
			<c:if test="${fileVO.oriName ne null}">
				<img class="fileIcon" width="30" height="30" src="/images/fileIcon.png" style="margin-left: 5px">
			</c:if>
		</c:forEach>
		</td>
		<%-- <td>${importantList.writer}</td> --%>
		<td>${importantList.regDate}</td>
		<td>${importantList.modifyDate}</td>
		<td>${importantList.hit}</td>
	</tr>
</c:forEach>