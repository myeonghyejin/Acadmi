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
	.col {
		margin : 30px 0 0 0;
	}
	.card{
		margin : 30px 0 20px 0;
		width : 80%;
	}
	h3 {
		margin : 30px;
	}
	.content {
		margin: 30px;
	}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<!-- Header 적용 -->
	<c:import url="../temp/administrator_header.jsp"></c:import>
	<!-- Header 끝 -->
		<div class="content-wrapper">
			<div class="content-fluid">
				<div class="row">
					<div class="col">
						<h3>학과 등록</h3>
							<section class="content">

					      <!-- Default box -->	
					      <div class="card">
					        <div class="card-body row">
					          <div class="col-7">
						         <form action="./departmentAdd" method="post">
						          	 <div class="form-group">
						           	  <label>단과대학</label>
					                  <select class="form-control select2" style="width: 100%;" name="collegeNum">
					                  	<c:forEach items="${list}" var="collegeVO">
											<option value="${collegeVO.collegeNum}">${collegeVO.collegeName }</option>
										</c:forEach>
					                  </select>
						           </div>
						           <div class="form-group">
						              <label for="deptName">학과 이름</label>
						              <input type="text" id="deptName" class="form-control" name="deptName"/>
						              <input type="hidden" name="deptNum">
						            </div>
						           
						            <div class="form-group clearfix">
						            <div class="icheck-primary d-inline">
				                        <input type="radio" id="radioPrimary1" name="status" value="1" checked>
				                        	<label for="radioPrimary1">
				                        	사용가능
				                       		</label>
				                     </div>
				                     
					                      <div class="icheck-primary d-inline">
					                        <input type="radio" id="radioPrimary1" name="status" value="0">
				                        	<label for="radioPrimary1">
				                        	사용불가
				                       		</label>
					                     </div>
				                     </div>
					                 <div  style="width:auto; float: right;">
							            <button type="submit" class="btn btn-info">등록</button> 
							            <button type="button" class="btn btn-danger" id="backBtn">취소</button>
						            </div>
						          </form>
					          </div>
					        </div>
					      </div>
			
			    	</section>
					</div>
				</div>
			</div>
		</div>	
</div>
<c:import url="../temp/footer.jsp"></c:import>	
<script type="text/javascript">
//취소
$("#backBtn").click(function() {
    let back = confirm("정말 취소하시겠습니까?")

    if(back == true) {
        location.href="../administrator/departmentList"
    }else {
        return;
    }
})
</script>	
</body>
</html>