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
<h1 class="fw-bolder">강의 등록</h1>
	<main class="flex-shrink-0">
			<section class="bg-light py-5">
                <div class="container px-5 my-5">
	                <form action="./add" method="post">
	               		 <p class="col-6">강의 이름</p>
						<input type="text" name="lectureName" class="form-control" id="lectureName" placeholder="강의 이름 입력"><br>
	                	
						
	                    <button type="submit" name="buttonType" value="1">임시등록</button>
	                    <button type="submit" name="buttonType" value="0">등록</button>
	                    <button><a href="./list" style="color: black;">뒤로가기</a></button>
	                 </form>
                </div>
             </section>
             
            
             
      </main>

</body>
</html>