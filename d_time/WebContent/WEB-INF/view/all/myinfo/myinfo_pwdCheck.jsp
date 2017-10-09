<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
 <link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
 
<title>회원가입</title>
</head>
<body>
    <center>
 
        <form method="post" action="myinfo_pwdCheck.do">
                <table>
                <tr>
                    <td width="150px" height="100px" align="center">비밀번호 :</td>
                    <td width="150px" align="center">
                        <input type="text" name="mem_pwd">
                    </td>
                </tr>

                <tr>
                <td colspan="0.5" height="100px"  align="center">
                <div class="form-group">
					<input type="submit"  class="btn btn-primary btn-block m-t-md" value="확인"> 
					</div>
					
                    
                      <!--   <input type="submit" value="확인"> -->
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