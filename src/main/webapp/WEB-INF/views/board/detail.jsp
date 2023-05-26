<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
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
			<header style="margin-top: 50px;">
				<div class="container-fluid">
					<div class="row col-md-7 mx-auto ">
						<div class="row col-md-12 d-flex justify-content-end">
							<div class="col-md-10 mx-auto">
							<h1 class="wow fadeInUp" data-wow-delay="0.1s"
								style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
								${boardVO.title}</h1>
							<div class="border-bottom border-dark pb-4 pt-4 wow fadeInUp" data-wow-delay="0.1s"
								style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
								<div class="strongFont3 wow fadeInUp" data-wow-delay="0.1s"
									style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
									<span class="mr-4">작성자</span>
									<span class="mr-4 fontlight">${boardVO.writer}</span>
									<span class="mr-4">작성일</span>
									<span class="mr-4 fontlight">${boardVO.regDate}</span>
									<span class="mr-4">조회수</span>
									<span class="mr-4 fontlight">${boardVO.hit}</span>
								</div>
							</div>

							<div class="mt-5 mb-5 wow fadeInUp" data-wow-delay="0.1s"
								style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
								<p>${boardVO.contents}</p>
							</div>
							
							<c:forEach items="${boardVO.fileVOs}" var="fileVO">
                                <img alt="" src="/file/${board}/${fileVO.fileName}">
                                <a href="./fileDown?fileNum=${fileVO.fileNum}">${fileVO.oriName}</a>
                           	</c:forEach>

							<div class="mt-6 mb-6 ">
								<a href="./list" class="btn btn-primary">목록</a>
							</div>

							<div class="my-5">	
								<div>
									<%-- <c:if test="${member.id eq boardVO.writer}"> --%>
										<a href="./update?num=${boardVO.num}" id="update" class="btn btn-primary float-right">수정</a>
												
										<a href="./delete?num=${boardVO.num}" id="delete" class="btn btn-primary float-right">삭제</a>
									<%-- </c:if> --%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/js/notice.js"></script>
</body>
</html>