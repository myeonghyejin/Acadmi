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
            <form class="row g-3" action="./studentUpdate" method="post" enctype="multipart/form-data">
            	<sec:authentication property="Principal" var="user"/>
				<input type="hidden" name="username" value="${useer.username}">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                    <c:set value="${departmentVO.deptName}" var="studentDeptName"></c:set>
                    <c:forEach items="${departmentVO.studentVOs}" var="studentVO">
     	 				<c:set var="studentGrade" value="${studentVO.grade}"></c:set>
                    	<c:set var="studentName" value="${studentVO.name}"></c:set>
     	 				<c:set var="studentPhone" value="${studentVO.phone}"></c:set>
     	 				<c:set var="studentBirth" value="${studentVO.birth}"></c:set>
     	 				<c:set var="studentAddress" value="${studentVO.address}"></c:set>
     	 				<c:set var="studentEmail" value="${studentVO.email}"></c:set>
     	 					<%-- <c:forEach items="${studentVO}" var="memberFilesVOs">
     	 						<c:set value="${memberFilesVOs.fileName}" var="memberFileName"></c:set> --%>
     	 						
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid " src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927" alt="..." />
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
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">학과이름 : <c:out value="${studentDeptName}"></c:out></h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">학년 : <c:out value="${studentGrade}"></c:out>학년</h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">이름 : <c:out value="${studentName}"></c:out></h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">전화번호 : <c:out value="${studentPhone}"></c:out></h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">생년월일 : <c:out value="${studentBirth}"></c:out></h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">이메일 : <c:out value="${studentEmail}"></c:out></h4>
		                            <h4 class="fw-bolder mb-1 mt-5 mx-5">주소 : <c:out value="${studentAddress}"></c:out></h4>
                                </header>
                            </article>
                        </div>
                        </c:forEach>
                    <%--     </c:forEach> --%>
                    </div>
              
                      <div class="d-grid">
						<button class="btn btn-primary float-right" id="submitButton" type="submit">수정</button>
	                  </div>
	                  
	           </div>
	           </form>
	     	</section>
     	

     	<!-- Footer 적용 -->
			<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
	</div>
<!-- ./wrapper -->
</body>
</html>