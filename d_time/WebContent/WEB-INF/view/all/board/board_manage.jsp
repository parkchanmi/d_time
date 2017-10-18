<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="/d_time/tablednd/jquery.tablednd.js"></script>
<script type="text/javascript"
	src="/d_time/tablednd/jquery.tablednd.min.js"></script>
<link href="/d_time/tablednd/tablednd.css" rel="stylesheet"
	type="text/css">


<script>

function addType() {
	var new_type= document.getElementById('new_type');
// db에 저장
	location.href="/d_time/admin/btype_add.do?new_type="+new_type.value;
		
}

function removeTemp(type,index){
	if(confirm("["+type+"] 게시판을 임시 삭제 하시겠습니까??")){
		location.href="/d_time/admin/board/temp_delete.do?type="+type+"&index="+index;
		//location.href="/d_time/index.jsp";
	//	location.replace("/d_time/index.jsp");
	}
}
function removeCor(type,index){
	if(confirm("["+type+"] 게시판과 게시글을 삭제 하시겠습니까??")){
		location.href="/d_time/admin/board/cor_delete.do?type="+type+"&index="+index;
	}
}


</script>

<script>
    $(function(){
        //tablednd 드래그앤드롭 실행 
        $("#btype").tableDnD();

 
    })
  </script>
<style>

/* 디폴트 스타일 */
/*
.tDnD_whileDrag {
    background-color: #eee;
}*/

/*사용자 정의 스타일 */
.dragRow {
	background-color: #eee;
}

td.dragHandle {
	
}

td.showDragHandle {
	background-image: url(images/updown2.gif);
	background-repeat: no-repeat;
	background-position: center left;
	cursor: move;
}
</style>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header" style="font-size: 30px;">
				<i class="fa fa-th-large"></i>게시판 관리
			</h3>
		</div>
		<div class="col-lg-6">
			<i class="fa fa-bookmark size-25px-icon fl-left" aria-hidden="true"></i> 
			<h3 class="fl-left board-manage text-left ">게시판 이름</h3>
			<input type="text" class="form-control input-sm col-lg-6 margin-right-num" name="new_type" id="new_type"> 
			<input class="btn btn-info board-add" type="button" onClick="addType()"value="추가" />
				
		</div>
		<div class="col-lg-12  table-responsive marginT20 order_ing">
			<form name="update_index" method="post"
				action="/d_time/admin/board_type/updateIndex.do">
				<table id="btype"
					class="table table-striped table-hover table-bordered_tB"
					style="display: inline-table; margin-top: 14px;  text-align: center;">
					<thead>
						<tr class="nodrag nodrop">
							<th style="text-align: center;">게시판 분류</th>
							<th style="text-align: center;">게시글 수</th>
							<th style="text-align: center;">게시판 순서</th>
							<th style="text-align: center;">게시판 삭제
								<input class="padding-in btn btn-confirm-blue board-add-line" type="submit" value="순서저장" />
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="type" items="${typelist}" varStatus="status">
							<tr>
								<td>${type.board_type}</td>
								<td>${countlist[status.index]}</td>
								<td id="row_index">${type.row_index}</td>
								<td>
									<!-- board_type에서만 제거 -->
									<input type="button" class="btn btn-board-delete-css" onclick="removeTemp('${type.board_type}',${type.row_index});" value="임시삭제"/>
									<!-- board에서 제거 -->
									<input type="button" class="btn btn-trash" onclick="removeCor('${type.board_type}',${type.row_index});" value="완전삭제"/>
									
								</td>
								<input type="hidden" name="b_type" value="${type.board_type}" />
							</tr>

						</c:forEach>
					</tbody>
				</table> 
			
			</form>
		</div>
	</div>

</body>


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


