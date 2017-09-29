<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head><title>코드확인</title>


<% request.setCharacterEncoding("utf-8");%>


<c:if test="${check==1}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td height="39" >${storeinfo.s_name} 해당 지점이 존재하지 않습니다.</td>
  </tr>
</table>


<form name="checkForm" method="post" action="confirm_code.do">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td  align="center">
       다른 코드를 입력하세요.<p>
       <input type="text" size="10" maxlength="12" name="s_code">
       <input type="submit" value="코드확인">
    </td>
  </tr>
</table>
</form>
</c:if>
<c:if test="${check==0}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center">
      <p>입력하신 ${storeinfo.s_name} 는 지점이 존재합니다. </p>
      <input type="button" value="닫기" onclick="sets_code('${storeinfo.s_code}',${storeinfo.s_no})">
    </td>
  </tr>
</table>
</c:if>
</body>
</html>
<script>

  function sets_code(s_code,s_no)
    {
    opener.document.userinput.s_code.value=s_code; //opener:새로운 창을 연다.
    opener.document.userinput.s_no.value=s_no; 
    opener.document.userinput.s_codecheck.value="0"; //중복확인을 위해 넣어줌
    
self.close();
}

</script>