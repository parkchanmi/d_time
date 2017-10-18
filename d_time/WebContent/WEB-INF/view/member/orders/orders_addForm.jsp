<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<meta charset="utf-8">
<c:if test="${check==1}">
	<script>
		alert('수량을 입력하세요!');
	</script>
</c:if>

<script>
	function submit_ok() {
		var input_check = false;
		var check = new Array();
		$("input[type=number]").each(function(idx) {
			var value = $(this).val();
			check.push(value);
		});

		for (var i = 0; i < check.length - 1; i++) { //입력한 값끼리 비교
			if (check[i] != 0) {
				input_check = true;
			}
		}
		if (!input_check) {
			alert('수량을 입력하세요!');
			return false;
		}

	}
</script>

<body>
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>발주신청
			</h3>
		</div>
		<div class="col-lg-12" style="margin-bottom: 25px;">
			<div class="text-right active fl-left width100">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs-menu in">
					<li id="order_ing"><a href="/d_time/stock_status.do">재고현황<i
							class="fa fa-angle-down"></i></a></li>
					<li id="order_list" class="active"><a
						href="/d_time/orders_addForm.do">발주신청 <i
							class="fa fa-angle-down"></i>
					</a></li>
				</ul>
			</div>
		</div>


		<form method="POST" onsubmit="return submit_ok();">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-3" style="padding: 0;">
						<div id='box-menu'
							class="background-none sell-box media media-services-menu right scrollpoint sp-effect2">
							<div class="media-body">
								<div class="menu_head margin-bottom">
									<i class="fa fa-coffee fa-2x color-icon-sell"
										aria-hidden="true"></i>
									<h4>음료</h4>
								</div>
								<div class="table-responsive order_ing">
									<table
										class="table table-striped table-hover table-bordered_tB font-size-15">
										<thead class="background-color-tablestock">
											<tr>
												<th width=30%
													class="border-top-bot text-center border-stock-th ">품목</th>
												<th class="border-top-bot text-center border-stock-th ">수량</th>
												<th width=30%
													class="border-top-bot text-center border-stock-th ">단위</th>
											</tr>
										</thead>

										<c:forEach var="orders_list" items="${list}">
											<c:if test="${orders_list.p_type == '음료'}">
												<tr style="background-color: transparent;" class="cursor-no">
													<td width="200" align="center"><input type="hidden"
														name="umryo" value="${orders_list.p_name}">${orders_list.p_name}</td>
													<td width="200" align="center"><input type="number"
														name="umryo_num" min="0" max="100" value="0"></td>
													<td width="200" align="center">${orders_list.p_std}</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3" style="padding: 0;">
						<div id='box-menu'
							class="background-none sell-box media media-services-menu right scrollpoint sp-effect2">
							<div class="media-body">
								<div class="menu_head margin-bottom">
									<i class="fa fa-coffee fa-2x color-icon-sell"
										aria-hidden="true"></i>
									<h4>식품</h4>
								</div>
								<div class="table-responsive order_ing">
									<table
										class="table table-striped table-hover table-bordered_tB font-size-15">
										<thead class="background-color-tablestock">
											<tr>
												<th width=30%
													class="border-top-bot text-center border-stock-th ">품목</th>
												<th class="border-top-bot text-center border-stock-th ">수량</th>
												<th width=30%
													class="border-top-bot text-center border-stock-th ">단위</th>
											</tr>
										</thead>
										<c:forEach var="orders_list" items="${list}">
											<c:if test="${orders_list.p_type == '식품'}">
												<tr style="background-color: transparent;" class="cursor-no">
													<td width="200" align="center"><input type="hidden"
														name="sikpoom" value="${orders_list.p_name}">${orders_list.p_name}</td>
													<td width="200" align="center"><input type="number"
														name="sikpoom_num" min="0" max="100" value="0"></td>
													<td width="200" align="center">${orders_list.p_std}</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3" style="padding: 0;">
						<div id='box-menu'
							class="background-none sell-box media media-services-menu right scrollpoint sp-effect2">
							<div class="media-body">
								<div class="menu_head margin-bottom">
									<i class="fa fa-coffee fa-2x color-icon-sell"
										aria-hidden="true"></i>
									<h4>상품</h4>
								</div>
								<div class="table-responsive order_ing">
									<table
										class="table table-striped table-hover table-bordered_tB font-size-15">
										<thead class="background-color-tablestock">
											<tr>
												<th width=30%
													class="border-top-bot text-center border-stock-th ">품목</th>
												<th class="border-top-bot text-center border-stock-th ">수량</th>
												<th width=30%
													class="border-top-bot text-center border-stock-th ">단위</th>
											</tr>
										</thead>

										<c:forEach var="orders_list" items="${list}">
											<c:if test="${orders_list.p_type == '상품'}">
												<tr style="background-color: transparent;" class="cursor-no">
													<td width="200" align="center"><input type="hidden"
														name="sangpoom" value="${orders_list.p_name}">${orders_list.p_name}</td>
													<td width="200" align="center"><input type="number"
														name="sangpoom_num" min="0" max="100" value="0"></td>
													<td width="200" align="center">${orders_list.p_std}</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3" style="padding: 0;">
						<div id='box-menu'
							class="background-none sell-box media media-services-menu right scrollpoint sp-effect2">
							<div class="media-body">
								<div class="menu_head margin-bottom">
									<i class="fa fa-coffee fa-2x color-icon-sell"
										aria-hidden="true"></i>
									<h4>소모품</h4>
								</div>
								<div class="table-responsive order_ing">
									<table
										class="table table-striped table-hover table-bordered_tB font-size-15">
										<thead class="background-color-tablestock">
											<tr>
												<th width=30%
													class="border-top-bot text-center border-stock-th ">품목</th>
												<th class="border-top-bot text-center border-stock-th ">수량</th>
												<th width=30%
													class="border-top-bot text-center border-stock-th ">단위</th>
											</tr>
										</thead>
										<c:forEach var="orders_list" items="${list}">
											<c:if test="${orders_list.p_type == '소모품'}">
												<tr style="background-color: transparent;" class="cursor-no">
													
													<td width="200" align="center"><input type="hidden"
														name="somopoom" value="${orders_list.p_name}">${orders_list.p_name}</td>
													<td width="200" align="center"><input type="number"
														name="somopoom_num" min="0" max="100" value="0"></td>
													<td width="200" align="center">${orders_list.p_std}</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div align="center">
						<input type="submit" class="btn btn-board" value="발주 신청"> 
						<input type="button" class="btn btn-download" value="초기화"
							style="padding: 9px 14px !important;" onclick="location.reload();">
					</div>
				</div>
			</div>
		</form>

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

