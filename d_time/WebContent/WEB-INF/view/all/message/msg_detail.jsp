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
				<i class="fa fa-th-large"></i>쪽지 상세보기
			</h3>
		</div>
		<div class="col-lg-4">
			<div class="panel panel-main border-0 box-shadow-none">

				<div class="col-lg-10" style="padding: 20px 0">
					<div
						class="media media-services scrollpoint sp-effect2 active animated fadeInRight"
						style="height: 42%">
						<div class="media-body">
							<table width="1000" class="table" align="center">
								<tr height="30">
									<th width="20%" class="font-size-15 msg-table ">제목</th>
									<td width="40%" class="font-size-15 msg-table">${msg_detail.msg_title}</td>

									<th class="font-size-15 msg-table ">보낸사람</th>
									<td class="font-size-15 msg-table ">${msg_detail.sen_sname}</td>
								</tr>

								<tr height="30">
									<th class="font-size-15 msg-table ">시간</th>
									<td class="font-size-15 msg-table ">${msg_detail.msg_date}</td>
									<th class="font-size-15 msg-table ">받은사람</th>
									<td class="font-size-15 msg-table ">${msg_detail.rcv_sname}</td>
								</tr>

								<tr>
									<th class="font-size-15">글내용</th>
									<td width="375" height="400" colspan="3" class="font-size-15"><pre>${msg_detail.msg_content}</pre></td>
								</tr>
								<tr height="30">
								</tr>
							</table>
						</div>
						<div class="msg-write-sentbtn ">
							<c:if test="${type=='receivebox'}">
								<input type="button" value="목록보기" class="btn btn-board"
									onClick="window.location='/d_time/msg_receive_list.do'">
							</c:if>
							<c:if test="${type=='sendbox'}">
								<input type="button" value="목록보기" class="btn btn-board"
									onClick="window.location='/d_time/msg_send_list.do'">
							</c:if>
							<input type="button" value="삭제" class="btn btn-download"
								OnClick="window.location='/d_time/Msg_delete.do?msg_no=${msg_detail.msg_no}'">
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>