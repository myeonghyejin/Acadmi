<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
	<style type="text/css">
	.sidebar-dropdown{
	height:87.5vh !important
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
			<c:import url="../temp/lecture_header.jsp"></c:import>
		</sec:authorize>
			
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->

		<!-- Main Contents start -->
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- 2레벨 Sidebar 적용 -->
					<c:import url="../temp/sidebar/professor_lecture.jsp"></c:import>
					<!-- 2레벨 Sidebar 끝 -->
				
					<!-- Contents start -->
					<div class="col">
						<!-- header start -->
						<div class="row" style="padding-top:10px">
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
							                <div class="card-tools row">
								                <div class="col-3 ml-2 mr-2 mt-1">
								                	<select class="select2" id="kind" name="kind" style="width:80px;border-color:#17a2b8">
												    	<option value="">전체</option>
														<option value="userName"${param.kind == 'userName' ? 'selected' : ''} >학번</option>
														<option value="name"${param.kind == 'name' ? 'selected' : ''}>이름</option>
													</select>
								                </div>
							                 	<div class="input-group my-1 col-8" style="width:210px;">
								                	<input type="text" class="form-control" name="search" id="search" value="${pagination.search}">
													<div class="input-group-append">
							                      		<button type="submit" class="btn btn-default" id="submit">
							                        		<i class="fas fa-search"></i>
							                      		</button>
							                    	</div>
							                  	</div>
							                </div>
							            </div>
						              	<!-- table-header end -->
	              
	              						<!-- table-body start -->
	              						<div class="card-body" id="allLectureList">
	                						<table class="table table-bordered" style="text-align: center;">
	                  							<thead style="background-color: #f8f9fa;color:#17a2b8;">
	                    							<tr>
	                    								<th></th>
								                    	<th>사진</th>
								                    	<th>학번</th>
								                    	<th>이름</th>
								                    	<th>학과</th>
								                    	<th>전화번호</th>
								                    </tr>
												</thead>
								                <tbody>
								                	<c:forEach items="${list}" var="attendee">
								                    	<tr>
								                    		<td style="vertical-align:middle; width:10%">
								                    			<sec:authentication property="principal.username" var="username"/>
									                    		<a href="../chat/detail?sender=${username}&recipient=${attendee.username}">
									                    			<i class="fa-regular fa-envelope fa-2xl"></i>
									                    		</a>
								                    		</td>
								                    		<td style="vertical-align:middle; width:13%">
						     	 								<c:if test="${empty attendee.memberFilesVO}">
											   	 					  <img class="img" src="/images/profile.jpg" alt="User profile picture" width="60rem" height="60rem" style="border-radius:5px">
											   	 				</c:if>
											   	 				<c:if test="${not empty attendee.memberFilesVO}">
											   	 					<img class="img" src="/file/member/${attendee.memberFilesVO.fileName}" width="60rem" height="60rem" style="border-radius:5px">
											   	 				</c:if>	
						     	 							</td>
								                    		<td style="vertical-align:middle;">${attendee.username}</td>
								                    		<td style="vertical-align:middle;">${attendee.name}</td>
							 								<td style="vertical-align:middle;">${attendee.departmentVO.deptName}</td>
							 								<td style="vertical-align:middle;">
							 									0${fn:substring(fn:replace(attendee.phone,"-",""), 0, 2)}-${fn:substring(fn:replace(attendee.phone,"-",""), 2, 6)}-${fn:substring(fn:replace(attendee.phone,"-",""), 6,10)}
							 								</td>
								                    	</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
	              						<!-- table-body end -->
	              						
	              						<!-- pagination start -->
	              						<div class="row g-3 justify-content-center" id="allLectureList">
											<ul class="pagination pagination-sm mx-auto justify-content-center" style="width: 200px;">
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
					<!-- Contents end -->
				</div>
			</div>
		</div>
		<!-- Main Contents end -->
		
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
		
		<script>
		    $(function () {
		      $('.select2').select2()
		    });
		    $("#allLectureList").on("click",".page-link", function(e){
		        let page = $(this).attr("data-all-page");
		        getList(page);
		        e.preventDefault();
		    });
		</script>
		
	</div>
<!-- ./wrapper -->
</body>
</html>