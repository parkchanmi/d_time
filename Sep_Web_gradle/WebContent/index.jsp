<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<a href="hello.do">/hello.do</a>
<br><a href="article/newArticle.do">http전송방식</a>
<br><a href="order/order.do">list저장</a>

<br><a href="search/internal.do?query=abc&p=10">내부검색</a>
<br><a href="search/external.do">외부검색</a>

<br><a href="cookie/make.do">쿠키생성</a>
<br><a href="cookie/view.do">쿠키확인</a>

<br><a href="header/check.do">헤더</a>

<br><a href="search/main.do">게임검색</a>
<br><a href="search/game.do">게임검색-예외발생</a>

<br><a href="account/create.do">model Attribute</a>

<br><a href="game/info?p=test">서블릿경로 [info]</a>
<br><a href="game/list">서블릿경로 [list]</a>

<br><a href="game/users/test/characters/12">템플릿변수</a>

<br>
<br><a href="login/login.do">로그인</a>
<br>
<br><a href="report/submission.do">파일업로드</a>
<br>
<br><a href="log/query.do">데이터 타입변환</a>
<br>
<br><a href="event/list.do">interceptor</a>
<br>
<br><a href="test/simpleTest.do">단순테스트1</a>
<br><a href="test/simpleTest1.do">단순테스트2</a>
<br><a href="test/simpleTest2.do">단순테스트3</a>
<br>
<br><a href="city/city.do">ajax / json</a>

</body>
</html>