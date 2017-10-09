<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">


<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	
	
		<!-- 탭  -->
		<h1>뜐뚠뜐~~~</h1>
		<br> <br>
		<div class="tab">

			<button class="tablinks"
				onclick="window.location='/d_time/stock_status.do'">재고 현황</button>
			<button class="tablinks"
				onclick="window.location='/d_time/orders_addForm.do'">발주 신청</button>
		</div>

		<table class="table" width="700">
			<thead>
				<tr>
					<td>분류</td>
					<td>품목</td>
					<td>보유 재고</td>
				</tr>
			</thead>

			<td width="100">음료</td>
			<c:forEach var="stock_list" items="${list}">
				<c:if test="${stock_list.st_type == '음료'}">
					<tr>
						<th></th>
						<td width="200">${stock_list.st_name}</td>
						<td>${stock_list.st_count}</td>
					</tr>
				</c:if>
			</c:forEach>

		</table>
		<br /> <br />

		<table class="table" width="700">
			<td width="100">식품</td>
			<c:forEach var="stock_list" items="${list}">
				<c:if test="${stock_list.st_type == '식품'}">
					<tr>
						<th></th>
						<td width="200">${stock_list.st_name}</td>
						<td>${stock_list.st_count}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>

		<br />
		<br />

		<table  class="table" width="700">
			<td width="100">상품</td>
			<c:forEach var="stock_list" items="${list}">
				<c:if test="${stock_list.st_type == '상품'}">
					<tr>
						<th></th>
						<td width="200">${stock_list.st_name}</td>
						<td>${stock_list.st_count}</td>
					</tr>

				</c:if>
			</c:forEach>

		</table>
		<br /> <br />
		<table class="table" width="700">
			<td width="100">소모품</td>
			<c:forEach var="stock_list" items="${list}">
				<c:if test="${stock_list.st_type == '소모품'}">
					<tr>
						<td></td>
						<td width="200">${stock_list.st_name}</td>
						<td>${stock_list.st_count}</td>
					</tr>
				</c:if>

			</c:forEach>
		</table>



	
	
</body>

</html>