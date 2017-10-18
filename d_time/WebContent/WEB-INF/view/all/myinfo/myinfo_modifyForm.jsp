<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.all.member.Member_DAO"%>

<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i> My page 수정
			</h3>
		</div>
		<div class="col-lg-6">
			<form method="post" action="myinfo_update.do">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-user"></i><strong> 나의 정보 수정하기</strong>
					</div> 
					<div class="board-notice height-fix" style="height:40%;">
						<ul>
							<input type="hidden" name="mem_type" value="${login.mem_type}" />
							<input type="hidden" name="mem_id" value="${login.mem_id}" />
							<input type="hidden" name="s_no" value="${login.s_no}" />
							<input type="hidden" name="s_name" value="${login.s_name}" />
							<input type="hidden" name="s_code" value="${login.s_code}" />
							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">구분 :</h3>
								<h4 class="board-text display-inherit">${login.mem_type}</h4></li>
							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">아이디 :</h3>
								<h4 class="board-text display-inherit">${login.mem_id}</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">비밀번호 :</h3>
								<h4 class="board-text display-inherit">
									<input class='col-lg-12 form-control input-sm' type="password"
										name="mem_pwd" style="width: 38%;" required>
								</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">이름 :</h3>
								<h4 class="board-text display-inherit">
									<input class='col-lg-12 form-control input-sm' type="text"
										type="text" name="mem_name" style="width: 38%;" required>
								</h4></li>


							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">연락처 :</h3>
								<h4 class="board-text display-inherit">
									<input class='col-lg-12 form-control input-sm' type="text"
										type="text" name="mem_hp" style="width: 38%;" required>
								</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">지점명 :</h3>
								<h4 class="board-text display-inherit">${login.s_name}</h4></li>
						</ul>
					</div>
				</div>
				<div class="btn-3-board">
					<input type="submit" class="btn btn-board" value="변경하기">
				</div>
			</form>
		</div>
</body>
</html>