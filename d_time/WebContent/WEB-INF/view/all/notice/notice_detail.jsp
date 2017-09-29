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
	
	<div class="panel panel-main">
		<div class="panel-heading">
			<strong> 공지 글 상세보기 </strong>
		</div>
		<div class="visit_area">
			<ul>

				<li>제목&nbsp;<i
					class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>${ndto.n_title} <span class="date_visit"></span></li>
				<li>내용&nbsp;<i
					class="fa fa-angle-right color_arrow margin_right"
					aria-hidden="true"></i>${ndto.n_content} <span class="date_visit"></span></li>

				<c:if test="${ndto.f_no!=0}">
					<li>첨부파일&nbsp;<i
						class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>${fname} <span class="date_visit">
							<button class="btn btn-default"
								onclick="javascript:location.href='/d_time/all/notice/download.do?f_no=${ndto.f_no}'">다운로드</button>
					</span></li>

				</c:if>
			</ul>
		</div>
	</div>
	<br>
	<div style="float:right;">
			<button class="btn btn-default"
				onclick="javascript:location.href='/d_time/all/notice/notice_list.do'">목록</button>
			<c:if test="${login.mem_type=='관리자'}">
				<button class="btn btn-default"
					onclick="javascript:location.href='/d_time/admin/notice/notice_modify.do?n_no=${ndto.n_no}'">수정</button>
				<button class="btn btn-default"
					onclick="delete_check(${ndto.n_no});">삭제</button>
			</c:if>
		</div>





</body>
