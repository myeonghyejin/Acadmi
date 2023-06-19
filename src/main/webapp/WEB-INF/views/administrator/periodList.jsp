<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<title>Insert title here</title>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Header 적용 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
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
		
		<div class="content-wrapper">
			<div class="col">
				<!-- header start -->
				<div class="row">
					<div class="col mt-3">
						<div class="card">
							<h3 class="my-3 mx-3">기간 목록 조회</h3>
						</div>
					</div>
				</div>
				<!-- header end -->
				
					<!-- Search -->
						<form action="./periodList" id="search-form">
							<input type="hidden" name="page" value="1">
								<div class="card search">
		               			<div class="row content">
		               				<label style="margin : 10px;">수강 년도</label>
		               				<select  class="select2" name="year" style="width: 15%;" id="year" >
		               				<option value="">전체</option>
		               				<c:forEach  begin="${map['min']}" end="${map['max']}" varStatus="i">
		               					<option value="${i.index}" ${lectureVO.year eq i.index  ? 'selected' : ''}>${i.index}</option>
		               				</c:forEach>
		               				
		       
		               				</select>
		               				<label style="margin : 10px;">학기</label>
		               				<select class="select2" name="semester"style="width: 15%;" id="semester">
		               					<option value="">전체</option>
		               					<option value="1" ${lectureVO.semester eq 1 ? 'selected' : '' }>1학기</option>
		               					<option value="2" ${lectureVO.semester eq 2 ? 'selected' : '' }>2학기</option>
		               				</select>
		               			</div>
		               		</div>
		               		
						</form>
				
				<!-- Default box -->
				<div class="card">
					<div class="card-header">
						
						<div class="card-tools">
							<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>		
						</div>
						
					
					</div>
					
					   <!-- Default box -->
					   <div class="card-body p-0">	
					   		<table class="table table-hover text-nowrap" style="text-align : center;">
					   			<thead>
					   				<tr>
					   					<th>수강연도</th>
					   					<th>학기</th>
					   					<th>수강 신청 시작일</th>
					   					<th>수강 신청 종료일</th>
					   					<th>장바구니 시작일</th>
					   					<th>장바구니 종료일</th>
					   					<th>강의 등록 시작일</th>
					   					<th>강의 등록 종료일</th>
					   				</tr>
					   			</thead>
					   			<tbody>
					   				<c:forEach items="${list}" var="periodVO">
					   					<tr class="container">
					   						<td>${periodVO.year }</td>
					   						<td>${periodVO.semester }</td>
					   						<td><fmt:formatDate value="${periodVO.applicationStart}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					   						<td><fmt:formatDate value="${periodVO.applicationEnd}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					   						<td><fmt:formatDate value="${periodVO.favoriteStart}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					   						<td><fmt:formatDate value="${periodVO.favoriteEnd}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					   						<td></td>
					   						<td><fmt:formatDate value="${periodVO.deadline}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					   					</tr>
					   				</c:forEach>
					   			</tbody>
					   		</table>
					   </div>
					   
					   <!-- /.card-body -->
				</div>
				<!-- /.card -->
				
					<!-- Pagination -->
				 <div class="row g-3 justify-content-center" style="margin: 20px auto;" id="pagination">
							<nav aria-label="pagination pagination-sm mx-auto" >
								<ul class="pagination pagination-sm mx-auto" style="width: 200px;">
									<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
										<a class="page-link" href="./periodList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./periodList?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./periodList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./periodList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./periodList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" style="color:#17a2b8;">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
					</div>
			</div>
		</div>
	</div>
	<!-- Footer 적용 -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- Footer 끝 -->
<script type="text/javascript">
$(function () {
    $('.select2').select2()
  });

</script>	
</body>
</html>