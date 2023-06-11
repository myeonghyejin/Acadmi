<%@page import="com.acadmi.department.DepartmentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	.lecture {
		margin : 40px 0 0 40px;
		color : #17a2b8;
	}
	
	.lectureNow {
		width : 60%;
	}
	
	

	.main2 {
		margin-top : auto;
		
	}
	
	.card1 {
		width : 60%;
		margin : 180px 0 0 0;
		
		
	}
	
	
	.list {
	  display: flex;
	  align-items: center;
 	  justify-content: space-between; 
 	 margin : 10px;
	
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
	
	.btn {
		margin : 30px 0 0 300px;
		width : 100px;
		height : 40px;
	}
	
	.title {
		height : 110px;
	}
	
	.nav-item {
		margin : 15px 0 0 10px;
	} 
</style>
	
<div class="wrapper main">
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<!-- Contents -->
					<div class="col">
						<div class="wrapper lecture">
							<h2 style="font-weight : bold;">강의 전체보기</h2>
								<div class="card lectureNow">
									<div class="row">
										<div class="col-12 main2">
								            <!-- Custom Tabs -->
								           
								            	 <div class="card-body">
									                <div class="tab-content">
									                  <div class="tab-pane active" id="tab1">
									                  		<c:forEach items="${currentLecture}" var="lectureVO">
									                  			<ul class="list">
									                  				<li class="list-item">${lectureVO.lectureName}</li>
									                  				<li class="list-item2">${lectureVO.professorVO.name}</li>
									                  			</ul>
									                  		</c:forEach>
									                  </div>
									                  <!-- /.tab-pane -->
									                  <div class="tab-pane" id="tab2">
									                   	
									                  </div>
									                  <!-- /.tab-pane -->
									                </div>
									                <!-- /.tab-content -->
									              </div><!-- /.card-body -->
								           
								            <!-- ./card -->
		          						</div>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>	
			<div class="container-fluid lecture">
				<div class="row">
		          <div class="col-12 main2">
		            <!-- Custom Tabs -->
		            <div class="card card1">
		              <div class="card-header d-flex p-0">
		                <ul class="nav nav-pills ml-auto p-2">
		                  <li class="nav-item"><a style="font-size : 32px; font-weight : bold;"  class="nav-link active" href="#tab_1" data-toggle="tab">공지사항</a></li>
		                  <li class="nav-item"><a style="font-size : 32px; font-weight : bold;" class="nav-link" href="#tab_2" data-toggle="tab">강의 공지사항</a></li>
		                   <button type="button" class="btn btn-info btn">더보기</button>
		                </ul>
		               
		              </div><!-- /.card-header -->
		             	 <div class="card-body">
			                <div class="tab-content">
			                  <div class="tab-pane active" id="tab_1">
			                    A wonderful serenity has taken possession of my entire soul,
			                    like these sweet mornings of spring which I enjoy with my whole heart.
			                    I am alone, and feel the charm of existence in this spot,
			                    which was created for the bliss of souls like mine. I am so happy,
			                    my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
			                    that I neglect my talents. I should be incapable of drawing a single stroke
			                    at the present moment; and yet I feel that I never was a greater artist than now.
			                  </div>
			                  <!-- /.tab-pane -->
			                  <div class="tab-pane" id="tab_2">
			                    The European languages are members of the same family. Their separate existence is a myth.
			                    For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
			                    in their grammar, their pronunciation and their most common words. Everyone realizes why a
			                    new common language would be desirable: one could refuse to pay expensive translators. To
			                    achieve this, it would be necessary to have uniform grammar, pronunciation and more common
			                    words. If several languages coalesce, the grammar of the resulting language is more simple
			                    and regular than that of the individual languages.
			                  </div>
			                  <!-- /.tab-pane -->
			                  <div class="tab-pane" id="tab_3">
			                    Lorem Ipsum is simply dummy text of the printing and typesetting industry.
			                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
			                    when an unknown printer took a galley of type and scrambled it to make a type specimen book.
			                    It has survived not only five centuries, but also the leap into electronic typesetting,
			                    remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
			                    sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
			                    like Aldus PageMaker including versions of Lorem Ipsum.
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
