<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<meta charset="utf-8">


<body class="fixed-nav sticky-footer bg-dark" id="page-top">



	<h1>뜐뚠뜐~~~</h1>
	<br>
	<br>
	<div class="tab">

		<button class="tablinks"
			onclick="window.location='/d_time/stock_status.do'">재고 현황</button>
		<button class="tablinks"
			onclick="window.location='/d_time/orders_addForm.do'">발주 신청</button>
	</div>



	<form method="POST">
		<table class="table" width="700">
			<thead>
				<tr>
					<td>분류</td>
					<td>품목</td>
					<td>수량</td>
					<td>단위</td>
				</tr>
			</thead>

			<td width="100">음료</td>

			<c:forEach var="orders_list" items="${list}">
				<c:if test="${orders_list.p_type == '음료'}">
					<tr>
						<th></th>
						<td width="200"><input type="hidden" name="umryo"
							value="${orders_list.p_name}">${orders_list.p_name}</td>
						<td width="200"><input type="number" name="umryo_num" min="0"
							max="100" value="0"></td>
						<td>${orders_list.p_std}</td>
					</tr>
				</c:if>
			</c:forEach>

		</table>
		<br /> <br />

		<table class="table" width="700">
			<td width="100">식품</td>
			<c:forEach var="orders_list" items="${list}">
				<c:if test="${orders_list.p_type == '식품'}">
					<tr>
						<th></th>
						<td width="200"><input type="hidden" name="sikpoom"
							value="${orders_list.p_name}">${orders_list.p_name}</td>
						<td width="200"><input type="number" name="sikpoom_num"
							min="0" max="100" value="0"></td>
						<td>${orders_list.p_std}</td>
					</tr>
				</c:if>
			</c:forEach>

		</table>

		<br /> <br />

		<table class="table" width="700">
			<td width="100">상품</td>
			<c:forEach var="orders_list" items="${list}">
				<c:if test="${orders_list.p_type == '상품'}">
					<tr>
						<th></th>
						<td width="200"><input type="hidden" name="sangpoom"
							value="${orders_list.p_name}">${orders_list.p_name}</td>
						<td width="200"><input type="number" name="sangpoom_num"
							min="0" max="100" value="0"></td>
						<td>${orders_list.p_std}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<br /> <br />

		<table class="table" width="700">
			<td width="100">소모품</td>

			<c:forEach var="orders_list" items="${list}">
				<c:if test="${orders_list.p_type == '소모품'}">
					<tr>
						<th></th>
						<td width="200"><input type="hidden" name="somopoom"
							value="${orders_list.p_name}">${orders_list.p_name}</td>
						<td width="200"><input type="number" name="somopoom_num"
							min="0" max="100" value="0"></td>
						<td>${orders_list.p_std}</td>
					</tr>
				</c:if>
			</c:forEach>

		</table>
		<br /> <br />



	<input type="submit" class="btn btn-info" value="발주 신청"
		style="width: 150; height: 50;">
	<input type="button" class="btn btn-default" value="초기화"
		style="width: 150; height: 50;" onclick="location.reload();">
	</button>




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

