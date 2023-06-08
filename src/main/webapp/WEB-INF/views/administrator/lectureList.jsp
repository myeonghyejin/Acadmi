<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
	
</style>
</head>

<body class="hold-transition sidebar-mini layout-fixed">>
<div class="wrapper">

<c:import url="../temp/administrator.jsp"></c:import>

	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				
				<div class="col" style="background-color : white;">
					<!-- header start -->
	               <div class="row" style="padding-top:10px">
	                  <div class="col-12">
	                     <div class="card">
	                        <h3 class="my-3 mx-3">강의 목록 조회</h3>
	                     </div>
	                  </div>
	               </div>
               <!-- header end -->
					
					<!-- Main content -->
				    <section class="content">
				
				      <!-- Default box -->
				      <div class="card">
				        <div class="card-header">
				          <h3 class="card-title">강의 조회</h3>
				
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
				                  	<th></th>
				                      <th style="width: 10%">
				                          강의번호
				                      </th>
				                      <th style="width: 10%">
				                          강의이름
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          강의요일
				                      </th>
				                      <th style="width : 15%">
				                          시작교시
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          종료교시
				                      </th>
				                      <th style="width: 20%">
				                      	  수강인원
				                      </th>
				                      <th style="width: 20%">
				                      	  상태
				                      </th>
				                  </tr>
				              </thead>
				              <tbody>
				                  <c:forEach items="${list}" var="lectureVO">
					   	 		<tr class="container">
					   	 			<td>
						   	 				<button class="toggleButton">+</button>
						   	 				<div class="toggleContent" style="display:none">
						   	 					<div class="contentContainer">
							   	 					  <table class="table table-hover text-nowrap" style="text-align: center;" id="table1">
								                        <tr>
								                            <th>강의번호:</th>
								                            <th>강의이름:</th>
								                           
								                        </tr>
								                        <tr>
								                        	<td>${lectureVO.lectureNum }</td>
								                        	<td>${lectureVO.lectureNum }</td>
								                        </tr>
								                       
								                    </table>
							                   </div>
						   	 				</div>
						   	 				
					   	 			</td>
					   	 			<td> ${lectureVO.lectureNum}</td>
					   	 			<td>${lectureVO.lectureName}</td>
					   	 			<td>${lectureVO.weekday}</td>
					   	 			<td>${lectureVO.startTime}교시</td>
					   	 			<td>${lectureVO.endTime}교시</td>
					   	 			<td>${lectureVO.personal}</td>
					   	 			<c:if test="${lectureVO.status eq 1}">
					   	 				<td>개강</td>
					   	 			</c:if>
					   	 			<c:if test="${lectureVO.status eq 0}">
					   	 				<td>폐강</td>
					   	 			</c:if>
					   	 			
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
							<a href="./administratorList?page=${pagination.startNum-1}">이전</a>
					</c:if>
					<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
				   	 	<a href="./administratorList?page=${i}">${i}</a>
				   	 </c:forEach>		
				   	<c:if test="${pagination.next}">
						<a href="./administratorList?page=${pagination.lastNum+1}">다음</a>
					</c:if> 
				</div>
				
			</div>
		</div>
	
	</div>
</div>	
<script type="text/javascript">
	let toggleButtons = document.getElementsByClassName("toggleButton");
	let toggleContents = document.getElementsByClassName("toggleContent");
	
	for (let i = 0; i < toggleButtons.length; i++) {
	  let toggleButton = toggleButtons[i];
	
	  toggleButton.addEventListener('click', function() {
	    let toggleContent = toggleContents[i]; // 수정: j 대신 i를 사용해야 함
	
	    if (toggleContent.style.display === 'none') {
	      toggleContent.style.display = 'block';
	    } else {
	      toggleContent.style.display = 'none';
	    }
	  });
	}
		
		
</script>
</body>
</html>