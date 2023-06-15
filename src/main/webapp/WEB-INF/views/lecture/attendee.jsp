<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../temp/professor_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper">
					<c:import url="../temp/sidebar/professor_lecture.jsp"></c:import>
				</div>
				<!-- 2레벨 Sidebar 끝 -->
				
				<!-- Contents -->
				<div class="col">
				<!-- header start -->
					<div class="row" style="padding-top:20px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">참여자 목록</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					<form action="./attendee" method="get">
					<input type="hidden" name="lectureNum" value="${lecture.lectureNum}">
		            	<div class="row">
							<div class="col-12">
								<div class="card">
									<!-- table-header start -->
									<div class="card-header">
					                	<div class="input-group" style="width:40%;float:right;">
						                  	<div class="input-group-prepend">
						                    	<select class="select2" id="kind" name="kind" style="width: 120px;border-color:#17a2b8">
									                <option value="">전체</option>
													<option value="userName" >학번</option>
													<option value="name">이름</option>
												</select>
						                  	</div>
						                  	<input type="text" class="form-control" name="search" id="search">
						                  	<div class="input-group-append">
						                    	<div class="input-group-text">
						                    	<button type="submit"></button>
						                    		<i class="fas fa-search"></i>
						                    	</div>
						                  	</div>
						                </div>
					              	</div>
					              	<!-- table-header end -->
              
              						<!-- table-body start -->
              						<div class="card-body">
                						<table class="table table-bordered" style="text-align: center;">
                  							<thead style="background-color: #f8f9fa;">
                    							<tr>
                    								<th></th>
							                    	<th>사진</th>
							                    	<th>학번</th>
							                    	<th>이름</th>
							                    	<th>학과</th>
							                    </tr>
											</thead>
							                <tbody>
							                	<c:forEach items="${list}" var="attendee">
							                    	<tr>
							                    		<td><sec:authentication property="principal.username" var="username"/>
							                    		<a href="../chat/detail?sender=${username}&recipient=${attendee.username}">
							                    		<i class="fa-regular fa-envelope fa-2xl"></i></a></td>
							                    		<td>
					     	 								<c:if test="${empty memberFiles}">
										   	 					  <img class="profile-user-img img-fluid img-circle"
															             src="/images/profile.jpg"
															             alt="User profile picture" >
										   	 				</c:if>
										   	 				<c:if test="${not empty memberFiles}">
										   	 					<img class="img-circle elevation-2" src="/file/member/${memberFiles}" width="70rem" height="70rem">
										   	 				</c:if>	
					     	 							</td>
							                    		<td>${attendee.username}</td>
							                    		<td>${attendee.name}</td>
						 								<td>${attendee.departmentVO.deptName}</td>
							                    	</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
              						<!-- table-body end -->
              						
              						<!-- pagination start -->
              						<div class="row g-3 justify-content-center">
										<ul class="pagination pagination-sm mx-auto" style="width: 200px;">
											<c:if test="${pagination.pre}">
												<li class="page-item">
													<a class="page-link" href="#" aria-label="Previous" data-all-page="1" style="color:#17a2b8;">
														<span aria-hidden="true">&laquo;</span>
													</a>
												</li>
											</c:if>
											<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="page">
												<li class="page-item">
													<a class="page-link" href="#" data-all-page="${page}" style="color:#17a2b8;">${page}</a>
												</li>
											</c:forEach>
											<c:if test="${pagination.next}">
												<li class="page-item">
													<a class="page-link" href="#" aria-label="Next" data-all-page="${pagination.totalPage}" style="color:#17a2b8;">
														<span aria-hidden="true">&raquo;</span>
													</a>
												</li>
											</c:if>
										</ul>
									</div>
					              <!-- pagination end -->
            					</div>
							</div> 
						</div>
					</form>
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