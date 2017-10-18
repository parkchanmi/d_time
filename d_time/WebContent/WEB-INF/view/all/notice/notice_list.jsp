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
				<div class="table-responsive marginT20 order_ing">
					<div class="col-lg-12">
						<h3 class="board-listtotal" style="position:relative; top:7px;">
						<i class="fa fa-list-ul" aria-hidden="true"></i> 전체글 : ${count}</h3>
						<c:if test="${login.mem_type=='관리자'}">
							<button class="write-btn-css btn btn-confirm-blue"
								style="float: right;"
								onclick="javascript:location.href='/d_time/admin/notice/notice_write.do'">
								글쓰기<i class="fa fa-pencil-square-o color-write"
									aria-hidden="true"></i>
							</button>
						</c:if>
					
					</div>
					

					<c:if test="${count == 0}">
						<table class="table table-striped table-hover table-bordered_tB">
							<tr>
								<td align="center">게시판에 저장된 글이 없습니다.</td>
							</tr>
						</table>
					</c:if>
					<c:if test="${count > 0}">

						<table class="table table-striped table-hover table-bordered_tB"
							style="display: inline-table; margin-top: 14px;">

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
										 <td><c:out value="${number}" /> <c:set var="number"
                        value="${number - 1}" /></td>
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
					<br /> <br />
					<div class="text-center">
						<ul class="pagination-01">
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
									<li><i class="fa fa-angle-left"></i><a
										href="notice_list.do?pageNum=${startPage-10}"></a></li>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<li class="paginate_button"><a
										href="notice_list.do?pageNum=${i}">${i}</a></li>
								</c:forEach>

								<c:if test="${endPage < pageCount}">
									<li><i class="fa fa-angle-right"></i><a
										href="notice_list.do?pageNum=${startPage + 10}"></a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
					<div class="search-area">
				         <form action="/d_time/notice_search.do" method="post" >
				            <select class="form-control select_box_style-menu"  id="searchOption" name="searchOption" style=" width: 29%; float: left;">
				               <option value="n_title">제목</option>
				               <option value="n_content">내용</option>
				               <option value="all">제목+내용</option> 
				            </select> 
				         	 <input class="form-control input-sm position-input-search" type="text" id="keyword"  name="keyword" required/> 
							<button class="btn-search-board btn"  type="submit">
								<i class="fa fa-search size-search" aria-hidden="true"></i>
							 </button>
				         </form>
     				 </div>
				
				
				</div>
			</div>
		</div>
	</div>
</body>
