<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 수정</title>
<c:import url="../temp/style.jsp"></c:import>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body class="hold-transition sidebar-mini">

	<sec:authorize access="hasRole('ROLE_PROFESSOR')">
		<c:import url="../temp/professor_header.jsp"></c:import>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_STUDENT')">
		<c:import url="../temp/header.jsp"></c:import>
	</sec:authorize>

	<div class="wrapper">
		<div class="content-wrapper">
		  <section class="content">
			<div class="row">
			  <div class="col-md-12 mt-5">
				<div class="card card-secondary">
				  <div class="card-header">
					<h3 class="card-title">
						<c:if test="${board eq 'notice'}">
							공지사항 수정
						</c:if>
						<c:if test="${board eq 'qna'}">
							질의응답 수정
						</c:if>
						<c:if test="${board eq 'lectureNotice'}">
							강의공지사항 수정
						</c:if>
						<c:if test="${board eq 'lectureQna'}">
							강의질의응답 수정
						</c:if>
					</h3>  		
				  </div>
				  
				  <div class="card-body">
					<sec:authentication property="principal.username" var="userName" />
		
					<div class="row col-md-7 mx-auto">
						<form id="contactForm" class="row g-3" action="./update" method="post" enctype="multipart/form-data">
							<input type="hidden" name="num" value="${dto.num}">
							
							<div class="col-md-6" style="margin-top: 20px;">
								<label for="writer" class="form-label strongFont2">작성자</label> 
								<input type="text" name="writer" class="form-control" id="writer" readonly value="${userName}">
							</div>
							
							<div class="col-md-7 mt-3">
								<label for="title" class="form-label strongFont2">제목</label>
								<input type="text" class="form-control" name="title" id="title" value="${dto.title}">
							</div>
							
							<c:if test="${board eq 'notice'}">
								<div class="col-md-6">
									<div class="row mt-4">
									  <div style="display: flex; align-items: center;">
									    <label for="important" class="form-label strongFont2" style="margin-bottom: 0; margin-left:10px">중요표시</label>
									    <div style="margin-left: 10px;">
									    	<c:if test="${dto.important == 0 || empty dto.important}">
									      		<input type="checkbox" class="form-control" name="important" id="important" style="width: 20px; height: 20px; margin-bottom: 0;">
									    	</c:if>
									    	<c:if test="${dto.important == 1}">
									    		<input type="checkbox" class="form-control" name="important" id="important" style="width: 20px; height: 20px; margin-bottom: 0;" checked>
									    	</c:if>
									    </div>
									  </div>
									</div>
								</div>
							</c:if>
							
							<c:if test="${board eq 'lectureQna'}">
								<div class="col-md-6">
									<div class="row mt-4">
										 <div style="display: flex; align-items: center;">
										   <label for="secret" class="form-label strongFont2" style="margin-bottom: 0; margin-left:10px">비밀글</label>
										   <div style="margin-left: 10px;">
											   <c:if test="${dto.secret == 0 || empty dto.secret}">
											    <input type="checkbox" class="form-control" name="secret" id="secret" style="width: 20px; height: 20px; margin-bottom: 0;">
											   </c:if>
											   <c:if test="${dto.secret == 1}">
											    <input type="checkbox" class="form-control" name="secret" id="secret" style="width: 20px; height: 20px; margin-bottom: 0;" checked>
											   </c:if>
										   </div>
										 </div>
									</div>
								</div>
							</c:if>
							
							<div class="col-md-12 mt-4">
								<label for="contents" class="form-label strongFont2">내용</label>
								<textarea class="form-control" name="contents" id="contents">${dto.contents}</textarea>
							</div>
							
							<div class="col-md-11 mt-3">
								<div id="fileList">
									<button class="col-md-12 mt-5 btn btn-primary" id="fileAdd" type="button">파일추가</button>
									<c:forEach items="${dto.fileVOs}" var="fileVO">
										<div class="input-group mb-3">
											<div class="input-group-text" style="width: 38px;">
												<input class="form-check-input mt-0 deleteCheck" type="checkbox" name="fileNum" value="${fileVO.fileNum}" style="margin-left: auto;">
											</div>
											<input type="text" disabled value="${fileVO.oriName}" class="form-control">
										</div>
									</c:forEach>	
								</div>	
							</div>

							<div class="row" style="margin-top: 50px; margin-left: 1080px;">	
								<button type="button" class="submitButton btn btn-info" style="margin-right: 5px;">수정</button>
								<a href="./detail?num=${dto.num}" class="btn btn-danger">취소</a>
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
	<script src="/js/board/boardCheck.js"></script>
	<script>
		setCount(${dto.fileVOs.size()});
	
		$("#contents").summernote({
			height : 500,
			width : 1187.48
		});
	</script>
</body>
</html>