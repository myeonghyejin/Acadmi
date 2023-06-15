<%@page import="com.acadmi.board.lectureNotice.LectureNoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 조회</title>
<c:import url="../temp/style.jsp"></c:import>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
</head>
<body class="hold-transition sidebar-mini">
	
	<sec:authorize access="hasRole('ROLE_PROFESSOR')">
		<c:import url="../temp/professor_header.jsp"></c:import>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_STUDENT')">
		<c:import url="../temp/student_header.jsp"></c:import>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
		<c:import url="../temp/administrator_header.jsp"></c:import>
	</sec:authorize>		
	
	<div class="wrapper">
		<div class="content-wrapper">
		  <section class="content">
			<div class="container-fluid" style="display: flex;">
			
			<c:if test="${board eq 'lectureNotice' || board eq 'lectureQna'}">
				<sec:authorize access="hasRole('ROLE_PROFESSOR')">
					<div class="row">
						<c:import url="../temp/sidebar/professor_lecture.jsp"></c:import>
					</div>
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_STUDENT')">
					<div class="row">
						<c:import url="../temp/sidebar/student_lecture_main.jsp"></c:import>
					</div>
				</sec:authorize>
			</c:if>
			
			  <div class="row" style="width: 3000px">
				<div class="col-12 mt-5">
				  <div class="callout callout-info">
					<h5 style="margin-bottom: 20px;"><i class="fas fa-info" style="margin-right: 10px;"></i>
						<c:if test="${board eq 'notice'}">
							공지사항
						</c:if>
						<c:if test="${board eq 'qna'}">
							질의응답
						</c:if>
						<c:if test="${board eq 'lectureNotice'}">
							강의공지사항
						</c:if>
						<c:if test="${board eq 'lectureQna'}">
							강의질의응답
						</c:if>
					</h5>
					<c:if test="${board eq 'notice'}">
						공지사항 게시판은 행정에서 교수, 학생 등에게 중요한 정보를 전달하고 공지하는 데 사용되는 게시판입니다.
					</c:if>
					<c:if test="${board eq 'qna'}">
						질의응답게시판(Q&A 게시판)은 사용자들이 질문을 하고, 행정이 그에 대한 답변을 제공하는 게시판입니다.
					</c:if>
					<c:if test="${board eq 'lectureNotice'}">
						강의 공지사항 게시판은 해당 강의 안에서 교수가 학생들에게 중요한 정보를 전달하고 공지하는 데 사용되는 게시판입니다.
					</c:if>
					<c:if test="${board eq 'lectureQna'}">
						강의 질의응답 게시판은 해당 강의 안에서 학생들이 교수에게 질문을 하고, 교수가 그에 대한 답변을 제공하는 게시판입니다.
					</c:if>
				  </div>
				
				<c:if test="${board eq 'qna' || board eq 'notice'}">
				  	<form class="row g-3 " action="./list" method="get" id="searchForm">
						<div class="col-auto ml-auto">
							<div class="input-group mb-4">
								<input type="hidden" name="page" value="1" id="page">
								<div class="col-auto">
									<label for="kind" class="visually-hidden"></label>
									<select class="form-select select2" name="kind" id="kind" aria-label="Default select example" style="width: 100px; height: 40px;">
										<option value="title" ${pagination.kind eq 'title' ? 'selected' :''}>제목</option>
										<option value="contents" ${pagination.kind eq 'contents' ?'selected':''}>내용</option>
									</select>
								</div>
								<input type="text" class="form-control" value="${pagination.search}" name="search" id="search" placeholder="검색어를 입력하세요" style="width: 300px; height: 40px;">
								<button type="submit" class="align-items-start btn btn-secondary" style="width: 100px; height: 40px; margin-left: 10px">검색</button>
							</div>
						</div>
					</form>
				</c:if>
				
				<c:if test="${board eq 'lectureQna' || board eq 'lectureNotice'}">
					<form class="row g-3 " action="./list" method="get" id="searchForm">
						<div class="col-auto ml-auto">
							<div class="input-group mb-4">
								<input type="hidden" name="page" value="1" id="page">
								<div class="col-auto">
									<label for="kind" class="visually-hidden"></label>
									<select class="form-select select2" name="kind" id="kind" aria-label="Default select example" style="width: 100px; height: 40px;">
										<option value="title" ${pagination.kind eq 'title' ? 'selected' :''}>제목</option>
										<option value="contents" ${pagination.kind eq 'contents' ?'selected':''}>내용</option>
									</select>
								</div>
								<input type="text" class="form-control" value="${pagination.search}" name="search" id="search" placeholder="검색어를 입력하세요" style="width: 300px; height: 40px;">
								<button type="submit" class="align-items-start btn btn-secondary lectureSearch" style="width: 100px; height: 40px; margin-left: 10px">검색</button>
							</div>
						</div>
					</form>
				</c:if>
				
				  <div class="invoice p-3 mb-3">
					<div class="row">
					  <div class="col-12 table-responsive">
						<table class="table table-hover text-nowrap" data-board-name="${board}">
							<thead class="table-light">
								<tr>
									<th>No</th>
									<th>제목</th>
									<c:if test="${board eq 'qna' || board eq 'lectureQna'}">
										<th>작성자</th>
									</c:if>
									<th>등록일</th>
									<c:if test="${board eq 'notice' || board eq 'lectureNotice'}">
										<th>수정일</th>
										<th>조회수</th>
									</c:if>
								</tr>
							</thead>
							<c:if test="${board eq 'notice'}">
								<tbody class="importantList">		
							</c:if>
							
								<sec:authentication property="principal.username" var="userName" />
								
								<sec:authentication property="principal.category" var="category" />
								
								<c:forEach items="${list}" var="dto">
								
									<c:if test="${board eq 'notice'}">
										<tr class="check-item" data-num-important="${dto.important}">
											<td class="noticeNum" data-num-id="${dto.num}">${dto.num}</td>
											<td class="d-flex align-items-center">								
												<a class="title" href="./detail?num=${dto.num}">${dto.title}</a>
												<c:forEach items="${dto.fileVOs}" var="fileVO">
													<c:if test="${fileVO.oriName ne null}">
														<img class="fileIcon" width="30" height="30" src="/images/fileIcon.png" style="margin-left: 5px">
													</c:if>
												</c:forEach>
											</td>
											<td>${dto.regDate}</td>
											<td>${dto.modifyDate}</td>
											<td>${dto.hit}</td>
										</tr>
									</c:if>
									
									<c:if test="${board eq 'qna'}">
										<tr class="check-item">
											<td class="qnaNum" data-num-id="${dto.num}">${dto.num}</td>
											<td class="d-flex align-items-center">
												<c:catch>
													<c:forEach begin="1" end="${dto.depth}">
														<img class="fileIcon2" width="20" height="20" src="/images/reply.png" style="margin-right: 5px">
													</c:forEach>							
												</c:catch>								
												<a class="title" href="./detail?num=${dto.num}">${dto.title}</a>
												<c:forEach items="${dto.fileVOs}" var="fileVO">
													<c:if test="${fileVO.oriName ne null}">
														<img class="fileIcon" width="30" height="30" src="/images/fileIcon.png" style="margin-left: 5px">
													</c:if>
												</c:forEach>
											</td>
											<c:forEach items="${students}" var="student">
												<c:forEach items="${professors}" var="professor">
													<c:choose>
													    <c:when test="${student.username eq dto.writer}">
													        <td>${student.name}</td>
													    </c:when>
													    <c:when test="${professor.username eq dto.writer}">
													        <td>${professor.name} 교수</td>
													    </c:when>
													    <c:otherwise>
													         <td>관리자</td>
													    </c:otherwise>
													</c:choose>
													
												</c:forEach>		
											</c:forEach>
											<td>${dto.regDate}</td>
										</tr>
									</c:if>	
																	
									<c:if test="${board eq 'lectureNotice'}">
										<tr class="check-item">
											<td class="noticeNum" data-num-id="${dto.num}" data-lectureNum-id="${dto.lectureNum}">${dto.num}</td>
											<td class="d-flex align-items-center">								
												<a class="title" href="./detail?num=${dto.num}">${dto.title}</a>
												<c:forEach items="${dto.fileVOs}" var="fileVO">
													<c:if test="${fileVO.oriName ne null}">
														<img class="fileIcon" width="30" height="30" src="/images/fileIcon.png" style="margin-left: 5px">
													</c:if>
												</c:forEach>
											</td>	
											<td>${dto.regDate}</td>
											<td>${dto.modifyDate}</td>
											<td>${dto.hit}</td>
										</tr>
									</c:if>
									
									<c:if test="${board eq 'lectureQna'}">										
										<tr class="check-item">
											<td class="qnaNum" data-num-id="${dto.num}" data-lectureNum-id="${dto.lectureNum}">${dto.num}</td>
											<td class="d-flex align-items-center">
												<c:catch>
													<c:forEach begin="1" end="${dto.depth}">
														<img class="fileIcon2" width="20" height="20" src="/images/reply.png" style="margin-right: 5px">
													</c:forEach>							
												</c:catch>
																								 																				 
												<c:if test="${dto.secret == 1 && dto.writer ne userName}">																	
													<c:choose>
													    <c:when test="${category == 1}">
													        <a class="title" href="./detail?num=${dto.num}">${dto.title}</a>
													    </c:when>
													    <c:otherwise>
													        <a class="title">비밀글입니다.</a>	
													    </c:otherwise>
													</c:choose>																	
												</c:if>
															
												<c:if test="${dto.secret == 1 && dto.writer eq userName}">
													<a class="title" href="./detail?num=${dto.num}">${dto.title}</a>						
												</c:if>		
																				
												<c:if test="${dto.secret == 0 || empty dto.secret}">		
													<a class="title" href="./detail?num=${dto.num}">${dto.title}</a>
												</c:if>
												
												<c:if test="${dto.secret == 1}">
													<img class="lockIcon" width="30" height="30" src="/images/lock.png" style="margin-left: 5px">
												</c:if>
												 
												<c:forEach items="${dto.fileVOs}" var="fileVO">
													<c:if test="${fileVO.oriName ne null}">
														<img class="fileIcon" width="30" height="30" src="/images/fileIcon.png" style="margin-left: 5px">						
													</c:if>
												</c:forEach>
											</td>			
											<c:forEach items="${students}" var="student">
												<c:forEach items="${professors}" var="professor">
													<c:if test="${student.username eq dto.writer}">
														<td>${student.name}</td>
													</c:if>
													<c:if test="${professor.username eq dto.writer}">
														<td>${professor.name} 교수</td>
													</c:if>
												</c:forEach>		
											</c:forEach>
											<td>${dto.regDate}</td>
										</tr>
									</c:if>	
								</c:forEach>
							</tbody>
						</table>
						
						<div class="col-12 float-right">
							<c:if test="${board eq 'notice'}">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
						    		<a class="float-right btn btn-primary" href="./add">작성</a>
						  		 </sec:authorize>
							</c:if>
							
							<c:if test="${board eq 'notice'}">
								<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
						    		<a class="float-right btn btn-primary" href="./add">작성</a>
						  		 </sec:authorize>
							</c:if>
							
						   <c:if test="${board eq 'qna'}">
								<sec:authorize access="hasRole('ROLE_STUDENT')">
						    		<a class="float-right btn btn-primary" href="./add">작성</a>
						  		 </sec:authorize>
							</c:if>
						   
						   <c:if test="${board eq 'qna'}">
								<sec:authorize access="hasRole('ROLE_PROFESSOR')">
						    		<a class="float-right btn btn-primary" href="./add">작성</a>
						  		 </sec:authorize>
							</c:if>
							
							<c:if test="${board eq 'lectureNotice'}">
								<sec:authorize access="hasRole('ROLE_PROFESSOR')">
						    		<a class="float-right btn btn-primary" href="./add?lectureNum=${pagination.lectureNum}">작성</a>
						  		</sec:authorize>
							</c:if>
							
							<c:if test="${board eq 'lectureQna'}">
								<sec:authorize access="hasRole('ROLE_STUDENT')">
						    		<a class="float-right btn btn-primary" href="./add?lectureNum=${pagination.lectureNum}">작성</a>
						  		</sec:authorize>
							</c:if>
						</div>
					  </div>

					<c:if test="${board eq 'qna' || board eq 'notice'}">
					  	<div class="row" style="margin: 20px auto;">
							<nav aria-label="Page navigation example">
								<ul class="pagination d-flex justify-content-center">
									<li class="page-item ${pagination.pre ? 'disabled' : '' }">
										<a class="page-link" href="./list?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre ? 'disabled' : ''}">
										<a class="page-link" href="./list?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./list?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./list?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>
					</c:if>	
						
					<c:if test="${board eq 'lectureQna' || board eq 'lectureNotice'}">	
						<div class="row" style="margin: 20px auto;">
							<nav aria-label="Page navigation example">
								<ul class="pagination d-flex justify-content-center">
									<li class="page-item ${pagination.pre ? 'disabled' : '' }">
										<a class="page-link" href="./list?lectureNum=${pagination.lectureNum}&page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre ? 'disabled' : ''}">
										<a class="page-link" href="./list?lectureNum=${pagination.lectureNum}&page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./list?lectureNum=${pagination.lectureNum}&page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./list?lectureNum=${pagination.lectureNum}&page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link lectureNums" href="./list?lectureNum=${pagination.lectureNum}&page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" data-lectureNum-id="${pagination.lectureNum}">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>				
					</c:if>		
					</div>         
				  </div>
				</div>
			  </div>
			</div>
		  </section>
		</div>
	</div>
		
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/js/board/notice.js"></script>
	
	<script>
	  $(document).ready(function() {
	
	    $('.lectureSearch').on('click', function(event) {
	      event.preventDefault();
	      
	      let boardName = $(".table").attr("data-board-name");
	      
	      if(boardName == 'lectureNotice'){
	    	  let lectureNum = $(".lectureNums").attr("data-lectureNum-id");
	    	  let page = $(".page-link").attr("data-board-page");
		      let kind = $('#kind').val();
		      let search = $('#search').val();
		      
		      let newUrl = './list?lectureNum=' + lectureNum + "&page=" + page + "&kind=" + kind + "&search=" + search;
		      
		      window.location.href = newUrl;    	 
	      } else if (boardName == 'lectureQna') {
	    	  let lectureNum = $(".lectureNums").attr("data-lectureNum-id");
	    	  let page = $(".page-link").attr("data-board-page");
		      let kind = $('#kind').val();
		      let search = $('#search').val();
		          
		      let newUrl = './list?lectureNum=' + lectureNum + "&page=" + page + "&kind=" + kind + "&search=" + search;
		      
		      window.location.href = newUrl; 
	      } else {
	    	  console.log("게시판 없음")
	      }  
	    });
	  });
	  
	  $(function () {
	      $('.select2').select2()
	    });
	</script>
</body>
</html>