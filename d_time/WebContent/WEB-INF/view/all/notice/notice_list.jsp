<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>공지사항
			</h3>
		</div>
		<div class="col-lg-12">
			<div class="panel-body">
				<div class="table-responsive">
					<table width="1500">

						<tr>
							<td>전체글 : ${count}</td>
						</tr>
					</table>
					<c:if test="${count == 0}">
						<table class="table table-striped table-hover table-bordered_tB">
							<tr>
								<td align="center">게시판에 저장된 글이 없습니다.</td>
							</tr>
						</table>
					</c:if>
					<c:if test="${count > 0}">

						<div class="table-responsive">
							<table class="table table-striped table-hover ">
								<thead>
									<tr>
										<th>No</th>
										<th>제목</th>
										<th>날짜</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="notice" items="${nlist}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td><a
												href="/d_time/all/notice/notice_detail.do?n_no=${notice.n_no}">${notice.n_title}</a></td>
											<td><fmt:formatDate value="${notice.n_date}"
													pattern="yyyy.MM.dd HH:mm" /></td>
											<td>${notice.n_count}</td>

										</tr>
									</c:forEach>

								</tbody>
							</table>
					</c:if>
					<br />
					<br />
					<center>
						<c:if test="${count > 0}">
							<c:set var="pageCount"
								value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
							<c:set var="pageBlock" value="${10}" />
							<fmt:parseNumber var="result" value="${currentPage / 10}"
								integerOnly="true" />
							<c:set var="startPage" value="${result * 10 + 1}" />
							<c:set var="endPage" value="${startPage + pageBlock-1}" />
							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>

							<c:if test="${startPage > 10}">
								<a href="notice_list.do?pageNum=${startPage-10}">[이전]</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<a href="notice_list.do?pageNum=${i}">[${i}]</a>
							</c:forEach>

							<c:if test="${endPage < pageCount}">
								<a href="notice_list.do?pageNum=${startPage + 10}">[다음]</a>
							</c:if>
						</c:if>
					</center>
					<c:if test="${login.mem_type=='관리자'}">

						<button class="btn btn-default"
							onclick="javascript:location.href='/d_time/admin/notice/notice_write.do'">글쓰기</button>
					</c:if>
				</div>
			</div>
			</div>
			</div>
		
</body>
