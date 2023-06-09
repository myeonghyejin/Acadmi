<%@page import="com.acadmi.department.DepartmentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	.lecture {
		margin : 40px;
		color : #17a2b8;
	}
	
	.active {
		
	}
	
</style>


	<div class="wrapper">
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- Contents -->
					<div class="col">
						<div class="wrapper lecture">
							<h2 style="font-weight : bold;">강의 전체보기</h2>
							<div class="card" >
								<div class="row">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
		          <div class="col-12">
		            <!-- Custom Tabs -->
		            <div class="card">
		              <div class="card-header d-flex p-0">
		                <ul class="nav nav-pills ml-auto p-2">
		                  <li class="nav-item"><a  style="font-size : 32px; font-weight : bold; color : #17a2b8;" class="nav-link active" href="#tab_1" data-toggle="tab">공지사항</a></li>
		                  <li class="nav-item"><a  style="font-size : 32px; font-weight : bold; color : #17a2b8;" class="nav-link" href="#tab_2" data-toggle="tab">강의 공지사항</a></li>
		                
		                 
		                </ul>
		              </div><!-- /.card-header -->
					</div>
				 </div>
			  </div>	
		  </div>
		</div>
	</div>	
	
