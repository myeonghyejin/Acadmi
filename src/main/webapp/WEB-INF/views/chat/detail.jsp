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
							<h3 class="card-title">메세지</h3>
						</div>
						<div class="card-body">
							<div class="direct-chat-messages" id="messageList">
								<!-- Message. Default to the left -->
								<c:forEach items="${chatRoom.chatMessageVOs}" var="chatMessageVO">
									<c:if test="${chatMessageVO.msgSender eq param.roomRecipient}">
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left">${chatMessageVO.msgSender}</span>
												<span class="direct-chat-timestamp float-right">${chatMessageVO.msgDate}</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="...">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">${chatMessageVO.msgContents}</div>
											<!-- /.direct-chat-text -->
										</div>
									</c:if>
									<c:if test="${chatMessageVO.msgSender eq param.roomSender}">
										<div class="direct-chat-msg right">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-right">${chatMessageVO.msgSender}</span>
												<span class="direct-chat-timestamp float-left">${chatMessageVO.msgDate}</span>
											</div>
										<!-- /.direct-chat-infos -->
											<img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image">
										<!-- /.direct-chat-img -->
											<div class="direct-chat-text text-right">${chatMessageVO.msgContents}</div>
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
								<input type="hidden" id="chatNum" name="chatNum" value="${chatRoom.chatNum}">
								<div class="input-group">
									<input id="message" type="text" name="message" placeholder="Type Message ..." class="form-control">
									<span class="input-group-append">
										<button type="button" class="btn btn-info" id="chatSend">Send</button>
									</span>
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
</body>
</html>