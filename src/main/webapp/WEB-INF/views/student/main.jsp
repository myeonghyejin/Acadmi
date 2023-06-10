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
	
	.lectureNow {
		width : 50%;
	}
	
	.main {
		margin-top : auto;
		
	}
	
	.card1 {
		width : 50%;
		
	}

	
	.list {
	  display: flex;
	  align-items: center;
 	 justify-content: space-between; 
	
	}
	
	.list-item {
	  flex-grow: 1;
	  font-size : 20px;
	} 
	
	
	.list-item2 {
		display: inline-block;
		float : right;
		font-size : 20px;
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
								<div class="card lectureNow">
									<div class="row">
										<c:forEach items="${list}" var="noticeVO">
											<ul>
												<li>${noticeVO.num }</li>
											</ul>
										</c:forEach>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>	
			<div class="container-fluid">
				<div class="row">
		          <div class="col-12 main">
		            <!-- Custom Tabs -->
		            <div class="card card1">
		              <div class="card-header d-flex p-0 card2">
		                <ul class="nav nav-pills ml-auto p-2">
		                  <li class="nav-item"><a style="font-size : 32px; font-weight : bold;"  class="nav-link active" href="#tab_1" data-toggle="tab">공지사항</a></li>
		                  <li class="nav-item"><a style="font-size : 32px; font-weight : bold;" class="nav-link" href="#tab_2" data-toggle="tab">강의 공지사항</a></li>
		             
		                </ul>
		              </div><!-- /.card-header -->
		              <div class="card-body">
		                <div class="tab-content">
		                  <div class="tab-pane active" id="tab_1">
		                  		<c:forEach items="${list}" var="noticeVO">
		                  			<ul class="list">
		                  				<li class="list-item">${noticeVO.title}</li>
		                  				<li class="list-item2">${noticeVO.regDate}</li>
		                  			</ul>
		                  		</c:forEach>
		                  </div>
		                  <!-- /.tab-pane -->
		                  <div class="tab-pane" id="tab_2">
		                   	
		                  </div>
		                  <!-- /.tab-pane -->
		                </div>
		                <!-- /.tab-content -->
		              </div><!-- /.card-body -->
		            </div>
		            <!-- ./card -->
		          </div>
		          <!-- /.col -->
       			</div>
        <!-- /.row -->
		  </div>
		</div>
	</div>	

<script type="text/javascript">

	
</script>
