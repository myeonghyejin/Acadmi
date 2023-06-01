<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 상세</title>
<c:import url="../temp/style.jsp"></c:import>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
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
							질의응답게시판
						</c:if>
						<c:if test="${board eq 'lectureNotice'}">
							강의공지사항
						</c:if>
					</h1>
				</div>
			  </div>
			</div>
		  </section>
	  
		<section class="content">
			<div class="card">
			  <div class="card-header">
				<h3 class="card-title">
					<c:if test="${board eq 'notice'}">
						공지사항 상세
					</c:if>
					<c:if test="${board eq 'qna'}">
						질의응답 상세
					</c:if>
					<c:if test="${board eq 'lecutureNotice'}">
						강의공지사항 상세
					</c:if>
				</h3>
	  
				<div class="card-tools">
				  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
					<i class="fas fa-minus"></i>
				  </button>
				  <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
					<i class="fas fa-times"></i>
				  </button>
				</div>
			  </div>
	  
			  <div class="card-body">
				<div class="row">
				  <div class="col-12 col-md-12 col-lg-8 order-2 order-md-1">
					<div class="row">
						<h1>${boardVO.title}</h1>
					</div>

					<div class="row">
						<span class="mr-4">작성자</span>
						<span class="mr-4 fontlight">${boardVO.writer}</span>
						<span class="mr-4" style="margin-left: 200px;">작성일</span>
						<span class="mr-4 fontlight">${boardVO.regDate}</span>
						<c:if test="${board eq 'notice'}">
							<span class="mr-4" style="margin-left: 200px;">수정일</span>
							<span class="mr-4 fontlight">${boardVO.modifiyDate}</span>
							<span class="mr-4">조회수</span>
							<span class="mr-4 fontlight">${boardVO.hit}</span>
						</c:if>
						
						<c:if test="${board eq 'lectureNotice'}">
							<span class="mr-4" style="margin-left: 200px;">수정일</span>
							<span class="mr-4 fontlight">${boardVO.modifiyDate}</span>
							<span class="mr-4">조회수</span>
							<span class="mr-4 fontlight">${boardVO.hit}</span>
						</c:if>
					</div>

					<c:forEach items="${boardVO.fileVOs}" var="fileVO">
                        <img alt="" src="/file/${board}/${fileVO.fileName}">
						<!-- <span class="mr-4">첨부파일</span>
						<img class="fileIcon" src="/images/fileIcon.png"> -->
                        <a href="./fileDown?fileNum=${fileVO.fileNum}">${fileVO.oriName}</a>
                    </c:forEach>

					<div class="row" style="margin-top: 200px;">
						<p>${boardVO.contents}</p>
					</div>
					
					<sec:authentication property="principal.username" var="userName" />

					<div class="row" style="margin-top: 200px;">
						<a href="./list" class="btn btn-light">목록</a>
						<c:if test="${userName eq boardVO.writer}">
							<a href="./update?num=${boardVO.num}" id="update" class="btn btn-info float-right">수정</a>	
							<a href="./delete?num=${boardVO.num}" id="delete" class="btn btn-danger float-right">삭제</a>
						</c:if>
					</div>
							 
					<c:if test="${board eq 'qna'}">
						<div class="mt-6 mb-6 float-right">
							<c:if test="${num ne 2}">
								<c:if test="${boardVO.step ne 1}">
									<a href="./reply?num=${boardVO.num}" class="btn btn-primary">답글</a>
								</c:if>
							</c:if>
						</div>
						
								<div class="row">
									<div class="col-12">
										<hr>
										<div class="post">
										  	<div class="user-block">
											  	<c:if test="${num eq 2}">
												  	<div class="replyDetail" data-num-id="${boardVO.num}">
	
												  	</div>
											  	</c:if>
										  	</div>
										</div>
									</div>
								</div>
							</c:if>
					    </div>
				   	</div>
				</div>
			</div>
		</section>
	</div>
</div>
		
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/js/board/notice.js"></script>
	<script src="/js/board/qnaReply.js"></script>
	<script src="../../plugins/jquery/jquery.min.js"></script>
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../../dist/js/adminlte.min.js"></script>
	<script src="../../dist/js/demo.js"></script>
</body>
</html>