<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>

		<h1>쪽지 쓰기</h1>
</center>
<center>
		<form method="post" action="msg_send_list.do">

			
			
				
	<table border=0 width=1000 cellspacing=0 cellpadding=0>

		<col width=100></col>
		<col width=></col>

				<tr>
					<td height="60">제목</td>
					<td><input type="text" class='form-control' name="msg_title" size="100" style="height:30px;"></td>
				</tr>

				<tr>
					<td height="60">내용</td>
					<td><textarea class='form-control' name="msg_content" style="height:100px;"></textarea></td>
				</tr>


				<tr>
					<td height="60">받는 사람</td>
					<td>
					
					<select id="msg_receiver" name="msg_receiver" class="form-control col-lg-3">
						<c:forEach var="msg" items="${list}">
						<c:if test="${msg.mem_no!=0}">
			    			<option value="${msg.s_no}">${msg.s_name}</option>
			    		</c:if>
			    		</c:forEach>
			    		
			    	</select>
			    	</td>
				</tr>

</table>
<table>
				<tr>
					<td colspan="2" align="center">
					
					<div class="form-group">
						<input type="submit"  class="btn btn-primary btn-block m-t-md" value="전송">	
					</div>
					
					<td colspan="2" align="center">

					<div class="form-group">
						<a  type="button" class="btn btn-default btn-block m-t-md"  href="#" onClick="history.back()">취소</a>
					</div>
					</td>
				</tr>

			</table>



<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	
		</form>
	</center>
</body>
</html>