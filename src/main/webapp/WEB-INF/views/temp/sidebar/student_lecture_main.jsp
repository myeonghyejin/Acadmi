<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/sidebar.css">

<div class="sidebar-dropdown">

	<!-- Menu -->
		<h3 style="margin-top: 20px; text-align: center;"><a href="/student/lectureMain?lectureNum=${lecture.lectureNum}">${lecture.lectureName}</a></h3>
	
	<!-- Submenu_1 -->
	<button onclick="myFunction_1()" class="sidebar-menu">
		<i class="fas fa-angle-down fa-2xs"></i>&nbsp
		강의 정보
	</button>
		<div id="submenu_1" class="sidebar-dropdown-content">
			<a href="">강의계획서 열람 </a>
			<a href="">참여자 목록</a>
	</div>
	
	<!-- Submenu_2 -->
	<button onclick="myFunction_2()" class="sidebar-menu">
		<i class="fas fa-angle-down fa-2xs"></i>&nbsp
		과목 게시판
	</button>
	<div id="submenu_2" class="sidebar-dropdown-content">
		<a href="#">공지사항 게시글</a>
		<a href="#">질의응답 게시글</a>
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