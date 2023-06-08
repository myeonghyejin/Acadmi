<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper"> 

		<!-- Header 적용 -->
		<c:import url="../temp/professor_header.jsp"></c:import>
		<!-- Header 끝 -->
		
		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:10px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">성적 관리</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					
					<!-- form start -->
					<form action="./attendee" method="get">
						<div class="row">
							<div class="col-12">
								<div class="card">
									<!-- table-header start -->
									<div class="card-header"">
					                	<h3 class="card-title" style="font-weight:normal;">학생 관리 | ${detail.lectureName}</h3>
					                	<div class="card-tools">
					                		<div class="input-group input-group-sm" style="width: 105px;">
					                  			<button class="btn btn-info"><a href="./add?lectureNum=${detail.lectureNum}" style="color: white;">성적 입력</a></button>
					                  		</div>
					                	</div>
					              	</div>
					              	<!-- table-header end -->
              
              						<!-- table-body start -->
              						<div class="card-body">
                						<table class="table table-bordered" style="text-align: center;">
				                    		<thead style="background-color: #f8f9fa;">
					                    		<tr>
					                    			<th>학번</th>
					                    			<th>학과</th>
					                    			<th>이름</th>
					                    			<th>학년</th>
					                    			<th>총점</th>
					                    		</tr>
					                    	</thead>
					                    	<tbody>
					                    		<c:forEach items="${attendee}" var="attendee">
					                    			<tr>
					                    				<td>${attendee.username}</td>
					                    				<td>${attendee.departmentVO.deptName}</td>
					                    				<td>${attendee.name}</td>
					                    				<td>${attendee.grade}학년</td>
					                    				<td>총점</td>
					                    			</tr>
					                    		</c:forEach>
					                    	</tbody>
			                    		</table>
			                   		</div>
              						<!-- table-body end -->
            					</div>
							</div> 
						</div>
					</form>
					<!-- form end -->
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