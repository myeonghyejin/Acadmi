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
        
            <!-- Main Contents -->
		<div class="container-fluid">
			<div class="row">
	<%-- 			<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper">
					<c:import url="./temp/sidebar/std_lecture.jsp"></c:import>
				</div>
				<!-- 2레벨 Sidebar 끝 --> --%>
				
				<!-- Contents -->
				<div class="col">
					 <section class="py-5">
                 <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">로그인</h1>
                            <p>저희 Acadmi에 오신걸 환영합니다</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                
                                <form id="contactForm" action="./login" method="post" data-sb-form-api-token="API_TOKEN">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <label for="username">아이디</label>
                                        <input class="form-control" id="username" value="${cookie.remember.value}" name="username"  placeholder="아이디를 입력하세요"/>
                                    </div>
                                    <!-- pw address input-->
                                    <div class="form-floating mb-3">
                                        <label for="password">비밀번호</label>
                                        <input class="form-control" id="password" name="password" type="password" placeholder="비밀번호를 입력하세요"/>
                                    </div>
                                    
                                    <div>
                                    	<a href="./findPw">비밀번호 찾기</a><br>
                                    	<a href="./join">회원가입</a>
                                    </div>
                                    
	                                <c:if test="${not empty param.errorMessage}">
	                                	<h3>${param.errorMessage}</h3>
	                                </c:if>
	                                <div class="d-grid">
	                                	<button class="btn btn-primary float-right" id="submitButton" type="submit">로그인</button>
	                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
				</div>
			</div>
		</div>
       
		<!-- Footer 적용 -->
			<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->
</body>
</html>