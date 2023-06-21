<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
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
	<div class="container-fluid">
		<div class="content-wrapper">
				<div class="col">
					<!-- header start -->
					<div class="row">
						<div class="col-12 mt-3">
							<div class="card">
								<h3 class="my-3 mx-3">강의실 수정</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
			

					      <!-- Default box -->
					      <div class="card">
					      
					        <div class="card-body">
						         <form action="./lectureRoomUpdate" method="post" id="lectureRoomForm">
						         	<input type="hidden" value="${lectureRoom.lectureBuilding}" name = "lectureBuilding">
						         	<input type="hidden" value="${lectureRoom.lectureRoom}" name = "lectureRoom">
						          	 <div class="form-group">
						           	  <label>단과대학 건물</label>
					                  <select class="form-control select2" style="width: 100%;" name="lectureBuilding" id="lectureBuilding" >
					                  	<c:forEach items="${college}" var="collegeVO">
											<option value="${collegeVO.building}" ${lectureRoom.lectureBuilding == collegeVO.building ? 'selected' : ''} disabled="disabled" >${collegeVO.building}</option>
										</c:forEach>
					                  </select>
						           </div>
						           <div class="form-group">
						              <label for="lectureRoom">강의실 호수</label>
						              <input type="number" id="lectureRoom" class="form-control" name="lectureRoom" value="${lectureRoom.lectureRoom }" readonly="readonly"/>
						            </div>
						            
						            <div class="form-group">
						              <label for="personal">최대 수용 인원</label>
						              <input type="number" id="personal" class="form-control" name="personal" value="${lectureRoom.personal }"/>
						            </div>
						            
						           
						           	<div class="form-group clearfix">
						            <div class="icheck-info d-inline">
				                        <input type="radio" id="radioPrimary1" name="status" value="1" ${lectureRoom.status == 1 ? 'checked' : ''} >
				                        	<label for="radioPrimary1">
				                        	사용 가능
				                       		</label>
				                       
				                     </div>
				                     
				                      <div class="icheck-info d-inline ml-3">
				                        <input type="radio" id="radioPrimary2" name="status" value="0" ${lectureRoom.status == 0 ? 'checked' : ''}>
				                        	<label for="radioPrimary2">
				                        	사용 불가
				                       		</label>
				                     </div>
						                 
				                     </div>
					                <div style="width:auto; float: right;">
							            <button type="submit" class="btn btn-info">수정</button> 
							            <button type="button" class="btn btn-danger" id="backBtn">취소</button>
						            </div>
						          </form>
					        </div>
					      </div>
			
		
				</div>
		
		</div>
	</div>	
</div>
<c:import url="../temp/footer.jsp"></c:import>	
<script type="text/javascript">
	$("#lectureBuilding").disabled = true
	
</script>
</html>
</body>