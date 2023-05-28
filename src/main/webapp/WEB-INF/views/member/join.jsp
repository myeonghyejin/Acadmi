<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
				<div class="col">
					 <section class="py-5">
                 <div class="container px-5">
                    <!-- Contact form-->
                  <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">회원가입</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                 <form:form id="contactForm" modelAttribute="memberVO" action="./join" method="post" data-sb-form-api-token="API_TOKEN">
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <form:label path="username">아이디</form:label>
                                        <form:input path="username" id="username" cssClass="form-control"/>
                                        <form:errors path="username"></form:errors>
                                    </div>
                                    <!-- pw address input-->
                                    <div class="form-floating mb-3">
                                        <form:label path="password">비밀번호</form:label>
                                        <form:password path="password" id="password" cssClass="form-control"/>
                                        <form:errors path="password"></form:errors>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <form:label path="email">이메일</form:label>
                                        <form:input path="email" id="email" cssClass="form-control"/>
                                        <form:errors path="email"></form:errors>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <label for="category">직업(학생 , 교수, 행정)</label>
                                        <input class="form-control" id="category" name="category"  placeholder="Enter your Birth..." data-sb-validations="required" />
                                        <form:errors path="category"></form:errors>
                                        
                                        <%-- <form:input path="birth" id="birth" cssClass="form-control"/>
                                        <label for="birth">Birth</label>
                                        <form:errors path="birth"></form:errors> --%>
                                    </div>
                                    <div class="d-grid"><button class="btn btn-primary float-right" id="submitButton" type="submit">가입</button></div>
                                </form:form>
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