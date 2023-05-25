<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>강의실 조회</h1>
	
	<table border="1">
		<thead>
			<tr>
				<th>강의실 건물</th>
				<th>강의실 호수</th>
				<th>최대수용인원</th>
				<th>사용여부</th>
				<th></th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="lectureVO">
			<tr>
				<td>${lectureVO.lectureBuilding}</td>
				<td>${lectureVO.lectureRoom}</td>
				<td>${lectureVO.personel}</td>
					<c:if test="${lectureVO.status eq 0}">
						<td style="color:red;">사용불가</td>
					</c:if>
					<c:if test="${lectureVO.status eq 1 }">
						<td>사용가능</td>
					</c:if>
				<td><a href="./lectureRoomUpdate?lectureBuilding=${lectureRoom.lectureBuilding}&lectureRoom=${lectureRoom.lectureRoom}"><button type="button" id="update">수정</button></a></td>	
				
			</tr>
		</c:forEach>
	</table>
	
	<a href="./lectureRoomAdd"><button type="button" id="add">작성</button></a>
	
	<c:if test="${pagination.pre}">
		<a href="./lectureRoomList?page=${pagination.startNum-1}">이전</a>
	</c:if>
	<c:forEach begin="${pagination.startNum}" end="${pagination.lastNum}" var="i">
   	 	<a href="./lectureRoomList?page=${i}">${i}</a>
   	 </c:forEach>		
   	<c:if test="${pagination.next}">
		<a href="./lectureRoomList?page=${pagination.lastNum+1}">다음</a>
	</c:if> 
</body>
</html>