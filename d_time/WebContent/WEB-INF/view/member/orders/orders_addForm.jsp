<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<meta charset="utf-8">


<body class="fixed-nav sticky-footer bg-dark" id="page-top">



	<h3>발주 신청</h3>
	<br>
	<br>
	<form method="POST">
	<div class="col-lg-10" style="margin-bottom: 25px;">
		<div class="text-right active fl-left">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs in">
				<li id="order_ing"><a href="/d_time/stock_status.do"> 재고 현황
						<i class="fa fa-angle-down"></i>
				</a></li>
				<li id="order_list" class="active"><a
					href="/d_time/orders_addForm.do"> 발주 신청<i
						class="fa fa-angle-down"></i>
				</a></li>
			</ul>
		</div>


			<table class="table">
				<thead>
					<tr>
						<td width="100" align="center">분 &nbsp &nbsp 류</td>
						<td width="200" align="center">품 &nbsp &nbsp 목</td>
						<td width="200" align="center">수 &nbsp &nbsp 량</td>
						<td width="200" align="center">단 &nbsp &nbsp 위</td>
					</tr>
				</thead>

				<tr>
					<td width="100" align="center">재 &nbsp &nbsp 료</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<c:forEach var="orders_list" items="${list}">
					<c:if test="${orders_list.p_type == '음료'}">
						<tr>
							<td width="100"></td>
							<td width="200" align="center"><input type="hidden"
								name="umryo" value="${orders_list.p_name}">${orders_list.p_name}</td>
							<td width="200" align="center"><input type="number"
								name="umryo_num" min="0" max="100" value="0"></td>
							<td width="200" align="center">${orders_list.p_std}</td>
						</tr>
					</c:if>
				</c:forEach>

			</table>


			<table class="table">
				<tr>
					<td width="100" align="center">식 &nbsp &nbsp 품</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="orders_list" items="${list}">
					<c:if test="${orders_list.p_type == '식품'}">
						<tr>
							<td width="100"></td>
							<td width="200" align="center"><input type="hidden"
								name="sikpoom" value="${orders_list.p_name}">${orders_list.p_name}</td>
							<td width="200" align="center"><input type="number"
								name="sikpoom_num" min="0" max="100" value="0"></td>
							<td width="200" align="center">${orders_list.p_std}</td>
						</tr>
					</c:if>
				</c:forEach>

			</table>

			<table class="table">
				<tr>
					<td width="100" align="center">상 &nbsp &nbsp 품</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="orders_list" items="${list}">
					<c:if test="${orders_list.p_type == '상품'}">
						<tr>
							<td width="100"></td>
							<td width="200" align="center"><input type="hidden"
								name="sangpoom" value="${orders_list.p_name}">${orders_list.p_name}</td>
							<td width="200" align="center"><input type="number"
								name="sangpoom_num" min="0" max="100" value="0"></td>
							<td width="200" align="center">${orders_list.p_std}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>

			<table class="table">
				<tr>
					<td width="100" align="center">소 모 품</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="orders_list" items="${list}">
					<c:if test="${orders_list.p_type == '소모품'}">
						<tr>
							<td width="100"></td>
							<td width="200" align="center"><input type="hidden"
								name="somopoom" value="${orders_list.p_name}">${orders_list.p_name}</td>
							<td width="200" align="center"><input type="number"
								name="somopoom_num" min="0" max="100" value="0"></td>
							<td width="200" align="center">${orders_list.p_std}</td>
						</tr>
					</c:if>
				</c:forEach>

			</table>
			<br /> <br />
			<div align="center">
				<input type="submit" class="btn btn-info" value="발주 신청"
					style="width: 150; height: 50;"> <input type="button"
					class="btn btn-default" value="초기화" style="width: 150; height: 50;"
					onclick="location.reload();">
				</button>
			</div>



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
		<script
			src="/d_time/resources/bootstrap/js/sb-admin-datatables.min.js"></script>
		<script src="/d_time/resources/bootstrap/js/sb-admin-charts.min.js"></script>
		</div>
</body>

</html>

