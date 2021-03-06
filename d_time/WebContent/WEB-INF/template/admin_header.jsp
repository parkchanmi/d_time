<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/d_time/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="utf-8">

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="/d_time/main_admin.do">Cafe. CiCHA</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item user-head" data-toggle="tooltip"
					data-placement="right" title="Dashboard"><a href="/d_time/myinfo.do"
					class="nav-link float-left" > <i
						class="fa fa-user-circle-o fa-4x"></i>
				</a>
					<div class="user-name">
					<c:if test="${login==null}">
					<script>
						location.href="/d_time/logout.jsp";
					</script>
					</c:if>
						<h5>
							<a>${login.mem_type}</a>
						</h5>
						<span><a>${login.mem_name }님</a></span>
					</div></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents01" data-parent="#exampleAccordion"> <i
						class="fa fa-cogs"></i> <span class="nav-link-text">지점관리</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents01">
						<li><a href="/d_time/store_list.do">지점목록</a></li>
						<li><a href="/d_time/store_regist.do">지점등록</a></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts"><a href="/d_time/sale.do" class="nav-link"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">매출현황</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables"><a class="nav-link" href="/d_time/store_order.do"> <i
						class="fa fa-fw fa-table"></i> <span class="nav-link-text">발주현황</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Components"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents04" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-wrench"></i> <span class="nav-link-text">물품관리</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents04">
						<li><a href="/d_time/admin/product/product_list.do">재고물품</a></li>
						<!-- <li><a href="">물품등록</a></li> -->
						<li><a href="/d_time/admin/menu/menu_list.do">주문메뉴</a></li>
						<li><a href="/d_time/admin/menu/menu_add.do">메뉴등록</a></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Components"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents05" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-wrench"></i> <span class="nav-link-text">게시판</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents05">
						<li><a href="/d_time/all/notice/notice_list.do">공지사항</a></li>
						<c:forEach var="board_type" items="${typelist}">
						<li><a href="/d_time/board_list.do?type=${board_type.board_type}">${board_type.board_type}</a></li>
						</c:forEach>
						<li><a href="/d_time/admin/board_manage.do?">게시판관리</a></li>
					</ul></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-envelope"></i> <span
						class="d-lg-none">Messages <span
							class="badge badge-pill badge-primary">12 New</span>
					</span> <!-- <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span> -->
				</a>
					<div class="dropdown-menu" aria-labelledby="messagesDropdown">
					<h6 class="dropdown-header">Message</h6>
					
						
						<div class="dropdown-divider"></div>
						
						
						<a class="dropdown-item small" href="/d_time/msg_writeForm.do">쪽지 쓰기</a>
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="/d_time/msg_send_list.do">보낸 쪽지함</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-cog fa-fw"></i> <span
						class="d-lg-none">Alerts <span
							class="badge badge-pill badge-warning">6 New</span>
					</span> <span class="indicator text-warning d-none d-lg-block"> </span>
				</a>
					<div class="dropdown-menu" aria-labelledby="alertsDropdown">
						
						<a class="dropdown-item small" href="/d_time/myinfo.do">현재시간:<%
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH:mm a");
 String today = formatter.format(new java.util.Date());
 out.println(today);
%></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="/d_time/myinfo.do">My page</a>
				
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="/d_time/logout.do"> 
								<strong> Logout
							</strong>
					
							
						</a>
						
						
					</div></li>
				
			</ul>
		</div>
	</nav>
