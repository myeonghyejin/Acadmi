<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeAdd</title>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>

	<div class="container-fluid my-5">
		<div class="row mb-4">
			<h3 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">글 수정</h3>
		</div>

		<div class="row gx-5 justify-content-center">
        	<div class="col-lg-8 col-xl-6">
            	<form:form id="contactForm" modelAttribute="boardVO" action="./update" method="post" data-sb-form-api-token="API_TOKEN" enctype="multipart/form-data">
			        <div class="form-floating mb-3">
				        <form:input path="title" id="title" cssClass="form-control"/>
				        <label for="title">Title</label>
				        <form:errors path="title"></form:errors>
			        </div>                  
	              	<div class="form-floating mb-3">
	                	<form:input path="writer" id="writer" cssClass="form-control"/>
	                    <label for="writer">Writer</label>
	                    <form:errors path="writer"></form:errors>
	                </div>                      
	                <div class="form-floating mb-3">
		                <textarea class="form-control" id="content" name="content" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
		                <label for="content">Content</label>
	                </div>                   
	                <div class="form-floating mb-3">
	                	<input type="file" name="boardFiles">
	                </div>                                            
	                <div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">Submit</button></div>
                </form:form>   
          	</div>
		</div>
     </div>
	
	<script>
		$("#contents").summernote({
			height : 500,
			width : 1187.48
		});
	</script>
</body>
</html>