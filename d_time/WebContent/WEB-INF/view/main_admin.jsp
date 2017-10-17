<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
ul,li,or { list-style:none; padding-top:5px;}
</style>
	<meta charset="utf-8">
		<div class="col-lg-12">
			<div class="row margin-bottom">
				<%-- <div class="col-lg-3 col-md-6">
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
				</div> --%>
<div class="col-lg-3 col-md-4">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong><span style="color: #5c7c97"><i
									class="fa fa-desktop"></i></span> 매장 </strong>
						</div>
						<div class="admin_area">
							<dl>
								<dt>
									<a href="/d_time/store_list.do?type=zik"><i class="fa fa-user-circle-o fa-4x" aria-hidden="true"></i></a><br>직영점<br>
									<span>${store1}지점</span>
								</dt>
								<dt>
									<a href="/d_time/store_list.do?type=ga"><i class="fa fa-user-o fa-4x" aria-hidden="true"></i></a><br>가맹점<br>
									<span>${store2}지점</span>
								</dt>
							</dl>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong> <span style="color: #5c7c97"> <i
									class="fa fa-area-chart"></i>
							</span>Best 3
							</strong> <a class="plus" href="/d_time/sale.do"><i class="fa fa-plus"></i></a>
						</div>
						<div class="panel-body info_area">
							<c:forEach var="store" items="${best_store}" varStatus="status">
							<li><a href="#">${status.count}위 : &nbsp; ${store.s_name}</a> <span
									class="date_visit">매출액 :&nbsp;${store.sel_cost}</span></li>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong> <span style="color: #5c7c97"> <i
									class="fa fa-volume-up"></i>
							</span> 공지사항
							</strong> <a class="plus" href="/d_time/all/notice/notice_list.do"><i class="fa fa-plus"></i></a>
						</div>
						<div class="visit_area">
							<ul>
							<c:forEach var="notice" items="${notice_list}">
							<li><a href="/d_time/all/notice/notice_detail.do?n_no=${notice.n_no}"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>${notice.n_title}</a> <span
									class="date_visit"><fmt:formatDate value="${notice.n_date}"
									pattern="yyyy.MM.dd HH:mm" /></span></li>
							
							</c:forEach>
							
								
							</ul>
						</div>
					</div>
				</div>

				

			</div>
		</div>
		<div class="col-lg-12">
			<div class="row margin-bottom">
			<div class="col-lg-4 col-md-4">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong> <span style="color: #5c7c97"> <i
									class="fa fa-table"></i>
							</span>최근 발주 내역
							</strong> <a class="plus" href="/d_time/store_order.do"><i class="fa fa-plus"></i></a>
						</div>
						<div class="panel-body visit_area">
							<ul class="main_order">
							<c:forEach var="order" items="${orders}">
							<li><span
									class="date_visit"><fmt:formatDate value="${order.o_date}"
									pattern="yyyy.MM.dd HH:mm"/></span>&nbsp;<a href="/d_time/order_detail.do?o_no=${order.o_no}&pageNum=1"><i
										class="fa fa-angle-right color_arrow margin_right"
										aria-hidden="true"></i>${order.s_name}의 ${order.o_no}번 발주 신청</a> </li>
							
							</c:forEach>
							
							
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-4">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong> <span style="color: #5c7c97"> <i
									class="fa fa-volume-up"></i>
							</span>커뮤니티
							</strong> <a class="plus" href="/d_time/board_list.do?type=건의사항"><i class="fa fa-plus"></i></a>
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
									<c:forEach var="board" items="${board_list}"  varStatus="status">
								<tr onClick='javascript:location.href="board_detail.do?b_no=${board.b_no}&type=${board.b_type}&pageNum=1"'>
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
			
				
				
			
				<!-- <div class="col-lg-3 col-md-4">
					<a href="/d_time/store_list.do"
						class="btn btn-default btn-lg btn-block margin-bottom02"> <i
						class="fa fa-cogs fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 지점관리
					</a> <a href="/d_time/sale.do"
						class="btn btn-default btn-lg btn-block none_margin-right"> <i
						class="fa fa-fw fa-area-chart fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 매출현황
					</a>
				</div>
				
			  	필요한 뷰포트에만 clearfix 를 추가하세요
			  	<div class="clearfix visible-xs-block"></div>
				<div class="col-lg-3 col-md-4">
					<a  href="/d_time/store_order.do"
						class="btn btn-default btn-lg btn-block margin-bottom02"> <i
						class="fa fa-fw fa-table fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 발주현황
					</a> <br>
					<a href="/d_time/admin/product/product_list.do"
						class="btn btn-default btn-lg btn-block none_margin-right"> <i
						class="fa fa-fw fa-wrench fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 물품관리
					</a>
				</div> -->
			</div>

		</div>

</html>
