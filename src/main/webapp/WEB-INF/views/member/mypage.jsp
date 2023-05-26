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
                                    <div class="fw-bolder mb-1"><%-- ${memberVO.userName} --%>이름</div>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2"><%-- ${boardVO.regDate} --%>가입날짜</div>
                                </header>
                            </article>
                        </div>
                    </div>
                             <div class="d-grid">
	                         	<button class="btn btn-primary float-right" id="submitButton" type="submit">수정</button>
	                         </div>
                </div>
            </section>

     	<!-- Footer 적용 -->
			<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
</body>
</html>