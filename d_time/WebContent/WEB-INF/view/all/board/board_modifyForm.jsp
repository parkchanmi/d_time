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
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	
<div class="panel panel-main">
		<div class="panel-heading">
			<strong> 게시판 글 수정 </strong>
		</div>
		<div class="visit_area">
		<input type=hidden name="mem_no" value="${login.mem_no}">
			<form method="POST" onsubmit="summer();" action="board_modifyForm.do?b_no=${board.b_no}&type=${type}&pageNum=${pageNum}">
			
				<ul>
					<input type=hidden name="mem_no" value="${login.mem_no}">
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
						aria-hidden="true"></i><input class='form-control input-sm' type="text" name="b_title"
			style="width: 700px;" value="${board.b_title}" required/></li>
					<li>내용&nbsp;<i
						class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>
						<div id="summernote">${board.b_content}</div> 
						<input name="b_content" id="content" type="hidden"> 
						
				</ul>
				<input class="btn btn-info" type="reset" value="다시작성" style="padding: 9px 24px; font-size: 15px;"> 
				<input class="btn btn-info" type="submit" value="수정" style="padding: 9px 24px; font-size: 15px;"/>
				<input class="btn btn-info" type="button" value="목록보기" style="padding: 9px 24px; font-size: 15px;"
				OnClick="window.location='board_list.do?type=${type}&pageNum=${pageNum}'">
				
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
		
	</div>
</body>

</html>
