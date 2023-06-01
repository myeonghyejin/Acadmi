<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 작성</title>
<c:import url="../temp/style.jsp"></c:import>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body class="hold-transition sidebar-mini">

	<c:import url="../temp/header.jsp"></c:import>

	<div class="wrapper">
		<div class="content-wrapper">
		  <section class="content-header">
			<div class="container-fluid">
			  <div class="row mb-2">
				<div class="col-sm-6">
				  <h1>
					<c:if test="${board eq 'notice'}">
						공지사항
					</c:if>
					<c:if test="${board eq 'qna'}">
						질의응답
					</c:if>
					<c:if test="${board eq 'lectureNotice'}">
						강의공지사항
					</c:if>
					<c:if test="${board eq 'lectureQna'}">
						강의질의응답
					</c:if>
				  </h1>
				</div>
			  </div>
			</div>
		  </section>
	  
		  <section class="content">
			<div class="row">
			  <div class="col-md-12">
				<div class="card card-secondary">
				  <div class="card-header">
					<h3 class="card-title">
						<c:if test="${board eq 'notice'}">
							공지사항 등록
						</c:if>
						<c:if test="${board eq 'qna'}">
							질의응답 등록
						</c:if>
						<c:if test="${board eq 'lectureNotice'}">
							강의공지사항 등록
						</c:if>
						<c:if test="${board eq 'lectureQna'}">
							강의질의응답 등록
						</c:if>
					</h3>
	  
					<div class="card-tools">
					  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
						<i class="fas fa-minus"></i>
					  </button>
					</div>
				  </div>

				  <div class="card-body">
					<sec:authentication property="principal.username" var="userName" />
		
					<div class="row col-md-7 mx-auto">
						<form class="row g-3" action="./add" method="post" enctype="multipart/form-data">
							
							<c:if test="${board eq 'lectureNotice'}">
								<div class="col-md-12 mt-3">
									<label for="lectureNum" class="form-label strongFont2">강의번호</label> 
									<input type="text" class="form-control" name="lectureNum" id="lectureNum">
								</div>
							</c:if>
									
							<div class="col-md-4" style="margin-top: 20px;">
								<label for="writer" class="form-label strongFont2">작성자</label>
								<input type="text" name="writer" class="form-control" id="writer" readonly value="${userName}">
							</div>
					
							<div class="col-md-12 mt-3">
								<label for="title" class="form-label strongFont2">제목</label> 
								<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요">
							</div>
							
							<c:if test="${board eq 'notice'}">
								<div class="col-md-12 mt-3">
									<label for="important" class="form-label strongFont2">중요표시</label> 
									<input type="checkbox" class="form-control" name="important" id="important">
								</div>
							</c:if>
							
							<c:if test="${board eq 'lectureQna'}">
								<div class="col-md-12 mt-3">
									<label for="secret" class="form-label strongFont2">비밀글</label> 
									<input type="checkbox" class="form-control" name="secret" id="secret">
								</div>
							</c:if>
							
							<div class="col-md-12 mt-3">
								<label for="contents" class="form-label strongFont2">내용</label>
								<textarea class="form-control" name="contents" id="contents" placeholder="내용을 입력하세요"></textarea>
							</div>
							
							<div class="col-md-12 mt-3">
								<div id="fileList">
									<button class="col-md-12 mt-5 btn btn-primary" id="fileAdd" type="button">파일추가</button>
								</div> 
							</div>

							<div class="row" style="margin-top: 50px; margin-left: 1080px;">		
								<button type="submit" class="submitButton btn btn-info" style="margin-right: 5px;">등록</button>
								<button type="button" class="btn btn-danger" onclick="location.href='./list'">취소</button>
							</div>
						</form>
					</div>
				  </div>
				</div>
			  </div>
			</div>
		  </section>
		</div>
	  </div>

	<c:import url="../temp/footer.jsp"></c:import>

	<script src="/js/filemanager.js"></script>
	<script src="/js/board/notice.js"></script>

	<script>
		$("#contents").summernote({
			height : 500,
			width : 1187.48
		});
	</script>

	<script src="../../plugins/jquery/jquery.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../../dist/js/adminlte.min.js"></script>
	<script src="../../dist/js/demo.js"></script>
</body>
</html>