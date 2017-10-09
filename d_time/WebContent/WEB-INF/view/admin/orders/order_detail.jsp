<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	
</script>

<meta charset="utf-8">
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>발주상세
			</h3>
		</div>

		<!-- /.col-lg-12 -->
		<div class="col-lg-12">
			<ul style="list-style: none; padding: 0px; font-size: 15px;">
				<li style="padding-bottom: 10px;"><i
					class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>지점명 : ${storename}</li>
				<li><i class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>${orderdto.o_date}</li>
			</ul>
			<div class="table-responsive order_ing">
				<form method="POST">
					<table class="table table-condensed table-hover table-bordered_tB"
						style="width: 50%">

						<thead>
							<tr>
								<th width="30%" style="text-align: center;">분 류</th>
								<th style="text-align: center;">재 료</th>
								<th style="text-align: center;">수량</th>
							</tr>
						</thead>

						<tr id="132582" style="text-align: center;">
							<td rowspan="3">음료</td>
							<c:forEach var="ordrink" items="${ordrink}">
								<tr>
									<td style="text-align:center"><input type="hidden" name="${orderdto.o_drink}"/>
										${ordrink.st_name}
										<%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align:center">
										${ordrink.st_num}
									</td>
								</tr>
							</c:forEach>
							
						</tr>

						<tr id="132582" style="text-align: center;">
							<td rowspan="3">식품</td>
							<%-- <td><input type="hidden" name="${orderdto.o_food}" />${orderdto.o_food}</td> --%>
							<c:forEach var="orfood" items="${orfood}">
								<tr>
									<td style="text-align:center"><input type="hidden" name="${orderdto.o_food}"/>
										${orfood.st_name}
										<%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align:center">
										${orfood.st_num}
									</td>
								</tr>
							</c:forEach>
						</tr>

						<tr id="132582" style="text-align: center;">
							<td rowspan="3">상품</td>
							<%-- <td><input type="hidden" name="${orderdto.o_product}" />${orderdto.o_product}</td> --%>
							<c:forEach var="orproduct" items="${orproduct}">
								<tr>
									<td style="text-align:center"><input type="hidden" name="${orderdto.o_product}"/>
										${orproduct.st_name}
										<%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align:center">
										${orproduct.st_num}
									</td>
								</tr>
							</c:forEach>
						</tr>

						<tr id="132582" style="text-align: center;">
							<td rowspan="2">소모품</td>
							<%-- <td><input type="hidden" name="${orderdto.o_thing}" />${orderdto.o_thing}</td> --%>
							<c:forEach var="orthing" items="${orthing}">
								<tr>
									<td style="text-align:center"><input type="hidden" name="${orderdto.o_thing}"/>
										${orthing.st_name}
										<%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align:center">
										${orthing.st_num}
									</td>
								</tr>
							</c:forEach>
						</tr>
					</table>

					<div class="form-group">
						<div class="col-lg-6 col-lg-offset-2">
							<a
								href="store_confirm.do?o_no=${orderdto.o_no}&s_no=${orderdto.s_no}"
								class="btn btn-secondary">승인</a>
						</div>
					</div>
				</form>
			</div>



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