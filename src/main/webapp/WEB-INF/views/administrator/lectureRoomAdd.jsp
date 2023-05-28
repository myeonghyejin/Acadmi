<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강의실 등록</h1>
	
	<form action="./lectureRoomAdd" method="post">
		강의실 건물 
		<select name="lectureBuilding">
			<option>전체</option>
			<option value="정보관">정보관</option>
			<option value="예대관">예대관</option>
			<option value="인문관">인문관</option>
			<option value="자연과학관">자연과학관</option>
			<option value="공과대학관">공과대학관</option>
		</select>
		깅의실 호수 <input type="text" name="lectureRoom">
		최대수용인원 <input type="text" name="personel">
		
		<input type="radio" name="status" value="1" checked >사용가능
		<input type="radio" name="status" value="0"> 사용불가
		
		<button type="submit">등록</button>
	</form>
</body>
</html>