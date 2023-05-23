<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/sidebar.css">

<div class="dropdown">
	<h4>수강</h4>
	<button onclick="myFunction()" class="menu">
		수강 정보&nbsp
		<i class="fas fa-angle-down fa-2xs"></i>
	</button>
	<div id="submenu" class="dropdown-content">
		<a href="#">수강 신청</a>
		<a href="#">수강 신청 내역</a>
		<a href="#">장바구니</a>
		<a href="#">내 장바구니</a>
		<a href="#">시간표 조회</a>
	</div>
</div>

<script type="text/javascript">
	/* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */
	function myFunction() {
	    document.getElementById("submenu").classList.toggle("show");
	}
	
	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
	  if (!event.target.matches('.menu')) {
	
	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      // 다른 메뉴 클릭 시 저절로 닫힘
	      /* if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      } */
	    }
	  }
	}
</script>