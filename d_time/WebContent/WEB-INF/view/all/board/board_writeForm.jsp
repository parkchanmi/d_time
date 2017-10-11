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
<style>
ul {
	list-style: none;
}
</style>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="panel panel-main">
		<div class="panel-heading">
			<strong> 게시판 글 작성 </strong>
		</div>
		<div class="visit_area">
			<form method="POST" onsubmit="return summer();">
				<input type=hidden name="mem_no" value="${login.mem_no}">
				<ul>

					<li>말머리&nbsp;<i
						class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i><select name="b_type">
						<c:forEach var="type" items="${typelist}">
							<option value="${type.board_type}">${type.board_type}</option>   
						</c:forEach>
						<!-- 	<option value="건의사항">건의사항</option>    
							<option value="물품교환">물품교환</option> -->
					</select></li>
					<li>제목&nbsp;<i
						class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i><input class='form-control input-sm'
						type="text" name="b_title" style="width: 900px;" required /></li>
					<li>내용&nbsp;<i
						class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>
						<div id="summernote"></div> <input name="b_content" id="content"
						type="hidden"></li>
					

				</ul>

				<input class="btn btn-info" type="submit" value="글쓰기"
					style="padding: 9px 24px; font-size: 15px;" /><input class="btn btn-info" type="reset" value="다시작성" style="padding: 9px 24px; font-size: 15px;">
					<input class="btn btn-info" type="button" style="padding: 9px 24px; font-size: 15px;"
					value="목록보기" OnClick="window.location='board_list.do?type=${type}'">
			</form>
		</div>
	</div>

<script type="text/javascript">
		$(window).load(function() {
			$('#summernote').summernote({ // summernote를 사용하기 위한 선언
				width : 1600,
				height : 500,
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
	<%-- <form method="POST">

		<table width="600" border="1" cellspacing="0" cellpadding="0"
			align="center">
			<input type=hidden name="mem_no" value="${login.mem_no}">
			<tr>
				<td align="center" width="70">말머리</td>
				<td><select name="b_type">
						<option value="건의사항">건의사항</option>    
						<option value="물품교환">물품교환</option>
				</select></td>
			</tr>

			<tr>
				<td align="center" width="70">제목</td>
				<td><input type="text" name="b_title" size="70"
					value="${board.title}"></td>
			</tr>

			<tr>
				<td align="center" width="70">내용</td>
				<td width="330"><textarea name="b_content" rows="30" cols="70"
						value="${board.b_content}"></textarea></td>
			</tr>

			<tr>
				<td colspan=2 align="center"><input type="reset" value="다시작성">
					<input type="submit" value="글쓰기"> <input type="button"
					value="목록보기" OnClick="window.location='board_list.do?type=${type}'">
				</td>
			</tr>
			</form> --%>



			
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
							<h5 class="modal-title" id="exampleModalLabel">Ready to
								Leave?</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">Select "Logout" below if you are
							ready to end your current session.</div>
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
