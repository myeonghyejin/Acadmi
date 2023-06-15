<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
	.contentContainer {
		margin : 20px;
	}
	
	.content {
		margin: 30px;
	}
	
	.content2 {
		margin : 10px 0 30px 30px;
	}
</style>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

<c:import url="../temp/administrator_header.jsp"></c:import>

	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				
				<div class="col" style="background-color : white;">
					<!-- header start -->
	               <div class="row" style="padding-top:10px">
	                  <div class="col-12">
	                     <div class="card">
	                        <h3 class="my-3 mx-3">강의 목록 조회</h3>
	                     </div>
	                  </div>
	               </div>
               <!-- header end -->
					
					<!-- Main content -->
				    <section class="content">
				    
				      <!--Search -->
					<form action="./lectureList" id="search-form">
						<input type="hidden" name="page" value="1">
						<div class="card search">
							<div class="row content" >
								<label style="margin : 10px;">학과</label>
								<select  class="select2" style="width: 15%;" name="deptName" id="dept">
									<option value="">전체</option>
									<c:forEach items="${department}" var="departmentVO">
										<c:if test="${departmentVO.deptNum !=1 && departmentVO.deptNum !=2 }">
											<option value="${departmentVO.deptName}">${departmentVO.deptName}</option>
										</c:if>
									</c:forEach>
								</select>
								<label style="margin : 10px;">학년도</label>
								<select class="select2" name="year" style="width: 20%;">
									<option value="">전체</option>
										<c:forEach items="${year}" var="year">
											<option value="${year}">${year}</option>
										</c:forEach>
										
								</select>
								<label style="margin : 10px;">학기</label>
								<select class="select2" name="semester" style="width: 20%;">
									<option value=''>전체</option>
									<option value="1">1학기</option>
									<option value="2">2학기</option>
								</select>
								
							</div>
							<div class="row content2">
								<label style="margin : 10px;">상태</label>
								<select class="select2" name="status" style="width: 20%;">
									<option value="">전체</option>
									<option value="0">폐강</option>
									<option value="1">개강</option>
									
								</select>
								<label style="margin : 10px;">강의</label>
								<input type="text" class="form-control" name="search" placeholder="강의를 입력해주세요" style="width : 20%">
								
									<button type="submit" class="btn btn-info" style="margin : 0 0 0 20px; width : 15%">검색</button>
							</div>
						</div>
					</form>
				    
				
				      <!-- Default box -->
				      <div class="card">
				        <div class="card-header">
				          <h3 class="card-title">강의 조회</h3>
				
				          <div class="card-tools">
				            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
				              <i class="fas fa-minus"></i>
				            </button>
				          </div>
				        </div>
				        <div class="card-body p-0">
				          <table class="table table-hover text-nowrap" style="text-align : center;"  id="tableAdmin">
				              <thead>
				                  <tr>
				                  	<th></th>
				                      <th style="width: 10%">
				                          강의번호
				                      </th>
				                      <th style="width: 10%">
				                          강의이름
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          강의요일
				                      </th>
				                      <th style="width : 15%">
				                          시작교시
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          종료교시
				                      </th>
				                      <th style="width: 20%">
				                      	  수강인원
				                      </th>
				                      <th style="width: 20%">
				                      	  상태
				                      </th>
				                  </tr>
				              </thead>
				              <tbody>
				                  <c:forEach items="${list}" var="lectureVO">
					   	 		<tr class="container">
					   	 			<td>
						   	 				<button class="toggleButton" style="background-color : white; border : none; outline : none; ">+</button>
						   	 				<div class="toggleContent" style="display:none">
						   	 					<div class="contentContainer">
							   	 					  <table class="table table-hover text-nowrap" style="text-align: center;" id="table1">
								                        <tr>
								                            <th>학년도</th>
								                            <th>학과</th>
								                           	<th>학기</th>
								                           	<th>담당교수</th>
								                           	<th>강의실</th>
								                           	<th></th>
								                        </tr>
								                        <tr>
								                        	<td>${lectureVO.year}</td>
								                        	<td>${lectureVO.departmentVO.deptName}</td>
								                        	<td>${lectureVO.semester }</td>
								                        	<td>${lectureVO.professorVO.name}</td>
								                        	<td>${lectureVO.lectureBuilding} ${lectureVO.lectureRoom}</td>
								                        	<c:if test="${lectureVO.lectureBuilding eq  null}">
								                        		<td><a href="./lectureRoomAssignment?lectureNum=${lectureVO.lectureNum}"><button class="btn btn-info">강의실 배정</button></a></td>
								                        	</c:if>
								                        </tr>
								                       
								                    </table>
							                   </div>
						   	 				</div>
						   	 				
					   	 			</td>
					   	 			<td> ${lectureVO.lectureNum}</td>
					   	 			<td>${lectureVO.lectureName}</td>
					   	 			<td>${lectureVO.weekday}</td>
					   	 			<td>${lectureVO.startTime}교시</td>
					   	 			<td>${lectureVO.endTime}교시</td>
					   	 			<td>${lectureVO.personal}</td>
					   	 			<c:if test="${lectureVO.status eq 1}">
					   	 				<td>개강</td>	
					   	 			</c:if>
					   	 			<c:if test="${lectureVO.status eq 0}">
					   	 				<td>폐강</td>
					   	 			</c:if>
					   	 			<c:if test="${lectureVO.status eq null }">
					   	 				<td>상태 없음</td>
					   	 			</c:if>
					   	 			
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
							<nav aria-label="pagination pagination-sm mx-auto" >
								<ul class="pagination pagination-sm mx-auto" style="width: 200px;">
									<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
										<a class="page-link" href="./lectureList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./lectureList?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./lectureList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./lectureList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./lecturetList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" style="color:#17a2b8;">
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
	/* 토글 */
	let toggleButtons = document.getElementsByClassName("toggleButton");
	let toggleContents = document.getElementsByClassName("toggleContent");
	
	for (let i = 0; i < toggleButtons.length; i++) {
	  let toggleButton = toggleButtons[i];
	
	  toggleButton.addEventListener('click', function() {
	    let toggleContent = toggleContents[i]; 
	
	    if (toggleContent.style.display === 'none') {
	      toggleContent.style.display = 'block';
	    } else {
	      toggleContent.style.display = 'none';
	    }
	  });
	}
	
/* select 디자인 */
   $(function () {
	      $('.select2').select2()
	 });
</script>
</body>
</html>