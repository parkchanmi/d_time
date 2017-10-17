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

	<center>
<div class="panel panel-main" style="width:750;">
		<div class="panel-heading" style="width:750;">
			<strong> 쪽지 상세보기 </strong>
		</div>
		</div>	 
		 <div class="col-md-6">
           <div class="media media-services scrollpoint sp-effect2 active animated fadeInRight">
           <div class="media-body">
		<table width="1000"  class="table" align="center"> 
	  <tr height="30">
	    <th  width="100">제목</th>
	    <td  width="100" >${msg_detail.msg_title}</td>
	    
	    <th width="125" >보낸 사람</th>
	    <td  width="125">${msg_detail.sen_sname}</td>
	  </tr>
	  
	  <tr height="30">
	    <th width="125" >시간</th>
	    <td width="125" >${msg_detail.msg_date}</td>
	    <th width="125" >받은 사람</th>
	    <td width="125" >${msg_detail.rcv_sname}</td>
	  </tr>
	
	  <tr>
	    <th width="125" >글내용</th>
	    <td width="375" height="400" colspan="3"><pre>${msg_detail.msg_content}</pre></td>
	  </tr>
	  <tr height="30">     
	    </tr>
	</table>   
</div>
</div>
</div>
	<table>
	<tr>
					<td colspan="2" align="center">
					
					<div class="form-group">
					<c:if test="${type=='receivebox'}">
						<input type="button" value="목록보기" class="btn btn-primary btn-block m-t-md"
								onClick="window.location='/d_time/msg_receive_list.do'">
					</c:if>
					<c:if test="${type=='sendbox'}">
						<input type="button" value="목록보기" class="btn btn-primary btn-block m-t-md"
								onClick="window.location='/d_time/msg_send_list.do'">
					</c:if>
					</div>
								
			<td colspan="2" align="center">
			<div class="form-group">
						<input type="button" value="삭제" class="btn btn-default btn-block m-t-md"
								OnClick="window.location='/d_time/Msg_delete.do?msg_no=${msg_detail.msg_no}'">
					</div>
					</td>
					</tr>
		</table>
					
			<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	
	

</center>
</body>
</html>