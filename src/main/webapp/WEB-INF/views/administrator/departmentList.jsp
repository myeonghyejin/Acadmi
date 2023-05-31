<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
	#row  {
		border : 1px solid black;
		padding: 50px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/administrator.jsp"></c:import>
	<div class="page-header">
		<div class="page-header-overlay">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<header class="entry-header wow fadeInDown" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;">
							<h1>
								학과 관리
							</h1>
						</header>
					</div>
				</div>
			</div>
		</div>
	</div>
	<header style="margin-top: 50px;">
	<div class="container-fluid">
		<div class="row col-md-7 mx-auto" id="row">
			<div class="row col-md-12 d-flex justify-content-end">
				<h4 style="">학과 목록 조회</h4>
				<table class="table table-fixed wow" data-wow-delay="0.1s" id="table2">
					<thead>
						<tr>
							<th>학과번호</th>
							<th>단과대학</th>
							<th>학과</th>
							<th>사용여부</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="collegeVO">
							<c:set value="${collegeVO.collegeName}" var="collegeName"></c:set>
							<c:forEach items="${collegeVO.departmentVOs}" var="departmentVO">
								<c:set value="${departmentVO.deptNum}" var="deptNum"></c:set>
								<c:set value="${departmentVO.deptName}" var="deptName"></c:set>
								<c:set value="${departmentVO.status}" var="status"></c:set>
								<tr class="dept">
									<c:if test="${status eq 1 }">
										<td><c:out value="${deptNum}"></c:out></td>
										<td><c:out value="${collegeName}"></c:out></td>
										<td><c:out value="${deptName}"></c:out></td>
										<td>
											<select name="status" class="status">
												<option value="1" selected>활성화</option>
												<option value="0">비활성화</option>
											</select>
										</td>
									</c:if>
									<c:if test="${status eq 0 }">
										<td style="color: #E2E2E2;"><c:out value="${deptNum}"></c:out></td>
										<td style="color: #E2E2E2;"><c:out value="${collegeName}"></c:out></td>
										<td style="color: #E2E2E2;"><c:out value="${deptName}"></c:out></td>
										<td>
											<select name="status" class="status">
												<option value="1">활성화</option>
												<option value="0" selected>비활성화</option>
											</select>
										</td>
									</c:if>
									<td>
										<button type="button" class="btn btn-primary" id="deptUpdate" data-dept="${deptNum}">
										수정
										</button>
									</td>
								</tr>
							</c:forEach>
							
						</c:forEach>
					</tbody>
				</table>
			</div>
			<a href="./departmentAdd"><button type="button" class="btn btn-primary">작성</button></a> 
		</div>
	</div>

			<div class="row d-flex justify-content-between">
					<nav aria-label="Page navigation example">
						<ul class="pagination d-flex justify-content-center wow fadeIn" data-wow-delay="0.1s"">
					 		<li class="page-item ${pagination.pre ? 'disabled' : '' }">
								<a class="page-link" href="./departmentList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item ${pagination.pre ? 'disabled' : ''}">
								<a class="page-link" href="./departmentList?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}">
									<span aria-hidden="true">&lsaquo;</span>
								</a>
							</li>
							<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
								<li class="page-item"><a class="page-link" href="./departmentList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}">${i}</a></li>
							</c:forEach>
							<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
								<a class="page-link" href="./departmentList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}">
									<span aria-hidden="true">&rsaquo;</span>
								</a>
							</li>
							<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
								<a class="page-link" href="./departmentList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
	</header>				
<script type="text/javascript" src="../js/administrator/departmentList.js"></script>	
</body>
</html>