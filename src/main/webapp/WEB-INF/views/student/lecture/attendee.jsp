<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head>
<body class="hold-transition sidebar-mini layout-fixed"" >
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
			                        <h3 class="my-3 mx-3">참여자 목록 조회</h3>
			                     </div>
			                  </div>
			               </div>
		              	 <!-- header end -->
		              	 <!-- Main content -->
		              	 <section class="content">
		              	 <!-- Default box -->
					      <div class="card">
					        <div class="card-header">
					          <h3 class="card-title">침여자 목록</h3>
					
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
										<c:set var="department" value="${lectureVO.departmentVO. }"></c:set>
						   	 		</tr>	
						   	 		</c:forEach>
					              </tbody>
					          </table>
					          
					        </div>
					        <!-- /.card-body -->
					      </div>
					      <!-- /.card -->
		              	 </section>
					</div>
				</div>
			</div>
	</div>
</body>
</html> --%>