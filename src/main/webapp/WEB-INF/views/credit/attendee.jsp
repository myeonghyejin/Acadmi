<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row mt-3">
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
					                			<c:if test="${attendee[0].creditVO.credit==null}">
					                  				<button class="btn btn-info"><a href="./add?lectureNum=${detail.lectureNum}" style="color: white;">성적 등록</a></button>
					                  			</c:if>
					                  			<c:if test="${attendee[0].creditVO.credit!=null}">
					                  				<button class="btn btn-info"><a href="./update?lectureNum=${detail.lectureNum}" style="color: white;">성적 수정</a></button>
					                  			</c:if>
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
					                    			<th>성적</th>
					                    		</tr>
					                    	</thead>
					                    	<tbody>
					                    		<c:forEach items="${attendee}" var="attendee">
					                    			<tr>
					                    				<td>${attendee.username}</td>
					                    				<td>${attendee.departmentVO.deptName}</td>
					                    				<td>${attendee.name}</td>
					                    				<td>${attendee.grade}학년</td>
					                    				<c:if test="${attendee.creditVO.credit==null}">
						                    				<td style="color:gray;">점수 없음</td>
						                    				<td style="color:gray;">성적 없음</td>
					                    				</c:if>
					                    				<c:if test="${attendee.creditVO.credit!=null}">
					                    					<td>${attendee.creditVO.credit}</td>
					                    					<c:choose>
														        <c:when test="${attendee.rank <=(detail.subscription*50/100)}">
														            <td>A</td>
														        </c:when>
														        <c:otherwise>
														            <td>B</td>
														        </c:otherwise>
														    </c:choose>
					                    				</c:if>
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