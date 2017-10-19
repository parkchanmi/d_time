<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<meta charset="utf-8">


<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-th-large"></i>발주 상세 내역
		</h3>
	</div>
	<div class="col-lg-12">
		<ul style="list-style: none; padding: 0px; font-size: 15px;">
		<li style="padding-bottom: 10px;"><i
					class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>발주번호 : ${orderdto.o_no}</li>
				
				<li style="padding-bottom: 10px;"><i class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>${orderdto.o_date}</li>
				<li style="padding-bottom: 10px;"><i class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>상태 : ${orderdto.o_state}</li>
			

		</ul>
		<div class="table-responsive order_ing">
			<form method="GET">
				<table class="table table-condensed table-hover table-bordered_tB"
					style="width: 50%">
					<thead>
						<tr>
							<th width="30%" style="text-align: center;">분류</th>
							<th style="text-align: center;">품목</th>
							<th style="text-align: center;">수량</th>
						</tr>
					</thead>
					<c:if test="${dsize>0}">
						<tr style="text-align: center;">
							<td rowspan="${dsize}">음료</td>
							<c:forEach var="orders_content" items="${um_list}"
								varStatus="status">
								<c:if test="${status.first}">
									<td style="text-align: center">${orders_content.umryo}</td>
									<td style="text-align: center">${orders_content.umryo_num}</td>
								</c:if>
							</c:forEach>
						</tr>

						<c:forEach var="orders_content" items="${um_list}"
							varStatus="status">
							<c:if test="${!status.first}">
								<tr>
									<td style="text-align: center">${orders_content.umryo}</td>
									<td style="text-align: center">${orders_content.umryo_num}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>

					<c:if test="${fsize>0}">
						<tr style="text-align: center;">
							<td rowspan="${fsize}">식품</td>

							<c:forEach var="orders_content" items="${sik_list}"
								varStatus="status">
								<c:if test="${status.first}">
									<td style="text-align: center">${orders_content.sikpoom}</td>
									<td style="text-align: center">${orders_content.sikpoom_num}</td>
								</c:if>
							</c:forEach>
						</tr>

						<c:forEach var="orders_content" items="${sik_list}"
							varStatus="status">
							<c:if test="${!status.first}">
								<tr>
									<td style="text-align: center">${orders_content.sikpoom}</td>
									<td style="text-align: center">${orders_content.sikpoom_num}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>

					<c:if test="${psize>0}">

						<tr style="text-align: center;">
							<td rowspan="${psize}">상품</td>
							<c:forEach var="orders_content" items="${sang_list}" varStatus="status">
								<c:if test="${status.first}">
									<td style="text-align: center">${orders_content.sangpoom}</td>
									<td style="text-align: center">${orders_content.sangpoom_num}</td>
								</c:if>
							</c:forEach>
							
						</tr>
						
						<c:forEach var="orders_content" items="${sang_list}" varStatus="status">
							<c:if test="${!status.first}">
								<tr>
									<td style="text-align: center">${orders_content.sangpoom}</td>
									<td style="text-align: center">${orders_content.sangpoom_num}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					
					<c:if test="${tsize>0}">
						<tr style="text-align: center;">
							<td rowspan="${tsize}">소모품</td>
							<c:forEach var="orders_content" items="${somo_list}" varStatus="status">
								<c:if test="${status.first}">
									<td style="text-align: center">${orders_content.somopoom}</td>
									<td style="text-align: center">${orders_content.somopoom_num}</td>
								</c:if>
							</c:forEach>
						</tr>
						
						<c:forEach var="orders_content" items="${somo_list}" varStatus="status">
							<c:if test="${!status.first}">
								<tr>
									<td style="text-align: center">${orders_content.somopoom}</td>
									<td style="text-align: center">${orders_content.somopoom_num}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</table>
			</form>
		</div>
	</div>

	<div class="col-lg-6" align="center"
		style="margin-bottom: 25px; width: 800px;">
		<c:if test="${orderdto.o_state=='대기'}">
			<input type="button" class="btn btn-download" value="발주 취소"
				onclick="window.location='/d_time/orders_delete.do?o_no=${orderdto.o_no}'">
		</c:if>
		<input type="button" class="btn btn-board" value="목록 보기"
			onclick="window.location='/d_time/orders_list.do'">

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
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready
				to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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