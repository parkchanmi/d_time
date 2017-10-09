<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
<meta charset="utf-8">



		<div class="col-lg-12">
			<div class="row margin-bottom">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong><span style="color: #5c7c97"><i
									class="fa fa-desktop"></i></span>회원</strong>
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
									class="date_visit"><fmt:formatDate value="${notice.n_date}" pattern="yyyy.MM.dd HH:mm"/></span></li>
							
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

				<div class="col-lg-3 col-md-4">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong><span style="color: #5c7c97"><i
									class="fa fa-user"></i></span> 매장 </strong>
						</div>
						<div class="admin_area">
							<dl>
								<dt>
									<i class="fa fa-user-circle-o fa-4x" aria-hidden="true"></i></i><br>직영점<br>
									<span>${store1}지점</span>
								</dt>
								<dt>
									<i class="fa fa-user-o fa-4x" aria-hidden="true"></i><br>가맹점<br>
									<span>${store2}지점</span>
								</dt>
							</dl>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="col-lg-12">
			<div class="row margin-bottom">
				<div class="col-lg-6 col-md-4">
					<div class="panel panel-main">
						<div class="panel-heading">
							<strong> <span style="color: #5c7c97"> <i
									class="fa fa-volume-up"></i>
							</span>커뮤니티
							</strong> <a class="plus" href="/d_time/board_list.do?type=1"><i class="fa fa-plus"></i></a>
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
								<tr>
											<td>${status.count}</td>
											<td>${board.b_type }</td>
											<td><a href="board_detail.do?b_no=${board.b_no}&type=1&pageNum=1">${board.b_title}</a></td>
											<td>${board.mem_no}</td>
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
				<div class="col-lg-3 col-md-4">
					<a href="/d_time/sell/sell_main.do"
						class="btn btn-default btn-lg btn-block margin-bottom02"> <i
						class="fa fa-cogs fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 판매하기
					</a> <a href="/d_time/stock_status.do"
						class="btn btn-default btn-lg btn-block none_margin-right"> <i
						class="fa fa-fw fa-wrench fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 재고관리
					</a>
				</div>
				<!-- 
			  	필요한 뷰포트에만 clearfix 를 추가하세요
			  	<div class="clearfix visible-xs-block"></div> -->
				<div class="col-lg-3 col-md-4">
					<a href="/d_time/saleMem.do?s_no=${login.s_no }" 
						class="btn btn-default btn-lg btn-block none_margin-right"> <i
						class="fa fa-fw fa-area-chart fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 매출현황
					</a> 
					<a href="/d_time/orders_list.do"
						class="btn btn-default btn-lg btn-block margin-bottom02"> <i
						class="fa fa-fw fa-table fa-3x color-mainmenu"></i>
						<div class="clearfix visible-xs-block"></div> 발주현황
					</a>
					
				</div>
			</div>


			<!-- 
		<div class="col-lg-6 col-md-6">
			<p class="bs-component">
				<a href="#" class="btn btn-default btn-lg btn-block">Block level button</a>	
			</p>	
		</div> -->
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
	<%-- 	<jsp:include page="footer.jsp"></jsp:include> --%>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>
		<!-- Logout Modal-->
		
