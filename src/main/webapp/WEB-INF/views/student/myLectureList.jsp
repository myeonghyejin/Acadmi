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
	.content {
		margin : 20px 10px 20px 0px;
		width : 100%;
	}
	.search {
		padding-left : 50px;
		padding-top : 10px;
	}
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
		
		<!-- Main Contents -->
			<div class="content-wrapper">
				<!-- Contents -->
				<div class="col">
						<!--header start  -->
						<div class="row" style="padding-top:10px">
		                  <div class="col-12">
		                     <div class="card">
		                        <h3 class="my-3 mx-3">수강 강의</h3>
		                     </div>
		                  </div>
		               </div>
		               <!--header end  -->
		               
		               	<!-- Default box -->
		               	<form action="./myLectureList" id="search-form">
		               		<div class="card">
		               			<!-- table-header start -->
								<div class="card-header">
									<div class="row justify-content-center my-3">
					            		<label class="mx-2 my-2">수강 연도</label>
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
					               		<button type="submit" class="btn btn-default ml-4" id="submit">
							            	<i class="fas fa-search"></i>
							            </button>
					                </div>
					            </div>
		               			<div class="card-body p-0">
		               				<table class="table table-hover text-nowrap" style="text-align : center;"  id="tableMyLecture">
		               				 <sec:authentication property="principal" var="user"/>
		               					<thead>
		               						<tr>
		               							<th style="width : 15%">구분</th>
		               							<th style="width : 30%">강좌 이름</th>
		               							<th>강의 요일</th>
		               							<th>수업 시간</th>
		               							<th>담당 교수</th>
		               							<th>학점</th>
		               							
		               						</tr>
		               					</thead>
		               					<tbody>
		               						<c:forEach items="${list}" var="lectureVO" varStatus="status">
		               							<tr>
		               								<td>
		               									${lectureVO.category}
		               								</td>
		               								<td><a href="./lecture/main?lectureNum=${lectureVO.lectureNum}">${lectureVO.lectureName}</a></td>		               								
		               								<td>${lectureVO.weekday}요일</td>
		               								<td>
								            			<c:if test="${lectureVO.startTime eq 1}"> 09:00</c:if>
														<c:if test="${lectureVO.startTime eq 2}"> 10:00</c:if>
														<c:if test="${lectureVO.startTime eq 3}"> 11:00</c:if>
														<c:if test="${lectureVO.startTime eq 4}"> 12:00</c:if>
														<c:if test="${lectureVO.startTime eq 5}"> 13:00</c:if>
														<c:if test="${lectureVO.startTime eq 6}"> 14:00</c:if>
														<c:if test="${lectureVO.startTime eq 7}"> 15:00</c:if>
														<c:if test="${lectureVO.startTime eq 8}"> 16:00</c:if>
														<c:if test="${lectureVO.startTime eq 9}"> 17:00</c:if>
														<c:if test="${lectureVO.startTime eq 10}"> 18:00</c:if>
								            			~
								            			<c:if test="${lectureVO.endTime eq 1}"> 10:00</c:if>
														<c:if test="${lectureVO.endTime eq 2}"> 11:00</c:if>
														<c:if test="${lectureVO.endTime eq 3}"> 12:00</c:if>
														<c:if test="${lectureVO.endTime eq 4}"> 13:00</c:if>
														<c:if test="${lectureVO.endTime eq 5}"> 14:00</c:if>
														<c:if test="${lectureVO.endTime eq 6}"> 15:00</c:if>
														<c:if test="${lectureVO.endTime eq 7}"> 16:00</c:if>
														<c:if test="${lectureVO.endTime eq 8}"> 17:00</c:if>
														<c:if test="${lectureVO.endTime eq 9}"> 18:00</c:if>
														<c:if test="${lectureVO.endTime eq 10}"> 19:00</c:if>		               								
		               								</td>
		               								<td>${lectureVO.professorVO.name}</td>
		               								<td>${lectureVO.completionGrade }학점</td>
		               								
		               							</tr>
		               						</c:forEach>
		               					</tbody>
		               				</table>
		               			</div>
		               		</div>
		               	</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<c:import url="../temp/footer.jsp"></c:import>		
<script type="text/javascript">
	/*입학년도 ~ 재학년도 */


	
	
	$(function () {
      $('.select2').select2()
    });

</script>	
</body>
</html>