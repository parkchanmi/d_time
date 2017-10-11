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

        <div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-user"></i></span> <strong> 나의 정보 수정하기</strong>
			</div>
    <table>
             <tr>
             <input type="hidden" name="mem_type" value="${login.mem_type}"/>
             <input type="hidden" name="mem_id" value="${login.mem_id}"/>
             <input type="hidden" name="s_no" value="${login.s_no}"/>
             <input type="hidden" name="s_name" value="${login.s_name}"/>
					<td height="50px">구분</td>
					<td>${login.mem_type}</td>
				</tr>

				<tr>
					<td height="50px">아이디</td>
					<td>${login.mem_id}</td>

				</tr>

				 <tr>
                    <td width="150px" height="50px" >비밀번호</td>
                    <td width="150px" >
                        <input class='col-lg-12 form-control input-sm' type="text" type="text" name="mem_pwd" required>
                    </td>
                </tr>


				<tr>
                    <td width="150px" height="50px" >이름</td>
                    <td width="150px" >
                        <input class='col-lg-12 form-control input-sm' type="text" type="text" name="mem_name" required>
                    </td>
                </tr>

				 <tr>
                    <td width="150px" height="50px" >연락처</td>
                    <td width="150px" align="center">
                        <input class='col-lg-12 form-control input-sm' type="text" type="text" name="mem_hp" required>
                    </td>
                </tr>


				<tr>
					<td height="50px">지점명</td>
					<td>${login.s_name}</td>

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
            </form>
       </center>  
</body>
</html>