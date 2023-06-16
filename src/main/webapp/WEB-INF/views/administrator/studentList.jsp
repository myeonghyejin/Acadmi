<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

</head>
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

	#pagination {
		 display: flex;
   	 	justify-content: center;
	
	}
	
	.selected-page{
		  background-color: #E2E2E2;
		  color: white; 
	}
	
	.content {
		margin: 30px;
	}
	
	.content2 {
		margin : 10px 0 30px 30px;
	}
	#tableStudent {
		width : 90%; 
	}
	h3 {
		margin : 40px;
	}
	.content {
		margin: 30px;
	}
	#add2 {
		float : right;
		clear : both;
		
	} 
	.card-title {
		margin : 20px 0 20px 40px;
	}
	.card-body{
		display: flex;
	  	justify-content: center;
	 	align-items: center;
	 	margin : 10px 0 30px 0;
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
	
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				
					<c:import url="../temp/sidebar/administrator_memberList.jsp"></c:import>
				
				<!-- 2레벨 Sidebar 끝 -->
				<div class="col" style="background-color : white;">
					<!-- header start -->
	               <div class="row" style="padding-top:10px">
	                  <div class="col-12">
	                     <div class="card">
	                        <h3 class="my-3 mx-3">학생 목록 조회</h3>
	                     </div>
	                  </div>
	               </div>
               <!-- header end -->
					
						<!-- Main content -->
				    <section class="content">
				    
				     <!--Search -->
					<form action="./studentList" id="search-form">
						<input type="hidden" name="page" value="1">
						<div class="card search">
							<div class="row content" >
								<label style="margin : 10px;">학번</label>
								<input type="text" class="form-control" name="username" placeholder="내용을 입력해주세요" style="width : 20%">
								<label style="margin : 10px;">성명</label>
								<input type="text" class="form-control" name="search" placeholder="내용을 입력해주세요" style="width : 20%" value="${pagination.search}">
								<label style="margin : 10px;">학년</label>
								<select class="select2" name="grade" style="width: 20%;">
									<option value="">전체</option>
									<option value="1">1학년</option>
									<option value="2">2학년</option>
									<option value="3">3학년</option>
									<option value="4">4학년</option>
								</select>
								
							</div>
							<div class="row content2">
								<label style="margin : 10px;">상태</label>
								<select class="select2" name="status" style="width: 20%;">
									<option value="">전체</option>
									<option value="1">재학</option>
									<option value="2">휴학</option>
									<option value="3">퇴학</option>
									<option value="4">졸업</option>
									<option value="5">졸업유예</option>
								</select>
								<label style="margin : 10px;">단과대학</label>
								<select class=" select2" name="collegeName"  id="college" style="width : 15%;" onchange="updateDepartmentOptions()">
								<option value="">전체</option>
									<c:forEach items="${college}" var="collegeVO">
										<c:if test="${collegeVO.collegeNum != 1 && collegeVO.collegeNum != 2}">
											<option value="${collegeVO.collegeName}">${collegeVO.collegeName}</option>
										</c:if>	
									</c:forEach>
								</select>
								<label style="margin : 10px;">학과</label>
								<select  class="select2" style="width: 25%;" name="deptName" id="dept">
									<option value="">전체</option>
									<c:forEach items="${department}" var="departmentVO">
										<c:if test="${departmentVO.deptNum !=1 && departmentVO.deptNum !=2 }">
											<option value="${departmentVO.deptName}">${departmentVO.deptName}</option>
										</c:if>
									</c:forEach>
								</select>
									<button type="submit" class="btn btn-info" style="margin : 0 0 0 20px; width : 15%">검색</button>
							</div>
						</div>
					</form>
				
				      <!-- Default box -->
				      <div class="card">
				        <div class="card-header">
				          <h3 class="card-title">학생 조회</h3>
				
				          <div class="card-tools">
				            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
				              <i class="fas fa-minus"></i>
				            </button>
				          </div>
				          
				        </div>
				        <div class="card-body p-0">
				          <table class="table table-hover text-nowrap" style="text-align : center;"  id="tableStudent">
				              <thead>
				                  <tr>
				                      <th style="width: 10%">
				                          쪽지
				                      </th>
				                      <th style="width: 10%">
				                          사진
				                      </th>
				                       <th style="width: 15%">
				                      	  학과
				                      </th>
				                      <th style="width : 8%">
				                      	  학번
				                      </th>
				                      <th style="width: 8%" class="text-center">
				                          성명
				                      </th>
				                      <th style="width : 15%">
				                          연락처
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          단과대학
				                      </th>
				                     
				                      <th style="width:8%">
				                      	학년
				                      </th>
				                      <th style="width: 20%">
				                      	  학적상태
				                      </th>
				                  </tr>
				              </thead>
				              <tbody>
				                 <c:forEach items="${list}" var="collegeVO">
     	 				<tr>
     	 				<c:set var="college" value="${collegeVO.collegeName}"></c:set>
     	 					<c:forEach items="${collegeVO.departmentVOs}" var="departmentVO">
     	 						<c:set var="department" value="${departmentVO.deptName}"></c:set>
     	 						<c:forEach items="${departmentVO.studentVOs}" var="studentVO">
     	 							<c:set var="studentName" value="${studentVO.name}"></c:set>
     	 							<c:set var="studentUsername" value="${studentVO.username}"></c:set>
     	 							<c:set var="studentPhone" value="${studentVO.phone}"></c:set>
     	 							<c:set var="studentGrade" value="${studentVO.grade}"></c:set>
     	 							<c:set var="studentStatus" value="${studentVO.status}"></c:set>
     	 							<c:set var="memberFiles" value="${studentVO.memberFilesVO.fileName }"></c:set>
     	 						<tr>
     	 							
	     	 							<td>
	     	 								<sec:authentication property="principal.username" var="username"/>
				     	 					<a href="../chat/detail?roomSender=${username}&roomRecipient=${studentVO.username}"><i class="fa-regular fa-envelope fa-2xl" style="margin:30px 0 0 0;"></i></a>
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
	   	 								<td><c:out value="${department}"></c:out></td>
	     	 							<td><c:out value="${studentUsername}"></c:out></td>
				     	 				<td><c:out value="${studentName}"></c:out></td>
				     	 				<td><c:out value="${studentPhone}"></c:out></td>
				     	 				<td><c:out value="${college}"></c:out></td>
				     	 				<td><c:out value="${studentGrade}"></c:out></td>
				     	 				<c:if test="${studentStatus eq 1}">
				     	 					<td>재학</td>
				     	 				</c:if>
				     	 				<c:if test="${studentStatus eq 2 }">
				     	 					<td>휴학</td>
				     	 				</c:if>
				     	 				<c:if test="${studentStatus eq 3 }">
				     	 					<td>퇴학</td>
				     	 				</c:if>
				     	 				<c:if test="${studentStatus eq 4 }">
				     	 					<td>졸업</td>
				     	 				</c:if>
				     	 				<c:if test="${studentStatus eq 5 }">
				     	 					<td>졸업유예</td>
				     	 				</c:if>
     	 						</tr>	
     	 						</c:forEach>
     	 					</c:forEach>
     	 				</tr>
     	 			</c:forEach>
				              </tbody>
				          </table>
				        </div>
				        <!-- /.card-body -->
				      </div>
				      <!-- /.card -->
				
				    </section>
			    	 <div class="row g-3 justify-content-center" style="margin: 20px auto;" id="pagination">
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-sm mx-auto" style="width: 200px;">
									<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
										<a class="page-link" href="./studentList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./studentList?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./studentList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./studentList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./studentList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" style="color:#17a2b8;">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="../temp/footer.jsp"></c:import>	
<script type="text/javascript">
/*  select 디자인 */
   $(function () {
      $('.select2').select2()
    });
</script>
</body>
</html>