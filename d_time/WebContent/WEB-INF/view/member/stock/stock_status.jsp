<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="utf-8">


<body>

	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>재고현황
			</h3>
		</div>
		<div class="col-lg-12" style="margin-bottom: 25px;">
			<div class="text-right active fl-left width100">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs-menu in">
					<li id="order_ing" class="active"><a
						href="/d_time/stock_status.do">재고현황<i class="fa fa-angle-down"></i></a></li>
					<li id="order_list"><a href="/d_time/orders_addForm.do">발주신청
							<i class="fa fa-angle-down"></i>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="row">
				<div class="col-lg-3" style="padding: 0;">
					<div id='box-menu'
						class="background-none sell-box media media-services-menu right scrollpoint sp-effect2">
						<div class="media-body">
							<div class="menu_head margin-bottom">
								<i class="fa fa-coffee fa-2x color-icon-sell" aria-hidden="true"></i>
								<h4>음료</h4>
								<!-- <h3 class="plus_icon">
										<a href="#" onClick="insRow(this)" id="drink_add"
											class="fl_right margin-right-num ">+</a>
									</h3> -->
							</div>
							<div class="table-responsive order_ing">
								<table class="table table-striped table-hover table-bordered_tB font-size-15">
									<thead class="background-color-tablestock">
										<tr>
											<th width=45% class="border-top-bot text-center border-stock-th ">재료</th>
											<th class="border-top-bot text-center border-stock-th ">보유재고</th>
										</tr>
									</thead>

									<c:forEach var="stock_list" items="${list}">
										<c:if test="${stock_list.st_type == '음료'}">
											<tr style="background-color: transparent;" class="cursor-no">
												<td width="100" align="center">${stock_list.st_name}</td>
												<td width="100" align="center"><fmt:formatNumber
														value="${stock_list.st_count}" pattern="#,###" /> g/ml</td>
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
								<i class="fa fa-cutlery fa-2x color-icon-sell"
									aria-hidden="true"></i>
								<h4>식품</h4>
								<!-- <h3 class="plus_icon">
										<a href="#" onClick="insRow(this)" id="drink_add"
											class="fl_right margin-right-num ">+</a>
									</h3> -->
							</div>
							<div class="table-responsive order_ing">
								<table class="table table-striped table-hover table-bordered_tB font-size-15">
									<thead class="background-color-tablestock">
										<tr>
											<th width=45% class="border-top-bot text-center border-stock-th">재료</th>
											<th class="border-top-bot text-center  border-stock-th">보유재고</th>
										</tr>
									</thead>
									<c:forEach var="stock_list" items="${list}">
										<c:if test="${stock_list.st_type == '식품'}">
											<tr style="background-color: transparent;" class="cursor-no">
												<td width="100" align="center">${stock_list.st_name}</td>
												<td width="100" align="center"><fmt:formatNumber
														value="${stock_list.st_count}" pattern="#,###" /> EA</td>
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
								<i class="fa fa-beer fa-2x color-icon-sell" aria-hidden="true"></i>
								<h4>상품</h4>
							</div>
							<div class="table-responsive order_ing">
								<table class="table table-striped table-hover table-bordered_tB font-size-15">
									<thead class="background-color-tablestock">
										<tr>
											<th width=45% class="border-top-bot text-center border-stock-th ">재료</th>
											<th class="border-top-bot text-center border-stock-th ">보유재고</th>
										</tr>
									</thead>
									<c:forEach var="stock_list" items="${list}">
										<c:if test="${stock_list.st_type == '상품'}">
											<tr style="background-color: transparent;" class="cursor-no">
												<td width="100" align="center">${stock_list.st_name}</td>
												<td width="100" align="center"><fmt:formatNumber
														value="${stock_list.st_count}" pattern="#,###" /> EA</td>
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
						class="background-none sell-box border-right-0 media media-services-menu right scrollpoint sp-effect2">
						<div class="media-body">
							<div class="menu_head margin-bottom">
								<i class="fa fa-shopping-bag fa-2x color-icon-sell"
									aria-hidden="true"></i>
								<h4>소모품</h4>
							</div>
							<div class="table-responsive order_ing">
								<table class="table table-striped table-hover table-bordered_tB font-size-15"> 
									<thead class="background-color-tablestock">
										<tr>
											<th width=45% class="border-top-bot text-center border-stock-th">재료</th>
											<th class="border-top-bot text-center border-stock-th">보유재고</th>
										</tr>
									</thead>
									<c:forEach var="stock_list" items="${list}">
										<c:if test="${stock_list.st_type == '소모품'}">
											<tr style="background-color: transparent;" class="cursor-no">
												<td width="100" align="center">${stock_list.st_name}</td>
												<td width="100" align="center"><fmt:formatNumber
														value="${stock_list.st_count}" pattern="#,###" /> EA</td>
											</tr>
										</c:if>

									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>