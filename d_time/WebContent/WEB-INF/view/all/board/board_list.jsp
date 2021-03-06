<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<body>
	<div class="row">
		<div class="col-lg-12">
			<c:if test="${keyword==null}">
				<h3 class="page-header">
					<i class="fa fa-th-large"></i>${type}</h3>
			</c:if>
			<c:if test="${keyword!=null}">
				<h3 class="page-header">
					<i class="fa fa-th-large"></i>검색결과:[${keyword}]
				</h3>
			</c:if>
		</div>

			<!-- 글쓰기 버튼 -->
			<%-- <table width="1000">
			<tr>
				<td><a href="board_writeForm.do?type=${type}&pageNum=${pageNum}">글쓰기</a></td>
				<!-- <input type="hidden" name="board_type" value="자유"> -->
			</tr>
		</table>
 --%>

			<%-- <ul class="nav nav-tabs in">
			<!-- Nav tabs -->
			<input type=hidden name="mem_no" value="${login.mem_no}">
			<c:if test="${type=='건의사항'}">
			<li id="order_ing" class="active"><a href="board_list.do?type=1">건의사항<i
					class="fa fa-angle-down"></i></a></li>	
			<li id="order_list"><a href="board_list.do?type=2">물품교환<i
					class="fa fa-angle-down"></i>
			</a></li>
			</c:if>
			<c:if test="${type==2}">
			<li id="order_ing"><a href="board_list.do?type=1">건의사항<i
					class="fa fa-angle-down"></i></a></li>
			<li id="order_list" class="active"><a href="board_list.do?type=2">물품교환<i
					class="fa fa-angle-down"></i>
			</a></li>
			</c:if> 
		</ul>
 --%>
			<!-- 게시판 글없을떄 -->

			<div class="col-lg-12">
				<div class="panel-body">
					<div class="table-responsive marginT20 order_ing">
						<h3 class="board-listtotal">
							<i class="fa fa-list-ul" aria-hidden="true"></i> 전체글 : ${count}
						</h3>


						<!-- 글쓰기 버튼 -->
						<a class="write-btn-css btn btn-confirm-blue"
							style="float: right;"
							href="board_writeForm.do?type=${type}&pageNum=${pageNum}">글쓰기<i
							class="fa fa-pencil-square-o color-write" aria-hidden="true"></i></a>

						<c:if test="${count == 0}">
							<table class="table table-striped table-hover table-bordered_tB"
								style="display: inline-table; margin-top: 14px;">
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
										<th width="10%">No.</th>
										<th width="15%">말머리</th>
										<th width="30%">제목</th>
										<th width="15%">지점명</th>
										<th width="15%">날짜</th>
										<th width="15%">조회수</th>
									</tr>
								</thead>
								<c:forEach var="boardlist" items="${list}">


									<tr id="132582">
										<td><c:out value="${number}" /> <c:set var="number"
												value="${number - 1}" /></td>
										<td>${boardlist.b_type}</td>
										<td><a
											href="board_detail.do?b_no=${boardlist.b_no}&type=${type}&pageNum=${pageNum}">${boardlist.b_title}</a></td>
										<td>${boardlist.s_name}</td>
										<td><fmt:formatDate value="${boardlist.b_date}"
												type="date" pattern="yyyy-MM-dd HH:mm" /></td>
										<td>${boardlist.b_count}</td>
										<%--  
                     <c:forEach var="storelist" items="${storelist}">
                        <c:if test="${ordlist.s_no == storelist.s_no}">
                           <td>${storelist.s_name}</td>
                        </c:if>
                     </c:forEach> --%>

									</tr>

								</c:forEach>
							</table>
						</c:if>
						<div class="text-center">
							<ul class="pagination-01">
								<c:if test="${count > 0}">
									<c:set var="pageCount"
										value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
									<c:set var="pageBlock" value="${5}" />
									<fmt:parseNumber var="result" value="${currentPage / pageBlock}"
										integerOnly="true" />
									<c:set var="startPage" value="${result * pageBlock + 1}" />
									<c:set var="endPage" value="${startPage + pageBlock-1}" />
									<c:if test="${endPage > pageCount}">
										<c:set var="endPage" value="${pageCount}" />
									</c:if>

									<c:if test="${startPage > pageBlock}">
										<li><a
											href="board_list.do?type=${type}&pageNum=${startPage-pageBlock}"><i class="fa fa-angle-left"></i></a></li>
									</c:if>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<li class="paginate_button"><a
											href="board_list.do?type=${type}&pageNum=${i}">${i}</a></li>
									</c:forEach>

									<c:if test="${endPage < pageCount}">
										<li><a
											href="board_list.do?type=${type}&pageNum=${startPage + pageBlock}"><i class="fa fa-angle-right"></i></a></li>
									</c:if>
								</c:if>

							</ul>
						</div>

						<div class="search-area">
							<form action="board_search.do?type=${type}" method="post">
								<select class="form-control select_box_style-menu"
									name="searchOption" style="width: 29%; float: left;">
									<option value="s_name">지점명</option>
									<option value="b_title">제목</option>
									<option value="b_content">내용</option>
									<option value="all">제목+내용</option>
								</select> <input class="form-control input-sm position-input-search"
									type="text" id="keyword" name="keyword" required />

								<button class="btn-search-board btn" type="submit">
									<i class="fa fa-search size-search" aria-hidden="true"></i>
								</button>
							</form>
						</div>

					</div>
				</div>
			</div>

		</div>



	<!-- /.content-wrapper-->

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
	<!-- Bootstrap core JavaScript-->

	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script>
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script
		src="resources/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="resources/bootstrap/js/sb-admin.min.js"></script>
	<!-- Custom scripts for this page-->
	<script src="resources/bootstrap/js/sb-admin-datatables.min.js"></script>