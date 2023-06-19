<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
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

		<!-- Main Contents -->
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:10px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">강의 목록</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					
					<!-- form start -->
					<form action="./list" id="myForm" method="get">
						<div class="row">
							<div class="col-12">
								<div class="card">
									<!-- table-header start -->
									<div class="card-header">
										<div class="card-title" style="width: 50%">
					            		<label class="mx-2 mb-2 mt-3">수강 연도</label>
					               		<select  class="select2" name="year" style="width:115px;" id="year" >
					               			<option value="${year}" ${param.year == year ? 'selected' : ''}>${year}</option>
					               			<option value="${year - 1}" ${param.year == year - 1 ? 'selected' : ''}>${year - 1}</option>
					               			<option value="${year - 2}" ${param.year == year - 2 ? 'selected' : ''}>${year - 2}</option>
					               			<option value="${year - 3}" ${param.year == year - 3 ? 'selected' : ''}>${year - 3}</option>
					               			<option value="${year - 4}" ${param.year == year - 4 ? 'selected' : ''}>${year - 4}</option>
					               		</select>
					               		<label class="ml-3 mr-2 mb-2 mt-3">학기</label>
					               		<select class="select2" name="semester"style="width:115px;" id="semester">
					               			<option value="1" ${param.semester eq 1 or semester eq 1 ? 'selected' : '' }>1학기</option>
					               			<option value="2" ${param.semester eq 2 or semester eq 2 ? 'selected' : '' }>2학기</option>
					               		</select>
					               		<button type="submit" class="btn btn-default ml-2" id="submit">
							            	<i class="fas fa-search"></i>
							            </button>
					                </div>
					                </form>
					                
					                	<div class="card-tools">
					                	<form  action="./list"  method="get">
					                		<div class="mr-2 mt-2">
					                			<input type="hidden" value="${list[0].temporary}">
					                  			<select class="select2" style="height: auto;width:115px" id="temporary" name="temporary" onchange="this.form.submit()">
													<option for="temporary" value="">전체</option>
													<option for="temporary" value="1" ${param.temporary == '1' ? 'selected' : ''}>등록</option>
													<option for="temporary" value="0" ${param.temporary == '0' ? 'selected' : ''}>미등록</option>
													
												</select>
					                    		<a class="btn btn-info ml-1" href="./add">강의 등록</a>
					                  		</div>
					                	</div>
					              	</div>
					              	<!-- table-header end -->
              
              						<!-- table-body start -->
              						<div class="card-body table-responsive p-0">
                						<table class="table table-hover text-nowrap" style="text-align: center;">
                  							<thead>
                    							<tr>
										            <th>강의 연도</th>
										            <th>학기</th>
										            <th>학년</th>
										            <th style="width:30%">강의 이름</th>
										            <th>구분</th>
										            <th>등록 상태</th>
										            <th></th>
							                    </tr>
											</thead>
								            <tbody>
			                    				<c:forEach items="${list}" var="LectureVO">
			                    					<tr>
						                    			<td style="vertical-align:middle;">${LectureVO.year}년도</td>
					 									<td style="vertical-align:middle;">${LectureVO.semester}학기</td>
					 									<td style="vertical-align:middle;">
						 									<c:if test="${LectureVO.grade !=null}">
						 										${LectureVO.grade}학년
						 									</c:if>
					 									</td>
					 									<c:if test="${LectureVO.temporary eq 0}">
					 										<td style="vertical-align:middle;">${LectureVO.lectureName}</td>
					 									</c:if>
					 									<c:if test="${LectureVO.temporary eq 1}">
					 										<td style="vertical-align:middle;"><a href="./main?lectureNum=${LectureVO.lectureNum}">${LectureVO.lectureName}</a></td>
					 									</c:if>
					 											
					 									<td style="vertical-align:middle;">${LectureVO.category}</td>
					 									<td style="vertical-align:middle;">
					 										<c:if test="${LectureVO.temporary eq 1}">등록</c:if> 
					 										<c:if test="${LectureVO.temporary eq 0}">미등록</c:if> 
					 									</td>
					 									<c:if test="${LectureVO.temporary eq 0}">
						 									<td style="width: 100px;">
						 										<a class="btn btn-primary" href="./update?lectureNum=${LectureVO.lectureNum}" style="color: white;">
						 										<i class="fas fa-pencil-alt"></i>수정</a>
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
		<!-- </div> -->

		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
		
		<script>
    $(function () {
	      $('.select2').select2()
	    });
	</script>
	

	


	</div>
<!-- ./wrapper -->
</body>
</html>