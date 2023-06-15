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
	<c:import url="../../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
<title>Insert title here</title>
<style type="text/css">
	#pagination {
		 display: flex;
   	 	justify-content: center;	
	
	}
	#tableAdmin {
		width : 90%; 
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
	
	.search {
		padding : 10px;
		
	}
	.content {
		margin : 10px;
	}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed" >
	<div class="wrapper">
		<c:import url="../../temp/header.jsp"></c:import>
			<div class="container-fluid">
				<div class="row">
					<div class="content-wrapper">
							<c:import url="../../temp/sidebar/student_lecture_main.jsp"></c:import>
					</div>
					<!-- Contents -->
					<div class="col" style="background-color : white;">
							<!-- header start -->
			               <div class="row" style="padding-top:10px">
			                  <div class="col-12">
			                     <div class="card">
			                        <h3 class="my-3 mx-3">참여자 목록</h3>
			                     </div>
			                  </div>
			               </div>
		              	 <!-- header end -->
		              	 <!-- Main content -->
		              	 <section class="content">
		              	 
		              	 <!--Search -->
		              	 
							<form action="./attendee" id="search-form">
							<input type="hidden" name="lectureNum" value="${pagination.lectureNum}">
							<input type="hidden" name="page" value="1">
							
							
							<div class="card search">
								<div class="row content" >
									<label style="margin : 10px;">학번</label>
									<input type="text" class="form-control" name="search" placeholder="내용을 입력해주세요" style="width : 20%" value="${pagination.search }">
									<label style="margin : 10px;">성명</label>
									<input type="text" class="form-control" name="name" placeholder="내용을 입력해주세요" style="width : 20%">
									<button type="submit" class="btn btn-info" style="margin : 0 0 0 20px; width : 15%">검색</button>
								</div>
							</div>
								
							</form>
					
		              	 <!-- Default box -->
					      <div class="card">
					      
					        <div class="card-body p-0">
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
					                      	  학부
					                      </th>
					                      <th style="width: 10%" class="text-center">
					                          학과(전공)
					                      </th>
					                      <th style="width : 15%">
					                          학번
					                      </th>
					                      <th style="width: 10%" class="text-center">
					                          이름
					                      </th>
					                      
					                  </tr>
					              </thead>
					              <tbody>
					                  <c:forEach items="${list}" var="lectureVO">
						   	 		<tr>
						   	 			<c:set var="studentName" value="${lectureVO.studentVO.name}"></c:set>
										<c:set var="studentUsername" value="${lectureVO.studentVO.username }"></c:set>
										<c:set var="department" value="${lectureVO.departmentVO.deptName}"></c:set>
										<c:set var="college" value="${lectureVO.collegeVO.collegeName }"></c:set>
										<c:set var="memberFiles" value="${lectureVO.studentVO.memberFilesVO.fileName }"></c:set>
										
										<td>
	     	 								<sec:authentication property="principal.username" var="username"/>
				     	 					<a href="../../chat/detail?roomSender=${username}&roomRecipient=${lectureVO.studentVO.username}"><i class="fa-regular fa-envelope fa-2xl" style="margin:30px 0 0 0;"></i></a>
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
	     	 							<td><c:out value="${college}"></c:out></td>
	     	 							<td><c:out value="${department}"></c:out> </td>
	     	 							<td>
	     	 								<c:out value="${studentUsername.substring(0, 4)}****"></c:out>
	     	 							
	     	 							</td>
	     	 							<td><c:out value="${studentName}"></c:out> </td>
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
										<a class="page-link" href="./attendee?lectureNum=${pagination.lectureNum}&page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./attendee?lectureNum=${pagination.lectureNum}&page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./attendee?lectureNum=${pagination.lectureNum}&page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./attendee?lectureNum=${pagination.lectureNum}&page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./attendee?lectureNum=${pagination.lectureNum}&page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" style="color:#17a2b8;">
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
<c:import url="../../temp/footer.jsp"></c:import>		
</body>
</html>