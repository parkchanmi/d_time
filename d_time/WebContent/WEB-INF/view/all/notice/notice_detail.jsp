<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<script>
function delete_check(n_no){
	if(confirm("공지를 삭제하시겠습니까??") == true){
		location.href='/d_time/admin/notice/notice_delete.do?n_no='+n_no;
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
						<strong> 공지 글 상세보기 </strong>
					</div>
					<div class="board-notice height-fix"> 
						<ul>
							<li class="padding-left-10 clear-both margin-bottom20">
								<i class="fa fa-angle-right color_arrow margin_right fl-left" aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">제목 : </h3>
								 <h4 class="board-text">${ndto.n_title}</h4>
							</li>
							<li class="padding-left-10 clear-both margin-bottom20">
								<i class="fa fa-angle-right color_arrow margin_right fl-left" aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left">내용 : </h3>
								<h4 class="board-text">${ndto.n_content}</h4>
							</li>
						</ul>
						<c:if test="${ndto.f_no!=0}">
							<div class="file-box" style="position:absolute; bottom:0px">
								<div class="file-box-title fl-left">
									<i class="fa fa-angle-right color_arrow margin_right fl-left" aria-hidden="true"></i>
									<h3 class="fl-left menu-board-notice text-left margin-bottom0">첨부파일 : </h3>
									<h4 class="board-text fl-left margin-right-num">${fname}</h4>
								</div>
								<button class="btn btn-download" onclick="javascript:location.href='/d_time/all/notice/download.do?f_no=${ndto.f_no}'">다운로드
									<i class="fa fa-download" aria-hidden="true"></i>
								</button>
							</div>
						</c:if>
						
					</div> 
				</div>
				<br>
				<div class="btn-3-board">
					<button class="btn btn-board"
						onclick="javascript:location.href='/d_time/all/notice/notice_list.do'">목록</button>
					<c:if test="${login.mem_type=='관리자'}">
						<button class="btn btn-board"
							onclick="javascript:location.href='/d_time/admin/notice/notice_modify.do?n_no=${ndto.n_no}'">수정</button>
						<button class="btn btn-download"
							onclick="delete_check(${ndto.n_no});" style="padding:9px 14px !important;">삭제</button>
					</c:if>
				</div>
			</div>
		</div>

</body>
