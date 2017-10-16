<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "controller.all.member.Member_DAO" %>

<html>
<head><title>id중복확인</title>


<% request.setCharacterEncoding("utf-8");%>

<%
 /*    String id = request.getParameter("id");
    MemberDao manager = MemberDao.getInstance;
    int check= manager.confirmid(id); */
 
%>

<c:if test="${check==1}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
  <p></p>
    <td height="39" align="center">
    <p><b>${mem_id}</b>(은)는</p> 
    <p>이미 사용중인 아이디입니다.</p>
    </td>
    <p></p>
  </tr>
</table>


<form name="checkForm" method="post" action="confirmid.do">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td  align="center">
       <p>다른 아이디을 선택하세요.</p>
       <p></p>
       <input type="text" size="10" maxlength="12" name="mem_id" class='col-lg-6 form-control input-sm' style="width:150;">
       <input type="submit" value="id중복확인" class="btn btn-default">
    </td>
  </tr>
</table>
</form>
</c:if>
<c:if test="${check==0}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center">
      <p></p>
      <p>입력하신 <b>${mem_id}</b>(은)는 </p>
      <p>사용하실 수 있는 아이디입니다. </p>
      <p></p>
      <input type="button" value="확인" onclick="setid()" class="btn btn-default"  style="width:100;">
    </td>
  </tr>
</table>
</c:if>
</body>
</html>
<script>

  function setid()
    {
    opener.document.userinput.mem_id.value="${mem_id}"; //opener:새로운 창을 연다.
    opener.document.userinput.idcheck.value="1"; //중복확인을 위해 넣어줌
    
self.close();
}

</script>