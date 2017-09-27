<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Cafe. CiCHA</title>
<!-- Bootstrap core CSS-->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/bootstrap/css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<jsp:include page="admin_header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="col-lg-12">
			<div class="row margin-bottom">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong><span style="color: #5c7c97"><i
									class="fa fa-desktop"></i></span>Cafe. CiCHA</strong>
						</div>
						<div class="info_area">
							<dl>
								<dt>
									<i class="fa fa-user-circle-o fa-4x" aria-hidden="true"></i>
								</dt>
								<dd>
									<span style="margin-right: 10px;">[Cafe. CiCHA]</span>관리자님<a
										href=""><i class="fa fa-pencil-square-o vertical-bottom"></i></a>
								</dd>
							</dl>
						</div>
						<div class="panel-info-footer text-center"
							style="font-size: 13px;">
							<a href="javascript:void(0);"
								onclick="javascript:window.open('/newsdesk/msg/message.html', 'MSG_POP', 'width=650, height=600, resizable=no, scrollbars=yes')">쪽지(0)
								<i class="fa fa-comments-o"></i>
							</a>&nbsp;&nbsp;&nbsp; <a href="">메모관리 &nbsp;<i
								class="fa fa-file-o"></i></a>&nbsp;&nbsp;&nbsp; <a
								href="/member/logout.php">로그아웃 <i class="fa fa-sign-out"></i></a>
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong> <span style="color: #5c7c97"> <i
									class="fa fa-volume-up"></i>
							</span> 공지사항
							</strong> <a class="plus" href="#"><i class="fa fa-plus"></i></a>
						</div>
						<div class="visit_area">
							<ul>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[이벤트 안내]9/19부터 신메뉴 출시 예정입니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[New매장 오픈] 종로 1가점을 오픈하였습니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[이벤트 안내]9/19부터 신메뉴 출시 예정입니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[New매장 오픈] 종로 1가점을 오픈하였습니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[이벤트 안내]9/19부터 신메뉴 출시 예정입니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[New매장 오픈] 종로 1가점을 오픈하였습니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[이벤트 안내]9/19부터 신메뉴 출시 예정입니다.</a> <span
									class="date_visit">2017.09.20</span></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-4">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong><span style="color: #5c7c97"><i
									class="fa fa-user"></i></span> 회원 </strong>
						</div>
						<div class="admin_area">
							<dl>
								<dt>
									<i class="fa fa-user-circle-o fa-4x" aria-hidden="true"></i></i><br>직영점<br>
									<span>5지점</span>
								</dt>
								<dt>
									<i class="fa fa-user-o fa-4x" aria-hidden="true"></i><br>가맹점<br>
									<span>3지점</span>
								</dt>
							</dl>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="col-lg-12">
			<div class="row margin-bottom">
				<div class="col-lg-6 col-md-4">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong> <span style="color: #5c7c97"> <i
									class="fa fa-volume-up"></i>
							</span>커뮤니티
							</strong> <a class="plus" href="#"><i class="fa fa-plus"></i></a>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-hover ">
									<thead>
										<tr>
											<th>No</th>
											<th>말머리</th>
											<th>제목</th>
											<th>지점명</th>
											<th>날짜</th>
											<th>조회</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>4</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>5</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>6</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>7</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>8</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>9</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
										<tr>
											<td>10</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
											<td>Column content</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4">
					<a href="#"
						class="btn btn-default btn-lg btn-block margin-bottom02"> <i
						class="fa fa-cogs fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 지점관리
					</a> <a href="#"
						class="btn btn-default btn-lg btn-block none_margin-right"> <i
						class="fa fa-fw fa-area-chart fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 매출현황
					</a>
				</div>
				<!-- 
			  	필요한 뷰포트에만 clearfix 를 추가하세요
			  	<div class="clearfix visible-xs-block"></div> -->
				<div class="col-lg-3 col-md-4">
					<a href="#"
						class="btn btn-default btn-lg btn-block margin-bottom02"> <i
						class="fa fa-fw fa-table fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 발주현황
					</a> <a href="admin/product/product_list.do"
						class="btn btn-default btn-lg btn-block none_margin-right"> <i
						class="fa fa-fw fa-wrench fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 물품관리
					</a>
				</div>
			</div>


			<!-- 
		<div class="col-lg-6 col-md-6">
			<p class="bs-component">
				<a href="#" class="btn btn-default btn-lg btn-block">Block level button</a>	
			</p>	
		</div> -->
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		
		Scroll to Top Button
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>
		Logout Modal
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>
		Bootstrap core JavaScript
		<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
		<script src="resources/bootstrap/vendor/popper/popper.min.js"></script>
		<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
		Core plugin JavaScript
		<script
			src="resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
		Page level plugin JavaScript
		<script src="resources/bootstrap/vendor/chart.js/Chart.min.js"></script>
		<script
			src="resources/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
		<script
			src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
		Custom scripts for all pages
		<script src="resources/bootstrap/js/sb-admin.min.js"></script>
		Custom scripts for this page
		<script src="resources/bootstrap/js/sb-admin-datatables.min.js"></script>
		<script src="resources/bootstrap/js/sb-admin-charts.min.js"></script>
	</div>
</body>

</html>
