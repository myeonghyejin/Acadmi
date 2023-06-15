<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="mt-5 mx-5">
		<div>
			<div class="row">
				<h2 style="color:#17a2b8;margin-left:25px;margin-bottom:15px;width:85%">공지사항</h2>
				<div style="text-align:right;">
					<a class="btn btn-info" href="./notice/list"">더보기</a>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table">
					<tbody>
						<c:forEach items="${list}" var="notice">
							<tr style="width: 80%;">
								<td style="width:85%;margin-left:50px">
								<i class="fa-solid fa-circle fa-2xs" style="color: #17a2b8;"></i>
									<a class="title ml-1" href="/notice/detail?num=${notice.num}" style="color:black;">${notice.title}</a>
								</td>
                        		<td style="text-align:center;">${notice.regDate}</td>
                      		</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
        
	</div> 
	
	