<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>메뉴관리목록</title>
</head>
<style>
#container {
	display: flex;
}

#box-left {
	background: white;
	flex: 1;
	text-align: center;
}

#box-center {
	background: white;
	flex: 1;
	text-align: center;
}

#box-right {
	background: white;
	flex: 1;
	text-align: center;
}
</style>
<script>
var Tbl;
var modify_d=false;
var modify_f=false;
var modify_p=false;

function modify(type){
	Tbl = document.getElementById(type);
	if(type=='drink'){
		if(!modify_d){//false:disable상태
			//다른 폼 disable처리
			$("input[type=text]").attr("disabled",true);
			$("input[type=number]").attr("disabled",true);
			$("#modify_btn_f").val('수정');
			$("#modify_btn_p").val('수정');
			modify_f=false;
			modify_p=false;
			$("input[type=submit]").remove();
			
			//해당 폼 입력받기
			$(Tbl).find("input[type=text]").attr("disabled",false);
			$(Tbl).find("input[type=number]").attr("disabled",false);
			$("#modify_btn_d").val('수정취소');
			$("#modify_btn_d").after("<input class='btn btn-info btn-sm' type='submit' value='수정완료'>");
			modify_d=true;
		}else{//true:입력가능상태
			$(Tbl).find("input[type=text]").attr("disabled",true);
			$(Tbl).find("input[type=number]").attr("disabled",true);
			$("#modify_btn_d").val('수정');
			$("input[type=submit]").remove();
			modify_d=false;
		}
		
	}else if(type=='food'){
		
		if(!modify_f){//false:disable상태
			//다른 폼 disable처리
			modify_d=false;
			modify_p=false;
			
			$("input[type=text]").attr("disabled",true);
			$("input[type=number]").attr("disabled",true);
			$("#modify_btn_d").val('수정');
			$("#modify_btn_p").val('수정');
			
			$("input[type=submit]").remove();
			
			//해당 폼 입력받기
			modify_f=true;
			$(Tbl).find("input[type=text]").attr("disabled",false);
			$(Tbl).find("input[type=number]").attr("disabled",false);
			$("#modify_btn_f").val('수정취소');
			$("#modify_btn_f").after("<input class='btn btn-info btn-sm' type='submit' value='수정완료'>");
			
		}else{//true:입력가능상태
			modify_f=false;
			$(Tbl).find("input[type=text]").attr("disabled",true);
			$(Tbl).find("input[type=number]").attr("disabled",true);
			$("#modify_btn_f").val('수정');
			$("input[type=submit]").remove();
			
		}
		
		
		
	}else if(type=='product'){
		if(!modify_p){//false:disable상태
			//다른 폼 disable처리
			modify_d=false;
			modify_f=false;
			$("input[type=text]").attr("disabled",true);
			$("input[type=number]").attr("disabled",true);
			
			$("#modify_btn_d").val('수정');
			$("#modify_btn_f").val('수정');
			
			$("input[type=submit]").remove();
			
			//해당 폼 입력받기
			modify_p=true;
			$(Tbl).find("input[type=text]").attr("disabled",false);
			$(Tbl).find("input[type=number]").attr("disabled",false);
			$("#modify_btn_p").val('수정취소');
			$("#modify_btn_p").after("<input class='btn btn-info btn-sm' type='submit' value='수정완료'>");
			
		}else{//true:입력가능상태
			modify_p=false;
			$(Tbl).find("input[type=text]").attr("disabled",true);
			$(Tbl).find("input[type=number]").attr("disabled",true);
			$("#modify_btn_p").val('수정');
			$("input[type=submit]").remove();
		}
	}
	
	
}

function delete_menu(m_no){
	if(confirm("정말 삭제하시겠습니까??"+m_no) == true){
		location.href='/d_time/admin/menu/menu_delete.do?m_no='+m_no;
	}
	
}
</script>
<body>
<h3>메뉴목록</h3>

<button class="btn btn-default" onClick="javascript:location.href='/d_time/admin/product/product_list.do'">재고물품</button>

<button class="btn btn-default" onClick="javascript:location.href='/d_time/admin/menu/menu_list.do'">주문메뉴</button>
<br><br>

	<form name="menu_form" method="post" action="/d_time/admin/menu/modify.do">
	<div id='container'>
	
		<div id='box-left'>
			<h5>음료</h5><input class="btn btn-default btn-sm" id="modify_btn_d" type="button" value="수정" onclick="modify('drink')"/><br/><br/>
			<table id="drink">
			<c:forEach var="menu" items="${mlist}">
			<c:if test="${menu.m_type=='음료' }">
			<tr><td><input class="form-control input-sm" type="text" name="m_name" value="${menu.m_name}" disabled required/></td><td><input class="form-control input-sm" type="number" name="m_cost" value="${menu.m_cost}" min=0 disabled required/></td>
			<td><input class="btn btn-default btn-sm" type="button" value="메뉴삭제" onclick="delete_menu(${menu.m_no})"/></td></tr>
			<tr><td colspan=3>recipe : ${menu.m_recipe }</td></tr>
		<input type="hidden" name="m_no" value="${menu.m_no }"/>
			</c:if>
			</c:forEach>
			</table>
		</div>
		
		<div id='box-center'>
			<h5>식품</h5><input class="btn btn-default btn-sm" id="modify_btn_f" type="button" value="수정" onclick="modify('food')"/><br/><br/>
			<table id="food">
			<c:forEach var="menu" items="${mlist }">
			<c:if test="${menu.m_type=='식품' }">
			<tr><td><input class="form-control input-sm" type="text" name="m_name" value="${menu.m_name}" disabled required/></td><td><input class="form-control input-sm" type="number" name="m_cost" value="${menu.m_cost}" min=0 disabled required/></td>
			<td><input class="btn btn-default btn-sm" type="button" value="메뉴삭제" onclick="delete_menu(${menu.m_no})"/></td></tr>
			<tr><td colspan=3>recipe : ${menu.m_recipe }</td></tr>
			<input type="hidden" name="m_no" value="${menu.m_no }"/>
			</c:if>
			</c:forEach>
			</table>
			
		</div>
		<div id='box-right'>
			<h5>상품</h5><input class="btn btn-default btn-sm" id="modify_btn_p" type="button" value="수정" onclick="modify('product')"/><br/><br/>
			<table id="product">
			<c:forEach var="menu" items="${mlist}">
			<c:if test="${menu.m_type=='상품' }">
			<tr><td><input class="form-control input-sm" type="text" name="m_name" value="${menu.m_name}" disabled required/></td><td><input class="form-control input-sm" type="number" name="m_cost" value="${menu.m_cost}" min=0 disabled required/></td>
			<td><input class="btn btn-default btn-sm" type="button" value="메뉴삭제" onclick="delete_menu(${menu.m_no})"/></td></tr>
			<tr><td colspan=3>recipe : ${menu.m_recipe }</td></tr>
			<input type="hidden" name="m_no" value="${menu.m_no}"/>
			</c:if>
			</c:forEach>
			</table>
		</div>
	
	</div>
	</form>
	<button class='btn btn-info' onClick="javascript:location.href='/d_time/admin/menu/menu_add.do'">메뉴추가</button>
</body>
</html>