<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
ul, li, ol {
	list-style: none;
	padding: 0;
}
</style>
<body>
<form method="post" action="msg_send_list.do">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>쪽지 쓰기
			</h3>
		</div>

		<div class="col-lg-4">
			<div class="panel panel-main border-0 box-shadow-none">
				
				<div class="col-lg-10" style="padding: 20px 0">
					<div
						class="media media-services scrollpoint sp-effect2 active animated fadeInRight"
						style="height: 42%">
						<div class="media-body">
							
								<ul>
									<li class="padding-left-10 clear-both margin-bottom20"><i
										class="fa fa-angle-right color_arrow margin_right fl-left"
										aria-hidden="true"></i>
										<h3 class="fl-left menu-board-notice text-left ">제목 :</h3>
										<h4 class="board-text" style="width: 40%;">
											<input type="text" class='form-control' name="msg_title"
												size="100" style="height: 30px;" required>
										</h4></li>
									<li class="padding-left-10 clear-both margin-bottom20"><i
										class="fa fa-angle-right color_arrow margin_right fl-left"
										aria-hidden="true"></i>
										<h3 class="fl-left menu-board-notice text-left h3-box">내용
											:</h3>
										<div class="board-text" style="width: 81%;">
											<textarea class='form-control' name="msg_content"
												style="height: 40%"></textarea>
										</div></li>

									<li class="padding-left-10 clear-both margin-bottom20"><i
										class="fa fa-angle-right color_arrow margin_right fl-left"
										aria-hidden="true"></i>
										<h3 class="fl-left menu-board-notice text-left ">받는사람 :</h3> <select
										id="msg_receiver" class="form-control select_box_style-menu"
										name="msg_receiver" style="width: 35%; float: left;">
											<c:forEach var="msg" items="${list}">
												<c:if test="${msg.mem_no!=0}">
													<option value="${msg.s_no}">${msg.s_name}</option>
												</c:if>
											</c:forEach>
									</select></li>
								</ul>
								<!-- Bootstrap core JavaScript -->
								<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
								<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
								<script
									src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
						
							
						</div>
						<div class="msg-write-sentbtn " >

							<input type="submit" class="btn btn-board " value="전송"> <a
								class="btn btn-download" onClick="history.back()">취소</a>

						</div>
							
					</div>
				</div>


			</div>
		</div>
	</div>
	</form>
</body>
</html>