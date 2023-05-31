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
<h1 class="fw-bolder">강의 수정</h1>
	<main class="flex-shrink-0">
			<section class="bg-light py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 my-3">
							<p class="col-6">강의 이름</p>
							<input type="text" name="lectureName" value="${update.lectureName}" 
                            class="form-control col-6" id="lectureName" placeholder="강의 이름 입력"><br>
                    </div>
                    <div class="input-category col-6">
	                    <select class="form-select" aria-label="Default select example"
	                    name="category" id="category">
		                    <option name="category" id="category">학과를 선택해주세요</option>
		                    <option for="category" ${update.category eq 1?'selected':''} value="1">컴퓨터공학과</option>
		            	</select>
                    </div>
                    
                </div>
             </section>
             
            
             
      </main>

</body>
</html>