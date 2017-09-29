<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>로그인</title>
</head>
<body>
	<form:form commandName="loginCommand"><!-- 폼객체로 바인딩 -->
		<form:errors element="div" /><!-- 에러메시지를 div로 묶겠다 -->
		아이디: <form:input path="userId" />
		<form:errors path="userId" /><!-- 비어있는 경우 에러메시지넘어온다. id=userId.errors -->
		<br />
		암호: <form:password path="password" showPassword="false" />
		<form:errors path="password" /><!-- 비어있는 경우 에러메시지넘어온다.  id=password.errors-->
		<br />
		<input type="submit" />
	</form:form>
	
	<%-- <form id="loginCommand" action="/Sep_Web_gradle/login/login.do" method="post">
		<div id="loginCommand.errors">아이디(ddd)와 암호가 일치하지 않습니다.</div><!-- 에러메시지를 div로 묶겠다 -->
		아이디: <input id="userId" name="userId" type="text" value="ddd"/>
		
		<br />
		암호: <input id="password" name="password" type="password" value=""/>
		
		<br />
		<input type="submit" />
	</form> --%>
	
	
	
	
</body>
</html>