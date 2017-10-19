<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="utf-8">

<script>


var list_sname = new Array();
var list_sel = new Array();
	 <c:forEach var="store" items="${best_store}" varStatus="status">
	 list_sel.push("${store.sel_cost}");
	 </c:forEach>
	 
	 <c:forEach var="store" items="${best_store}" varStatus="status">
	 list_sname.push("${store.s_name}");
	 </c:forEach>
	
	var num_length = list_sel[0].length-1;
	var std = Math.pow(10,num_length);

	//alert(test);
</script>
<style>
ul, li, or {
	list-style: none;
	padding-top: 5px;
}
.jqplot-target {
color:#000 !important;

}
</style>
<script type="text/javascript" src="/d_time/jqplot/js/jquery.jqplot.js"></script>

<link rel="stylesheet" type="text/css"
	href="/d_time/jqplot/css/jquery.jqplot.css" />
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.barRenderer.js"></script>

<script>
/* 
<c:forEach var="store" items="${best_store}" varStatus="status">
<li><a href="#">${status.count}위 : &nbsp; ${store.s_name}</a> <span
      class="date_visit">매출액 :&nbsp;${store.sel_cost}</span></li>
</c:forEach>
 */
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

<div class="col-lg-12">
	<div class="row margin-bottom">
		<div class="col-lg-3 col-md-4">
			<div class="panel panel-main">
				<div class="panel-heading">
					<strong><span style="color: #5c7c97"><i
							class="fa fa-user"></i></span>회원</strong>
				</div>
				<div class="info_area">
					<dl>
						<dt>
							<i class="fa fa-user-circle-o fa-4x" aria-hidden="true"></i>
						</dt>
						<dd>
							<span style="margin-right: 10px;">[Cafe. CiCHA]</span>ID:${mem_id}<a
								href=""><i class="fa fa-pencil-square-o vertical-bottom"></i></a>
						</dd>
					</dl>
				</div>
				<!-- <div class="panel-info-footer text-center"
							style="font-size: 13px;">
							<a href="javascript:void(0);"
								onclick="javascript:window.open('/newsdesk/msg/message.html', 'MSG_POP', 'width=650, height=600, resizable=no, scrollbars=yes')">쪽지(0)
								<i class="fa fa-comments-o"></i>
							</a>&nbsp;&nbsp;&nbsp; <a href="">메모관리 &nbsp;<i
								class="fa fa-file-o"></i></a>&nbsp;&nbsp;&nbsp; <a
								href="/d_time/logout.do">로그아웃 <i class="fa fa-sign-out"></i></a>
						</div> -->
			</div>
		</div>
		<div class="col-lg-4 col-md-4">
			<div class="panel panel-main">
				<div class="panel-heading">
					<strong> <span style="color: #5c7c97"> <i
							class="fa fa-coffee"></i>
					</span>최근 판매 내역
					</strong> <a class="plus" href="/d_time/sell/sell_main.do"><i
						class="fa fa-plus"></i></a>
				</div>
				<div class="panel-body visit_area">
					<ul class="main_order">
						<c:forEach var="sale" items="${sale_list}">
							<li style="line-height: 22px !important"><span
								class="date_visit"><fmt:formatDate
										value="${sale.sel_date}" pattern="yyyy.MM.dd HH:mm" /></span>
							<li style="line-height: 22px !important">${sale.sel_history}</li>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div> 
		<div class="col-lg-5 col-md-4">
			<div class="panel panel-main">
				<div class="panel-heading">
					<strong> <span style="color: #5c7c97"> <i
							class="fa fa-volume-up"></i>
					</span> 공지사항
					</strong> <a class="plus" href="/d_time/all/notice/notice_list.do"><i
						class="fa fa-plus"></i></a>
				</div>
				<div class="visit_area">
					<ul>
						<c:forEach var="notice" items="${notice_list}">
							<li><a
								href="/d_time/all/notice/notice_detail.do?n_no=${notice.n_no}"><i
									class="fa fa-angle-right color_arrow margin_right"
									aria-hidden="true"></i>${notice.n_title}</a> <span
								class="date_visit"><fmt:formatDate
										value="${notice.n_date}" pattern="yyyy.MM.dd HH:mm" /></span></li>

						</c:forEach>
						<!-- <li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[이벤트 안내]9/19부터 신메뉴 출시 예정입니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[New매장 오픈] 종로 1가점을 오픈하였습니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[이벤트 안내]9/19부터 신메뉴 출시 예정입니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[New매장 오픈] 종로 1가점을 오픈하였습니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[이벤트 안내]9/19부터 신메뉴 출시 예정입니다.</a> <span
									class="date_visit">2017.09.20</span></li> -->
						<!-- 	<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[New매장 오픈] 종로 1가점을 오픈하였습니다.</a> <span
									class="date_visit">2017.09.20</span></li>
								<li><a href="#"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>[이벤트 안내]9/19부터 신메뉴 출시 예정입니다.</a> <span
									class="date_visit">2017.09.20</span></li> -->
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12">
	<div class="row margin-bottom">
		<div class="col-lg-5 col-md-4">
		
			<div class="panel panel-main">
			<div class="panel-heading">
					<strong> <span style="color: #5c7c97"> <i
							class="fa fa-area-chart"></i>
					</span> 월매출 순위</strong></div>
				<!-- <i class="fa fa-check-circle-o fa-2x" style="color: #424242"
					aria-hidden="true"></i>
				<h3 class="store_title" style="font-size: 20px; font-weight: 600">
					월매출 순위</h3> -->
				<div class="w3-third" style="float: none; width: 100%;     padding: 37px;"> 
					<div id="barchart" style="width:500px; height: 370px;"> 
						<script type="text/javascript"> 
							jQuery(document)
									.ready(
											function() {
												jQuery("#barchart")
														.jqplot(
																[ list_sel ],
																{
																	animate : true,
																	
																	seriesColors : [ '#0f91b5' ],
																	stackSeries : false,
																	grid : {
																		background : '#ffffff' 
																	},
																	series : [ { 
																		renderer : jQuery.jqplot.BarRenderer,
																		
																		 pointLabels: { show: true },
																		rendererOptions : {
																			shadow : false,
																			animation : {
																				speed : 2000
																			},
																			barWidth:50,
																			 pointLabels: { show: true }
																		}
																	} ],
																	axes : {
																		xaxis : {
																			renderer : jQuery.jqplot.CategoryAxisRenderer,
																			tickOptions : {
																				textColor : '#000000',
																				 fontSize: '14px' 
																			},
																			ticks : [
																					'1위:'+list_sname[0],
																					'2위:'+list_sname[1],
																					'3위:'+list_sname[2],
																					'4위:'+list_sname[3],
																					'5위:'+list_sname[4],
																					]
																		},
																		yaxis : {
																			tickOptions : {
																				textColor : '#000000'
																			},
																			min : 0,
																			max : eval(list_sel[0])+std,
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
		<div class="col-lg-7 col-md-4">
			<div class="panel panel-main">
				<div class="panel-heading">
					<strong> <span style="color: #5c7c97"> <i
							class="fa fa-volume-up"></i>
					</span>커뮤니티
					</strong> <a class="plus" href="/d_time/board_list.do?type=건의사항"><i
						class="fa fa-plus"></i></a>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>No</th>
									<th>말머리</th>
									<th>제목</th>
									<th>지점명</th>
									<th>날짜</th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${board_list}" varStatus="status">
									<tr
										onClick='javascript:location.href="board_detail.do?b_no=${board.b_no}&type=${board.b_type}&pageNum=1"'>
										<td>${status.count}</td>
										<td>${board.b_type }</td>
										<td>${board.b_title}</td>
										<td>${board.s_name}</td>
										<td><fmt:formatDate value="${board.b_date}"
												pattern="yyyy.MM.dd HH:mm" /></td>
										<td>${board.b_count}</td>
									</tr>



								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
</div>