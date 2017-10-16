<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#container {
	display: flex;
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
		pdelete= "<a href='#' onClick=removeRow('drink') class='btn btn-default btn-sm minor_icon'><i class='fa fa-minus' aria-hidden='true'></i></a>"; 
		
		
	}
	else if(add_type=='food_add'){
		oTbl = document.getElementById("food");
		pname = "<input class='form-control input-sm' type=text name=addFood width:100%; required> ";
		pstd= "<input class='form-control input-sm' type=number name=addFstd width:100%; min=1 max=1000 required> ";
		pdelete= "<a href='#' onClick=removeRow('food') class='btn btn-default btn-sm minor_icon'><i class='fa fa-minus' aria-hidden='true'></i></a>"; 
	}
	else if(add_type=='product_add'){
		oTbl = document.getElementById("product");
		pname = "<input class='form-control input-sm' type=text name=addProduct width:100%; required> ";
		pstd= "<input class='form-control input-sm' type=number name=addPstd width:100%; min=1 max=1000 required> ";
		pdelete= "<a href='#' onClick=removeRow('product') class='btn btn-default btn-sm minor_icon'><i class='fa fa-minus' aria-hidden='true'></i></a>"; 
	}
	else if(add_type=='thing_add'){
		oTbl = document.getElementById("thing");
		pname = "<input class='form-control input-sm' type=text name=addThing width:100%; required> ";
		pstd= "<input class='form-control input-sm' type=number name=addTstd width:100%; min=1 max=1000 required>";
		pdelete= "<a href='#' onClick=removeRow('thing') class='btn btn-default btn-sm minor_icon'><i class='fa fa-minus' aria-hidden='true'></i></a>";
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

	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>재고물품
			</h3>
		</div>

		<div class="col-lg-12" style="margin-bottom:25px;">
			<div class="text-right active fl-left width100">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs-menu in">
					<li id="order_ing" class="active"><a
						href="/d_time/admin/product/product_list.do">재고물품<i
							class="fa fa-angle-down"></i></a></li>
					<li id="order_list"><a href="/d_time/admin/menu/menu_list.do">주문메뉴
							<i class="fa fa-angle-down"></i>
					</a></li>
					<li id="order_list">	
							<a href="/d_time/admin/menu/menu_add.do">메뉴추가 
								<i class="fa fa-angle-down"></i>
							</a>
						</li>
				</ul>
			</div>
		</div>

		<form name="product_form" method="post"
			action="/d_time/admin/product/product_add.do"
			onSubmit="return submit_ok();">
			<div id="container" class="col-lg-12">
				<div class="col-lg-3" style="padding:0; margin-right:15px; max-width:24%;" >
					<div class="media media-services-menu right scrollpoint sp-effect2"
						style="overflow:auto;">
						<div class="media-body">
							<div class="menu_head">
								<i class="fa fa-coffee fa-2x color-pro" aria-hidden="true"></i>
								<h4>음료</h4>
								<h3 class="plus_icon"><a href="#" onClick="insRow(this)" id="drink_add" class="fl_right margin-right-num ">+</a></h3>
							</div>
							<div class="table-responsive order_ing">
								<table class="table table-striped table-hover table-bordered_tB" id="drink">
									<thead>
										<tr>
											<th width=40% class="border-top-bot">이름</th>
											<th width=40% class="border-top-bot">단위당 수량</th>
											<th class="border-top-bot">&nbsp;</th>
										</tr>
									</thead>
									<c:forEach var="drink" items="${plist}">
										<c:if test="${drink.p_type=='음료'}">
											<tr style="background-color:#fbfbfb">
												<td width=100px>${drink.p_name}</td>
												<td width=100px>${drink.p_std}</td>
												<td><input class="btn btn-default btn-sm" type=button
													value='삭제' onClick='removeProd(${drink.p_no})' /></td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3" style="padding:0; margin-right:15px; max-width:24%;" >
					<div class="media media-services-menu right scrollpoint sp-effect2"
						style="overflow: auto;">
						
						<div class="media-body">
							<div class="menu_head">
							<i class="fa fa-cutlery fa-2x color-pro" aria-hidden="true"></i>
								<h4>식품</h4>
								<h3 class="plus_icon"><a href="#" onClick="insRow(this)" id="food_add" class="fl_right margin-right-num">+</a></h3>
							</div>
							<div class="table-responsive order_ing">
								<table class="table table-striped table-hover table-bordered_tB" id="food">
									<thead>
										<tr>
											<th width=40% class="border-top-bot">이름</th>
											<th width=40% class="border-top-bot">단위당 수량</th>
											<th class="border-top-bot">&nbsp;</th>
										</tr>
									</thead>
									<c:forEach var="food" items="${plist}">
										<c:if test="${food.p_type=='식품'}">
											<tr style="background-color:#fbfbfb">
												<td width=100px>${food.p_name}</td>
												<td width=100px>${food.p_std}</td>
												<td><input class="btn btn-default btn-sm" type=button
													value='삭제' onClick='removeProd(${food.p_no});' /></td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3" style="padding:0; margin-right:15px; max-width:24%;" >
					<div class="media media-services-menu right scrollpoint sp-effect2"
						style="overflow: auto;">
						
						<div class="media-body">
							<div class="menu_head">
								<i class="fa fa-beer fa-2x color-pro" aria-hidden="true"></i>
								<h4>상품</h4>
								<h3 class="plus_icon"><a href="#" onClick="insRow(this)" id="product_add" class="fl_right margin-right-num">+</a></h3>
							</div>
							<div class="table-responsive order_ing">
								<table class="table table-striped table-hover table-bordered_tB" id="product" >
									<thead>
										<tr>
											<th width=40% class="border-top-bot">이름</th>
											<th width=40% class="border-top-bot">단위당 수량</th>
											<th class="border-top-bot">&nbsp;</th>
										</tr>
									</thead>
									<c:forEach var="product" items="${plist}">
										<c:if test="${product.p_type=='상품'}">
											<tr style="background-color:#fbfbfb">
												<td width=100px>${product.p_name}</td>
												<td width=100px>${product.p_std}</td>
												<td><input class="btn btn-default btn-sm" type=button
													value='삭제' onClick='removeProd(${product.p_no})' /></td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3" style="padding:0; margin-right:15px; max-width:24%;" >
					<div class="media media-services-menu right scrollpoint sp-effect2"
						style="overflow: auto;">
						<div class="media-body">
							<div class="menu_head">
								<i class="fa fa-shopping-bag fa-2x color-pro"  aria-hidden="true"></i>
								<h4>소모품</h4>
								<h3 class="plus_icon"><a href="#" onClick="insRow(this)" id="thing_add" class="fl_right margin-right-num" >+</a></h3>
							</div>
							<div class="table-responsive order_ing">
								<table class="table table-striped table-hover table-bordered_tB" id="thing">
									<thead>
										<tr>
											<th width=40% class="border-top-bot">이름</th>
											<th width=40% class="border-top-bot">단위당 수량</th>
											<th class="border-top-bot">&nbsp;</th>
										</tr>
									</thead>
									<c:forEach var="thing" items="${plist}">
										<c:if test="${thing.p_type=='소모품'}">
											<tr style="background-color:#fbfbfb">
												<td width=100px>${thing.p_name}</td>
												<td width=100px>${thing.p_std}</td>
												<td><input class="btn btn-default btn-sm" type=button
													value='삭제' onClick='removeProd(${thing.p_no})' /></td>
											</tr>
										</c:if>
									</c:forEach>
								</table> 
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12 text-lg-center"> 
				<input class="padding-in btn btn-confirm-blue" type="submit" value="확인" />
			</div>
		</form>
	</div>
