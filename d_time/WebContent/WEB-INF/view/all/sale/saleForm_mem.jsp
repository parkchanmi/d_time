<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<meta charset="utf-8">

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-th-large"></i>지점관리
		</h3>
	</div>

	<!-- /.col-lg-12 -->
	<div class="col-lg-7.5">
		<div class="panel panel-default">
			<div class="panel-heading">
				<form action="saleMem.do" method="POST">
					<input type="hidden" name="s_no" value="${login.s_no}"> <input
						type="date" name="from" value="${from}" /> <input type="date"
						name="to" value="${to}" /> <input type="submit"> <input
						type="button" value="파일 내보내기"
						onclick="location.href='downloadMem.do?s_no=${login.s_no}&from=${from}&to=${to}'" />

					<c:if test="${from!=null}">
						<br>
									${from}~${to}
							</c:if>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body col-lg12">
				<div class="table-responsive">
					<table class="table table-striped table-hover table-bordered_tB">
						<thead>
							<tr>
								<th>지점명</th>
								<th>구분</th>
								<th>기간매출</th>
								<th></th>
							</tr>
						</thead>
						<c:forEach items="${list_mem}" var="list_mem">
							<tr id="132582">
								<td>${list_mem.s_name}</td>
								<td>${list_mem.s_type}</td>
								<td><fmt:formatNumber value="${list_mem.sel_cost}"
										pattern="#,###" />원</td>
								<td></td>
							</tr>
						</c:forEach>
					</table>

					<style>
.scrolltbody {
	display: block;
	
	border-collapse: collapse;
	
}

.scrolltbody th {
}

.scrolltbody td {
	border-top: 0;
}

.scrolltbody tbody {
	display: block;
	height: 200px;
	overflow: auto;
}

.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) {
	width: 200px;
}

.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) {
	width: 200px;
}

.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) {
	width: 400px;
}

.scrolltbody th:last-child {
	width: 200px;
}

.scrolltbody td:last-child {
	width: 200px;
}
</style>

					<table class="table table-striped table-hover table-bordered_tB scrolltbody">
						<thead>
							<tr>
								<th>판매일</th>
								<th>분류</th>
								<th>판매내역</th>
								<th>판매금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${detail_mem}" var="detail_mem">
								<tr id="132582">
									<td>${detail_mem.sel_date}</td>
									<td>${detail_mem.sel_type}</td>
									<td>${detail_mem.sel_history}</td>
									<td><fmt:formatNumber value="${detail_mem.sel_cost}"
											pattern="#,###" />원</td>
								
								</tr>

							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
		<!-- /.panel-body -->
	</div>


	<!-- /.panel -->
	<!-- 연매출 그래프 -->
	<script>
		var test = new Array();
		var date_temp;
		var list_y_mem = new Array();
		<c:forEach items="${list_y_mem}" var="y_mem">
		list_y_mem.push({
			date : "${y_mem.date}",
			cost : "${y_mem.sum_cost}"
		});
		</c:forEach>
		for (var i = 1; i <= 12; i++) {
			var date_find = false;
			if (i < 10)
				date_temp = "2017-0" + i;
			else
				date_temp = "2017-" + i;
			for (var j = 0; j < list_y_mem.length; j++) {
				if (list_y_mem[j].date == date_temp) {
					test.push(list_y_mem[j].cost);
					date_find = true;
					break;
				}
			}
			if (date_find == false)
				test.push(0);
		}
		//alert(test);
	</script>
	<div class="w3-panel" style="float: left; width: 50%">
		<div class="w3-third" style="float: none; width: 100%">
			<div id="piechart2" style="width: 660px; height: 370px;">
				<script type="text/javascript">
					var pie_mem = new Array();
					<c:forEach items="${pie_mem}" var="pie_mem">
					var count_num = eval("${pie_mem.count}");

					pie_mem.push({
						type : "${pie_mem.type}",
						count : count_num
					});
					</c:forEach>
					$(document)
							.ready(
									function() {
										var chart_data;

										if (pie_mem.length == 1) {
											chart_data = [ [ [ pie_mem[0].type,
													pie_mem[0].count ] ] ];
										} else if (pie_mem.length == 2) {
											chart_data = [ [
													[ pie_mem[0].type,
															pie_mem[0].count ],
													[ pie_mem[1].type,
															pie_mem[1].count ] ] ];
										} else if (pie_mem.length == 3) {
											chart_data = [ [
													[ pie_mem[0].type,
															pie_mem[0].count ],
													[ pie_mem[1].type,
															pie_mem[1].count ],
													[ pie_mem[2].type,
															pie_mem[2].count ] ] ];
										} else if (pie_mem.length == 0) {
											chart_data = [ [ [ '음료', 0 ],
													[ '식품', 0 ], [ '상품', 0 ] ] ];
										}

										var chart_opt = {
											title : '판매 통계',
											seriesDefaults : {
												renderer : $.jqplot.PieRenderer,
												rendererOptions : {
													startAngle : 180,
													sliceMargin : 4,
													showDataLabels : true,
													padding : 10,
													shadow : false
												}
											},
											seriesColors : [ "#4bb2c5",
													"#c5b47f", "#EAA228" ],

											legend : {
												show : true,
												escapeHtml : true,
												location : 'e'
											}

										};
										$.jqplot('piechart2', chart_data,
												chart_opt);
									});
				</script>
			</div>
		</div>
	</div>
	<div class="w3-panel" style="float: left; width: 50%"">
		<div class="w3-third" style="float: none; width: 100%">
			<div id="barchart" style="width: 660px; height: 370px;">
				<script type="text/javascript">
					jQuery(document)
							.ready(
									function() {
										jQuery("#barchart")
												.jqplot(
														[ test ],
														{
															animate : true,
															title : "지점 연매출",
															seriesColors : [ '#00CC99' ] // 두개 이상의 색을 적어도 최상의 2개의 색만 반영됨
															,
															stackSeries : false,
															series : [ {
																renderer : jQuery.jqplot.BarRenderer,
																rendererOptions : {
																	animation : {
																		speed : 2000
																	}
																}
															} ],
															axes : {
																xaxis : {
																	renderer : jQuery.jqplot.CategoryAxisRenderer,
																	ticks : [
																			'1월',
																			'2월 ',
																			'3월 ',
																			'4월 ',
																			'5월 ',
																			'6월 ',
																			'7월 ',
																			'8월 ',
																			'9월 ',
																			'10월 ',
																			'11월 ',
																			'12월 ' ]
																},
																yaxis : {
																	min : 0,
																	max : 750000,
																	numberTicks : 6
																}
															}
														});
									});
				</script>
			</div>
		</div>
	</div>
</div>

<!-- 파이그래프 -->


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


</html>