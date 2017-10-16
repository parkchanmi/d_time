<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="utf-8">


<body class="fixed-nav sticky-footer bg-dark" id="page-top">


	<!-- 탭  -->
	<h3>재고 현황</h3>
	<br>
	<br>
	<div class="col-lg-10" style="margin-bottom: 25px;">
		<div class="col-lg-10">
			<div class="active">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs in">
					<li id="order_ing" class="active"><a
						href="/d_time/stock_status.do"> 재고 현황
						 <i	class="fa fa-angle-down"></i></a></li>
					<li id="order_list"><a href="/d_time/orders_addForm.do">
							발주신청 <i class="fa fa-angle-down"></i>
					</a></li>
				</ul>
			</div>
		</div>



		<table class="table" width="500">
			<thead>
				<tr>
					<td width="100" align="center">분 &nbsp &nbsp &nbsp 류</td>
					<td width="100" align="center">품 &nbsp &nbsp &nbsp목</td>
					<td width="100" align="center">보유 재고</td>
				</tr>
			</thead>

			<tr>
				<td width=100 align="center">재 &nbsp &nbsp &nbsp 료</td>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="stock_list" items="${list}">
				<c:if test="${stock_list.st_type == '음료'}">
					<tr>
						<td width="100"></td>
						<td width="100" align="center">${stock_list.st_name}</td>
						<td width="100" align="center"><fmt:formatNumber
								value="${stock_list.st_count}" pattern="#,###" /> g</td>
					</tr>
				</c:if>
			</c:forEach>

		</table>
		<table class="table">
			<tr>
				<td width=100 align="center">식 &nbsp &nbsp &nbsp 품</td>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="stock_list" items="${list}">
				<c:if test="${stock_list.st_type == '식품'}">
					<tr>
						<td width="100"></td>
						<td width="100" align="center">${stock_list.st_name}</td>
						<td width="100" align="center"><fmt:formatNumber
								value="${stock_list.st_count}" pattern="#,###" /> EA</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>

		<table class="table">
			<tr>
				<td width="100" align="center">상 &nbsp &nbsp &nbsp 품</td>
				<td></td>
				<td></td>
			</tr>
			<c:forEach var="stock_list" items="${list}">
				<c:if test="${stock_list.st_type == '상품'}">
					<tr>
						<td width="100"></td>
						<td width="100" align="center">${stock_list.st_name}</td>
						<td width="100" align="center"><fmt:formatNumber
								value="${stock_list.st_count}" pattern="#,###" /> EA</td>
					</tr>
				</c:if>
			</c:forEach>

		</table>

		<table class="table">
			<tr>
				<td width="100" align="center">소 모 품</td>
				<td></td>
				<td></td>

			</tr>
			<c:forEach var="stock_list" items="${list}">
				<c:if test="${stock_list.st_type == '소모품'}">
					<tr>
						<td width="100"></td>
						<td width="100" align="center">${stock_list.st_name}</td>
						<td width="100" align="center"><fmt:formatNumber
								value="${stock_list.st_count}" pattern="#,###" /> EA</td>
					</tr>
				</c:if>

			</c:forEach>
		</table>


	</div>

	</div>
</body>

</html>