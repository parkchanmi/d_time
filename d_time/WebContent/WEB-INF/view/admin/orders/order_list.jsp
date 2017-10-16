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
		</div>

		<!-- /.col-lg-12 -->
		<div class="col-lg-12">
			<div class="text-right active fl-left">


				<!-- Nav tabs -->
				<ul class="nav nav-tabs in">
					<li id="order_ing" ><a href="store_order.do">발주대기함<i
							class="fa fa-angle-down"></i></a></li>
					<li id="order_list"><a href="javascript:void(0);">지점발주현황 <i
							class="fa fa-angle-down"></i>
					</a></li>
					<div class="table-responsive disN order_list">
						<select name="f_no" id="f_no"
							class="form-control select_box_style" onchange="store_change(this.value);">
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
			<div class="table-responsive order_ing">
				<table class="table table-striped table-hover table-bordered_tB">
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>지점명</th>
							<th>상태</th>
						</tr>
					</thead>
					<c:forEach var="ordlist" items="${ordersList}" varStatus="status">
						<tr id="132582" style="cursor: pointer;"
							onClick=" location.href='order_detail.do?o_no=${ordlist.o_no} & s_no=${ordlist.s_no}' "
							onMouseOver=" window.status = 'order_detail.do' "
							onMouseOut=" window.status = '' ">

							<td>${status.count}</td>
							<td><fmt:formatDate
                           value="${ordlist.o_date}" type="date" dateStyle="long" />신청내역</td>
							<c:forEach var="storelist" items="${storelist}">
								<c:if test="${ordlist.s_no == storelist.s_no}">
									<td>${storelist.s_name}</td>
								</c:if>
							</c:forEach>
							<td>${ordlist.o_state}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
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
