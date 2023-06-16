<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 상세</title>
<c:import url="../temp/style.jsp"></c:import>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
</head>
<body class="hold-transition sidebar-mini">

	<sec:authentication property="principal.username" var="userName" />
					
	<sec:authentication property="principal.category" var="category" />

	<!-- Header 적용 -->
	<sec:authorize acess="hasRole('ROLE_ADMIN')">
		<c:import url="../temp/administrator_header.jsp"></c:import>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
		<c:import url="../temp/administrator_header.jsp"></c:import>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_PROFESSOR')">
		<c:import url="../temp/professor_header.jsp"></c:import>
	</sec:authorize>
		
	<sec:authorize access="hasRole('ROLE_STUDENT')">
		<c:import url="../temp/student_header.jsp"></c:import>
	</sec:authorize>
	<!-- Header 끝 -->
	
	<div class="wrapper">
		<div class="content-wrapper">
		<section class="content">
			<div class="callout callout-info" style="margin-top: 50px; border-top: 1px solid #cecece;">
				<h5 style="margin-bottom: 20px;">
					<c:if test="${board eq 'notice'}">
						<h3 style="font-size: 30px">학사 공지</h3>
					</c:if>

					<c:if test="${board eq 'lectureNotice'}">
						<h3 style="font-size: 30px">강의 공지</h3>
					</c:if>
					
					<c:if test="${board eq 'qna' || board eq 'lectureQna'}">
						<h3 style="font-size: 30px">질의응답 Q&A</h3>
					</c:if>
				</h5>
			</div>
		
			<div class="card" style="padding-top: 50px; margin-top: 40px;">
				<div class="card-body">
				<div class="row">
					<table class="table" data-board-name="${board}">
						<tr>
						    <th width=20% class="text-center warning" style="background-color:#cecece">번호</th>
						    <td width=30% class="text-center">${boardVO.num}</td>
						    <th width=20% class="text-center warning" style="background-color:#cecece; border-bottom: 1px solid #d6d6cd;">작성일</th>
					        <td width=30% class="text-center" style="border-bottom: 1px solid #d6d6cd;">${boardVO.regDate}</td>
					    </tr>     
						 <tr>
					         <th width=20% class="text-center warning" style="background-color:#cecece">작성자</th>
						   	 <td width=30% class="text-center">${boardVO.writer}</td>
				         </tr>
						 <tr>
					         <th width=20% class="text-center warning" style="background-color:#cecece">제목</th>
					         <td colspan="3">${boardVO.title}</td>
				         </tr>
				         
				         <tr>
					         <th width=20% class="text-center warning" style="background-color:#cecece">첨부파일</th>
					         <td colspan="3">
					         	<c:forEach items="${boardVO.fileVOs}" var="fileVO">
									<img class="fileIcon" width="30" height="30" src="/images/fileIcon.png" style="margin-right: 5px">
			                        <a href="./fileDown?fileNum=${fileVO.fileNum}">${fileVO.oriName}</a>
		                    	</c:forEach>
					         </td>
				         </tr>
         
				         <tr>
					         <td colspan="4" class="text-left" valign="top" height="200">
					         	<pre style="white-space: pre-wrap;border:none;background-color: white; font-size: 23px;">${boardVO.contents}</pre>
					         </td>   
				         </tr>
	
						<tr>
				          <td colspan="4" class="text-right">
					        <c:if test="${board eq 'qna'}">
								<c:if test="${num ne 2}">
									<c:if test="${boardVO.step ne 1}">
										<c:if test="${category == 0}">
											<a href="./reply?num=${boardVO.num}" class="btn btn-primary" style="margin-right: 5px">답글</a>
										</c:if>
									</c:if>
								</c:if>
							</c:if>
							
							<c:if test="${board eq 'lectureQna'}">
								<c:if test="${num ne 2}">
									<c:if test="${boardVO.step ne 1}">
										<c:if test="${category == 1}">
											<a href="./reply?num=${boardVO.num}&lectureNum=${boardVO.lectureNum}" class="btn btn-primary" style="margin-right: 5px">답글</a>
										</c:if>
									</c:if>
								</c:if>
							</c:if>
							
				            <c:if test="${userName eq boardVO.writer}">
								<a href="./update?num=${boardVO.num}" id="update" class="btn btn-info float-right">수정</a>
								<c:if test="${board eq 'qna' || board eq 'notice'}">
									<a id="delete" data-board-num="${boardVO.num}" data-board-name="${board}" class="btn btn-danger float-right" style="margin-right: 5px">삭제</a>
								</c:if>
								<c:if test="${board eq 'lectureQna' || board eq 'lectureNotice'}">
									<a id="delete" data-board-num="${boardVO.num}" data-board-name="${board}" data-board-lectureNum="${boardVO.lectureNum}" class="btn btn-danger float-right" style="margin-right: 5px">삭제</a>
								</c:if>
							</c:if>
							<c:if test="${board eq 'qna' || board eq 'notice'}">
				            	<a href="./list" class="btn btn-light float-left">목록</a>
				            </c:if>
				            <c:if test="${board eq 'lectureQna' || board eq 'lectureNotice'}">
				            	<a href="./list?lectureNum=${boardVO.lectureNum}" class="btn btn-light float-left">목록</a>
				            </c:if>
				          </td>
				        </tr>
				</table>

				<c:if test="${board eq 'qna' || board eq 'lectureQna'}">
					<div class="col-12">
						<div class="post" style="margin-top: 50px;">
							<div class="user-block">
								<c:if test="${num eq 2}">
									<div class="replyDetail" data-num-id="${boardVO.num}">
													
									</div>
								</c:if>
							</div>
						</div> 
					</div>
				</c:if>		
		  		
				   	</div>
				</div>
			</div>
		</section>
	</div>
</div>
	
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/js/board/notice.js"></script>
	<script src="/js/board/qnaReply.js"></script>
</body>
</html>