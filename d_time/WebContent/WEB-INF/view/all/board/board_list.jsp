<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="col-lg-12">

	<div class="marginB10 active">
	<h3>${board_type}</h3>
	
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
			<c:if test="${type==1}">
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
	</div>
	<!-- 게시판 글없을떄 -->


	<!--발주대기함-->
	<div class="table-responsive marginT20 order_ing">


		<table width="1500">

			<tr>
				<td>전체글 : ${count}</td>
				<td width=500 colspan="5" align="right"><a
					href="board_writeForm.do?type=${type}&pageNum=${pageNum}">글쓰기</a></td>


			</tr>
		</table>


		<!-- 글쓰기 버튼 -->
		<c:if test="${count == 0}">
			<table class="table table-striped table-hover table-bordered_tB">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>

		<c:if test="${count > 0}">
			<table class="table table-striped table-hover table-bordered_tB">
				<thead>
					<tr>
						<th>No.</th>
						<th>말머리</th>
						<th>제목</th>
						<th>지점명</th>
						<th>날짜</th>
						<th>조회수</th>
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
						<td><fmt:formatDate value="${boardlist.b_date}" type="date"
								pattern="yyyy-MM-dd" /></td>
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
				<a href="board_list.do?type=${type}&pageNum=${startPage-10}">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="board_list.do?type=${type}&pageNum=${i}">[${i}]</a>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<a href="board_list.do?type=${type}&pageNum=${startPage + 10}">[다음]</a>
			</c:if>
		</c:if>
		<div align="center">
			<form action="board_search.do" method="post" >
				<select name="searchOption" style="width:70; height:40;">
					<option value="지점명">지점명</option>
					<option value="제목">제목</option>
				</select>
				 <input type="text" id="keyword" name="keyword" required style="width:170; height:40;"/> 
				 <input	type=hidden name="b_type" value="${login.mem_no}">
				 <input	type="submit" value="검색" style="width:70; height:40;"	>

			</form>
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
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
<script src="resources/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
<script
	src="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script src="resources/bootstrap/js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->
<script src="resources/bootstrap/js/sb-admin-datatables.min.js"></script>
