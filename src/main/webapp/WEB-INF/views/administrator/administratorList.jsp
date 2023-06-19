<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<style type="text/css">

	#row {
	  display: flex;
	  justify-content: center; /* 가로 방향으로 가운데 정렬 */
	  align-items: center; /* 세로 방향으로 가운데 정렬 */
	}
	
	.col-custom {
	  flex-grow: 1;
	}

</style>
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

		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper">
					<c:import url="../temp/sidebar/administrator_memberList.jsp"></c:import>
				</div>
				<!-- 2레벨 Sidebar 끝 -->
				
				<!-- Contents -->
				<div class="col">
				<!-- header start -->
					<div class="row" style="padding-top:20px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">직원 목록 조회</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					<!-- Default box -->
					
					<!-- header end -->
					<!-- Default box -->
					<div class="card">
						<div class="card-header">
							<div class="card-tools">
								<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
									<i class="fas fa-minus"></i>
								</button>		
							</div>
							<form action="./administratorList" id="search-form">
								<c:forEach items="${list}" var="departmentVO">
									<c:forEach items="${departmentVO.administratorVOs}" var="administratorVO">
										<c:set var="administratorName" value="${administratorVO.name}"></c:set>
					   	 				<c:set var="administratorPhone" value="${administratorVO.phone}"></c:set>
					   	 				<c:set var="administratorEmail" value="${administratorVO.email}"></c:set>
					   	 				<c:set var="administratorStatus" value="${administratorVO.status}"></c:set>
					   	 				<c:set var="administratoruserName" value="${administratorVO.username}"></c:set>
									</c:forEach>
								</c:forEach>
									<input type="hidden" name="page" value="1">
										<div class="row justify-content-center mx-auto my-3" >
											<div class="col-custom">
													<div class="row" id="row">
														<div class="col-2">
															<div class="form-group">
																<label>상태</label>
																<select class="select2" style="width: 100%;" name="status">
																	<option value="">전체</option>
																	<option value="1"${administratorStatus eq 1 ? 'selected' : '' }>재직</option>
																	<option value="2"${administratorStatus eq 2 ? 'selected' : '' } >휴직</option>
																	<option value="3"${administratorStatus eq 3 ? 'selected' : '' }>퇴직</option>
																</select>
															</div>
														</div>
														<div class="col-4">
															<div class="form-group">
																<label>직원 번호</label>
																<input type="text" class="form-control" name="username" placeholder="내용을 입력하세요.">
															</div>
														</div>
														<div class="col-4">
															<div class="form-group">
																<label>이름</label>
																<div class="input-group">
																	<input type="text" class="form-control" placeholder="이름을 입력하세요." name="search" value="${pagination.search}">
																	<div class="input-group-append">
																		<button type="submit" class="btn btn-default" id="submit">
																			<i class="fas fa-search "></i>
																		</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
		
											</div>
										</div>
									
				              		<div class="card-body">
				              		<table class="table table-hover text-nowrap" style="text-align : center;"  id="tableAdmin">
			             				 <thead>
							                  <tr>
							                      <th style="width: 10%">
							                          쪽지
							                      </th>
							                      <th style="width: 10%">
							                          사진
							                      </th>
							                      <th style="width: 10%">
							                      	  직원번호
							                      </th>
							                      <th style="width: 10%" class="text-center">
							                          성명
							                      </th>
							                      <th style="width : 15%">
							                          연락처
							                      </th>
							                      <th style="width: 10%" class="text-center">
							                          이메일
							                      </th>
							                      <th style="width: 20%">
							                      	  담당학과
							                      </th>
							                      <th style="width: 20%">
							                      	  상태
							                      </th>
							                  </tr>
							              </thead>
							              <tbody>
							                  <c:forEach items="${list}" var="departmentVO">
								   	 		<tr>
								   	 			<c:set var="department" value="${departmentVO.deptName}"></c:set>
								   	 			<c:forEach items="${departmentVO.administratorVOs}" var="administratorVO">
								   	 				<c:set var="administratorName" value="${administratorVO.name}"></c:set>
								   	 				<c:set var="administratorPhone" value="${administratorVO.phone}"></c:set>
								   	 				<c:set var="administratorEmail" value="${administratorVO.email}"></c:set>
								   	 				<c:set var="administratorStatus" value="${administratorVO.status}"></c:set>
								   	 				<c:set var="administratoruserName" value="${administratorVO.username}"></c:set>
								   	 				<c:set var="memberFiles" value="${administratorVO.memberFilesVO.fileName}"></c:set>
								   	 				<tr>
									   	 				
									   	 			<td>
				     	 								<sec:authentication property="principal.username" var="username"/>
							     	 					<a href="../chat/detail?roomSender=${username}&roomRecipient=${administratorVO.username}"><i class="fa-regular fa-envelope fa-2xl" style="margin:30px 0 0 0;"></i></a>
				     	 							</td>
									   	 			<td>
									   	 				<c:if test="${empty memberFiles}">
									   	 					  <img class="img-circle elevation-2"
														             src="/images/profile.jpg"
														             alt="User profile picture" style="width :4.3rem">
									   	 				</c:if>
									   	 				<c:if test="${not empty memberFiles}">
									   	 					<img class="img-circle elevation-2" src="/file/member/${memberFiles}" width="70rem" height="70rem">
									   	 				</c:if>	
									   	 				
									   	 			</td>
									   	 			<td><c:out value="${administratoruserName}"></c:out></td>
									   	 			<td><c:out value="${administratorName}"></c:out></td>
									   	 			<td><c:out value="${administratorPhone}"></c:out></td>
									   	 			<td><c:out value="${administratorEmail}"></c:out></td>
									   	 			<td><c:out value="${department}"></c:out></td>
									   	 			<c:if test="${administratorStatus eq 1}">
									   	 				<td>재직</td>
									   	 			</c:if>
									   	 			<c:if test="${administratorStatus eq 2}">
									   	 				<td>휴직</td>
									   	 			</c:if>
									   	 			<c:if test="${administratorStatus eq 3}">
									   	 				<td>퇴직</td>
									   	 			</c:if>
								   	 				</tr>
								   	 			</c:forEach>
								   	 		</tr>	
								   	 		</c:forEach>
							              </tbody>
			          				</table>
				            	</div>
				            	  <div class="row g-3 justify-content-center" style="margin: 20px auto;" id="pagination">
									<nav aria-label="Page navigation example">
										<ul class="pagination pagination-sm mx-auto"  style="width: 200px;">
										
											<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
												<a class="page-link" href="./administratorList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</li>
											<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
												<a class="page-link" href="./administratorList?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
													<span aria-hidden="true">&lsaquo;</span>
												</a>
											</li>
											<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
												<li class="page-item"><a class="page-link" href="./administratorList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
											</c:forEach>
											<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
												<a class="page-link" href="./administratorList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
													<span aria-hidden="true">&rsaquo;</span>
												</a>
											</li>
											<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
												<a class="page-link" href="./administratorList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" style="color:#17a2b8;">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</li>
										</ul>
									</nav>
								</div>
								
							</form>
						</div>		
					</div>
				</div>
			</div>
		</div>

	<!-- Footer 적용 -->
	<c:import url="../temp/footer.jsp"></c:import>
	<!-- Footer 끝 -->
	
	<script>
	    $(function () {
	      $('.select2').select2()
	    });
	</script>

	</div>
<!-- ./wrapper -->
</body>
</body>
</html>