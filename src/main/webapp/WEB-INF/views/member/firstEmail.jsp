<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<body>
	<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
       
      	<!-- Header 적용 -->
			<c:import url="../temp/header.jsp"></c:import>
		<!-- Header 끝 --> 
			
    	<section class="py-5">
            <div class="container px-5">
                <!-- Contact form-->
                <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                    <div class="text-center mb-5">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                        <h1 class="fw-bolder">최초 이메일 인증</h1>
                        <p>처음 로그인이시면 최초 이메일 인증을 완료해주세요</p>
                    </div>
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            
                            <form:form id="contactForm" data-sb-form-api-token="API_TOKEN" modelAttribute="memberVO" action="./firstEmail" method="post">
                                <!-- email input-->
                                <div class="form-floating mb-3">
                                    <form:label path="email">이메일</form:label>
                                	<form:input path="email" cssClass="form-control" id="email" placeholder="이메일을 입력하세요"/>
                                    <form:errors path="email" cssStyle="color:red;"></form:errors>
                                </div>
                               <!-- Submit Button-->
                                <div class="d-grid">
                                	<button class="btn btn-primary float-right" id="submitButton" type="submit">다음</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    	<!-- Footer 적용 -->
			<c:import url="../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->
		</div>>
</body>
</html>