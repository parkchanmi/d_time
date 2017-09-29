<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#container {
	display: flex;
}

#box-left {
display: flex;
	flex: 1;
	text-align: center;
}

#box-right {
display: flex;
	flex: 1;
	text-align: center;
}
</style>
<script>
var oTbl;
var pname,pstd;
function insRow(type) {
	var add_type=document.getElementById(type.getAttribute('id')).getAttribute('id');//버튼의 id
	
	if(add_type=='drink_add'){
		oTbl = document.getElementById("drink");
		pname = "<input class='form-control input-sm' type=text name=addDrink style=width:100%; required> ";
		pstd= "<input class='form-control input-sm' type=number name=addDstd style=width:100%; min=1 max=1000 required> ";
		pdelete= "<input class='btn btn-info btn-sm' type=button value='-' onClick=removeRow('drink')>";
	}
	else if(add_type=='food_add'){
		oTbl = document.getElementById("food");
		pname = "<input class='form-control input-sm' type=text name=addFood width:100%; required> ";
		pstd= "<input class='form-control input-sm' type=number name=addFstd width:100%; min=1 max=1000 required> ";
		pdelete= "<input class='btn btn-info btn-sm' type=button value='-' onClick=removeRow('food')>";
	}
	else if(add_type=='product_add'){
		oTbl = document.getElementById("product");
		pname = "<input class='form-control input-sm' type=text name=addProduct width:100%; required> ";
		pstd= "<input class='form-control input-sm' type=number name=addPstd width:100%; min=1 max=1000 required> ";
		pdelete= "<input class='btn btn-info btn-sm' type=button value='-' onClick=removeRow('product')>";
	}
	else if(add_type=='thing_add'){
		oTbl = document.getElementById("thing");
		pname = "<input class='form-control input-sm' type=text name=addThing width:100%; required> ";
		pstd= "<input class='form-control input-sm' type=number name=addTstd width:100%; min=1 max=1000 required> ";
		pdelete= "<input class='btn btn-info btn-sm' type=button value='-' onClick=removeRow('thing')>";
	}
	
	  
	  var oRow = oTbl.insertRow();
	  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	  
	  var oCell1 = oRow.insertCell();
	  oCell1.innerHTML = pname;
	  
	  var oCell2 = oRow.insertCell();
	  oCell2.innerHTML = pstd;
	  
	  var oCell3 = oRow.insertCell();
	  oCell3.innerHTML = pdelete;
	  
}
function removeRow(remove) {
	var oTbl = document.getElementById(remove);
	oTbl.deleteRow(oTbl.clickedRowIndex);
}

function removeProd(p_no){
	if(confirm("정말 삭제하시겠습니까??"+p_no) == true){
		location.href='/d_time/admin/product/product_delete.do?p_no='+p_no;
	}
}
function submit_ok(){
	var list = new Array();
	
	<c:forEach var="name_list" items="${plist}">
		list.push('${name_list.p_name}');
	</c:forEach>
		//list OK
	
	var check=new Array();
	$("input[type=text]").each(function(idx){   
         
        var value = $(this).val();
 		
        check.push(value);
         
      });

		
	 for(var i=0;i<check.length;i++){ //입력한 값과 기존 물품 비교
		for(var j=0;j<list.length;j++){
			if(check[i]==list[j]){
				alert("이미 존재하는 물품입니다.");
				return false;
			}
		}
	} 
	 for(var i=0;i<check.length-1;i++){ //입력한 값끼리 비교
			for(var j=i+1;j<check.length;j++){
				if(check[i]==check[j]){
					alert("동일한 값이 입력되었습니다.")
					return false;
				}
			}
		} 
	
}

</script>
<h3>재고물품</h3>

<button class="btn btn-default" onClick="javascript:location.href='/d_time/admin/product/product_list.do'">재고물품</button>

<button class="btn btn-default" onClick="javascript:location.href='/d_time/admin/menu/menu_list.do'">주문메뉴</button>
<br><br>

<style>
table{
	width:100%;
	text-align:center;
}
th, td{
	text-align:center;
}

</style>
<form name="product_form" method="post" action ="/d_time/admin/product/product_add.do" onSubmit="return submit_ok();">
<div id="container" class="col-lg-12">
<div id="box-left" class="col-lg-6">
<div class="panel" style="overflow:auto; width:85%;height:60%;">
<table border=0 id="drink" >
<tr><th colspan="3">음료&nbsp;&nbsp;&nbsp;<input class="btn btn-info btn-sm" type="button" id="drink_add" onClick="insRow(this)" value="+"/></th></tr>
<tr><th width=50%;>이름</th><th width=30%;>단위당 수량</th><th>&nbsp;</th></tr>
<c:forEach var="drink" items="${plist}">
<c:if test="${drink.p_type=='음료'}">
<tr><td width=100px>${drink.p_name}</td><td width=100px>${drink.p_std}</td><td><input class="btn btn-default btn-sm" type=button value='삭제' onClick='removeProd(${drink.p_no})'/></td></tr>
</c:if>
</c:forEach>
</table>
</div>
<div class="panel" style="overflow:auto; width:85%;height:60%;">
<table border=0 id="food" >
<tr><th colspan="3">식품&nbsp;&nbsp;&nbsp;<input class="btn btn-info btn-sm" type="button" id="food_add" onClick="insRow(this)" value="+"/></th></tr>
<tr><th width=50%;>이름</th><th width=30%;>단위당 수량</th><th>&nbsp;</th></tr>
<c:forEach var="food" items="${plist}">
<c:if test="${food.p_type=='식품'}">
<tr><td width=100px>${food.p_name}</td><td width=100px>${food.p_std}</td><td><input class="btn btn-default btn-sm" type=button value='삭제' onClick='removeProd(${food.p_no});'/></td></tr>
</c:if>
</c:forEach>
</table><br>
</div>
</div>
<div id="box-right" class="col-lg-6">
<div class="panel" style="overflow:auto; width:85%;height:60%;">
<table border=0 id="product" >

<tr><th colspan="3">상품&nbsp;&nbsp;&nbsp;<input class="btn btn-info btn-sm" type="button" id="product_add" onClick="insRow(this)" value="+"/></th></tr>

<tr><th width=50%;>이름</th><th width=30%;>단위당 수량</th><th>&nbsp;</th></tr>
<c:forEach var="product" items="${plist}">
<c:if test="${product.p_type=='상품'}">
<tr ><td width=100px>${product.p_name}</td><td width=100px>${product.p_std}</td><td><input class="btn btn-default btn-sm"  type=button value='삭제' onClick='removeProd(${product.p_no})'/></td></tr>
</c:if>
</c:forEach>
</table><br>
</div>
<div class="panel" style="overflow:auto; width:85%;height:60%;">
<table border=0 id="thing" style="text-align:center;width:100%">
<tr><th colspan="3">소모품&nbsp;&nbsp;&nbsp;<input class="btn btn-info btn-sm" type="button" id="thing_add" onClick="insRow(this)" value="+"/></th></tr>
<tr><th width=50%;>이름</th><th width=30%;>단위당 수량</th><th>&nbsp;</th></tr>
<c:forEach var="thing" items="${plist}">
<c:if test="${thing.p_type=='소모품'}">
<tr><td width=100px>${thing.p_name}</td><td width=100px>${thing.p_std}</td><td><input class="btn btn-default btn-sm" type=button value='삭제' onClick='removeProd(${thing.p_no})'/></td></tr>
</c:if>
</c:forEach>
</table>
</div>
</div>
</div>
<input class='btn btn-info' type="submit" value="확인"/>
</form>

