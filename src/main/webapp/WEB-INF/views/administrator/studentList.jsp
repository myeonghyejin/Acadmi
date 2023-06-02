<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<c:import url="../temp/administrator.jsp"></c:import>
	
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				
					<c:import url="../temp/sidebar/administrator_memberList.jsp"></c:import>
				
				<!-- 2레벨 Sidebar 끝 -->
				<div class="col" style="background-color : white;">
					<h3>학생 목록 조회</h3>
					
						<!-- Main content -->
				    <section class="content">
				
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
     	 							<c:set var="memberFiles" value="${studentVO.memberFilesVO }"></c:set>
     	 						<tr>
     	 							
	     	 							<td></td>
	     	 							<td>
	   	 									<img alt="" src="/file/${board}/${boardFileVO.fileName}" width="60rem" height="60rem">
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
			    	<c:if test="${pagination.pre}">
						<a href="./studentList?page=${pagination.startNum-1}">이전</a>
					</c:if>
					<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
				   	 	<a href="./studentList?page=${i}">${i}</a>
				   	 </c:forEach>		
				   	<c:if test="${pagination.next}">
						<a href="./studentList?page=${pagination.lastNum+1}">다음</a>
					</c:if> 
				</div>
			</div>
		</div>
	</div>
</div>

	
</body>
</html>