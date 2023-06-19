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
		               
		               <!-- Main content -->
		               		<div class="card search">
		               			<div class="row content">
		               				<label style="margin : 10px;">수강 년도</label>
		               				<select  class="select2" name="year" style="width: 15%;" id="year" >
		               				<option value="">전체</option>
		               				<c:forEach  begin="${map['min']}" end="${map['max']}" varStatus="i">
		               					<option value="${i.index}" ${lectureVO.year eq i.index  ? 'selected' : ''}>${i.index}</option>
		               				</c:forEach>
		               				
		       
		               				</select>
		               				<label style="margin : 10px;">학기</label>
		               				<select class="select2" name="semester"style="width: 15%;" id="semester">
		               					<option value="">전체</option>
		               					<option value="1" ${lectureVO.semester eq 1 ? 'selected' : '' }>1학기</option>
		               					<option value="2" ${lectureVO.semester eq 2 ? 'selected' : '' }>2학기</option>
		               				</select>
		               			</div>
		               		</div>
		               		<!-- Default box -->
		               		<div class="card">
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
		               
					</div>
				</div>
			</div>
		</div>
	</div>
<c:import url="../temp/footer.jsp"></c:import>		
<script type="text/javascript">
	/*입학년도 ~ 재학년도 */
	

	/* 검색 기능 */
	$("#year").on("change", function() {
		let year = $(this).val()
		let semester = $("#semester").val()
		
		
		$.ajax({
			url : "./myLectureList",
			type : "GET",
			data : {
				year : year,
				semester : semester
			},
			
			success : function(response) {
				location.href="./myLectureList?year=" + year + "&semester=" + semester
				
			}
		})
	})
	
	$("#semester").on("change", function() {
		let semester = $(this).val()
		let year = $("#year").val()
		
		$.ajax({
			url : "./myLectureList",
			type : "GET",
			data : {
				year : year,
				semester : semester
			},
			
			success : function(response) {
				location.href="./myLectureList?year=" + year + "&semester=" + semester
			}
		})
	})
	
	$(function () {
      $('.select2').select2()
    });

</script>	
</body>
</html>