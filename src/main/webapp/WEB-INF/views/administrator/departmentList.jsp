<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
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
	
	.content {
		margin: 30px;
	}
	
	.col {
		background-color : white;
	}
	
	#table2 {
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
		width : 10%;
		
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
<title>Insert title here</title>
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
	<div class="content-wrapper">
		<div class="container-fulid">
			<div class="row">
				<div class="col">
					<!-- header start -->
	               <div class="row" style="padding-top:10px; margin-left: 10px;">
	                  <div class="col-12">
	                     <div class="card">
	                        <h3 class="my-3 mx-3">학과 조회</h3>
	                     </div>
	                  </div>
	               </div>
               <!-- header end -->
					<!-- Main content -->
				    <section class="content">
				    
				      
				    <form action="./departmentList" id="search-form">
						<input type="hidden" name="page" value="1">
						<div class="card search">
							<div class="row content" >
								<label style="margin : 10px;">단과대학</label>
								<select class="select2" name="collegeNum" style="width: 20%;">
									<option value="">전체</option>
									<c:forEach items="${college}" var="collegeVO">
										<option value="${collegeVO.collegeNum}">${collegeVO.collegeName}</option>
									</c:forEach>
								</select>
								<label style="margin : 10px;">학과</label>
								<input type="text" class="form-control" name="deptName" placeholder="내용을 입력해주세요" style="width : 20%">
								<label style="margin : 10px;">상태</label>
								<select class="select2" name="status" style="width: 20%;">
									<option value="">전체</option>
									<option value="1">사용가능</option>
									<option value="0">사용불가</option>
									
								</select>
								<button type="submit" class="btn btn-info" style="margin : 0 0 0 20px; width : 15%">검색</button>
							</div>
						</div>
					</form>
				
				      <!-- Default box -->
				      <div class="card">
				        <div class="card-header">
				          <h3 class="card-title">학과 목록 조회</h3>
				
				          <div class="card-tools">
				            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
				              <i class="fas fa-minus"></i>
				            </button>
				          </div>
				        </div>
				        <div class="card-body p-0">
				          <table class="table table-hover text-nowrap" style="text-align : center;"  id="table2">
				              <thead>
				                  <tr>
				                      <th style="width: 10%">
				                         학과 번호
				                      </th>
				                      <th style="width: 10%">
				                          단과대학
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          학과
				                      </th>
				                      <th style="width : 15%">
				                          사용여부
				                      </th>
				                      <th style="width: 10%">
				                 
				                      </th>
				                    
				                  </tr>
				              </thead>
				              <tbody>
				              	<c:forEach items="${list}" var="collegeVO">
									<c:set value="${collegeVO.collegeName}" var="collegeName"></c:set>
									<c:forEach items="${collegeVO.departmentVOs}" var="departmentVO">
										<c:set value="${departmentVO.deptNum}" var="deptNum"></c:set>
										<c:set value="${departmentVO.deptName}" var="deptName"></c:set>
										<c:set value="${departmentVO.status}" var="status"></c:set>
										<tr class="dept">
											<c:if test="${status eq 1 }">
												<td><c:out value="${deptNum}"></c:out></td>
												<td><c:out value="${collegeName}"></c:out></td>
												<td><c:out value="${deptName}"></c:out></td>
												<td>
													<select name="status" class="select2" style="width : 50%">
														<option value="1" selected>사용가능</option>
														<option value="0">사용불가</option>
													</select>
												</td>
											</c:if>
											<c:if test="${status eq 0 }">
												<td style="color: #E2E2E2;"><c:out value="${deptNum}"></c:out></td>
												<td style="color: #E2E2E2;"><c:out value="${collegeName}"></c:out></td>
												<td style="color: #E2E2E2;"><c:out value="${deptName}"></c:out></td>
												<td>
													<select name="status" class="select2" style="width : 50%">
														<option value="1">사용가능</option>
														<option value="0" selected>사용불가</option>
													</select>
												</td>
											</c:if>
											<td>
												<button type="button" class="btn btn-primary" id="deptUpdate" data-dept="${deptNum}">
												수정
												</button>
											</td>
										</tr>
									</c:forEach>
									
								</c:forEach>
				            </tbody>
				          </table>
							
				        </div>
				        <!-- /.card-body -->
				      </div>
				      <!-- /.card -->
				     <a href="./departmentAdd"><button type="button" id="add2" class="btn btn-info">작성</button></a>
				    </section>
				
				    	<div class="row g-3 justify-content-center" style="margin: 20px auto;" id="pagination">
								<ul class="pagination pagination-sm mx-auto" style="width : 200px;">
									<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
										<a class="page-link" href="./departmentList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1" style="color:#17a2b8;">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./departmentList?"page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}" style="color:#17a2b8;">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./departmentList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}" style="color:#17a2b8;">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./departmentList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}" style="color:#17a2b8;">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./departmentList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}" style="color:#17a2b8;">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript" src="../js/administrator/departmentList.js"></script>	
<script type="text/javascript">
/* 페이지네이션 선택 색상 */

   $(function () {
      $('.select2').select2()
    });
</script>
</body>
</html>