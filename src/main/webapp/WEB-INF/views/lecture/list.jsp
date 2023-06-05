<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<c:import url="../temp/header.jsp"></c:import>
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:10px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">내 강의 조회</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					
					<!-- form start -->
					<form action="./list" method="get">
						<div class="row">
							<div class="col-12">
								<div class="card">
									<!-- table-header start -->
									<div class="card-header">
					                	<h3 class="card-title" style="font-weight:normal;">강의 목록</h3>
					                	<div class="card-tools">
					                		<div class="input-group input-group-sm" style="width: 230px;">
					                  			<select class="form-control mx-3" style="height: auto;" id="temporary" name="temporary" onchange="this.form.submit()">
					                    			<option name="temporary" id="temporary" value=" ">강의 조회</option>
													<option for="temporary" value=" " >전체</option>
													<option for="temporary" value="1">등록</option>
													<option for="temporary" value="0">미등록</option>
												</select>
					                    		<a class="btn btn-info" href="./add">강의 등록</a></button>
					                  		</div>
					                	</div>
					              	</div>
					              	<!-- table-header end -->
              
              						<!-- table-body start -->
              						<div class="card-body table-responsive p-0">
                						<table class="table table-hover text-nowrap" style="text-align: center;">
                  							<thead>
                    							<tr>
													<th >강의번호</th>
										            <th>강의년도</th>
										            <th>학기</th>
										            <th>학년</th>
										            <th style="width:30%">강의이름</th>
										            <th>구분</th>
										            <th>등록 상태</th>
										            <th></th>
							                    </tr>
											</thead>
								            <tbody>
			                    				<c:forEach items="${list}" var="LectureVO">
			                    					<tr>
						                    			<td>${LectureVO.lectureNum}</td>
						                    			<td>${LectureVO.year}</td>
					 									<td>${LectureVO.semester}학기</td>
					 									<td>${LectureVO.grade}</td>
					 									<c:if test="${LectureVO.temporary eq 0}">
					 										<td>${LectureVO.lectureName}</td>
					 									</c:if>
					 									<c:if test="${LectureVO.temporary eq 1}">
					 										<td><a href="./main?lectureNum=${LectureVO.lectureNum}" style="color: black;">${LectureVO.lectureName}</a></td>
					 									</c:if>
					 											
					 									<td>${LectureVO.category}</td>
					 									<td>
					 										<c:if test="${LectureVO.temporary eq 1}">등록</c:if> 
					 										<c:if test="${LectureVO.temporary eq 0}">미등록</c:if> 
					 									</td>
					 									<c:if test="${LectureVO.temporary eq 0}">
						 									<td>
						 										<a class="btn btn-primary" href="./update?lectureNum=${LectureVO.lectureNum}" style="color: white;">
						 										<i class="fas fa-pencil-alt"></i>수정</a></button>
						 										<a class="btn btn-danger" href="./delete?lectureNum=${LectureVO.lectureNum}" style="color: white;">
						 										<i class="fas fa-trash"></i>삭제</a>
						 										<%-- <input type="hidden" name="lectureNum" value="${LectureVO.lectureNum}"> --%>
						 									</td>
						 								</c:if>
						 								<c:if test="${LectureVO.temporary eq 1}">
						 									<td> </td>
						 								</c:if>
						                    		</tr>
			                    				</c:forEach>
			                    			</tbody>
                						</table>
              						</div>
              						<!-- table-body end -->
            					</div>
							</div> 
						</div>
					</form>
					<!-- form end -->
				</div>
			</div>
		</div>

		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
</body>
</html>