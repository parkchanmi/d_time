<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">


<meta charset="utf-8">


<body class="fixed-nav sticky-footer bg-dark" id="page-top">


		<h1>뜐뚠뜐~~~</h1>
		<br>
		
		전체 글 : ${count}
		
		<table border="1"  width="600">

			<tr>
				<td>no</td>
				<td>title</td>
				<td>state</td>
			</tr>
			
			<c:forEach var="orderslist" items="${list}">
				<tr>
					<td>${orderslist.r}</td>
					<td><a href="orders_content.do?o_no=${orderslist.o_no}"><fmt:formatDate value="${orderslist.o_date}" type="date"
							dateStyle="long" /> 발주 신청 내역 </a></td>
					<td>${orderslist.o_state}</td>
				</tr>
			</c:forEach>

		</table>
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

