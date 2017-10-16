<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<meta charset="utf-8">


<body class="fixed-nav sticky-footer bg-dark" id="page-top">



	<h3><i class="fa fa-th-large">발주 신청 상세내역</i></h3>
	<br>
	<br>
	<ul style="list-style: none; padding: 0px; font-size: 15px;">
				
				<li><i class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>${orderdto.o_date}</li>
				<li><i class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>상태 : ${orderdto.o_state}</li>
		
			</ul>
	<form method="GET">
		<div class="col-lg-10" style="margin-bottom: 25px; width: 800px;">

			<table class="table" width="700">
				<thead>
					<tr>
						<td width="200" align="center">분 &nbsp &nbsp 류</td>
						<td width="300" align="center">품 &nbsp &nbsp 목</td>
						<td width="200" align="center">수 &nbsp &nbsp 량</td>

					</tr>
				</thead>
		<c:if test="${um_list!=null}">
				<tr>
					<td width="200" align="center">재 &nbsp &nbsp 료</td>
					<td></td>
					<td></td>

				</tr>
				<c:forEach var="orders_content" items="${um_list}">
					<tr>
						<td></td>
						<td width="300" align="center">${orders_content.umryo}</td>
						<td width="200" align="center">${orders_content.umryo_num}</td>
					</tr>
				</c:forEach>
		</c:if>
			</table>
<c:if test="${sik_list!=null}">
			<table class="table" width="700">
				<tr>
					<td width="200" align="center">식 &nbsp &nbsp 품</td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="orders_content" items="${sik_list}">
					<tr>
						<td></td>
						<td width="300" align="center">${orders_content.sikpoom}</td>
						<td width="200" align="center">${orders_content.sikpoom_num}</td>
					</tr>
				</c:forEach>
			</table>
</c:if>
<c:if test="${sang_list!=null}">
			<table class="table" width="700">
				<tr>
					<td width="200" align="center">상 &nbsp &nbsp 품</td>
					<td></td>
					<td></td>
				</tr>

				<c:forEach var="orders_content" items="${sang_list}">
					<tr>
						<td></td>
						<td width="300" align="center">${orders_content.sangpoom}</td>
						<td width="200" align="center">${orders_content.sangpoom_num}</td>

					</tr>
				</c:forEach>

			</table>
</c:if>
<c:if test="${somo_list!=null}">
			<table class="table" width="700">
				<tr>
					<td width="200" align="center">소모품</td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="orders_content" items="${somo_list}">
					<tr>
						<td></td>
						<td width="300" align="center">${orders_content.somopoom}</td>
						<td width="200" align="center">${orders_content.somopoom_num}</td>
					</tr>
				</c:forEach>

			</table>
</c:if>
		</div>
		<br /> <br />
	</form>
	<div style="clear: both;"></div>
	<div class="col-lg-10" align="center" style="margin-bottom: 25px; width: 800px; ">
		<input type="button" class="btn btn-default" value="목록 보기"
			onclick="window.location='/d_time/orders_list.do'">


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

