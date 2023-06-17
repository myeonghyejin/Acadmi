<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="mt-3 mx-5">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<h3 style="color:#17a2b8;text-align:center;margin-bottom:20px;">중요 공지사항</h3>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="important">
						<tr>
							<td style="height:90px;vertical-align:middle;">
								<i class="fa-regular fa-circle-check fa-2xl" style="color: #17a2b8;"></i> &nbsp;&nbsp;&nbsp;
								<a href="/notice/detail?num=${important.num}" style="color:black;">${important.title}</a>
							</td>
                      	</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div> 
	
	