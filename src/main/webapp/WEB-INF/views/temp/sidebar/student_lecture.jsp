<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<link rel="stylesheet" href="/css/sidebar.css">

<div class="sidebar-dropdown">

	<!-- Menu -->
	<h4>수강</h4>
	
	<!-- 더 많은 개수의 submenu가 필요할 경우
	필요한 수 만큼 복사하고 div 태그의 아이디 'submenu_숫자' 형식으로 수정하여 사용하면 됨 -->
	<!-- Submenu_1 -->
	<button onclick="myFunction_1()" class="sidebar-menu">
		<i class="fas fa-angle-down fa-2xs"></i>&nbsp
		수강 신청
	</button>
	<div id="submenu_1" class="sidebar-dropdown-content">
		<a href="/student/lecture/all_lecture">수강 신청 & 장바구니</a>
	</div>
	
	<!-- Submenu_2 -->
	<button onclick="myFunction_2()" class="sidebar-menu">
		<i class="fas fa-angle-down fa-2xs"></i>&nbsp
		내역 조회
	</button>
	<div id="submenu_2" class="sidebar-dropdown-content">
		<a href="/student/lecture/my_lecture">내 수강 신청</a>
		<a href="/student/lecture/my_favorite">내 장바구니</a>
	</div>
	
	<!-- Submenu_3 -->
	<button onclick="myFunction_3()" class="sidebar-menu">
		<i class="fas fa-angle-down fa-2xs"></i>&nbsp
		시간표
	</button>
	<div id="submenu_3" class="sidebar-dropdown-content">
		<a href="/student/lecture/timetable">시간표 조회</a>
	</div>
	
</div>

<script type="text/javascript">
	/* 더 많은 개수의 submenu가 필요할 경우
	필요한 숫자 만큼 'myFunction_숫자()' 함수를 복사하고 아이디 수정하여 사용하면 됨 */
	function myFunction_1() {
	    document.getElementById("submenu_1").classList.toggle("show");
	}
	function myFunction_2() {
	    document.getElementById("submenu_2").classList.toggle("show");
	}
	function myFunction_3() {
	    document.getElementById("submenu_3").classList.toggle("show");
	}
	
	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
	  if (!event.target.matches('.menu')) {
	
	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
</script>