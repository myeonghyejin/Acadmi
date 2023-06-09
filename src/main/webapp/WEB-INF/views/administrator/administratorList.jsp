<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Insert title here</title>
<style type="text/css">
	#pagination {
		 display: flex;
   	 	justify-content: center;
	
	}
	
	.selected-page{
		  background-color: #E2E2E2;
		  color: white; /* 선택된 페이지의 텍스트 색상도 변경할 수 있습니다 */
	}

	#tableAdmin {
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
	
	.search {
		padding : 10px;
		
	}
	.content {
		margin : 10px;
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
					<!-- header start -->
	               <div class="row" style="padding-top:10px">
	                  <div class="col-12">
	                     <div class="card">
	                        <h3 class="my-3 mx-3">직원 목록 조회</h3>
	                     </div>
	                  </div>
	               </div>
              	 <!-- header end -->
					
					<!-- Main content -->
				    <section class="content">
				
					<!--Search -->
					<form action="./administratorList" id="search-form">
						<input type="hidden" name="page" value="1">
						<div class="card search">
							<div class="row content" >
								<label style="margin : 10px;">직원 번호</label>
								<input type="text" class="form-control" name="username" placeholder="내용을 입력해주세요" style="width : 20%">
								<label style="margin : 10px;">성명</label>
								<input type="text" class="form-control" name="search" placeholder="내용을 입력해주세요" style="width : 20%">
								<label style="margin : 10px;">상태</label>
								<select class="form-control select" name="status" style="width: 20%;">
									<option value="">전체</option>
									<option value="1">재직</option>
									<option value="2">휴직</option>
									<option value="3">퇴직</option>
								</select>
								<button type="submit" class="btn btn-info" style="margin : 0 0 0 20px; width : 15%">검색</button>
							</div>
						</div>
					</form>
					
				      <!-- Default box -->
				      <div class="card">
				        <div class="card-header">
				          <h3 class="card-title">직원 조회</h3>
				
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
				                      <th style="width: 10%">
				                          쪽지
				                      </th>
				                      <th style="width: 10%">
				                          사진
				                      </th>
				                      <th style="width: 10%">
				                      	  직원번호
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          성명
				                      </th>
				                      <th style="width : 15%">
				                          연락처
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          이메일
				                      </th>
				                      <th style="width: 20%">
				                      	  담당학과
				                      </th>
				                      <th style="width: 20%">
				                      	  상태
				                      </th>
				                  </tr>
				              </thead>
				              <tbody>
				                  <c:forEach items="${list}" var="departmentVO">
					   	 		<tr>
					   	 			<c:set var="department" value="${departmentVO.deptName}"></c:set>
					   	 			<c:forEach items="${departmentVO.administratorVOs}" var="administratorVO">
					   	 				<c:set var="administratorName" value="${administratorVO.name}"></c:set>
					   	 				<c:set var="administratorPhone" value="${administratorVO.phone}"></c:set>
					   	 				<c:set var="administratorEmail" value="${administratorVO.email}"></c:set>
					   	 				<c:set var="administratorStatus" value="${administratorVO.status}"></c:set>
					   	 				<c:set var="administratoruserName" value="${administratorVO.username}"></c:set>
					   	 				<c:set var="memberFiles" value="${administratorVO.memberFilesVO.fileName}"></c:set>
					   	 				<tr>
						   	 				
						   	 			<td>
	     	 								<sec:authentication property="principal.username" var="username"/>
				     	 					<a href="../chat/detail?roomSender=${username}&roomRecipient=${administratorVO.username}"><i class="fa-regular fa-envelope fa-2xl" style="margin:30px 0 0 0;"></i></a>
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
						   	 			<td><c:out value="${administratoruserName}"></c:out></td>
						   	 			<td><c:out value="${administratorName}"></c:out></td>
						   	 			<td><c:out value="${administratorPhone}"></c:out></td>
						   	 			<td><c:out value="${administratorEmail}"></c:out></td>
						   	 			<td><c:out value="${department}"></c:out></td>
						   	 			<c:if test="${administratorStatus eq 1}">
						   	 				<td>재직</td>
						   	 			</c:if>
						   	 			<c:if test="${administratorStatus eq 2}">
						   	 				<td>휴직</td>
						   	 			</c:if>
						   	 			<c:if test="${administratorStatus eq 3}">
						   	 				<td>퇴직</td>
						   	 			</c:if>
					   	 				</tr>
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
				  	<div class="row" style="margin: 20px auto;" id="pagination">
							<nav aria-label="Page navigation example">
								<ul class="pagination d-flex justify-content-center">
									<li class="page-item ${pagination.page eq 1? 'disabled' : '' }">
										<a class="page-link" href="./administratorList?page=1&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="1">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.pre eq false ? 'disabled' : ''}">
										<a class="page-link" href="./administratorList?page=${pagination.startNum-1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Previous" data-board-page="${pagination.startNum-1}">
											<span aria-hidden="true">&lsaquo;</span>
										</a>
									</li>
									<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
										<li class="page-item"><a class="page-link" href="./administratorList?page=${i}&kind=${pagination.kind}&search=${pagination.search}" data-board-page="${i}">${i}</a></li>
									</c:forEach>
									<li class="page-item ${pagination.next eq false ? 'disabled' : ''}">
										<a class="page-link" href="./administratorList?page=${pagination.lastNum+1}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.lastNum+1}">
											<span aria-hidden="true">&rsaquo;</span>
										</a>
									</li>
									<li class="page-item ${pagination.next eq totalPage ? 'disabled' : ''}">
										<a class="page-link" href="./administratorList?page=${pagination.totalPage}&kind=${pagination.kind}&search=${pagination.search}" aria-label="Next" data-board-page="${pagination.totalPage}">
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
<script type="text/javascript">
 /* 페이지네이션 선택 색상 */ 

</script>
</body>
</html>