<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/style.jsp"></c:import>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>

<c:import url="../temp/header.jsp"></c:import>

	<h1>강의실 조회</h1>
	
	<table class="table table-hover" border="1" id="table1">
		<thead>
			<tr>
				<th>강의실 건물</th>
				<th>강의실 호수</th>
				<th>최대수용인원</th>
				<th>사용여부</th>
				<th></th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="lectureRoomVO">
			<tr>
					
					<c:if test="${lectureRoomVO.status eq 0}">
						<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.lectureBuilding}</td>
						<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.lectureRoom}</td>
						<td class="lectureRoom" style="color: #E2E2E2;">${lectureRoomVO.personal}</td>
						<td>
							<select name="status" class="status0">
								<option value="0"selected >사용불가</option>
								<option value="1">사용가능</option>
							</select>
						</td>
					</c:if>
					<c:if test="${lectureRoomVO.status eq 1 }">
						<td>${lectureRoomVO.lectureBuilding}</td>
						<td>${lectureRoomVO.lectureRoom}</td>
						<td >${lectureRoomVO.personal}</td>
						<td>
							<select name="status" class="status1">
								<option value="0" >사용불가</option>
								<option value="1"selected>사용가능</option>
							</select>
						</td>
					</c:if>
				<td><button type="button" class="btn btn-primary" id="update" data-lecture="${lectureRoomVO.lectureBuilding}${lectureRoomVO.lectureRoom}"
				data-lectureBuilding="${lectureRoomVO.lectureBuilding}" data-lectureRoom="${lectureRoomVO.lectureRoom }">
				수정</button> </td>
				
			</tr>
		</c:forEach>
	</table>
	
	<a href="./lectureRoomAdd"><button type="button" id="add" class="btn btn-primary">작성</button></a>
	
	<c:if test="${pagination.pre}">
		<a href="./lectureRoomList?page=${pagination.startNum-1}">이전</a>
	</c:if>
	<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
   	 	<a href="./lectureRoomList?page=${i}">${i}</a>
   	 </c:forEach>		
   	<c:if test="${pagination.next}">
		<a href="./lectureRoomList?page=${pagination.lastNum+1}">다음</a>
	</c:if> 
	<script type="text/javascript" src="../js/administrator/lectureRoomList.js"></script>
</body>
</html>