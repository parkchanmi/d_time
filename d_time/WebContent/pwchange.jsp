<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "controller.all.member.Member_DAO" %>

<!DOCTYPE>
<html>
<head>
<title>비밀번호 찾기</title>
</head>
<body>

<center>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
	
<form method="post" action="pwchanged.do">

 <div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-user"></i></span> <strong> 비밀번호 찾기</strong>
			</div>
    <table>
             

				 <tr>
                    <td width="150px" height="100px" align="center">새 비밀번호 :</td>
                    <td width="150px" align="center">
                        <input class='col-lg-12 form-control input-sm' type="text" name="mem_pwd" required>
                    </td>
                </tr>


            </table>
            <table>
				<tr>
					<td height="100px" colspan="2" align="center">
					
					<div class="form-group">
						<input type="submit"  class="btn btn-primary btn-block m-t-md" value="변경하기">	
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
            </div>
            </div>
            </div>
       </center>  
</body>
</html>