<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
	
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col" style="background-color : white;">
						<!-- header start -->
	               <div class="row" style="padding-top:10px">
	                  <div class="col-12">
	                     <div class="card">
	                        <h3 class="my-3 mx-3">강의실 조회</h3>
	                     </div>
	                  </div>
	               </div>
               <!-- header end -->
               <section class="content">
               
               	<div class="card">
             		 <div class="card-header">
			          <h3 class="card-title">강의실 조회</h3>
			
			          <div class="card-tools">
			            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
			              <i class="fas fa-minus"></i>
			            </button>
			          </div>
		        	</div>
		        	 <!--Search -->
					<form action="./lectureRoomAssignment" id="search-form">
						<input type="hidden" name="page" value="1">
						<div class="row justify-content-center mx-auto my-3 ">
							<div class="col-md-8">
								<div class="row">
									<div class="col-4">
										<div class="form-group">
											<label>요일</label>
											<select class="select2" name="weekday" style="width : 100%;" id="weekday">
												<option value="">전체</option>
												<option value="">월요일</option>
												<option value="">화요일</option>
												<option value="">수요일</option>
												<option value="">목요일</option>
												<option value="">금요일</option>
												</select>
										</div>
									</div>
									<div class="col-4">
										<div class="form-group">
											<label>시작 시간</label>
											<select class="select2" name="startTime" style="widt : 100%;" id="startTime">
												<option value="">전체</option>
												<c:forEach items="${room}" var="room">
													<c:forEach items="${room.timeTableVOs}" var="timeTableVO">
														<c:forEach items="${timeTableVO.timeInfoVOs}" var="timeInfoVO">
															<option value="">${timeInfoVO.startTime }</option>
														</c:forEach>
													</c:forEach>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>	
								<button type="submit" class="btn btn-info" style="margin : 0 0 0 20px; width : 15%">검색</button>
							</div>
							
						</div>
					</form>
               	
		        	
		        	<div class="card-body p-0">
		        		<table class="table table-hover text-nowrap"  style="text-align : center;"id="table1">
		        			 <thead>
				                  <tr>
				                      <th style="width: 10%">
				                          강의실 건물
				                      </th>
				                      <th style="width: 10%">
				                          강의실 호수
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          최대수용인원
				                      </th>
				                      <th style="width : 15%">
				                          
				                      </th>
				                  </tr>
				              </thead>
				              
				                <tbody>
				               
				                <c:forEach items="${list}" var="lectureRoomVO">
										<tr class="find">
											<td class="lectureRoom" >${lectureRoomVO.lectureBuilding}</td>
											<td class="lectureRoom">${lectureRoomVO.lectureRoom}</td>
											<td class="lectureRoom">${lectureRoomVO.personal}</td>
											
											<td>
												<button type="button" class="btn btn-info" id="assignment" data-lecture="${lectureRoomVO.lectureBuilding}${lectureRoomVO.lectureRoom}"
													data-lectureBuilding="${lectureRoomVO.lectureBuilding}" data-lectureRoom="${lectureRoomVO.lectureRoom }" data-lectureNum="${lecture.lectureNum}"
													>
													배정
												</button> 
											</td>
									</tr>
								</c:forEach>
				              </tbody>
		        		</table>
		        	</div>
               	</div>
               </section>
               
               	<div class="row" style="margin: 20px auto;" id="pagination">
							<nav aria-label="Page navigation example">
								<ul class="pagination d-flex justify-content-center">
									<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
										<a class="page-link" href="./lectureRoomAssignment?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./lectureRoomAssignment?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./lectureRoomAssignment?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./lectureRoomAssignment?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./lectureRoomAssignment?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}">
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
<script type="text/javascript" src="../js/administrator/lectureRoomAssignment.js"></script>
</body>
</html>