<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
</head>
<body class="courses-page">
	<div class="page-header">
		<div class="page-header-overlay">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<header class="entry-header wow fadeInDown" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;">
							<h1>
								<c:if test="${board eq 'notice'}">
									공지사항
								</c:if>
								<c:if test="${board eq 'qna'}">
									질의응답게시판
								</c:if>
							</h1>
						</header>
					</div>
				</div>
			</div>
		</div>
	</div>
			
	<c:import url="../temp/header.jsp"></c:import>
			<header style="margin-top: 50px;">
				<div class="container-fluid">
					<div class="row col-md-7 mx-auto ">
						<div class="row col-md-12 d-flex justify-content-end">
							<form class="row g-3 " action="./list" method="get" id="searchForm">
								
								<div class="col-auto ml-auto">
									<div class="input-group mb-4">
										<input type="hidden" name="page" value="1" id="page">
										<div class="col-auto">
											<label for="kind" class="visually-hidden"></label>
											<select class="form-select wow fadeInUp" data-wow-delay="0.1s" name="kind" id="kind"
												aria-label="Default select example">
												<option value="title" ${pagination.kind eq 'title' ? 'selected' :''}>제목</option>
												<option value="contents" ${pagination.kind eq 'contents' ?'selected':''}>내용
												</option>
												<option value="writer" ${pagination.kind eq 'writer' ? 'selected' :''}>작성자
												</option>
											</select>
										</div>
										<input type="text" class="form-control mb-4 wow fadeInUp" data-wow-delay="0.1s"
											style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;"
											value="${pagination.search}" name="search" id="search" placeholder="검색어를 입력하세요">
										<button type="submit" class="align-items-start btn btn-primary">검색</button>
									</div>
								</div>
							</form>
						</div>

						<table class="table table-fixed wow" data-wow-delay="0.1s">
							<thead class="table-light">
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
							</thead>
								
							<tbody>		
							
								<tr class="importantList" style="background-color: #f2f2f2;">
									
								</tr>
								
								
								<c:forEach items="${list}" var="dto">
									<tr class="check-item" data-num-important="${dto.important}">
									
										<td class="noticeNum" data-num-id="${dto.num}">${dto.num}</td>
										
										<td class="d-flex align-items-center">
											<a class="title" href="./detail?num=${dto.num}">${dto.title}</a>
										</td>
										<td>${dto.writer}</td>
										<td>${dto.regDate}</td>
										<td>${dto.hit}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<div class="col-12 float-right">	
							<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
						    	<a class="float-right btn btn-primary" href="./add">작성</a>
						    </sec:authorize>
						</div>
						
				<div class="row d-flex justify-content-between">
					<nav aria-label="Page navigation example">
						<ul class="pagination d-flex justify-content-center wow fadeIn" data-wow-delay="0.1s"">
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
					
				</div>
			</div>
		</header>
		
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/js/notice.js"></script>
</body>
</html>