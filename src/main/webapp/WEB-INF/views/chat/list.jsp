<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Acadmi!</title>
<!-- CSS/favicon 적용 -->
<c:import url="../temp/style.jsp"></c:import>
<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Header 적용 -->
		<c:import url="../temp/header.jsp"></c:import>
		<!-- Header 끝 -->
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper"></div>
				<!-- 2레벨 Sidebar 끝 -->
				<!-- Contents -->
				<div class="col">
					<section class="content">
						<div class="card direct-chat">
							<div class="card-header">
								<h3 class="card-title">메세지</h3>


							</div>
							<div class="card-body">

								<div class="direct-chat-contacts-light">
									<c:forEach items="${list}" var="chatRoomVO">
										<div class="contacts-list">
											<c:forEach items="${chatRoomVO.chatMessageVOs}" var="chatMessageVO" varStatus="i">
												<c:if test="${i.last}">
													<li><a href="./detail?sender=${chatMessageVO.sender}&recipient=${chatMessageVO.recipient}">
														<img class="contacts-list-img" src="" alt="...">
																<div class="contacts-list-info">
																	<span class="contacts-list-name">
																		${chatMessageVO.recipient}
																		<small class="contacts-list-date float-right">${chatMessageVO.msgDate}</small>
																	</span>
																	<span class="contacts-list-msg">
																		${chatMessageVO.msgContents}
																		<c:if test="${chatMessageVO.msgStatus eq 0}">
																			<small class="contacts-list-date float-right">!</small>
																		</c:if>
																	</span>
																</div>
													</a></li>
												</c:if>
											</c:forEach>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
	</div>
	<!-- ./wrapper -->
</body>
</html>