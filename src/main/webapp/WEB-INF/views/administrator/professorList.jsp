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
								<h3 class="my-3 mx-3">교수 목록 조회</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					<!-- Default box -->
					<div class="card">
						<div class="card-header">
							<div class="card-tools">
								<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
									<i class="fas fa-minus"></i>
								</button>		
							</div>
						<form action="./professorList" id="search-form">
							
								<input type="hidden" name="page" value="1">
									<div class="row justify-content-center mx-auto my-3" >
										<div class="col-md-8">
											<div class="row">
												<div class="col-4">
													<div class="form-group">
														<label>담당대학</label>
														<select class="select2" name="collegeName" style="width : 100%;" id="college" onchange="updateDepartmentOptions()">
														<option value="">전체</option>
															<c:forEach items="${college}" var="collegeVO">
																<c:if test="${collegeVO.collegeNum != 1 && collegeVO.collegeNum != 2}">
																	<option value="${collegeVO.collegeName}">${collegeVO.collegeName }</option>
																</c:if>	
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="col-4">
													<div class="form-group">
														<label >담당학과</label>
														<select  class="select2" style="width : 100%;" name="deptName" id="dept">
															<option value="">전체</option>
															<c:forEach items="${department}" var="departmentVO">
																<c:if test="${departmentVO.deptNum !=1 && departmentVO.deptNum !=2 }">
																	<option value="${departmentVO.deptName}">${departmentVO.deptName}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="col-4">
													<div class="form-group">
														<label >상태</label>
														<select class="select2" name="status" style="width: 100%;">
															<option value="">전체</option>
															<option value="1">재직</option>
															<option value="2">휴직</option>
															<option value="3">퇴직</option>
														</select>
													</div>
												</div>
												
											</div>
											<div class="row">
												<div class="col-6">
													<div class="form-group">
														<label>교수 번호</label>
														<input type="text" class="form-control" name="username" placeholder="교수 번호를 입력하세요.">
													</div>
												</div>
												<div class="col-6">
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
								 <table class="table table-hover text-nowrap" style="text-align : center;"  id="tableProfessor">
					              <thead>
					                  <tr>
					                      <th style="width: 10%">
					                          쪽지
					                      </th>
					                      <th style="width: 10%">
					                          사진
					                      </th>
					                      
					                       <th style="width: 10%">
					                          교수번호
					                      </th>
					         
					                      <th style="width: 5%" class="text-center">
					                          성명
					                      </th>
					                     
					                       <th style="width: 15%" class="text-center">
					                          담당대학
					                      </th>
	
					                      <th style="width: 15%">
					                      	  담당학과
					                      </th>
					                       <th style="width : 10%">
					                          연락처
					                      </th>
					                      <th style="width:10%">
					                      	이메일
					                      </th>
					                      <th style="width:15%">
					                      	사무실
					                      </th>
					                      <th style="width: 20%">
					                      	  상태
					                      </th>
					                  </tr>
					              </thead>
					              <tbody>
					              <c:forEach items="${list}" var="collegeVO">
				   	 				<tr>
									<c:set var="collegeName" value="${collegeVO.collegeName}"></c:set>
									<c:set var="collegeBuilding" value="${collegeVO.building}"></c:set>
									<c:forEach items="${collegeVO.departmentVOs}" var="departmentVO">
										<c:set var="department" value="${departmentVO.deptName}"></c:set>
										<c:forEach items="${departmentVO.professorVOs}" var="professorVO">
											<c:set var="professorName" value="${professorVO.name}"></c:set>
											<c:set var="professorPhone" value="${professorVO.phone}"></c:set>
											<c:set var="professorEmail" value="${professorVO.email}"></c:set>
											<c:set var="professorRoom" value="${professorVO.professorRoom}"></c:set>
											<c:set var="professorStatus" value="${professorVO.status}"></c:set>
											<c:set var="professoruserName" value="${professorVO.username}"></c:set>
											<c:set var="memberFiles" value="${professorVO.memberFilesVO.fileName }"></c:set>
											<tr>
												
											<td>
		     	 								<sec:authentication property="principal.username" var="username"/>
					     	 					<a href="../chat/detail?roomSender=${username}&roomRecipient=${professorVO.username}"><i class="fa-regular fa-envelope fa-2xl" style="margin:30px 0 0 0;"></i></a>
		     	 							</td>
											<td>
					   	 						<c:if test="${empty memberFiles}">
							   	 					  <img class="profile-user-img img-fluid img-circle"
												             src="/images/profile.jpg"
												             alt="User profile picture">
							   	 				</c:if>
							   	 				<c:if test="${not empty memberFiles}">
							   	 					<img class="img-circle elevation-2" src="/file/member/${memberFiles}" width="70rem" height="70rem">
							   	 				</c:if>	
					   	 					</td>
					   	 					<td><c:out value="${professoruserName}"></c:out></td>
											<td><c:out value="${professorName}"></c:out></td>
											<td><c:out value="${collegeName}"></c:out></td>	
											<td><c:out value="${department}"></c:out></td>
											<td><c:out value="${professorPhone}"></c:out></td>
											<td><c:out value="${professorEmail}"></c:out></td>
											<td>
											<c:out value="${collegeBuilding} "></c:out><c:out value="${professorRoom}"></c:out>
											</td>
											<c:if test="${professorStatus eq 1}">
												<td>재직</td>
											</c:if>
											<c:if test="${professorStatus eq 2}">
												<td>휴직</td>
											</c:if>
											<c:if test="${professorStatus  eq 3}">
												<td>퇴임</td>
											</c:if>
											</tr>
											</c:forEach>
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
											<a class="page-link" href="./professorList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
										<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
											<a class="page-link" href="./professorList?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
												<span aria-hidden="true">&lsaquo;</span>
											</a>
										</li>
										<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
											<li class="page-item"><a class="page-link" href="./professorList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
										</c:forEach>
										<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
											<a class="page-link" href="./professorList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
												<span aria-hidden="true">&rsaquo;</span>
											</a>
										</li>
										<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
											<a class="page-link" href="./professorList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" style="color:#17a2b8;">
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

</html>