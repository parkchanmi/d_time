<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<meta charset="utf-8">


<link href="/d_time/resources/summernote/summernote.css"
	rel="stylesheet">
<script src="/d_time/resources/summernote/summernote.js"></script>

<script src="/d_time/resources/summernote/lang/summernote-ko-KR.js"></script>


<script type="text/javascript">
	function summer() {
		var markStr = $('#summernote').summernote('code');
		if (markStr == "<p><br></p>") {
			alert("내용을 입력하세요!!");
			return false;
		}
		if (markStr == "") {
			alert("내용을 입력하세요!!");
			return false;
		}
		$("#content").val(markStr);
	}

	function sendFile(file, editor, welEditable) {
		data = new FormData();
		data.append("uploadFile", file);

		$.ajax({
			data : data,
			type : "POST",
			url : "/d_time/summernote/imgupload.do",
			cache : false,
			contentType : false,
			processData : false,
			dataType : 'json',

			success : function(response) {
				alert(response.result.path);
				console.log(response);
				$('#summernote').summernote('insertImage',
						response.result.path, data.name);
			},
			error : function(jqXHR) {
				alert(jqXHR.responseText);
			}

		});
	}
</script>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header" style="font-size: 30px;">
				<i class="fa fa-th-large"></i>수정하기
			</h3>
		</div>
		<div class="col-lg-7">
			<div class="panel panel-main" style="height: 75%;">
				<div class="panel-heading">
					<strong> 게시판 글 수정 </strong>
				</div>
				<div class="board-notice">
					<input type=hidden name="mem_no" value="${login.mem_no}">
					<form method="POST" onsubmit="summer();"
						action="board_modifyForm.do?b_no=${board.b_no}&type=${type}&pageNum=${pageNum}">
						<div class="btn-3-board margin-right-num">
							<button class="btn btn-board" type="submit">수정</button>
							<button class="btn btn-board" type="button"  OnClick="window.location='board_list.do?type=${type}&pageNum=${pageNum}'">목록</button>
							<%-- 	<button class="btn btn-board" type="submit"
								OnClick="javascript:location.href='/d_time/board/board_list.do?type=${type}&pageNum=${pageNum}'">목록</button> --%>
						</div>
						<ul>
							<input type=hidden name="mem_no" value="${login.mem_no}">
							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-angle-right color_arrow margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">말머리 :</h3> 
								<select class="form-control select_box_style-menu" name="b_type" style="width: 20%; float: left;">
									<c:forEach var="b_type" items="${typelist}">
										<c:if test="${b_type.board_type==type}">
											<option value="${b_type.board_type}" selected>${b_type.board_type}</option>
										</c:if>
										<c:if test="${b_type.board_type!=type}">
											<option value="${b_type.board_type}">${b_type.board_type}</option>
										</c:if>  
							</c:forEach>
							</select></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-angle-right color_arrow margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">제목 :</h3>
								<h4 class="board-text">
									<input class='form-control input-sm' type="text" name="b_title"
										style="font-size: 1.5rem; width: 162%"
										value="${board.b_title}" required />
								</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-angle-right color_arrow margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left h3-box">내용 :
								</h3> <%--  <h4 class="board-text"><input class='form-control input-sm'
						type="text" name="n_title" style="font-size:1.5rem; width:47%"
						value="${ndto.n_title }" required /></h4> --%>
								<div class="board-text">
									<div id="summernote">${board.b_content}</div>
									<input name="b_content" id="content" type="hidden">
								</div></li>
						</ul>
						<%-- <input class="btn btn-info" type="submit" value="수정" style="padding: 9px 24px; font-size: 15px;"/>
				<input class="btn btn-info" type="button" value="목록보기" style="padding: 9px 24px; font-size: 15px;"
				OnClick="window.location='board_list.do?type=${type}&pageNum=${pageNum}'"> --%>

					</form>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(window).load(function() {
			$('#summernote').summernote({ // summernote를 사용하기 위한 선언
				width : 600,
				height : 370,
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						console.log(files);
						console.log(files[0]);
						var opt = {};
						sendFile(files[0], editor, welEditable);

					}
				}
			});
		});
	</script>


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

</body>

</html>
