<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>게임 검색 결과</title>
</head>
<body>
	인기 키워드:
	

	<c:forEach var="popularQuery" items="${popularQueryList}">
	${popularQuery}
	</c:forEach>
	<form action="game.do">
		<select name="type">
			<c:forEach var="searchType" items="${searchTypeList}">
				<c:choose>
					<c:when test="${command.type==searchType.code }">
					
					<option value="${searchType.code}" selected>
					${searchType.text}
					</option>
					</c:when>
					<c:otherwise>
					<option value="${searchType.code}">
					${searchType.text}
					</option>
					</c:otherwise>
				
				</c:choose>
				
			</c:forEach>
		</select> 
		<input type="text" name="query" value="${command.query}" /> <input
			type="submit" value="검색" />
	</form>
	검색 결과: ${searchResult}
</body>
</html>