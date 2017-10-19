<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.all.member.Member_DAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<title>쪽지함</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>받은 쪽지함
			</h3>
		</div>

		<div class="col-lg-12">
			<div class="panel-body">
				<div class="table-responsive marginT20 order_ing">



					<c:if test="${count == 0}">
						<table width="700" border="1" cellpadding="0" cellspacing="0">
							<tr>
								<td align="center">게시판에 저장된 글이 없습니다.</td>
							</tr>
						</table>
					</c:if>



					<table class="table table-striped table-hover table-bordered_tB"
						style="display: inline-table; margin-top: 14px;">
						<thead>
							<tr>

								<th width="25%">날짜</th>
								<th width="30%">제목</th>
								<th width="15%">보낸사람</th>
								<th width="15%">받는 사람</th>
								<th width="15%">상태</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="msglist" items="${list}">


								<tr>
									<td>${msglist.msg_date}</td>
									<td><a
										href="msg_detail.do?msg_no=${msglist.msg_no}&type=receivebox">${msglist.msg_title}</a></td>

									<td>${msglist.sen_sname}</td>
									<td>${msglist.rcv_sname}</td>

									<c:if test="${msglist.msg_state == 1}">
										<td>읽음</td>
									</c:if>

									<c:if test="${msglist.msg_state == 0}">
										<td class="color-icon-sell">읽지 않음</td> 
									</c:if>

								</tr>

							</c:forEach>
						</tbody>
					</table>

					<!-- Bootstrap core JavaScript -->
					<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
					<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
					<script
						src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>




				</div>
			</div>
		</div>
	</div>
	
	

</body>
</html>