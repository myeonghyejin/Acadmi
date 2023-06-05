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
		<c:import url="../temp/header.jsp"></c:import>
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
		            	<div class="row">
							<div class="col-12">
								<div class="card">
									<!-- table-header start -->
									<div class="card-header">
					                	<div class="input-group input-group-sm" style="width: 300px;float:right;">
						                	<input type="text" class="form-control" placeholder="Search Mail">
						                  	<div class="input-group-append">
						                    	<div class="btn btn-info">
						                      		<i class="fas fa-search"></i>
						                    	</div>
						                  	</div>
						            	</div>
					              	</div>
					              	<!-- table-header end -->
              
              						<!-- table-body start -->
              						<div class="card-body">
                						<table class="table table-bordered" style="text-align: center;">
                  							<thead>
                    							<tr>
                    								<th></th>
							                    	<th>학번</th>
							                    	<th>이름</th>
							                    	<th>학과</th>
							                    	<th>이메일</th>
							                    	<th>전화번호</th>
							                    </tr>
											</thead>
							                <tbody>
							                	<c:forEach items="${list}" var="attendee">
							                    	<tr>
							                    		<td><sec:authentication property="principal.username" var="username"/>
							                    		<a href="../chat/detail?sender=${username}&recipient=${attendee.username}">
							                    		<i class="fa-regular fa-envelope fa-2xl"></i></a></td>
							                    		<td>${attendee.username}</td>
							                    		<td>${attendee.name}</td>
						 								<td>${attendee.deptNum}</td>
						 								<td>${attendee.email}</td>
						 								<td>${attendee.phone}</td>
							                    	</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
              						<!-- table-body end -->
              						<div class="card-footer clearfix" style="background-color: white">
					                <ul class="pagination pagination-sm">
					                  <li class="page-item"><a class="page-link" href="#">«</a></li>
					                  <li class="page-item"><a class="page-link" href="#">1</a></li>
					                  <li class="page-item"><a class="page-link" href="#">2</a></li>
					                  <li class="page-item"><a class="page-link" href="#">3</a></li>
					                  <li class="page-item"><a class="page-link" href="#">»</a></li>
					                </ul>
					              </div>
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

	</div>
<!-- ./wrapper -->
</body>
</html>