<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8">


<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<div class="container-fluid" style="padding: 0px;">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header" style="font-size: 28px;">
					<i class="fa fa-th-large"></i>매출현황
				</h3>
			</div>

			<!-- /.col-lg-12 -->
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<form class="form-horizontal" action="sale.do" method="POST">
							<input type="date" name="from" value="${from}" /> <input
								type="date" name="to" value="${to}" /> <input type="submit"
								class="graph-submit" value="확인" /> <input type="button"
								value="파일 내보내기" class="graph-file-export"
								onclick="location.href='download.do'">
							<c:if test="${from!=null}">
								<br>
								<span
									style="font-size: 15px; letter-spacing: -0.2px; color: #505050; font-weight: bold; display: inline-block; margin-top: 10px;">${from}~${to}</span>
							</c:if>
						</form>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<div class="table-responsive">

							<table class="table table-striped table-hover table-bordered_tB">
								<thead>
									<tr>
										<th>지점명</th>
										<th>구분</th>
										<th>기간매출</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="list">
									<tr id="132582">
										<td>${list.s_name}</td>
										<td>${list.s_type}</td>
										<td>${list.sel_cost}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->

			<!-- 직영점 그래프 -->
			<script>
				var test = new Array();
				var date_temp;

				var list_y1 = new Array();
				<c:forEach items="${list_y1}" var="y1">
				list_y1.push({
					date : "${y1.date}",
					cost : "${y1.sum_cost}"
				});
				</c:forEach>

				for (var i = 1; i <= 12; i++) {
					var date_find = false;

					if (i < 10)
						date_temp = "2017-0" + i;
					else
						date_temp = "2017-" + i;

					for (var j = 0; j < list_y1.length; j++) {
						if (list_y1[j].date == date_temp) {
							test.push(list_y1[j].cost);
							date_find = true;
							break;
						}
					}
					if (date_find == false)
						test.push(0);

				}
				//alert(test);
			</script>
			<div class="col-lg-12">
				<div class="col-lg-6" style="float: left; width: 50%">

					<i class="fa fa-check-circle-o fa-2x" style="color: #424242"
						aria-hidden="true"></i>
					<h3 class="store_title" style="font-size: 20px; font-weight: 600">직영점
						연매출</h3>
					<div id="barchart" style="width: 660px; height: 370px;">
						<script type="text/javascript">
							jQuery(document)
									.ready(
											function() {
												jQuery("#barchart")
														.jqplot(
																[ test ],
																{
																	/* title : "직영점 연매출", */
																	seriesColors : [ '#FAAC58' ] // 두개 이상의 색을 적어도 최상의 2개의 색만 반영됨
																	,
																	stackSeries : false,
																	seriesDefaults : {
																		renderer : jQuery.jqplot.BarRenderer
																	},
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

				<!-- 가맹점 그래프 -->
				<script>
					var test2 = new Array();
					var date_temp2;

					var list_y2 = new Array();
					<c:forEach items="${list_y2}" var="y2">
					list_y2.push({
						date : "${y2.date}",
						cost : "${y2.sum_cost}"
					});
					</c:forEach>

					for (var i = 1; i <= 12; i++) {
						var date_find = false;

						if (i < 10)
							date_temp2 = "2017-0" + i;
						else
							date_temp2 = "2017-" + i;

						for (var j = 0; j < list_y2.length; j++) {
							if (list_y2[j].date == date_temp2) {
								test2.push(list_y2[j].cost);
								date_find = true;
								break;
							}
						}
						if (date_find == false)
							test2.push(0);
					}
					//alert(test2);
				</script>

				<div class="col-lg-6" style="float: left; width: 50%">

					<i class="fa fa-check-circle-o fa-2x" style="color: #424242"
						aria-hidden="true"></i>
					<h3 class="store_title" style="font-size: 20px; font-weight: 600">가맹점
						연매출</h3>
					<div id="barchart2" style="width: 660px; height: 370px;">
						<script type="text/javascript">
							jQuery(document)
									.ready(
											function() {
												jQuery("#barchart2")
														.jqplot(
																[ test2 ],
																{
																	seriesColors : [ '#81BEF7' ] // 두개 이상의 색을 적어도 최상의 2개의 색만 반영됨
																	,
																	stackSeries : false,
																	seriesDefaults : {
																		renderer : jQuery.jqplot.BarRenderer
																	},
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
	</div>
</body>

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
