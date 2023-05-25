<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
</head>
<body class="courses-page">
	<div class="page-header">
		<div class="page-header-overlay">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<header class="entry-header wow fadeInDown" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;">
							<h1>공지사항</h1>
						</header>
					</div>
				</div>
			</div>
		</div>
	</div>
			
	<c:import url="../temp/header.jsp"></c:import>
	
			<div class="container-fluid my-5">
		<div class="row mb-4">
			<h3
				class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">공지사항 등록</h3>
		</div>

		<div class="row col-md-7 mx-auto">
			<form class="row g-3" action="./update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="num" value="${dto.num}">
				
				<div class="col-md-4">
					<label for="writer" class="form-label strongFont2">작성자</label> 
					<input type="text" name="writer" class="form-control" id="writer" value="${dto.writer}">
						<%-- <label for="writer" class="form-label strongFont2">작성자</label> <input
						type="text" name="writer" class="form-control" id="writer" readonly value="${member.id}"> --%>
				</div>

				<div class="col-md-12 mt-3">
					<label for="title" class="form-label strongFont2">제목</label> 
					<input type="text" class="form-control" name="title" id="title" value="${dto.title}">
				</div>
				
				<div class="col-md-12 mt-3">
					<label for="important" class="form-label strongFont2">중요표시</label>
					<c:if test="${dto.important == 0}">
						<input type="checkbox" class="form-control" name="important" id="important">
					</c:if>
					<c:if test="${dto.important == 1}">
						<input type="checkbox" class="form-control" name="important" id="important" checked>
					</c:if>
				</div>

				<div class="col-md-12 mt-3">
					<label for="contents" class="form-label strongFont2">내용</label>
					<textarea class="form-control " name="contents" id="contents">${dto.contents}</textarea>
				</div>
				
				 <div id="fileList">
					<button class="col-md-12 mt-5 btn btn-primary" id="fileAdd" type="button">파일추가</button>
				</div>
				
				<div id="fileList" class="my-5">
					<div class="input-group mb-3">
						<c:forEach items="${dto.fileVOs}" var="fileVO">
							<input type="file" class="form-control" id="files" name="files" value="${fileVO.oriName}">
							<button type="button" class="btn btn-outline-danger deleteCheck">X</button>
						</c:forEach>
					</div>
				</div>
				
				<div class="col-md-12 mt-2">
					<div class="d-flex justify-content-between">
						<button type="submit" class="submitButton" data-wow-delay="0.1s">
							<span>수정</span>
						</button>
		
						<button type="button" class="image-buttonclose" data-wow-delay="0.1s" onclick="location.href='./list'">
							<span>취소</span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
		$("#contents").summernote({
			height : 500,
			width : 1187.48
		});
	</script>
		
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/js/filemanager.js"></script>
	<script src="/js/notice.js"></script>
</body>
</html>