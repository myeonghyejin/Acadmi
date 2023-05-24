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

	 <section class="bg-light py-5">
     	<div class="container px-5 my-5">
		    <div class="text-center mb-5">
		     	<h1 class="fw-bolder">List</h1>
		     	<p class="lead fw-normal text-muted mb-0">With our no hassle pricing plans</p>
		    </div>
            
		    <div class="row gx-5">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${list}" var="boardVO">
							<tr>
								<td>${boardVO.num}</td>
								<td>${boardVO.title}</td>
								<td>${boardVO.writer}</td>
								<td>${boardVO.regDate}</td>
								<td>${boardVO.modifyDate}</td>
								<td>${boardVO.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">				  
						<c:if test="${pager.pre}">
							<li class="page-item">
								<a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
			    		</c:if>
								    
			     		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			            	<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			            </c:forEach>
			            
			            <c:if test="${pager.next}">
							<li class="page-item">
								<a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
								  <span aria-hidden="true">&raquo;</span>
				 				</a>
			 				</li>
			 			</c:if>
			  		</ul>
				</nav>
				
				<div>
			    	<form action="./list">
				        <select name="kind">
				        	<option value="title">Title</option>
				        	<option value="contents">Contents</option>
				        	<option value="writer">Writer</option>
				        </select>     		
				        <input type="text" name="search">
				        <button type="submit">Search</button>
			        </form>
			    </div>     	
		 	</div>
   		</div>
   </section>
	
</body>
</html>