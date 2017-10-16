<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
function now_stock(s_no){
	
	// url과 사용자 입력 id를 조합합니다.
    url = "/d_time/now_stock.do?s_no="+s_no;
   
    // 새로운 윈도우를 엽니다.
    open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=800,height=800"); 
}
</script>

<meta charset="utf-8">

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
				<li><i class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>상태 : ${orderdto.o_state}</li>
					<li><i class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i><button class="btn btn-secondary" onclick="now_stock(${orderdto.s_no})">재고 현황</button></li>
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
						<c:if test="${dsize>0}">
						<tr style="text-align: center;">
							<td rowspan="${dsize}">재료</td>
							<c:forEach var="ordrink" items="${ordrink}" varStatus="status">
								<c:if test="${status.first}">
									<td style="text-align: center"><input type="hidden"
										name="${orderdto.o_drink}" /> ${ordrink.st_name} <%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align: center">${ordrink.st_num}</td>
								</c:if>
							</c:forEach>

						</tr>
						
						
							<c:forEach var="ordrink" items="${ordrink}" varStatus="status">
							
								<c:if test="${!status.first}">
									<%-- ${status.index} --%>
									<tr>
									<td style="text-align: center"><input type="hidden"
										name="${orderdto.o_drink}" /> ${ordrink.st_name} <%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align: center">${ordrink.st_num}</td>
									</tr>
								</c:if>
								
							</c:forEach>
						
						</c:if>
						
						<c:if test="${fsize>0}">
						<tr style="text-align: center;">
							<td rowspan="${fsize}">식품</td>

							<c:forEach var="orfood" items="${orfood}" varStatus="status">
								<c:if test="${status.first}">
									<td style="text-align: center"><input type="hidden"
										name="${orderdto.o_food}" /> ${orfood.st_name} <%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align: center">${orfood.st_num}</td>
								</c:if>
							</c:forEach>
						</tr>
						
						
							<c:forEach var="orfood" items="${orfood}" varStatus="status">
								<c:if test="${!status.first}">
								<tr>
									<td style="text-align: center"><input type="hidden"
										name="${orderdto.o_food}" /> ${orfood.st_name} <%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align: center">${orfood.st_num}</td>
									</tr>
								</c:if>
							</c:forEach>
						
						</c:if>
						<c:if test="${psize>0}">

						<tr style="text-align: center;">
							<td rowspan="${psize}">상품</td>
							
							<c:forEach var="orproduct" items="${orproduct}" varStatus="status">
								<c:if test="${status.first}">
									<td style="text-align: center"><input type="hidden"
										name="${orderdto.o_product}" /> ${orproduct.st_name} <%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align: center">${orproduct.st_num}</td>
								</c:if>
							</c:forEach>
						</tr>
					
							<c:forEach var="orproduct" items="${orproduct}" varStatus="status">
								<c:if test="${!status.first}">
									<tr>
									<td style="text-align: center"><input type="hidden"
										name="${orderdto.o_product}" /> ${orproduct.st_name} <%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align: center">${orproduct.st_num}</td>
									</tr>
								</c:if>
							</c:forEach>
					
						</c:if>
						<c:if test="${tsize>0}">
						<tr style="text-align: center;">
							<td rowspan="${tsize}">소모품</td>
							
							<c:forEach var="orthing" items="${orthing}" varStatus="status">
								<c:if test="${status.first}">
									<td style="text-align: center"><input type="hidden"
										name="${orderdto.o_thing}" /> ${orthing.st_name} <%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align: center">${orthing.st_num}</td>
								</c:if>
							</c:forEach>
						</tr>
						
						<c:forEach var="orthing" items="${orthing}" varStatus="status">
								<c:if test="${!status.first}">
								<tr>
									<td style="text-align: center"><input type="hidden"
										name="${orderdto.o_thing}" /> ${orthing.st_name} <%-- ${ordrink.st_num}	 --%>
									</td>
									<td style="text-align: center">${orthing.st_num}</td>
										</tr>
								</c:if>
							</c:forEach>
					
						</c:if>
					</table>

					<div class="form-group">
						<div class="col-lg-6 col-lg-offset-2">
						<c:if test="${orderdto.o_state=='대기'}">
							<a
								href="store_confirm.do?o_no=${orderdto.o_no}&s_no=${orderdto.s_no}"
								class="btn btn-secondary">승인</a>
						</c:if>
						<c:if test="${orderdto.o_state=='승인'}">
							<a class="btn btn-secondary">승인완료</a>
						</c:if>
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
			</div></div></div>
			