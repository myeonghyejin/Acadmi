<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../temp/style.jsp"></c:import>
	<!-- CSS/favicon 끝 -->
	
	<script nonce="86cd0369-3283-47b2-80ac-0f2454d8cfac">(function(w,d){!function(a,b,c,d){a[c]=a[c]||{};a[c].executed=[];a.zaraz={deferred:[],listeners:[]};a.zaraz.q=[];a.zaraz._f=function(e){return function(){var f=Array.prototype.slice.call(arguments);a.zaraz.q.push({m:e,a:f})}};for(const g of["track","set","debug"])a.zaraz[g]=a.zaraz._f(g);a.zaraz.init=()=>{var h=b.getElementsByTagName(d)[0],i=b.createElement(d),j=b.getElementsByTagName("title")[0];j&&(a[c].t=b.getElementsByTagName("title")[0].text);a[c].x=Math.random();a[c].w=a.screen.width;a[c].h=a.screen.height;a[c].j=a.innerHeight;a[c].e=a.innerWidth;a[c].l=a.location.href;a[c].r=b.referrer;a[c].k=a.screen.colorDepth;a[c].n=b.characterSet;a[c].o=(new Date).getTimezoneOffset();if(a.dataLayer)for(const n of Object.entries(Object.entries(dataLayer).reduce(((o,p)=>({...o[1],...p[1]})),{})))zaraz.set(n[0],n[1],{scope:"page"});a[c].q=[];for(;a.zaraz.q.length;){const q=a.zaraz.q.shift();a[c].q.push(q)}i.defer=!0;for(const r of[localStorage,sessionStorage])Object.keys(r||{}).filter((t=>t.startsWith("_zaraz_"))).forEach((s=>{try{a[c]["z_"+s.slice(7)]=JSON.parse(r.getItem(s))}catch{a[c]["z_"+s.slice(7)]=r.getItem(s)}}));i.referrerPolicy="origin";i.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a[c])));h.parentNode.insertBefore(i,h)};["complete","interactive"].includes(b.readyState)?zaraz.init():a.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script>
</head>

				<body class="hold-transition sidebar-mini layout-fixed">
					<div class="wrapper">
						<!-- Header 적용 -->
						<c:import url="../temp/header.jsp"></c:import>
						<!-- Header 끝 -->

						<div class="content-wrapper">

							<section class="content-header">
								<div class="container-fluid">
									<div class="row mb-2">
										<div class="col-sm-6 ml-5">
											<br>
											<br>
											<br>
										</div>
									</div>
								</div>
							</section>

							<section class="content">
								<div class="container-fluid">
									<div class="row justify-content-center">
										<div class="col-md-6">
											<div class="card card-info card-outline ml-5">
												<div class="card-body box-profile">
													<form action="./administratorUpdate" method="post" enctype="multipart/form-data">
														<sec:authentication property="Principal" var="user"/>
															<input type="hidden" name="username" value="${user.username}">
																<div class="text-center">
																	<c:forEach items="${departmentVO.administratorVOs}" var="administratorVO">
				     	 												<c:choose>
																		    <c:when test="${empty administratorVO.memberFilesVO.fileName}">
																		        <img class="profile-user-img img-fluid img-circle"
																		             src="/images/profile.jpg"
																		             alt="User profile picture">
																		    </c:when>
																		    <c:otherwise>	
																				<img class="img-fluid img-size"
																				     src="/file/member/${administratorVO.memberFilesVO.fileName}"
																				     alt="User profile picture">
																		    </c:otherwise>
																		</c:choose>
																	</c:forEach>
																<div class="col-md-12 mt-3">
											                        <div id="fileList">
											                           <button class="col-md-3  btn btn-info" id="fileAdd" type="button">파일추가</button>
											                        </div> 
											                     </div> 
															</div>
													
													<c:forEach items="${departmentVO.administratorVOs}" var="administratorVO">
														<c:set var="administratorName" value="${administratorVO.name}"></c:set>
															<sec:authentication property="Principal" var="user"/>
																	<h3 class="profile-username text-center"><c:out value="${administratorName}"></c:out>(${user.username})</h3>
													</c:forEach>
													
													<c:forEach items="${departmentVO.administratorVOs}" var="administratorVO">
														<c:set var="administratorPhone" value="${administratorVO.phone}"></c:set>
														<c:set var="administratorBirth" value="${administratorVO.birth}"></c:set>
														<c:set var="administratorAddress" value="${administratorVO.address}"></c:set>
														<%-- <c:set var="administratorAddressDetail" value="${administratorVO.addressDetail}"></c:set> --%>
														<c:set var="administratorEmail" value="${administratorVO.email}"></c:set>
															

														<div class="card-body">
															<strong><i class="fas fa-book mr-1"></i> 학과, 학년</strong>
															<p class="text-muted">
																<c:set value="${departmentVO.deptName}" var="administratorDeptName"></c:set>
																	학과 이름 : &ensp;<c:out value="${administratorDeptName}"></c:out><br>
															</p>
																<hr>
																	<strong><i class="fa-solid fa-cake-candles mr-1"></i> 생년월일</strong>
																			<p class="text-muted"><c:out value="${administratorBirth}"></c:out></p>
																<hr>
																	<strong><i class="fa-solid fa-phone mr-1"></i> 전화번호</strong>
																		<p class="text-muted"><input value="${administratorVO.phone}" type="text" id="phone" name="phone"></p>
																<hr>
																	<strong><i class="fas fa-envelope mr-1"></i> 이메일</strong>
																		<p class="text-muted"><input value="${administratorVO.email}" type="email" id="email" name="email"></p>
																<hr>
																	<strong><i class="fas fa-map-marker-alt mr-1"></i> 주소</strong>
																		<p class="text-muted"><input value="${administratorVO.address}" type="text" id="address" name="address"></p>
																		<%-- <strong><i class="mr-1"></i> 상세 주소 입력</strong>
																		<p class="text-muted"><input value="${administratorVO.addressDetail}" type="text" id="addressDetail" name="addressDetail"></p> --%>
															
														</div>
													</c:forEach>
														<button class="btn btn-info float-right" id="submitButton" type="submit">수정</button>
													</form>
														<sec:authentication property="Principal" var="user"/>
	                 										<a href="/member/administratorPage?username=${user.username}" class="btn btn-danger float-right mx-3">취소</a>	
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>

			<!-- Footer 적용 -->
				<c:import url="../temp/footer.jsp"></c:import>
			<!-- Footer 끝 -->

<script type="text/javascript" src="/js/filemanager.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
               
            }
        }).open();
    });
}
</script>

</body>
</html>