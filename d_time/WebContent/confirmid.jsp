<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    <td height="39" >${mem_id} 이미 사용중인 아이디입니다.</td>
  </tr>
</table>


<form name="checkForm" method="post" action="confirmid.do">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td  align="center">
       다른 아이디을 선택하세요.<p>
       <input type="text" size="10" maxlength="12" name="mem_id">
       <input type="submit" value="id중복확인">
    </td>
  </tr>
</table>
</form>
</c:if>
<c:if test="${check==0}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center">
      <p>입력하신 ${mem_id} 는 사용하실 수 있는 id입니다. </p>
      <input type="button" value="닫기" onclick="setid()">
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