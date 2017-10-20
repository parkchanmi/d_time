<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>

<style>
#container {
	display: flex;
}
#box-left {
	flex: 1;
	display: block;
	padding: 10px;
}

#box-center {
	flex: 1;
	display: block;
	padding: 10px;
}

#box-right {
	flex: 1;
	display: block;
	padding: 10px;
}

#box-left span, #box-center span, #box-right span {
	margin-right: 0px;
	float: right;
	font-size: 18px;
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
function menu_recipe(){
	
	// url과 사용자 입력 id를 조합합니다.
    url = "/d_time/sell/menu_recipe.do";
   
    // 새로운 윈도우를 엽니다.
    open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1400,height=800"); 
}
</script>
<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">
			<i class="fa fa-th-large"></i>판매
		</h3>
	</div>

	<div class="col-lg-12">
		<button onclick="menu_recipe()" class="btn btn-cook margin-bottom02">
			<i class="fa fa-book margin-right-num" aria-hidden="true"></i>레시피
		</button>
		<div class="row">
			<div class="col-3 box-cal">
				<form action="/d_time/sell/sell_sale.do"
					onSubmit="return submit_confirm();">
					<div id='top-cal' style="height: 450px; position: relative;">
						<div class="menu_head margin-bottom">
							
							<h4>Total</h4>
							<!-- <h3 class="plus_icon">
									<a href="#" onClick="insRow(this)" id="drink_add"
										class="fl_right margin-right-num ">+</a>
								</h3> -->
						</div>
							<table class="table-sell table table-striped table-hover table-bordered_tB font-size-15" id="cal_table" style="height:67% !important">
								<thead>
									<tr>
										<th width=10% class="border-top-bot">No</th>
										<th width=40% class="border-top-bot">주문메뉴명</th>
										<th width=20% class="border-top-bot">수량</th>
										<th width=30% class="border-top-bot">판매금액</th>
									</tr>
								</thead>
						</table>
						
						<div class="file-box">
							<div class="file-box-title fl-left" id="total_table">
								<i class="fa fa-calculator color_arrow margin_right-6 fl-left" aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left margin-bottom0">총 금액</h3>
								<h4 class="board-text fl-left margin-right-num"><span id="total_price">0</span>원</h4>
							</div>
							<input class="fl-right btn btn-sellicon" type="submit"value="결제" /> 
						</div>
					</div>
				</form>
			</div>

			<div id='box-left' class="col-lg-3" style="padding: 0;">
				<div id='box-menu'
					class="margin-left-10 background-none sell-box media media-services-menu right scrollpoint sp-effect2">
					<div class="media-body">
						<div class="menu_head margin-bottom">
							<i class="fa fa-coffee fa-2x color-icon-sell" aria-hidden="true"></i>
							<h4>음료</h4>
							<!-- <h3 class="plus_icon">
									<a href="#" onClick="insRow(this)" id="drink_add"
										class="fl_right margin-right-num ">+</a>
								</h3> -->
						</div>

						<div class="table-responsive order_ing">
							<table class="table table-striped table-hover table-bordered_tB">
								<thead>
									<tr>
										<th width=45% class="border-top-bot">메뉴</th>
										<th width=30% class="border-top-bot">가격</th>
										<th class="border-top-bot">판매비고</th>
									</tr>
								</thead>
								<c:forEach var="menu" items="${mlist}" varStatus="status">
									<c:if test="${menu.m_type=='음료' }">
										<tr style="background-color: transparent;">
											<c:if test="${blist[status.index]}">
												<td width=100px><button class="btn btn-menu-default">${menu.m_name}</button></td>
											</c:if>
											<c:if test="${!blist[status.index]}">
												<td width=100px><button class="btn btn-menu-default"
														disabled=""
														onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})">${menu.m_name}</button></td>
											</c:if>
											<td width=100px>${menu.m_cost}원</td>
											<c:if test="${blist[status.index]}">
												<td class="text-center"><input class="btn btn-sellicon"
													type=button
													onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})"
													value='가능' /></td>
											</c:if>
											<c:if test="${!blist[status.index]}">
												<td class="text-center"><i
													class="fa fa-ban sell-ban-icon" aria-hidden="true"></i>
												<!-- 
												<input class="btn btn-default btn-sm" type=button
													value='판매불가' / --></td>
											</c:if>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div id='box-left' class="col-lg-3" style="padding: 0;">
				<div id='box-menu'
					class="background-none sell-box media media-services-menu right scrollpoint sp-effect2">
					<div class="media-body">
						<div class="menu_head margin-bottom">
							<i class="fa fa-cutlery fa-2x color-icon-sell" aria-hidden="true"></i>
							<h4>식품</h4>
						</div>
						<div class="table-responsive order_ing">
							<table class="table table-striped table-hover table-bordered_tB">
								<thead>
									<tr>
										<th width=45% class="border-top-bot">메뉴</th>
										<th width=30% class="border-top-bot">가격</th>
										<th class="border-top-bot">판매비고</th>
									</tr>
								</thead>
								<c:forEach var="menu" items="${mlist}" varStatus="status">
									<c:if test="${menu.m_type=='식품' }">
										<tr style="background-color: transparent;">
											<c:if test="${blist[status.index]}">
												<td width=100px><button class="btn btn-menu-default">${menu.m_name}</button></td>
											</c:if>
											<c:if test="${!blist[status.index]}">
												<td width=100px><button class="btn btn-menu-default"
														disabled=""
														onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})">${menu.m_name}</button></td>
											</c:if>
											<td width=100px>${menu.m_cost}원</td>
											<c:if test="${blist[status.index]}">
												<td class="text-center"><input class="btn btn-sellicon"
													type=button
													onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})"
													value='가능' /></td>
											</c:if>
											<c:if test="${!blist[status.index]}">
												<td class="text-center"><i
													class="fa fa-ban sell-ban-icon" aria-hidden="true"></i></td>
											</c:if>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div id='box-left' class="col-lg-3" style="padding: 0;">
				<div id='box-menu'
					class="background-none border-right-0 sell-box media media-services-menu right scrollpoint sp-effect2">
					<div class="media-body">
						<div class="menu_head margin-bottom">
							<i class="fa fa-beer fa-2x color-icon-sell" aria-hidden="true"></i>
							<h4>상품</h4>
						</div>

						<div class="table-responsive order_ing">
							<table class="table table-striped table-hover table-bordered_tB">
								<thead>
									<tr>
										<th width=45% class="border-top-bot">메뉴</th>
										<th width=30% class="border-top-bot">가격</th>
										<th class="border-top-bot">판매비고</th>
									</tr>
								</thead>
								<c:forEach var="menu" items="${mlist}" varStatus="status">

									<tr style="background-color: transparent;">
										<c:if test="${menu.m_type=='상품' }">
											<c:if test="${blist[status.index]}">
												<td width=100px><button class="btn btn-menu-default">${menu.m_name}</button></td>
											</c:if>
											<c:if test="${!blist[status.index]}">
												<td width=100px><button class="btn btn-menu-default"
														disabled=""
														onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})">${menu.m_name}</button></td>
											</c:if>
											<td width=100px>${menu.m_cost}원</td>
											<c:if test="${blist[status.index]}">
												<td class="text-center"><input class="btn btn-sellicon"
													type=button
													onClick="add_sell('${menu.m_type}','${menu.m_name}',${menu.m_cost},${menu.m_no})"
													value='가능' /></td>
											</c:if>
											<c:if test="${!blist[status.index]}">
												<td class="text-center"><i
													class="fa fa-ban sell-ban-icon" aria-hidden="true"></i></td>
											</c:if>
										</c:if>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>