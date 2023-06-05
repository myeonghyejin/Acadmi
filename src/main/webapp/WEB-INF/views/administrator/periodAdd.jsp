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
<style type="text/css">
	
</style>
<title>Insert title here</title>
</head>
<body>
	<form action="./periodAdd" method="post">
		<div class="wrapper">
			수강 년도 <input type="text" name="year"> <br>
			수강 학기<input type="text" name="semester"><br>
		</div>
		
			 <div class="card-body p-0">
			 	<div class="col">
			 		<label style="font-size : 23px;">수강신청 기간설정</label>
			 	</div>
				 	<div class="wrapper">
					  <div class="form-group">
					    <label>수강신청 시작일</label>
					    <input type="date" id="datetime" class="form-control" name="applicationStart" style="width: 500px; display: inline-block;" />
					  </div>
			 		</div>
			</div>
		<button class="btn btn-info" type="submit">등록</button>
		
	</form>
	
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function() {
	  let datetimeField = document.getElementById('datetime');

	  datetimeField.addEventListener('focus', function() {
	    this.type = 'datetime-local';
	  });

	  datetimeField.addEventListener('blur', function() {
	    this.type = 'text';
	  });
	});
	
	
</script>
</body>
</html>