<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "controller.all.member.Member_DAO" %>

<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<center>
<form method="post" action="myinfo_update.do">

    <table>
             <tr>
					<td height="100px" align="center">구분 : </td>
					<td>${login.mem_type}</td>
				</tr>

				<tr>
					<td height="100px" align="center">아이디 : </td>
					<td>${login.mem_id}</td>

				</tr>

				 <tr>
                    <td width="150px" height="100px" align="center">비밀번호 :</td>
                    <td width="150px" align="center">
                        <input type="text" name="mem_pwd" required>
                    </td>
                </tr>


				<tr>
                    <td width="150px" height="100px" align="center">이름:</td>
                    <td width="150px" align="center">
                        <input type="text" name="mem_name">
                    </td>
                </tr>

				 <tr>
                    <td width="150px" height="100px" align="center">연락처 :</td>
                    <td width="150px" align="center">
                        <input type="text" name="mem_hp">
                    </td>
                </tr>


				<tr>
					<td height="100px" align="center">지점명 : </td>
					<td>${login.s_no}</td>

				</tr>
   
               <!--  <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="변경">
                    </td>
                </tr> -->
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

            </form>
       </center>  
</body>
</html>