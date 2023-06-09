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
										<div class="contacts-list chatRoom">
											<c:forEach items="${chatRoomVO.chatMessageVOs}" var="chatMessageVO" varStatus="i">
												<c:if test="${i.first}">
													<li><a href="./detail?roomSender=${chatRoomVO.roomSender}&roomRecipient=${chatRoomVO.roomRecipient}">
															<c:choose>
																<c:when test="${empty chatRoomVO.memberFilesVO.fileName}">
																	<img class="contacts-list-img" src="/images/profile.jpg" alt="User Avatar">
																</c:when>
																<c:otherwise>	
																	<img class="contacts-list-img"  src="/file/member/${chatRoomVO.memberFilesVO.fileName}" alt="User Avatar">
																</c:otherwise>
															</c:choose>
															<div class="contacts-list-info">
																<span class="contacts-list-name">
																	<c:choose>
																	<c:when test="${chatRoomVO.chatStatus eq 2}">
																		${chatRoomVO.recipientName}(${chatRoomVO.roomRecipient})님이 나감
																	</c:when>
																	<c:otherwise>
																		${chatRoomVO.recipientName}(${chatRoomVO.roomRecipient})
																	</c:otherwise>
																</c:choose>
																	<small class="contacts-list-date float-right">${chatMessageVO.msgDate}</small>
																</span>
																<span class="contacts-list-msg">
																	${chatMessageVO.msgContents}
																	<c:if test="${chatRoomVO.chatStatus eq 0}">
																		<span class="right badge badge-info">!</span>
																	</c:if>
																	<small class="contacts-list-date float-right deleteButton" data-chat-num="${chatRoomVO.chatNum}"
																	data-room-sender="${chatRoomVO.roomSender}" data-room-recipient="${chatRoomVO.roomRecipient}">
																		<button class="btn btn-block btn-danger btn-xs"><i class="fa-regular fa-trash-can"></i></button>
																	</small>
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
	<script src="../js/chat/chatList.js"></script>
</body>
</html>