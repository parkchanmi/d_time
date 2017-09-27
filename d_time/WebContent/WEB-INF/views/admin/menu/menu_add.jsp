<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>물품관리목록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
var oTbl;
var pname,pstd;
function insRow() {
	//var add_type=document.getElementById(type.getAttribute('id')).getAttribute('id');//버튼의 id
	
	  oTbl = document.getElementById("recipe");
		
	  var oRow = oTbl.insertRow();
	  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	  
	  var oCell1 = oRow.insertCell();
	  oCell1.innerHTML = "&nbsp;";
	  
	  var oCell2 = oRow.insertCell();//재료명
	  $('.m_recipe').clone().appendTo(oCell2).removeClass('m_recipe');
	 // oCell2.removeClass('m_recipe');
	  
	  var oCell3 = oRow.insertCell();//수량
	  oCell3.innerHTML="<input class='form-control input-sm' type=number name=m_num  min=1 max=10 required>";
	  
	  var oCell4 = oRow.insertCell();//삭제버튼
	  oCell4.innerHTML = "<input class='btn btn-default btn-sm' type=button value=- onClick=removeRow()>";
}

function removeRow() {

	//alert(remove+oTbl.clickedRowIndex);
	oTbl.deleteRow(oTbl.clickedRowIndex);
}

</script>


</head>
<body>
<h3>주문메뉴 등록</h3><br><br>
<form name="menu_form" method="post" action ="/d_time/admin/menu/menu_add.do">
구분:
<select class="col-lg-3 form-control input-sm" name="m_type">
<option value="음료">음료</option>
<option value="식품">식품</option>
<option value="상품">상품</option>
</select>
<br/>
메뉴명:
<input class='col-lg-3 form-control input-sm' type="text" name="m_name" width="50%" required/>
<br/>
가격:
<input class='col-lg-3 form-control input-sm' type="number" name="m_cost" min="0"  required/>
<br/>
<table id="recipe">
<tr>
<td>재료:</td>
<td>
<select class='m_recipe form-control input-sm' name="m_recipes">
<optgroup label="음료">
<c:forEach var="prod" items="${plist}">
<c:if test="${prod.p_type=='음료'}">
<option>${prod.p_name }</option>
</c:if>
</c:forEach>
</optgroup>
<optgroup label="식품">
<c:forEach var="prod" items="${plist}">
<c:if test="${prod.p_type=='식품'}">
<option>${prod.p_name }</option>
</c:if>
</c:forEach>
</optgroup>
<optgroup label="상품">
<c:forEach var="prod" items="${plist}">
<c:if test="${prod.p_type=='상품'}">
<option>${prod.p_name }</option>
</c:if>
</c:forEach>
</optgroup>
<optgroup label="소모품">
<c:forEach var="prod" items="${plist}">
<c:if test="${prod.p_type=='소모품'}">
<option>${prod.p_name }</option>
</c:if>
</c:forEach>
</optgroup>
</select>

</td>
<td>
<input class='form-control input-sm' type="number" name="m_num" class="m_num" min="1" max="100" required/>
</td>
<td>
<input class="btn btn-default btn-sm" type="button" value="+" onClick="insRow()"/>
</td>

</tr>

</table>

<br/>
<input class="btn btn-info" type="submit" value="확인"/>
</form>
</body>
</html>