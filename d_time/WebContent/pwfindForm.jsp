<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
 <link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
 
<title>비밀번호찾기</title>

</head>
<body>

    <center>

        <form method="post" action="pwfindForm.do">
        <div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-user"></i></span> <strong> 비밀번호 찾기</strong>
			</div>
                <table>
                <tr>
                    <td width="150px" height="100px" align="center">아이디 : </td>
                    <td width="150px" align="center" >
                        <input class='col-lg-12 form-control input-sm' type="text" name="mem_id" required>
                    </td>
                </tr>
                
                <tr>
                    <td width="150px" height="100px" align="center" >지점코드 : </td>
                    <td width="150px" align="center">
                        <input class='col-lg-12 form-control input-sm' type="text" name="s_code" required>
                    </td>
                </tr>
                
</table>
<table>
                <tr>
                <td colspan="0.5" height="100px"  width="100px" align="center">
                <div class="form-group">
					<input type="submit"  class="btn btn-primary btn-block m-t-md" value="확인"> 
					</div>
					

                    </td>
                </tr>
            </table>
</div>
<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	
	
        </form>

    </center>

    
</body>
</html>