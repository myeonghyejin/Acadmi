<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
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
			
        		 <!-- Page Content-->
            <section class="py-5">
            
            	<%-- <c:forEach items="${list}" var="memberVO">
     	 			<c:forEach items="${memberVO.administratorVO}" var="administratorVO">
     	 				<c:set var="studentName" value="${administratorVO.name}"></c:set>
     	 				<c:forEach items="${departmentVO.studentVOs}" var="studentVO">
     	 					<c:set var="studentName" value="${studentVO.name}"></c:set>
     	 					<c:set var="studentUsername" value="${studentVO.username}"></c:set>
     	 					<c:set var="studentPhone" value="${studentVO.phone}"></c:set>
     	 					<c:set var="studentGrade" value="${studentVO.grade}"></c:set>
     	 					<c:set var="studentStatus" value="${studentVO.status}"></c:set> --%>
            
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid " src="/images/iu.jpg" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                            
                                <!-- Post header-->
                                <header class="mb-4">
		                            <!-- Post title-->
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">학과번호 : <c:out value="${memberVO.deptNum}"></c:out></h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">학년 : <c:out value="${memberVO.grade}"></c:out></h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">이름 : <c:out value="${memberVO.name}"></c:out></h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">이름 : <c:out value="${memberVO.name}"></c:out></h4>
                                </header>
                            </article>
                        </div>
                    </div>
               		</div>
               		<%-- </c:forEach>
     	 		</c:forEach>
     		</c:forEach> --%>
                      <div class="d-grid">
						<button class="btn btn-primary float-right" id="submitButton" type="submit">수정</button>
	                  </div>
     	</section>

     	<!-- Footer 적용 -->
			<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
	</div>
<!-- ./wrapper -->
</body>
</html>