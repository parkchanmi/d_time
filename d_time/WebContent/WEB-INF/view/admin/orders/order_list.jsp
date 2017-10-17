<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	var s_no = '${s_no}';

	function store_change(store_no) {
		location.href = "/d_time/store_order.do?s_no=" + store_no;
	}

	$(function() {
		if (s_no) {
			$('.nav li').removeClass('active');
			$('#order_list').addClass('active');
			$('.table-responsive').removeClass('disN');
			//$('.order_list').addClass('disN');
		} else {
			$('.nav li').removeClass('active');
			$('#order_ing').addClass('active');
			$('.table-responsive').removeClass('disN');
			$('.order_list').addClass('disN');

		}
		$('.nav li').click(function() { // nav bar 메뉴 클릭 했을 때,
			if (!$(this).hasClass('active')) { // 액티브를 가지고 있지 않을 때만 처리. 가지고 있을땐 필요없으니까.
				$('.nav li').removeClass('active'); // 메뉴 전체 active 클래스 삭제.
				$(this).addClass('active'); // 내가 누른 li 에만 active 클래스 추가.

				var clicked_li_id = $(this).attr('id');
				console.log(clicked_li_id);

				$('.table-responsive').addClass('disN');

				$('.' + clicked_li_id).removeClass('disN');

			}
		});

	});
</script>
<meta charset="utf-8">
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-th-large"></i>발주관리
		</h3>
		<h3 class="board-listtotal" style="position:relative; top:0">
				<i class="fa fa-list-ul" aria-hidden="true"></i> 전체글 : ${count}
			</h3>
	</div>

	<!-- /.col-lg-12 -->
	<div class="col-lg-12">
		<div class="text-right active fl-left">


			<!-- Nav tabs -->
			<ul class="nav nav-tabs in">
				<li id="order_ing"><a href="store_order.do">발주대기함<i
						class="fa fa-angle-down"></i></a></li>
				<li id="order_list"><a href="javascript:void(0);">지점발주현황 <i
						class="fa fa-angle-down"></i>
				</a></li>
				<div class="table-responsive disN order_list">
					<select name="f_no" id="f_no" class="form-control select_box_style"
						onchange="store_change(this.value);">
						<option value="0">지점명을 선택하세요</option>
						<c:forEach var="storelist" items="${storelist}">
							<option value="${storelist.s_no}"
								${s_no == storelist.s_no ? "selected" :""}>${storelist.s_name}</option>
						</c:forEach>
					</select>
				</div>

			</ul>

		</div>
		<!--발주대기함-->
		<br>
		<div class="table-responsive marginT20 order_ing">
			<c:if test="${count == 0}">
					<table class="table table-striped table-hover table-bordered_tB" style="display:inline-table; margin-top:14px; ">
						<tr> 
							<td align="center">발주 신청 내역이 없습니다.</td>
						</tr>
					</table>
				</c:if>
			<c:if test="${count > 0}">
			
			<table class="table table-striped table-hover table-bordered_tB">

				<thead>
					<tr>
						<th>No.</th>
						<th>발주번호</th>
						<th>제목</th>
						<th>지점명</th>
						<th>상태</th>
					</tr>
				</thead>
				<c:forEach var="orderslist" items="${list}">
					<c:if test="${number > 0 }">
						<tr>

							<td><c:out value="${number}" /> <c:set
									var="number" value="${number-1 }" /></td>
							<td>${orderslist.o_no}</td>
							<td>
							<a
								href="/d_time/order_detail.do?o_no=${orderslist.o_no}&pageNum=${pageNum}"><fmt:formatDate
										value="${orderslist.o_date}" type="date" dateStyle="long" />
									발주 신청 내역 </a></td>
							<td>${orderslist.s_name}</td>
							<td>${orderslist.o_state}</td>
						</tr>

					</c:if>
				</c:forEach>
			</table>
			</c:if>
		</div>
	</div>
	<div style="clear: both;"></div>
	
	<div align="center" class="col-lg-10" style="margin-bottom: 25px;">
	<ul class="pagination-01">
		<c:if test="${count > 0}">
			<c:set var="pageCount"
				value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
			<c:set var="pageBlock" value="${10}" />
			<fmt:parseNumber var="result" value="${currentPage / 10}"
				integerOnly="true" />
			<c:set var="startPage" value="${result * 10 + 1}" />
			<c:set var="endPage" value="${startPage + pageBlock-1}" />
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>
		<c:if test="${s_no==null}">
			<c:if test="${startPage > 10}">
				<li><i class="fa fa-angle-left"></i><a href="store_order.do?pageNum=${startPage-10}"></a></li>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li class="paginate_button"><a href="store_order.do?pageNum=${i}">${i}</a></li>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<li><i class="fa fa-angle-right"></i><a href="store_order.do?pageNum=${startPage + 10}"></a></li>
			</c:if>
		</c:if>
	
		<c:if test="${s_no!=null}">
			<c:if test="${startPage > 10}">
				<li><i class="fa fa-angle-left"></i><a href="store_order.do?s_no=${s_no}&pageNum=${startPage-10}"></a></li>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li class="paginate_button"><a href="store_order.do?s_no=${s_no}&pageNum=${i}">${i}</a></li>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<li><i class="fa fa-angle-right"></i><a href="store_order.do?s_no=${s_no}&pageNum=${startPage + 10}"></a></li>
			</c:if>
		</c:if>
	</c:if>
	</ul>
	</div>
	<!-- /.panel -->

</div>



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
