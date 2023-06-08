<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	#pagination {
		 display: flex;
   	 	justify-content: center;
	
	}
	
	#table1 {
		width : 90%;
	}
	
	h3 {
		margin : 40px;
	}
	
	.card-title {
		margin : 5px 0 10px 5px;
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
		<c:import url="../temp/administrator.jsp"></c:import>
<!-- Header 끝 -->
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col">
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
               
                   <!--Search -->
					<form action="./lectureRoomAssignment" id="search-form">
						<input type="hidden" name="page" value="1">
						<div class="card search">
							<div class="row content" >
								<label style="margin : 10px;">학과</label>
								<select  class="form-control select" style="width: 15%;" name="deptName" id="dept">
									<option value="">전체</option>
									<c:forEach items="${department}" var="departmentVO">
										<c:if test="${departmentVO.deptNum !=1 && departmentVO.deptNum !=2 }">
											<option value="${departmentVO.deptName}">${departmentVO.deptName}</option>
										</c:if>
									</c:forEach>
								</select>
								<label style="margin : 10px;">학년도</label>
								<select class="form-control select2" name="year" style="width: 20%;">
									<option value="">전체</option>
										<c:forEach items="${year}" var="year">
											<option value="${year}">${year}</option>
										</c:forEach>
										
								</select>
								<label style="margin : 10px;">학기</label>
								<select class="form-control select3" name="semester" style="width: 20%;">
									<option value=''>전체</option>
									<option value="1">1학기</option>
									<option value="2">2학기</option>
								</select>
								
							</div>
							<div class="row content2">
								<label style="margin : 10px;">상태</label>
								<select class="form-control select4" name="status" style="width: 20%;">
									<option value="">전체</option>
									<option value="0">폐강</option>
									<option value="1">개강</option>
									
								</select>
								<label style="margin : 10px;">강의이름</label>
								<input type="text" class="form-control" name="lectureName" placeholder="강의를 입력해주세요" style="width : 20%">
								
									<button type="submit" class="btn btn-info" style="margin : 0 0 0 20px; width : 15%">검색</button>
							</div>
						</div>
					</form>
               	
               	<div class="card">
             		 <div class="card-header">
			          <h3 class="card-title">강의실 조회</h3>
			
			          <div class="card-tools">
			            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
			              <i class="fas fa-minus"></i>
			            </button>
			          </div>
		        	</div>
		        	
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
													data-lectureBuilding="${lectureRoomVO.lectureBuilding}" data-lectureRoom="${lectureRoomVO.lectureRoom }">
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