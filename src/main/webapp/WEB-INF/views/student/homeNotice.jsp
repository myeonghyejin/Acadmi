<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="mt-5 mb-3 mx-5">
		<!-- homeLecture Head start -->
        <div class="row mt-4">
			<div class="col-12">
				<div class="card card-info card-outline" style="vertical-align:middle;">
				<div class="row">
					<div class="col-9 my-1 mr-4" style=" float: left: ;">
					<h4 class="my-2 mx-4" style="color:#17a2b8;margin-bottom:0px;">공지사항</h4>
					</div>
					<div class="col-2 mx-4" style="text-align:right; float: right;">
						<a class="btn btn-info my-2 mx-2" href="./notice/list">더보기</a>
					</div>
					</div>
					<hr class="mx-3" style="margin:0px">
            		<c:forEach items="${list}" var="notice">
						<a class="title ml-1" href="/notice/detail?num=${notice.num}" style="color:black;">
		            		<div class="card-header mx-3 row" style="padding-left:0px">
		            			<div class="col-9">
		            			<i class="fa-solid fa-circle fa-2xs" style="color: #17a2b8;"></i>
		            			${notice.title}
		            			</div>
		            			<div class="col-3" style="text-align:right;">
		            			${notice.regDate}
		            			</div>
		            		</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
    