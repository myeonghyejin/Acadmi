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
	#table1 {
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
		margin : 5px 0 10px 5px;
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
	<!-- Header 적용 -->
		<c:import url="../temp/administrator.jsp"></c:import>
	<!-- Header 끝 -->
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col">
					<!-- header start -->
	               <div class="row" style="padding-top:10px">
	                  <div class="col-12">
	                     <div class="card">
	                        <h3 class="my-3 mx-3">강의실</h3>
	                     </div>
	                  </div>
	               </div>
               <!-- header end -->
				    <section class="content">
				
				      <!-- Default box -->
				      <div class="card">
				        <div class="card-header">
				          <h3 class="card-title">강의실 조회</h3>
				
				          <div class="card-tools">
				            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
				              <i class="fas fa-minus"></i>
				            </button>
				          </div>
				        </div>
				        <div class="card-body p-0">
				          <table class="table table-hover text-nowrap" style="text-align : center;"id="table1">
				              <thead>
				                  <tr>
				                      <th style="width: 10%">
				                          강의실 건물
				                      </th>
				                      <th style="width: 10%">
				                          강의실 호수
				                      </th>
				                      <th style="width: 10%" class="text-center">
				                          최대수용인원
				                      </th>
				                      <th style="width : 15%">
				                          사용어부
				                      </th>
				                      <th style="width: 10%">
				                 
				                      </th>
				                    
				                  </tr>
				              </thead>
				              <tbody>
				                <c:forEach items="${list}" var="lectureRoomVO">
										<tr class="find">
											
											<c:if test="${lectureRoomVO.status eq 0}">
												<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.lectureBuilding}</td>
												<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.lectureRoom}</td>
												<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.personal}</td>
												<td>
													<select name="status" class="status">
														<option value="0"selected >사용불가</option>
														<option value="1">사용가능</option>
													</select>
												</td>
											</c:if>
											<c:if test="${lectureRoomVO.status eq 1 }">
												<td>${lectureRoomVO.lectureBuilding}</td>
												<td>${lectureRoomVO.lectureRoom}</td>
												<td >${lectureRoomVO.personal}</td>
												<td>
													<select name="status" class="status">
														<option value="0" >사용불가</option>
														<option value="1"selected>사용가능</option>
													</select>
												</td>
											</c:if>
										<td>
											<button type="button" class="btn btn-primary" id="update" data-lecture="${lectureRoomVO.lectureBuilding}${lectureRoomVO.lectureRoom}"
												data-lectureBuilding="${lectureRoomVO.lectureBuilding}" data-lectureRoom="${lectureRoomVO.lectureRoom }">
												수정
											</button> 
										</td>
									</tr>
								</c:forEach>
				              </tbody>
				          </table>
				        </div>
				        <!-- /.card-body -->
				      </div>
				      <!-- /.card -->
				    <a href="./lectureRoomAdd"><button type="button" id="add2" class="btn btn-info">작성</button></a>
				    </section>
				    	
				    	<c:if test="${pagination.pre}">
								<a href="./lectureRoomList?page=${pagination.startNum-1}">이전</a>
						</c:if>
							<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
						   	 	<a href="./lectureRoomList?page=${i}">${i}</a>
						   	 </c:forEach>		
						<c:if test="${pagination.next}">
								<a href="./lectureRoomList?page=${pagination.lastNum+1}">다음</a>
						</c:if> 
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="../js/administrator/lectureRoomList.js"></script>
</body>
</html>