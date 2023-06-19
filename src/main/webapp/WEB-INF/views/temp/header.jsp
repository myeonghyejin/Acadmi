<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<c:import url="/temp/administrator_header.jsp"></c:import>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
	<c:import url="/temp/administrator_header.jsp"></c:import>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_PROFESSOR')">
	<c:import url="/temp/professor_header.jsp"></c:import>
</sec:authorize>
	
<sec:authorize access="hasRole('ROLE_STUDENT')">
	<c:import url="/temp/student_header.jsp"></c:import>
</sec:authorize>