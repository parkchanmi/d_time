<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<h3>공지사항</h3>
	<br>

	<div class="panel-body">
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
			<br/><br/>
	<c:if test="${login.mem_type=='관리자'}">
	
		<button class="btn btn-default"
			onclick="javascript:location.href='/d_time/admin/notice/notice_write.do'">글쓰기</button>
	</c:if>
		</div>
	</div>


</body>
