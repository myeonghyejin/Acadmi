<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
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

</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Header 적용 -->
		<c:import url="../temp/administrator_header.jsp"></c:import>
		<!-- Header 끝 -->
		
		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="content-wrapper">
				<div class="col">
					<!-- header start -->
					<div class="row" style="padding-top:10px">
						<div class="col-12">
							<div class="card">
								<h3 class="my-3 mx-3">기간 등록</h3>
							</div>
						</div>
					</div>
					<!-- header end -->
					
					<section class="content">
						<div class="card">
							<div class="card-body row">
								<div class="col">
									<form action="./periodAdd" method="post">
										<div class="wrapper">
											<div class="form-group">
								          	  <label>수강년도</label>
								                <select  class="form-control select2" style="width: 100%;" name="year" id="year" >
													<c:forEach items="${year}" var="year">
														<option value="${year}">${year }</option>
													</c:forEach>
													
												</select>
											</div>
											<div class="form-group">
								          	  <label>수강학기</label>
								                <select  class="form-control select2" style="width: 100%;" name="semester" id="semester">
													<option value="1">1학기</option>
													<option value="2">2학기</option>
												</select>
											</div>
										</div>
										
										<div class="card-body">
											<div class="row">
											  <div class="col">
											    <label style="font-size: 20px;">장바구니 기간 설정</label>
											  </div>
											</div>
											
											<div class="row" style="margin-top : 20px;">
											  <div class="col">
											    <div class="form-group">
											      <label>장바구니 시작일</label>
											      <br>
											      <input type="date" class="form-control" name="favoriteStart" style="display: inline-block; margin-right: 40px;">
											    </div>
											  </div>
											
											  <div class="col">
											    <div class="form-group">
											      <label>장바구니 종료일</label>
											      <br>
											      <input type="date" class="form-control" id="favoriteEnd" onchange="updateApplicationEnd()" name="favoriteEnd" style=" display: inline-block;">
											    </div>
											  </div>
											</div>
										</div>
										<div class="card-body">
											<div class="row">
											  <div class="col">
											    <label style="font-size: 20px;">수강 신청 기간 설정</label>
											  </div>
											</div>
											<div class="row" style="margin-top : 20px;">
											  <div class="col">
											    <div class="form-group">
											      <label>수강 신청 시작일</label>
											      <br>
											      <input type="date" class="form-control" name="applicationStart" style=" display: inline-block; margin-right: 40px;">
											    </div>
											  </div>
											
											  <div class="col">
											    <div class="form-group">
											      <label>수강 신청 종료일</label>
											      <br>
											      <input type="date" class="form-control" id="applicationEnd" " name="applicationEnd" style=" display: inline-block;" readonly="readonly">
											    </div>
											  </div>
											</div>
											
										</div>
										<div class="card-body">
											<div class="row">
											  <div class="col">
											    <label style="font-size: 20px;">강의 마감일 기간 설정</label>
											  </div>
											</div>
											<div class="row" style="margin-top : 20px;">
											  <div class="col">
											    <div class="form-group">
											      <label>강의 종료일</label>
											      <br>
											      <input type="date" class="form-control" name="deadline" style=" display: inline-block; margin-right: 40px;">
											    </div>
											  </div>
											</div>
										<div style="width:auto; float: right; margin-top:20px;">
							                <button class="btn btn-info" type="submit" name="buttonType" value="1" style="margin-right : 10px;">기간 등록</button>
							                <a class="btn btn-danger"  style="color: white;" id="backBtn">취소</a>
				               		 	</div>
										
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
	
<script type="text/javascript">

//수강 신청 종료일 자동 설정
function updateApplicationEnd(){
	let favoriteEnd = $("#favoriteEnd").val()
	console.log(favoriteEnd)
	
	$("#applicationEnd").val(favoriteEnd)
}

//취소 
$("#backBtn").click(function() {
    let back = confirm("정말 취소하시겠습니까?")

    if(back == true) {
        location.href="/"
    }else {
        return;
    }
})
</script>
</body>
</html>