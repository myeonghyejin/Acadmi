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

							<div class="mt-6 mb-6 ">
								<button type="button" class="image-buttonclosewhite color-5 wow fadeInUp"
									data-wow-delay="0.1s"
									style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;"
									onclick="location.href='./list'">
									<span>목록</span>
								</button>
							</div>

							<div class="my-5">	
								<div>
									<%-- <c:if test="${member.id eq boardVO.writer}"> --%>
										<form action="./update" id="frm">
											<input type="hidden" name="num" value="${boardVO.num}">
											<div class="d-flex">
												<button type="submit" class="image-button color-5 wow fadeIn mr-3"
													id="update" data-wow-delay="0.1s">
													<span>글수정</span>
												</button>

												<button type="button" id="delete"
													class="image-buttonclose wow fadeIn mr-4" data-wow-delay="0.1s">
													<span>글삭제</span>
												</button>
											</div>
										</form>
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