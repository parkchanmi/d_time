<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	var type = '${type}';

	$(function() {
		if (type == 'all') {
			$('.nav li').removeClass('active');
			$('#store_all').addClass('active');
		} else if (type == 'zik') {
			$('.nav li').removeClass('active');
			$('#store_zik').addClass('active');

		} else if (type == 'ga') {
			$('.nav li').removeClass('active');
			$('#store_ga').addClass('active');
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
			<i class="fa fa-th-large"></i>지점관리
		</h3>
	</div>
	<div class="col-lg-12" style="margin-bottom: 25px;">
		<div class="text-right active fl-left width100">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs-menu in">
				<li id="store_all"><a href="/d_time/store_list.do?type=all">전체<i
						class="fa fa-angle-down"></i></a></li>
				<li id="store_zik"><a href="/d_time/store_list.do?type=zik">직영<i
						class="fa fa-angle-down"></i>
				</a></li>
				<li id="store_ga"><a href="/d_time/store_list.do?type=ga">가맹
						<i class="fa fa-angle-down"></i>
				</a></li>
			</ul>
		</div>
	</div>
 
	<div class="col-lg-12 margin-bottom20">
		<a class="write-btn-css btn btn-confirm-blue" style="float: right;"
			href="/d_time/store_regist.do">지점등록<i
			class="fa fa-pencil-square-o color-write" aria-hidden="true"></i></a>
	</div>
	<!-- /.col-lg-12 -->
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="marginR5"><i class="fa fa-check-square-o"></i></span>

			</div>
			<!-- /.panel-heading -->
			<div class="panel-body" style="padding: 0px;">

				<div class="table-responsive">


					<table class="table table-striped table-hover table-bordered_tB">
						<thead>
							<tr>
								<th>No.</th>
								<th>지점명</th>
								<th>담당자</th>
							</tr>
						</thead>
						<%-- <c:forEach var="stlist" items="${storelist}">
										<c:forEach var="memlist" items="${memlist}">
												<c:if test="${memlist.s_no == stlist.s_no}">
													<tr id="132582">
														<td>${stlist.s_no}</td>
														<td><a href="store_info.do?s_no=${stlist.s_no}">${stlist.s_name}</a></td>
														<td>${memlist.mem_name}</td>
													</tr>
												</c:if>
												
													<tr id="132582">
														<td>${stlist.s_no}</td>
														<td><a href="store_info.do?s_no=${stlist.s_no}">${stlist.s_name}</a></td>
														<td></td>
													</tr>
										</c:forEach>
									</c:forEach> --%>
						<c:forEach var="stlist" items="${storelist}" varStatus="status">
							<tr id="132582">
								<td>${status.count}</td>
								<td><a href="store_info.do?s_no=${stlist.s_no}">${stlist.s_name}</a></td>
								<c:forEach var="memlist" items="${memlist}">
									<c:if test="${memlist.s_no == stlist.s_no}">
										<td id="132582">${memlist.mem_name}</td>
									</c:if>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<!-- /.panel-body -->
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

