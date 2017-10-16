<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>물품관리목록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var oTbl;
	var pname, pstd;
	function insRow() {
		//var add_type=document.getElementById(type.getAttribute('id')).getAttribute('id');//버튼의 id

		oTbl = document.getElementById("recipe");

		var oRow = oTbl.insertRow();
		oRow.onmouseover = function() {
			oTbl.clickedRowIndex = this.rowIndex
		}; //clickedRowIndex - 클릭한 Row의 위치를 확인;

		var oCell1 = oRow.insertCell();
		oCell1.innerHTML = "&nbsp;";

		var oCell2 = oRow.insertCell();//재료명
		$('.m_recipe').clone().appendTo(oCell2).removeClass('m_recipe');
		// oCell2.removeClass('m_recipe');

		var oCell3 = oRow.insertCell();//수량
		oCell3.innerHTML = "<input class='form-control input-sm' type=number name=m_num  min=1  required>";

		var oCell4 = oRow.insertCell();//삭제버튼
		oCell4.innerHTML = "<a href='#'  onClick=removeRow() class='menu_minus-icon'><i class='fa fa-minus-circle' aria-hidden='true'></i></a>"; 
		
	}

	function removeRow() {

		//alert(remove+oTbl.clickedRowIndex);
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}
</script>


</head>

<style>
ul,li,ol { list-style:none; padding:0px;}
	

</style>

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-th-large"></i>주문메뉴 등록
				</h3>
			</div>

			<div class="col-lg-12" style="margin-bottom: 25px;">
				<div class="text-right active fl-left width100">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs-menu in">
						<li id="order_ing"><a
							href="/d_time/admin/product/product_list.do">재고물품<i
								class="fa fa-angle-down"></i></a></li>
						<li id="order_list"><a href="/d_time/admin/menu/menu_list.do">주문메뉴
								<i class="fa fa-angle-down"></i>
						</a></li>
						<li id="order_list" class="active"><a
							href="/d_time/admin/menu/menu_add.do">메뉴등록 <i
								class="fa fa-angle-down"></i>
						</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<form name="menu_form" method="post" action="/d_time/admin/menu/menu_add.do">
				<ul>
					<li class="padding-left-10 clear-both margin-bottom20">
						<h3 class="fl-left menu-plus">구분</h3>
						<select class="form-control select_box_style-menu" name="m_type">
							<option value="음료">음료</option>
							<option value="식품">식품</option>
							<option value="상품">상품</option>
						</select>
					</li>
					<li class="padding-left-10 clear-both margin-bottom20">
						<h3 class="fl-left menu-plus">메뉴명</h3>
						<input class='col-lg-3 form-control input-sm' type="text" name="m_name" width="50%" required /> 
					</li>
					<li class="padding-left-10 clear-both margin-bottom20 ">
						<h3 class="fl-left menu-plus">가격</h3>
						<input class='col-lg-3 form-control input-sm' type="number" name="m_cost" min="0" required />  
					</li>
				</ul>
					<table id="recipe" class="padding-left-10 clear-both margin-bottom02">
						<tr class="clear-both">
							<td class="fl-left width-auto menu-plus padding-left30 margin-right43">재료</td>
							<td><select class="m_recipe width-auto form-control select_box_style-menu fl-left" name="m_recipes">
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
								<input class="form-control input-sm fl-left"  type="number"
								name="m_num" class="m_num" min="1" required />
							</td>
							<td>
							<!-- <input class="btn btn-default btn-sm" type="button"
							value="+" onClick="insRow()" /> -->
								<a href="#" onClick="insRow()" class="menu_plus-icon">
									<i class="fa fa-plus-circle" aria-hidden="true"></i>
								</a>
							</td>
						</tr>
					</table>
					<div class="menu-plus-btn">
						<input class="btn btn-info" type="submit" value="확인" />
					</div>
				</form>

			</div>
		</div>

</html>