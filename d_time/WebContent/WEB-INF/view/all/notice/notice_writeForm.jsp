<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 글쓰기</title>
</head>
<body>
<form action="notice_writePro.do" method="post" enctype="multipart/form-data">
제목: <input type="text" name="n_title"/><br>
내용: <textarea name="n_content"></textarea><br>
파일첨부: <input type="file" name="n_file"/>
<input type="submit" value="전송"/>
</form>
</body>
</html>