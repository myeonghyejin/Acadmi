<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Acadmi!</title>
	<!-- CSS/favicon 적용 -->
	<c:import url="../../temp/style.jsp"></c:import>
	<link rel="stylesheet" href="/css/timetable.css">
	<!-- CSS/favicon 끝 -->
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Header 적용 -->
		<c:import url="../../temp/header.jsp"></c:import>
		<!-- Header 끝 -->

		<!-- Main Contents -->
		<div class="container-fluid">
			<div class="row">
				<!-- 2레벨 Sidebar 적용 -->
				<div class="content-wrapper">
					<c:import url="../../temp/sidebar/student_lecture.jsp"></c:import>
				</div>
				<!-- 2레벨 Sidebar 끝 -->
				
				<!-- Contents -->
				<div class="col">

					<!-- Content Header (Page header) -->
					<section class="content-header">
						<div class="container-fluid">
							<div class="row mb-2">
								<div class="col-sm-6">
									<h1>시간표 조회</h1>
								</div>
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right">
										<li class="breadcrumb-item"><a href="#">Home</a></li>
										<li class="breadcrumb-item active">시간표 조회</li>
									</ol>
								</div>
							</div>
						</div><!-- /.container-fluid -->
					</section>

					<!-- Content -->
					<div class="container-fluid">
						<div class="card card-primary">
							<div class="card-body p-0">

	<!-- time-table -->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="table-responsive">
					<table class="timetable table table-striped ">
						<thead>
							<tr class="text-center">
								<th scope="col"></th>
								<th scope="col">Monday</th>
								<th scope="col">Tuesday</th>
								<th scope="col">Wednesday</th>
								<th scope="col">Thursday</th>
								<th scope="col">Friday</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">09:00 Am - 10:00 Am</th>
								<td></td>
								<td></td>
								<td class="timetable-workout">30 MINUTES
									<br> 12:35 pm - 01:05 pm</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row">10:00 Am - 11:00 Am</th>
                                <td></td>
                                <td></td>
                                <td class="timetable-workout">Classes Name</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row">11:00 Am - 12:00 Pm</th>
                                <td class="timetable-workout">30 MINUTES
                                    <br> 12:35 pm - 01:05 pm</td>
                                <td class="timetable-workout">30 MINUTES
                                    <br> 12:35 pm - 01:05 pm</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row">12:00 Pm - 13:00 Pm</th>
                                <td class="timetable-workout">Classes Name</td>
                                <td class="timetable-workout">Classes Name</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row">13:00 Pm - 14:00 Pm</th>
                                <td></td>
                                <td class="timetable-workout">30 MINUTES
                                    <br> 12:35 pm - 01:05 pm</td>
                                <td></td>
                                <td class="timetable-workout">30 MINUTES
                                    <br> 12:35 pm - 01:05 pm</td>
                                <td class="timetable-workout">30 MINUTES
                                    <br> 12:35 pm - 01:05 pm</td>
                            </tr>
                            <tr>
                                <th scope="row">14:00 Pm - 15:00 Pm</th>
                                <td></td>
                                <td class="timetable-workout">Classes Name</td>
                                <td></td>
                                <td class="timetable-workout">Classes Name</td>
                                <td class="timetable-workout">Classes Name</td>
                            </tr>
                            <tr>
                                <th scope="row">15:00 Pm - 16:00 Pm</th>
                                <td class="timetable-workout">30 MINUTES
                                    <br> 12:35 pm - 01:05 pm</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row">16:00 Pm - 17:00 Pm</th>
                                <td class="timetable-workout">Classes Name</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row">17:00 Pm - 18:00 Pm</th>
                                <td class="timetable-workout">30 MINUTES
                                    <br> 12:35 pm - 01:05 pm</td>
                                <td></td>
                                <td></td>
                                <td class="timetable-workout">30 MINUTES
                                    <br> 12:35 pm - 01:05 pm</td>
                                <td></td>
                            </tr>
						</tbody>
					</table>
				</div>
				<!-- timetable -->
			</div>
		</div>
	</div>
	<!-- /.time-table -->

							</div>
							<!-- /.card-body -->
						</div>
					<!-- /.card -->
					</div>
					<!-- the events -->
					<div id="external-events"></div>
				<!-- /.content -->
				</div>
			</div>
		</div>

		<!-- Footer 적용 -->
		<c:import url="../../temp/footer.jsp"></c:import>
		<!-- Footer 끝 -->

	</div>
<!-- ./wrapper -->


<script>
</script>
</body>
</html>