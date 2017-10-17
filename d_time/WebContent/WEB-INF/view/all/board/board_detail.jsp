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
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>상세보기
			</h3>
		</div>
		<div class="col-lg-7">
			<div class="panel panel-main">
					<div class="panel-heading">
						<strong>글 상세보기 </strong>
					</div>
					<div class="board-notice height-fix">
						<ul>
							<input type=hidden name="mem_no" value="${login.mem_no}">
							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-angle-right color_arrow margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">제목 :</h3>
								<h4 class="board-text display-inherit">${board.b_title}</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-angle-right color_arrow margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">작성자 :</h3>
								<h4 class="board-text display-inherit">${board.s_name}</h4></li>
							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-angle-right color_arrow margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">내용 :</h3>
								<h4 class="board-text display-inherit">${board.b_content}</h4></li>
						</ul>
					</div>
					
					<div class="file-box">
					
						<form method="POST">
							<div class="comment-box fl-left">
								<input type=hidden name="mem_no" value="${login.mem_no}">
								<i class="fa fa-commenting-o color_arrow margin_right fl-left" aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left margin-bottom0 width-8 comment-tit-text">댓글</h3>
								<h4 class="comment-text fl-left margin-right-num">
									<input type="text" maxlength="50" class="form-control" name="r_content">
								</h4>
								
								<button class="btn btn-download position-ab" type="submit">등록
									<i class="fa fa-check-square-o" aria-hidden="true"></i>
								</button>
							</div> 
						</form>
						
						<c:forEach var="reviewlist" items="${reviewlist}">
							<div class="comment-box-complete fl-left">
								<i class="fa fa-comments-o color_arrow margin_right fl-left" aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left margin-bottom0 width-8 comment-tit-text">${reviewlist.s_name}</h3>
								<h4 class="comment-box-contents fl-left margin-right-num">${reviewlist.r_content}</h4>
								<c:if test="${login.mem_no==reviewlist.mem_no}">
									<a href="#" class="position-ab" OnClick="window.location='/d_time/board_deletereview.do?r_no=${reviewlist.r_no}&b_no=${board.b_no}&type=${type}&pageNum=${pageNum}'">
										<i class="fa fa-times-circle size-17px-icon delete-circle" aria-hidden="true"></i>
									</a>
								</c:if>
								<h4 class="comment-box-date fl-left margin-right-num"><fmt:formatDate value="${reviewlist.r_date}" type="date"
										dateStyle="short" /></h4>
								
							</div>
							<%-- <tr>
								<td align="center" width="70">${reviewlist.s_name}</td>
								<td>${reviewlist.r_content}</td>
								<td><fmt:formatDate value="${reviewlist.r_date}" type="date"
										dateStyle="short" /></td>
								<td><c:if test="${login.mem_no==reviewlist.mem_no}">
	
										<input type="button" value="삭제"
											OnClick="window.location='/d_time/board_deletereview.do?r_no=${reviewlist.r_no}&b_no=${board.b_no}&type=${type}&pageNum=${pageNum}'">
									</c:if></td>
	
	
							</tr> --%>
						</c:forEach>
						
						
	
					</div>
				
				</div>
				<div class="btn-3-board">
					<button class="btn btn-board"
						OnClick="window.location='board_list.do?type=${type}&pageNum=${pageNum}'">목록</button>
				
					<c:if test="${login.mem_no==board.mem_no}">
						<button class="btn btn-board"
							OnClick="window.location='/d_time/board_modifyForm.do?b_no=${board.b_no}&type=${type}&pageNum=${pageNum}'">수정</button>
						<button class="btn btn-download"
							OnClick="window.location='/d_time/board_delete.do?b_no=${board.b_no}&type=${type}'"style="padding:9px 14px !important;">삭제</button>
						
					</c:if>
					<c:if test="${login.mem_type=='관리자'}">
						<button class="btn btn-board"
							OnClick="window.location='/d_time/board_modifyForm.do?b_no=${board.b_no}&type=${type}&pageNum=${pageNum}'">수정</button>
						<button class="btn btn-download"
							OnClick="window.location='/d_time/board_delete.do?b_no=${board.b_no}&type=${type}'" style="padding:9px 14px !important;">삭제</button>
						
						<%-- <input type="button" value="수정"
							OnClick="window.location='/d_time/board_modifyForm.do?b_no=${board.b_no}&type=${type}&pageNum=${pageNum}'">
						<input type="button" value="삭제"
							OnClick="window.location='/d_time/board_delete.do?b_no=${board.b_no}&type=${type}'"> --%>


					</c:if>


				</div>



				<br>

				
<%-- 
				<form method="POST">
					<input type=hidden name="mem_no" value="${login.mem_no}">
					<table width="600" border="1" cellspacing="0" cellpadding="0"
						align="center">
						<tr>
							<td align="center" width="70">댓글</td>
							<td>
							
							<input type="text" name="r_content" size="60"></td>
							<td colspan=2 align="center"><input type="submit"
								value="댓글등록"></td>
						</tr>
					</table>
				</form> --%>



			</div>
		</div>
</body>





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