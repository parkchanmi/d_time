<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "controller.all.member.Member_DAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
 <link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
 
<title>쪽지함</title>
</head>
<body>
		<h1>보낸 쪽지함</h1>
	<center>

		<c:if test="${count == 0}">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>

		
		<table class="table table-striped table-hover table-bordered_tB">
			<thead>
				<tr>
					
					
					<th>날짜</th>
					<th>제목</th>
					<th>보낸 지점</th>
					<th>받는 지점</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach var="msglist" items="${list}">
				

					<tr >
						
						<td>${msglist.msg_date}</td>
						<td><a href="msg_detail.do?msg_no=${msglist.msg_no}">${msglist.msg_title}</a></td> 
						<td>${msglist.sen_sname}</td>
						<td>${msglist.rcv_sname}</td>

					</tr>
				
			</c:forEach>
			</tbody>
		</table>
		
			<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	
	

</center>
</body>
</html>