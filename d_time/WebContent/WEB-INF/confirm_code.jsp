<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "controller.all.member.Member_DAO" %>

<html>
<head><title>코드확인</title>


<% request.setCharacterEncoding("utf-8");%>
<!-- Bootstrap core CSS -->
 <link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">

<c:if test="${check==0}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td height="39" align="center" >
    <p></p>
    <p></p>
    <b>${storeinfo.s_name}</b> 해당 지점이 존재하지 않습니다.</td>
  </tr>
</table>

<form name="checkForm" method="post" action="confirm_code.do">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center">
      <p> 다른 지점코드를 입력하세요.</p>
      <p></p>
      <p></p>
       <input type="text" size="10" maxlength="12" name="s_code" class='col-lg-6 form-control input-sm' style="width:160;">
       <input type="submit" class="btn btn-default"  value="코드확인">
    </td>
  </tr>
</table>
</form>
</c:if>

<c:if test="${check==1}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center">
    <p></p>
      <p>입력하신<b>${storeinfo.s_name}</b>(은)는</p>
      <p>지점이 존재합니다. </p>
      <input type="button" class="btn btn-default" style="width:100;" value="확인" onclick="sets_code('${storeinfo.s_code}',${storeinfo.s_no})">
    </td>
  </tr>
</table>
</c:if>

<c:if test="${check==2}">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td height="39" align="center" >
    <p><b>${storeinfo.s_name}</b>(은)는</p>
    <p> 이미 등록된 지점입니다.</p></td>
    <p></p>
    <p></p>
  </tr>
</table>

<form name="checkForm" method="post" action="confirm_code.do">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center">
      <p>다른 지점코드를 입력하세요.</p> 
       <p></p>
       <input type="text" size="10" maxlength="12" name="s_code" class='col-lg-6 form-control input-sm' style="width:160;">
       <input class="btn btn-default"  style="width:100;"  type="submit" value="코드확인">     
    </td>
  </tr>
</table>
</form>
</c:if>


</body>
</html>

<script>

  function sets_code(s_code,s_no,s_type,s_name)
    {
    opener.document.userinput.s_code.value=s_code; //opener:새로운 창을 연다.
    opener.document.userinput.s_no.value=s_no; 
    opener.document.userinput.s_codecheck.value="0"; //중복확인을 위해 넣어줌
    opener.document.getElementById("s_name").value=s_name;
    if(s_type=='직영'){
    	opener.document.getElementById("j_type").checked=true;
    	opener.document.userinput.mem_type.value="직영"; 
    }
    if(s_type=='가맹'){
    	opener.document.getElementById("g_type").checked=true;
    	opener.document.userinput.mem_type.value="가맹"; 
    }
    
self.close();
}

</script>