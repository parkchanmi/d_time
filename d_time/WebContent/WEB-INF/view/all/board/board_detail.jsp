<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<script>
		function delete_check(n_no) {
			if (confirm("공지를 삭제하시겠습니까??") == true) {
				location.href = '/d_time/admin/notice/notice_delete.do?n_no='
						+ n_no;
			}
		}
	</script>

	<div class="panel panel-main">
		<div class="panel-heading">
			<strong> 글 상세보기 </strong>
		</div>
		<div class="visit_area">
			<ul>
			<input type=hidden name="mem_no" value="${login.mem_no}">

				<li>제목&nbsp;<i
					class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>${board.b_title} <span class="date_visit"></span></li>
				<li>작성자&nbsp;<i
					class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>${board.s_name} <span class="date_visit"></span></li>

				<li>내용&nbsp;<i
					class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>${board.b_content} <span class="date_visit"></span></li>

			</ul>
		</div>
	</div>
	<br>
	<div style="float: right;">
		<input type="button" value="목록보기"
			OnClick="window.location='board_list.do?type=${type}&pageNum=${pageNum}'">
		<c:if test="${login.mem_no==board.mem_no}">
			<input type="button" value="수정"
				OnClick="window.location='/d_time/board_modifyForm.do?b_no=${board.b_no}&type=${type}&pageNum=${pageNum}'">
			<input type="button" value="삭제"
				OnClick="window.location='/d_time/board_delete.do?b_no=${board.b_no}&type=${type}'">


		</c:if>
	</div>



	<br>
	
	<table width="600" border="1" cellspacing="0" cellpadding="0"
		align="center">
		<c:forEach var="reviewlist" items="${reviewlist}">
			<tr>
				<td align="center" width="70">${reviewlist.s_name}</td>
				<td>${reviewlist.r_content}</td>
				<td><fmt:formatDate value="${reviewlist.r_date}" type="date"
						dateStyle="short" /></td>
			</tr>
		</c:forEach>

	</table>

	<form method="POST">
		<table width="600" border="1" cellspacing="0" cellpadding="0"
			align="center">
			<tr>
				<td align="center" width="70">댓글</td>
				<td><input type="text" name="r_content" size="60"></td>
				<td colspan=2 align="center"><input type="submit" value="댓글등록">
				</td>
			</tr>

		</table>
	</form>








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
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>