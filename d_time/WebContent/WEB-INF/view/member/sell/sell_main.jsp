<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<style>
#container {
	display: flex;
}

#box-cal {
	flex: 1;
	text-align: center;
	position:relative;
	height:65%;
}

#box-menu {
	flex: 2;
	text-align: center;
	display: flex;

}
#box-left {
	flex: 1;
	text-align: center;
	display: block;
}

#box-center {
	flex: 1;
	text-align: center;
	display: block;
}

#box-right {
	flex: 1;
	text-align: center;
	display: block;
}


</style>
<script>
var Tbl;
var modify_d=false;
var modify_f=false;
var modify_p=false;


function add_sell(m_type, m_name, m_cost, m_no){
	
	
		var oTbl = document.getElementById("cal_table");
		
		for(var i=1;i<oTbl.rows.length;i++){ //이미 추가된 메뉴는 +1
			var el = oTbl.rows[i].cells[1];
			if($(el).text()==m_name){
				var va=$('input[name=m_count]'); ///array
				var target = va[i-1].value;
				va[i-1].value=eval(target)+1;
				
				cal_cost(va[i-1],m_cost);
				total_cal();
				return;
			}
		}
		
	 var oRow = oTbl.insertRow(); //새로 추가되는 메뉴는 row 추가
	  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	  
	  var oCell1 = oRow.insertCell();
	  oCell1.innerHTML = "&nbsp";
	  
	  var oCell2 = oRow.insertCell();
	  oCell2.innerHTML = "<a onclick='delete_row()'>"+m_name+"</a>"+"<input type='hidden' name='m_name' value='"+m_name+"'>";
	  
	  var oCell3 = oRow.insertCell();
	  oCell3.innerHTML = "<input type=number name=m_count style=width:50px; height:20px; min=1  value=1 onChange='cal_cost(this,"+m_cost+")' required>";
	
	  var oCell4 = oRow.insertCell();
	  oCell4.innerHTML = "<span class='priceOne'>"+m_cost+"</span>원"+"<input type='hidden' name='m_cost' value='"+m_cost+"'>"+
	  "<input type='hidden' name='m_type' value='"+m_type+"'>"+ "<input type='hidden' name='m_no' value='"+m_no+"'>";
	  
	  total_cal();
		 
		 for(var i = 1;i<oTbl.rows.length;i++){//index정리
			 var el=oTbl.rows[i].cells[0];
			 $(el).text(i);
		 }
	
}
function delete_row(){
	var oTbl = document.getElementById("cal_table");
	oTbl.deleteRow(oTbl.clickedRowIndex);
	 
	 total_cal();
	 
	 for(var i = 1;i<oTbl.rows.length;i++){ //index정리
		 var el=oTbl.rows[i].cells[0];
		 $(el).text(i);
	 }
	
}

function cal_cost(count_item,price){ //수량증가시 금액증가
	var target = $(count_item).parent().next().children("span");
	var count = count_item.value;
	target.text(count*price); 
	
	total_cal();
}
function total_cal(){ //하단 총 금액 계산
	
	 var total=0;
		
	 $(".priceOne").each(function(index) {
	           total += eval($(this).text());

	    });
	 $("#total_price").text(total);
	 return total;
}

function submit_confirm(){
	var total = total_cal();
	if(total==0){
		alert('메뉴를 주문하세요.');
		return false;
	}
	if(confirm("결제 금액 : "+total+"원 \n결제 하시겠습니까?") == true){
		
	}else{
		return false;
	}
}
</script>
<body>

	<h3>판매모드</h3>
	<br/><br/>
	<style>
	table, th{
	text-align:center;
	}
	
	</style>
	<div id='container'>
	
		<div id='box-cal' class="panel" style="width:70%;height:65%;margin-right:10px;padding:5px;">
			<form action="/d_time/sell/sell_sale.do" onSubmit="return submit_confirm();">
			<div id='top-cal' style="overflow:auto;height:450px;">
			<h5>계산</h5>
			<table  width="100%" id="cal_table">
			<tr><th width=10%>No</th><th width=40%>주문메뉴명</th><th width=20%>수량</th><th width=30%>판매금액</th></tr>
			
			</table>
			</div>
			<div id='bottom-cal' style="width:500px;position:absolute; bottom:0px;">
<hr>
			<table id="total_table" width="100%" text-align="center" >
			<tr><td colspan=2 width=60%>총 금액</td><td width=25%><span id="total_price">0</span>원</td>
			<td width=15%><input class="btn btn-info" type="submit" value="계산"/></td></tr>
			
			</table>
			</div>
			</form>
		</div>
		
		<div id='box-menu' >
			<div id='box-left' class="panel" style="overflow:auto; width:70%;height:65%;">
			음료<br/><br/>
			<c:forEach var="menu" items="${mlist}">
			<c:if test="${menu.m_type=='음료' }">
			<button class="btn btn-default" onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})">${menu.m_name}</button><br/><br/>
			</c:if>
			</c:forEach>
			</div>
			<div id='box-center' class="panel" style="overflow:auto; width:70%;height:65%;">
			식품<br/><br/>
			<c:forEach var="menu" items="${mlist}">
			<c:if test="${menu.m_type=='식품' }">
			<button class="btn btn-default" onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})">${menu.m_name}</button><br/><br/>
			</c:if>
			</c:forEach>
			</div>
			<div id='box-right' class="panel" style="overflow:auto; width:70%;height:65%;">
			상품<br/><br/>
			<c:forEach var="menu" items="${mlist}">
			<c:if test="${menu.m_type=='상품' }">
			<button class="btn btn-default" onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})">${menu.m_name}</button><br/><br/>
			</c:if>
			</c:forEach>
			</div>
		</div>
		
	
	</div>
</body>
