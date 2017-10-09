<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<meta charset="utf-8">


<body class="fixed-nav sticky-footer bg-dark" id="page-top">



	<h1>뜐뚠뜐~~~</h1>
	<br>
	<br>

	<form method="GET">
		<table class="table" width="700">
			<thead>
				<tr>
					<td>분류</td>
					<td>품목</td>
					<td>수량</td>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="100" colspan="3">음료</td>
				</tr>
				<c:forEach var="orders_content" items="${um_list}">
					<tr>
						<th></th>
						<td width="200">${orders_content.umryo}</td>
						<td width="200">${orders_content.umryo_num}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<br /> <br />
		<table>
			<tbody>
				<tr>
					<td width="100" colspan="3">식품</td>
				</tr>
				<c:forEach var="orders_content" items="${sik_list}">
					<tr>
						<th></th>
						<td width="200">${orders_content.sikpoom}</td>
						<td width="200">${orders_content.sikpoom_num}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <br />

		<table>
			<tbody>
				<tr>
					<td width="100" colspan="3">상품</td>
				</tr>

				<c:forEach var="orders_content" items="${sang_list}">
					<tr>
						<th></th>
						<td width="200">${orders_content.sangpoom}</td>
						<td width="200">${orders_content.sangpoom_num}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <br />

		<table>
			<tbody>
				<tr>
					<td width="100" colspan="3">소모품</td>
				</tr>
				<c:forEach var="orders_content" items="${somo_list}">
					<tr>
						<th></th>
						<td width="200">${orders_content.somopoom}</td>
						<td width="200">${orders_content.somopoom_num}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br /> <br /> <input type="button" class="btn btn-default"
			value="목록 보기" onclick="window.location='/d_time/orders_list.do'">
		</button>

	</form>



	</div>
	<!-- /.container-fluid-->
	<!-- /.content-wrapper-->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="/d_time/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="/d_time/resources/bootstrap/vendor/popper/popper.min.js"></script>
	<script
		src="/d_time/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="/d_time/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script src="/d_time/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>
	<script
		src="/d_time/resources/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="/d_time/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="/d_time/resources/bootstrap/js/sb-admin.min.js"></script>
	<!-- Custom scripts for this page-->
	<script src="/d_time/resources/bootstrap/js/sb-admin-datatables.min.js"></script>
	<script src="/d_time/resources/bootstrap/js/sb-admin-charts.min.js"></script>
	</div>
</body>

</html>

