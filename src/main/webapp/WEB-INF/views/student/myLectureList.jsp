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
		padding : 10px;
	}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<c:import url="../temp/header.jsp"></c:import>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
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
		               <section class="content">
		               		<div class="card search">
		               			<div class="row content">
		               				<label style="margin : 10px;">수강 년도</label>
		               				<select  class="form-control select" name="year" style="width: 15%;" id="year" >
		               				<option value="">전체</option>
		               				<c:forEach  begin="${map['min']}" end="${map['max']}" varStatus="i">
		               					<option value="${i.index}" ${lectureVO.year eq i.index  ? 'selected' : ''}>${i.index}</option>
		               				</c:forEach>
		               				
		       
		               				</select>
		               				<label style="margin : 10px;">학기</label>
		               				<select class="form-control select" name="semester"style="width: 15%;" id="semester">
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
		               							<th style="width : 10%">강의번호</th>
		               							<th style="width : 30%">강좌명</th>
		               							<th style="width : 10%">담당교수</th>
		               							<th style="width : 10%">수강인원</th>
		               							<th style="width : 10%">구분</th>
		               							
		               						</tr>
		               					</thead>
		               					<tbody>
		               						<c:forEach items="${list}" var="lectureVO">
		               							<tr>
		               								<td>${lectureVO.lectureNum }</td>
		               								<td><a href="./lecture/main?lectureNum=${lectureVO.lectureNum}">${lectureVO.lectureName}</a></td>
		               								<td>${lectureVO.professorVO.name}</td>
		               								<td>${lectureVO.subscription}</td>
		               								<td>
		               									${lectureVO.category}
		               								</td>
		               								
		               							</tr>
		               						</c:forEach>
		               					</tbody>
		               				</table>
		               			</div>
		               		</div>
		               </section>
		               
					</div>
				</div>
			</div>
		</div>
	</div>
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

</script>	
</body>
</html>