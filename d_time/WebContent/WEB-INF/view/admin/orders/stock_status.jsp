<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="utf-8">


<body id="page-top">


	
	<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>${storeName} 재고현황
			</h3>
	</div>

		

		<table class="table" width="500">
			<thead>
				<tr>
					<td width="100" align="center">분 &nbsp; &nbsp; &nbsp; 류</td>
					<td width="100" align="center">품 &nbsp; &nbsp; &nbsp;목</td>
					<td width="100" align="center">보유 재고</td>
				</tr>
			</thead>

			<tr>
				<td width=100 align="center">재 &nbsp; &nbsp; &nbsp; 료</td>
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
				<td width=100 align="center">식 &nbsp; &nbsp; &nbsp; 품</td>
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
				<td width="100" align="center">상 &nbsp; &nbsp; &nbsp; 품</td>
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

</body>

</html>