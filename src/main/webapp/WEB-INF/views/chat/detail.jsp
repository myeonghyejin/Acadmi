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
					<div class="card direct-chat direct-chat-lime">
						<div class="card-header">
							<h3 class="card-title">${chatRoom.recipientName}</h3>
							<small class="contacts-list-date float-right">
								<c:choose>
									<c:when test="${chatRoom.chatStatus eq 2}">
										<button id="addButton" class="btn btn-block btn-info btn-xs" data-room-sender="${chatRoom.roomSender}" data-room-recipient="${chatRoom.roomRecipient}"><i class="fa-sharp fa-regular fa-handshake"></i></button>
									</c:when>
									<c:otherwise>
										<button id="deleteButton" class="btn btn-block btn-danger btn-xs" data-chat-num="${chatRoom.chatNum}"
										data-room-sender="${chatRoom.roomSender}" data-room-recipient="${chatRoom.roomRecipient}"><i class="fa-regular fa-trash-can"></i></button>
									</c:otherwise>
								</c:choose>
							</small>
						</div>
						<div class="card-body">
							<div class="direct-chat-messages" id="messageList">
								<!-- Message. Default to the left -->
								<c:forEach items="${chatRoom.chatMessageVOs}" var="chatMessageVO">
									<c:if test="${chatMessageVO.msgStatus eq 2}">
										<div>${chatMessageVO.msgContents}</div>
									</c:if>
									<c:if test="${chatMessageVO.msgSender eq param.roomRecipient}">
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left">${chatRoom.recipientName}(${chatMessageVO.msgSender})</span>
												<span class="direct-chat-timestamp float-right">${chatMessageVO.msgDate}</span>
											</div>
											<!-- /.direct-chat-infos -->
											<c:choose>
												<c:when test="${empty chatMessageVO.memberFilesVO.fileName}">
													<img class="direct-chat-img" src="/images/profile.jpg" alt="User profile picture">
												</c:when>
												<c:otherwise>
													<img class="direct-chat-img"  src="/file/member/${chatMessageVO.memberFilesVO.fileName}" alt="message user image">
												</c:otherwise>
											</c:choose>
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">
											${chatMessageVO.msgContents}
											<small class="contacts-list-date float-right">
												<button class="btn btn-block btn-danger btn-xs deleteMessage" data-msg-num="${chatMessageVO.msgNum}"><i class="fa-regular fa-trash-can"></i></button>
											</small>
											</div>
											<!-- /.direct-chat-text -->
										</div>
									</c:if>
									<c:if test="${chatMessageVO.msgSender eq param.roomSender}">
										<div class="direct-chat-msg right">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-right">${chatRoom.senderName}(${chatMessageVO.msgSender})</span>
												<span class="direct-chat-timestamp float-left">${chatMessageVO.msgDate}</span>
											</div>
										<!-- /.direct-chat-infos -->
											<c:choose>
												<c:when test="${empty chatMessageVO.memberFilesVO.fileName}">
													<img id="profile" data-file-name="${chatMessageVO.memberFilesVO.fileName}" class="direct-chat-img" src="/images/profile.jpg" alt="message user image">
												</c:when>
												<c:otherwise>
													<img id="profile" data-file-name="${chatMessageVO.memberFilesVO.fileName}" class="direct-chat-img"  src="/file/member/${chatMessageVO.memberFilesVO.fileName}" alt="message user image">
												</c:otherwise>
											</c:choose>
										<!-- /.direct-chat-img -->
											<div class="direct-chat-text text-right">
												${chatMessageVO.msgContents}
												<small class="contacts-list-date float-left">
													<button class="btn btn-block btn-danger btn-xs deleteMessage" data-msg-num="${chatMessageVO.msgNum}"><i class="fa-regular fa-trash-can"></i></button>
												</small>
											</div>
										<!-- /.direct-chat-text -->
										</div>
									</c:if>
								</c:forEach>
								<!-- /.direct-chat-msg -->

								<!-- Message to the right -->
								
								<!-- /.direct-chat-msg -->
							<!--/.direct-chat-messages-->
							</div>
						<!-- /.card-body -->
						<div class="card-footer">
							<form>
								<div class="form-group" id="formSend">
									<input type="hidden" id="chatNum" name="chatNum" value="${chatRoom.chatNum}">
	                      
									<div class="input-group">
										<input id="message" type="text" name="message" placeholder="Type Message ..." class="form-control">
										<span class="input-group-append">
										<button type="button" class="btn" id="fileButton"><i class="fa-regular fa-file"></i></button>
										</span>
										<span class="input-group-append">
											<button type="button" class="btn btn-info" id="chatSend">Send</button>
										</span>
									</div>
								</div>
							</form>
						</div>
						<!-- /.card-footer-->
					</div>
					<!--/.direct-chat -->
				</div>
			</div>
		</div>
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
	</div>
	<!-- ./wrapper -->
	<script src="../js/chat/chatDetail.js"></script>
	<script src="../plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
</body>
</html>