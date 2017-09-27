<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${confirm==false}">
<script>
alert('재고부족');
history.go(-1);
</script>
</c:if>

<c:if test="${dberr==false}">
<script>
alert('db저장에러');
history.go(-1);
</script>
</c:if>

<c:if test="${confirm==true}">
<script>alert('판매완료');</script>
<meta http-equiv="Refresh" content="0;url=/d_time/sell/sell_main.do" >
</c:if>
