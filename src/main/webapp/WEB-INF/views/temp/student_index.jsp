<%@page import="com.acadmi.department.DepartmentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-9 mb-4">
		<!-- 진행중인 강의 목록 -->
		<div id="homeLecture">
		
		</div>
		
		<!-- 공지사항 목록 -->
		<div id="homeStudentNotice">
		
		</div>
		<!-- 강의 공지사항 목록 -->
		<div id="homeLectureNotice">
		
		</div>
	</div>
	<div class="col-3 mt-3 mb-4" style="border-left: 1px solid #17a2b8;">
		<!-- 중요 공지사항 목록 -->
		<div id="homeImportant">
		
		</div>
	</div>
</div>

<script type="text/javascript" src="/js/student/home.js">
	
</script>
