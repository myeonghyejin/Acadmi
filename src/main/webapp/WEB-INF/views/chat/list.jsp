<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Acadmi!</title>
<!-- CSS/favicon 적용 -->
<c:import url="../temp/style.jsp"></c:import>
<style>
  .btn .fa-search {
    position: relative;
    top: -3px;
  }
</style>
<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Header 적용 -->
		<sec:authorize acess="hasRole('ROLE_ADMIN')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
			<c:import url="../temp/administrator_header.jsp"></c:import>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<c:import url="../temp/professor_header.jsp"></c:import>
		</sec:authorize>
			
		<sec:authorize access="hasRole('ROLE_STUDENT')">
			<c:import url="../temp/student_header.jsp"></c:import>
		</sec:authorize>
		<!-- Header 끝 -->
	
		<!-- Contents -->
		<div class="content-wrapper">
			<div class="col">
				<section class="content">
					<div class="row">
						<div class="col mt-3">
							<div class="card">
								<h3 class="my-3 mx-3">메시지</h3>
							</div>
						</div>
					</div>
					<div class="card direct-chat">
						<div class="card-header">
							<form style="width: 800px; margin-left: auto;" action="./list" method="get" id="searchForm">
									<div class="row" style="justify-content: flex-end; height:40px;">
										<select class="select2" name="kind" id="kind"  style="width: 100px;">
											<option value="recipientName" ${pagination.kind eq 'recipientName' ? 'selected' :''}>이름</option>
											<option value="roomRecipient" ${pagination.kind eq 'roomRecipient' ?'selected':''}>ID</option>
										</select>
										<div class="form-group">
											<div class="input-group input-group-lg">
												<input type="text" class="form-control form-control-lg" value="${pagination.search}" name="search" id="search" placeholder="검색어를 입력하세요"  style="height: 40px;">
												<div class="input-group-append">
													<button type="submit" class="btn btn-lg btn-default"  style="height: 40px;"><i class="fa fa-search"></i></button>
												</div>
											</div>
										</div>
									</div>
							</form>
						</div>
						<div class="card-body">
							<div class="direct-chat-contacts-light">
								<c:forEach items="${list}" var="chatRoomVO">
									<div class="contacts-list chatRoom">
										<c:forEach items="${chatRoomVO.chatMessageVOs}" var="chatMessageVO" varStatus="i">
											<c:if test="${i.first}">
												<li>
													<a href="./detail?roomSender=${chatRoomVO.roomSender}&roomRecipient=${chatRoomVO.roomRecipient}">
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
																	<button class="btn btn-block btn-danger btn-xs"><i class="fa-solid fa-door-open"></i></button>
																</small>
															</span>
														</div>
													</a>
												</li>
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
		<!-- Footer 적용 -->
		<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
	</div>
	<!-- ./wrapper -->
	<script src="../js/chat/chatList.js"></script>
	<script>
	    $(function () {
	      $('.select2').select2()
	    });
	</script>
</body>
</html>