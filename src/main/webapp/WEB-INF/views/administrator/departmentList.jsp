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
		<c:import url="../temp/administrator.jsp"></c:import>
	<!-- Header 끝 -->
	<div class="content-wrapper">
		<div class="container-fulid">
			<div class="row">
				<div class="col">
					<h3>학과 관리</h3>
					<!-- Main content -->
				    <section class="content">
				
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
				                          사용어부
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
													<select name="status" class="status">
														<option value="1" selected>활성화</option>
														<option value="0">비활성화</option>
													</select>
												</td>
											</c:if>
											<c:if test="${status eq 0 }">
												<td style="color: #E2E2E2;"><c:out value="${deptNum}"></c:out></td>
												<td style="color: #E2E2E2;"><c:out value="${collegeName}"></c:out></td>
												<td style="color: #E2E2E2;"><c:out value="${deptName}"></c:out></td>
												<td>
													<select name="status" class="status">
														<option value="1">활성화</option>
														<option value="0" selected>비활성화</option>
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
				     <a href="./departmentAdd"><button type="button" id="add" class="btn btn-info">작성</button></a>
				    </section>
				
				    	<c:if test="${pagination.pre}">
								<a href="./departmentList?page=${pagination.startNum-1}">이전</a>
						</c:if>
							<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
						   	 	<a href="./departmentList?page=${i}">${i}</a>
						   	 </c:forEach>		
						<c:if test="${pagination.next}">
								<a href="./departmentList?page=${pagination.lastNum+1}">다음</a>
						</c:if> 
				</div>
			</div>
		</div>
	</div>
</div>

	
<script type="text/javascript" src="../js/administrator/departmentList.js"></script>	
</body>
</html>