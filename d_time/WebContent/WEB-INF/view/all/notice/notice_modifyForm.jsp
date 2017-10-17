<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





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
			<h3 class="page-header" style="font-size:30px;">
				<i class="fa fa-th-large"></i>수정하기
			</h3>
		</div>
		<div class="col-lg-7">
			<div class="panel panel-main" style="height:75%;">
				<div class="panel-heading">
					<strong> 공지 글 수정하기</strong>
				</div>
				<div class="board-notice">

					<form action="/d_time/admin/notice/notice_modifyPro.do"
						method="post" enctype="multipart/form-data" onsubmit="summer();">
						<input class="btn btn-info modify-btn-board" type="submit" value="수정"/>
						<ul>
							<li class="padding-left-10 clear-both margin-bottom20">
								<i class="fa fa-angle-right color_arrow margin_right fl-left" aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">제목 : </h3>
								 <h4 class="board-text"><input class='form-control input-sm'
								type="text" name="n_title" style="font-size:1.5rem; width:120%"
								value="${ndto.n_title }" required /></h4>
							</li>
							<li class="padding-left-10 clear-both margin-bottom20">
								<i class="fa fa-angle-right color_arrow margin_right fl-left" aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left h3-box">내용 : </h3>
								<%--  <h4 class="board-text"><input class='form-control input-sm'
								type="text" name="n_title" style="font-size:1.5rem; width:47%"
								value="${ndto.n_title }" required /></h4> --%>
								<div class="board-text">
								<div id="summernote">${ndto.n_content}</div> <input
								name="n_content" id="content" type="hidden"> <input
								name="n_no" type="hidden" value="${ndto.n_no}"></div>
							</li>
						</ul>
						
						<c:if test="${fname!=null}">
							<div class="file-box">
								<div class="file-box-title fl-left">
									<i class="fa fa-angle-right color_arrow margin_right fl-left" aria-hidden="true"></i>
									<h3 class="fl-left menu-board-notice text-left margin-bottom0">파일첨부 : </h3>
									<h4 class="board-text fl-left margin-right-num">${fname }</h4>
								</div>
							</div>
						</c:if>
						
					</form>
				</div>
			</div>
		</div>
	</div>








	<%-- <form action="/d_time/admin/notice/notice_modifyPro.do" method="post"
		enctype="multipart/form-data" onsubmit="summer();">
		제목: <input class='form-control input-sm' type="text" name="n_title"
			style="width: 700px;" value="${ndto.n_title }" /><br> 내용:
		<div id="summernote">${ndto.n_content}</div>
		<input name="n_content" id="content" type="hidden"><br> <input
			name="n_no" type="hidden" value="${ndto.n_no}"><br>
		<c:if test="${fname!=null}">
	파일첨부: ${fname }<br>
		</c:if>

		<input class="btn btn-info" type="submit" value="전송" />
	</form> --%>
	<script type="text/javascript">
		$(window).load(function() {
			$('#summernote').summernote({ // summernote를 사용하기 위한 선언
				width : 650,
				height : 400,
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