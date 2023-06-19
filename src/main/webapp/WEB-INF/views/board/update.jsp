<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Acadmi</title>
<c:import url="../temp/style.jsp"></c:import>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body class="hold-transition sidebar-mini">

	<div class="wrapper">
	
		<sec:authentication property="principal.username" var="userName" />
	
		<!-- Header 적용 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
	     	<c:import url="../temp/administrator_header.jsp"></c:import>
	  	</sec:authorize>
	  	
	  	<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
	     	<c:import url="../temp/administrator_header.jsp"></c:import>
	  	</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:choose>
				<c:when test="${board eq 'lectureNotice'}">
					<c:import url="../temp/lecture_header.jsp"></c:import>
				</c:when>
				<c:when test="${board eq 'lectureQna'}">
					<c:import url="../temp/lecture_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="../temp/professor_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</sec:authorize>
	
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:choose>
				<c:when test="${board eq 'lectureNotice'}">
					<c:import url="../temp/lecture_header.jsp"></c:import>
				</c:when>
				<c:when test="${board eq 'lectureQna'}">
					<c:import url="../temp/lecture_header.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="../temp/student_header.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</sec:authorize>	
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- 2레벨 Sidebar 적용 -->
					<c:if test="${board eq 'lectureNotice' || board eq 'lectureQna'}">
						<sec:authorize access="hasRole('ROLE_PROFESSOR')">
							<c:import url="../temp/sidebar/professor_lecture.jsp"></c:import>
						</sec:authorize>
									
						<sec:authorize access="hasRole('ROLE_STUDENT')">
							<c:import url="../temp/sidebar/student_lecture_main.jsp"></c:import>
						</sec:authorize>
					</c:if>
					<!-- 2레벨 Sidebar 끝 -->
					<!-- Contents -->
					<div class="col">
					  	<div class="row" style="padding-top:20px">
							<div class="col-12">
								<div class="card">
									<h3 class="my-3 mx-3">
										<c:if test="${board eq 'notice'}">
											공지사항 수정
										</c:if>
										<c:if test="${board eq 'qna'}">
											질의응답 수정
										</c:if>
										<c:if test="${board eq 'lectureNotice'}">
											공지사항 수정
										</c:if>
										<c:if test="${board eq 'lectureQna'}">
											질의응답 수정
										</c:if>
									</h3>
								</div>
							</div>
						</div>
					  
						<div class="row">
							<div class="col-md-12" style="margin-top: 10px;">
								<div class="card card-secondary">
									<div class="card-body" style="margin: 0 auto">				
										<form id="contactForm" action="./update" method="post" enctype="multipart/form-data">
											<input type="hidden" name="num" value="${dto.num}">
											
											<input type="hidden" name="writer" class="form-control" id="writer" readonly value="${userName}">
											
											<div class="col-md-12 mt-3">
												<label for="title" class="form-label strongFont2">제목</label>
												<input type="text" class="form-control" name="title" id="title" value="${dto.title}">
											</div>
											
											<c:if test="${board eq 'notice'}">
												<div class="col-md-12">
													<div class="row mt-4">
													  <div style="display: flex; align-items: center;">
													    <label for="important" class="form-label strongFont2" style="margin-bottom: 0; margin-left:10px">중요 표시</label>
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
												<div class="col-md-12">
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
											
											<div class="col-md-12 mt-2">
												<div class="form-group" id="fileList">
													<button class="col-md-12 mt-5 btn btn-secondary" id="BoardFileAdd" type="button">파일 추가</button>
													<c:forEach items="${dto.fileVOs}" var="fileVO">
															<div class="input-group">
																<c:if test="${not empty fileVO.fileName}">
																	<div class="input-group-text" style="width: 38px;">
																		<input class="form-check-input mt-0 deleteCheck" type="checkbox" name="fileNum" value="${fileVO.fileNum}" style="margin-left: auto;">
																	</div>
																</c:if>
																<div class="custom-file">
																	<input type="file" class="custom-file-input" id="exampleInputFile" name="addfiles" disabled value="${fileVO.oriName}">
																	<label class="custom-file-label" for="exampleInputFile">${fileVO.oriName}</label>
																</div>
													    	</div>			    	
											    	</c:forEach>
										    	</div>											
											</div> 
				
											<div class="col-md-12 mt-4">
												<a href="./detail?num=${dto.num}" class="btn btn-danger float-right">취소</a>	
												<button type="button" class="submitButton btn btn-info float-right" style="margin-right: 5px;">수정</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
			  		</div>
				</div>
			</div>
		</div>
		<c:import url="../temp/footer.jsp"></c:import>
	</div>
	<script src="/js/filemanager.js"></script>
	<script src="/js/board/notice.js"></script>
	<script src="/js/board/boardCheck.js"></script>
	<script>
	
		$("#contents").summernote({
			height : 300
		});
		
		setCount(${dto.fileVOs.size()});
		
		$("#BoardFileAdd").click(()=>{
			const fileInput = document.getElementById('exampleInputFile');
		    const fileLabel = document.querySelector('.custom-file-label');

		    fileInput.addEventListener('change', function() {
		      const fileName = this.files[0].name;
		      fileLabel.textContent = fileName;
		    });
		});
	</script>
</body>
</html>