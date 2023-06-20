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
				<div class="col" >
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
												<option value="월">월요일</option>
												<option value="화">화요일</option>
												<option value="수">수요일</option>
												<option value="목">목요일</option>
												<option value="금">금요일</option>
												</select>
										</div>
									</div>
									<div class="col-4">
										<div class="form-group">
											<label>시작 시간</label>
											<select class="select2" name="startTime" style="width : 100%;" id="startTime">
												<option value="">전체</option>
												<option value="1">9:00</option>
												<option value="2">10:00</option>
												<option value="3">11:00</option>
												<option value="4">12:00</option>
												<option value="5">13:00</option>
												<option value="6">14:00</option>
												<option value="7">15:00</option>
												<option value="8">16:00</option>
												<option value="9">17:00</option>
												<option value="10">18:00</option>
												
											</select>
										</div>
									</div>
								</div>	
								<div class="row">
									<div class="col-4">
										<div class="form-group">
											<label>종료 시간</label>
											<select class="select2" name="endTime" style="width : 100%;" id="endTime">
												<option value="">전체</option>
												<option value="1">10:00</option>
												<option value="2">11:00</option>
												<option value="3">12:00</option>
												<option value="4">13:00</option>
												<option value="5">14:00</option>
												<option value="6">15:00</option>
												<option value="7">16:00</option>
												<option value="8">17:00</option>
												<option value="9">18:00</option>
												<option value="10">19:00</option>
												
											</select>
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label>수용 인원</label>
												<div class="input-group">
													<input type="text" class="form-control" placeholder="수용인원을 입력하세요." name="personal" >
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
		        	<!-- Pagination -->
				 <div class="row g-3 justify-content-center" style="margin: 20px auto;" id="pagination">
									
					<ul class="pagination pagination-sm mx-auto"  style="width: 200px;">
						<c:if test="${pagination.pre}">
							<li class="page-item">
								<a class="page-link" href="./lectureRoomAssignment?page=1&lectureNum=${lectureVO.lectureNum}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						
						<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
							<li class="page-item"><a class="page-link" href="./lectureRoomAssignment?page=${i}&lectureNum=${lectureVO.lectureNum}&startTime=${lectureVO.startTime}&endTime=${lectureVO.endTime}&weekday=${lectureVO.weekday}&personal=${lectureVO.personal}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
						</c:forEach>
						
						<c:if test="${pagination.next }">
							<li class="page-item">
								<a class="page-link" href="./lectureRoomAssignment?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" style="color:#17a2b8;">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					</ul>
				
				</div>
               	</div>
               </section>
               
    			
               
               
				</div>
			</div>
		</div>
	</div>
</div>	
<script type="text/javascript" src="../js/administrator/lectureRoomAssignment.js"></script>
<script>
	    $(function () {
	      $('.select2').select2()
	    });
</script>
</body>
</html>