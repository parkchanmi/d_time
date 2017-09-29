<%@ page contentType="text/html; charset=UTF-8"%>





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
<body>
	<div class="panel panel-main">
		<div class="panel-heading">
			<strong> 공지 글 작성 </strong>
		</div>
		<div class="visit_area">
			<form action="/d_time/admin/notice/notice_writePro.do" method="post"
				enctype="multipart/form-data" onsubmit="return summer();">
				<ul>
					<li>제목&nbsp;<i
						class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i><input class='form-control input-sm'
						type="text" name="n_title" style="width: 900px;" required /></li>
					<li>내용&nbsp;<i
						class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>
						<div id="summernote"></div> <input name="n_content" id="content"
						type="hidden"></li>
					<li>파일첨부&nbsp;<i
						class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i><input type="file" name="n_file" /></li>

				</ul>

				<input class="btn btn-info" type="submit" value="글쓰기"
					style="padding: 9px 24px; font-size: 15px;" />
			</form>
		</div>
	</div>
<!-- 
제목: <input class='form-control input-sm' type="text" name="n_title" style=width:900px;/><br>
내용: <div id="summernote"></div>
	<input name="n_content" id="content" type="hidden"><br>
파일첨부: <input type="file" name="n_file"/><br> -->
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
</body>
</html>