<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>메뉴관리목록</title>
</head>
<style>
#container {
	display: flex;
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
			$("input[type=hidden]").attr("disabled",true);
			$("#modify_btn_f").val('수정');
			$("#modify_btn_p").val('수정');
			modify_f=false;
			modify_p=false;
			
			
			$('button#btn-modify-f-con').addClass('disN');
			$('input#input-modify-f').addClass('input-disabled');
			$('input#input-modify-f-num').addClass('input-disabled');
			$('#modify_btn_f_x').addClass('disN');
			$('#modify_btn_f').removeClass('disN');
			
			$('button#btn-modify-p-con').addClass('disN');
			$('input#input-modify-p').addClass('input-disabled');
			$('input#input-modify-p-num').addClass('input-disabled');
			$('#modify_btn_p_x').addClass('disN');
			$('#modify_btn_p').removeClass('disN');
			
			
			
			
			$("input[type=submit]").remove();
			
			//해당 폼 입력받기
			
			$(Tbl).find("input[type=text]").attr("disabled",false);
			$(Tbl).find("input[type=number]").attr("disabled",false);
			$(Tbl).find("input[type=hidden]").attr("disabled",false);
			
			$("#modify_btn_d").addClass('disN');
			$('#modify_btn_d_x').removeClass('disN');
			$('button#btn-modify-d-con').removeClass('disN');
			$('input#input-modify-d').removeClass('input-disabled');
			$('input#input-modify-d-num').removeClass('input-disabled');
			modify_d=true; 
			
			
			
			
			
		}else{//true:입력가능상태
			
			$(Tbl).find("input[type=text]").attr("disabled",true);
			$(Tbl).find("input[type=number]").attr("disabled",true);
			$(Tbl).find("input[type=hidden]").attr("disabled",true);
			$("#modify_btn_d").removeClass('disN');
			$('#modify_btn_d_x').addClass('disN');
			$('input#input-modify').addClass('input-disabled');
			$('input#input-modify-num').addClass('input-disabled');
			
			$('button#btn-modify-con').addClass('disN'); 
			$("input[type=submit]").remove();
			modify_d=false;
		}
		
	}else if(type=='food'){
		
		if(!modify_f){//false:disable상태
			//다른 폼 disable처리
			
			
			
			$("input[type=text]").attr("disabled",true);
			$("input[type=number]").attr("disabled",true);
			$("input[type=hidden]").attr("disabled",true);
			modify_d=false;
			modify_p=false;
			$("#modify_btn_d").val('수정');
			$("#modify_btn_p").val('수정');
			
			$('button#btn-modify-d-con').addClass('disN');
			$('input#input-modify-d').addClass('input-disabled');
			$('input#input-modify-d-num').addClass('input-disabled');
			$('#modify_btn_d_x').addClass('disN');
			$('#modify_btn_d').removeClass('disN');
			
			$('button#btn-modify-p-con').addClass('disN');
			$('input#input-modify-p').addClass('input-disabled');
			$('input#input-modify-p-num').addClass('input-disabled');
			$('#modify_btn_p_x').addClass('disN');
			$('#modify_btn_p').removeClass('disN');
			
			
			
			
			$("input[type=submit]").remove();
			
			//해당 폼 입력받기
			modify_f=true;
			
			$(Tbl).find("input[type=text]").attr("disabled",false);
			$(Tbl).find("input[type=number]").attr("disabled",false);
			$(Tbl).find("input[type=hidden]").attr("disabled",false);
			$("#modify_btn_f").addClass('disN');
			$('#modify_btn_f_x').removeClass('disN');
			
			$('input#input-modify-f').removeClass('input-disabled');
			$('input#input-modify-f-num').removeClass('input-disabled');
			$('button#btn-modify-f-con').removeClass('disN');
			
			
		}else{//true:입력가능상태
			modify_f=false;
		
			$(Tbl).find("input[type=text]").attr("disabled",true);
			$(Tbl).find("input[type=number]").attr("disabled",true);
			$(Tbl).find("input[type=hidden]").attr("disabled",true);
		
			$("#modify_btn_f").removeClass('disN');
			$('#modify_btn_f_x').addClass('disN');
			$('input#input-modify-f').addClass('input-disabled');
			$('input#input-modify-f-num').addClass('input-disabled');
			
			
			
			$('button#btn-modify-f-con').addClass('disN'); 
			$("input[type=submit]").remove();
			
			
			
		}
		
		
		
	}else if(type=='product'){
		if(!modify_p){//false:disable상태
			//다른 폼 disable처리
			modify_d=false;
			modify_f=false;
			$("input[type=text]").attr("disabled",true);
			$("input[type=number]").attr("disabled",true);
			$("input[type=hidden]").attr("disabled",true);
			
			$('button#btn-modify-d-con').addClass('disN');
			$('input#input-modify-d').addClass('input-disabled');
			$('input#input-modify-d-num').addClass('input-disabled');
			$('#modify_btn_d_x').addClass('disN');
			$('#modify_btn_d').removeClass('disN');
			
			$('button#btn-modify-f-con').addClass('disN');
			$('input#input-modify-f').addClass('input-disabled');
			$('input#input-modify-f-num').addClass('input-disabled');
			$('#modify_btn_f_x').addClass('disN');
			$('#modify_btn_f').removeClass('disN');
			
			
			
			
			
			$("#modify_btn_d").val('수정');
			$("#modify_btn_f").val('수정');
			
			$("input[type=submit]").remove();
			
			//해당 폼 입력받기
			modify_p=true;
			$(Tbl).find("input[type=text]").attr("disabled",false);
			$(Tbl).find("input[type=number]").attr("disabled",false);
			$(Tbl).find("input[type=hidden]").attr("disabled",false);
			$("#modify_btn_p").addClass('disN');
			$('#modify_btn_p_x').removeClass('disN');
			$('button#btn-modify-p-con').removeClass('disN');
			$('input#input-modify-p').removeClass('input-disabled');
			$('input#input-modify-num-p').removeClass('input-disabled');
			
		}else{//true:입력가능상태
			modify_p=false;
		
			$("#modify_btn_p").removeClass('disN');
			$('#modify_btn_p_x').addClass('disN');
			$('input#input-modify-p').addClass('input-disabled');
			$('input#input-modify-num-p').addClass('input-disabled');
			
			$(Tbl).find("input[type=text]").attr("disabled",true);
			$(Tbl).find("input[type=number]").attr("disabled",true);
			$(Tbl).find("input[type=hidden]").attr("disabled",true);
			$('button#btn-modify-p-con').addClass('disN'); 
			$("input[type=submit]").remove();
		}
	}
	
}

function delete_menu(m_no,m_name){
	if(confirm(m_name+"를 삭제하시겠습니까??") == true){
		location.href='/d_time/admin/menu/menu_delete.do?m_no='+m_no;
	}
	
}

$(function(){
	//$(".table-responsive tbody tr").click(function() {
	$('.menu-list').click(function(){
		if($(this).next().hasClass('hide')) {
			$(this).next().removeClass('hide');
		} else {
			$(this).next().addClass('hide');
		}
	});
});
</script>

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-th-large"></i>주문메뉴
				</h3>
			</div>

			<div class="col-lg-12" style="margin-bottom: 25px;">
				<div class="text-right active fl-left width100">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs-menu in">
						<li id="order_ing"><a
							href="/d_time/admin/product/product_list.do">재고물품<i
								class="fa fa-angle-down"></i></a></li>
						<li id="order_list" class="active"><a
							href="/d_time/admin/menu/menu_list.do">주문메뉴 <i
								class="fa fa-angle-down"></i>
						</a></li>
						<li id="order_list"><a href="/d_time/admin/menu/menu_add.do">메뉴등록
								<i class="fa fa-angle-down"></i>
						</a></li>
					</ul>
				</div>
			</div>

			<form name="menu_form" method="post"
				action="/d_time/admin/menu/modify.do">
				<div id="container" class="col-lg-12">
					<div class="col-lg-4">
						<div
							class="media media-services-menu right scrollpoint sp-effect2"
							style="overflow: auto;">
							<div class="media-body">
								<div class="menu_head">
									<i class="fa fa-coffee fa-2x color-pro" aria-hidden="true"></i>
									<h4>음료</h4>
									<h3 class="modify">
										<a href="#" onclick="modify('drink')" id="modify_btn_d"
											class="fl_right margin-right-num "> <i
											class="fa fa-pencil-square-o color-modify size-2x"
											aria-hidden="true"></i>
										</a> <a href="#" onclick="modify('drink')" id="modify_btn_d_x"
											class="fl_right margin-right-num disN"> <i
											class="fa fa-undo color-modify size-2x" aria-hidden="true"></i>
										</a>
									</h3>
								</div>
								<div class="table-responsive">
									<table
										class="table table-striped table-hover table-bordered_tB"
										id="drink">
										<thead>
											<tr>
												<th width=40% class="padding-left-20 border-top-bot">메뉴</th>
												<th width=40% class="padding-left-20 border-top-bot">가격</th>
												<th class="border-top-bot">&nbsp;</th>
											</tr>
										</thead>
										<c:forEach var="menu" items="${mlist}">
											<c:if test="${menu.m_type=='음료'}">

												<tr style="background-color: #fbfbfb" class="menu-list">
													<td><input
														class="input-disabled form-control input-sm font-size-15"
														type="text" id="input-modify-d" name="m_name"
														value="${menu.m_name}" disabled required /></td>
													<td><input
														class="input-disabled form-control input-sm font-size-15"
														type="number" id="input-modify-d-num" name="m_cost"
														value="${menu.m_cost}" min=0 disabled required /></td>
													<td><input class="btn btn-default btn-sm"
														type="button" value="메뉴삭제"
														onclick="delete_menu(${menu.m_no},'${menu.m_name}')" /></td>
												</tr>

												<tr id="menu-recipe" class="hide">

													<td colspan=3><i
														class="fa fa-angle-double-left fa-rotate-180"
														aria-hidden="true"></i>recipe : ${menu.m_recipe}</td>
												</tr>
												<input type="hidden" name="m_no" value="${menu.m_no}"
													disabled />
											</c:if>
										</c:forEach>

										<!-- <tr>
											<td>
												<input class='btn btn-info btn-sm' id="modify-confirm" type='submit' value="수정완료"/>
											</td>
										</tr> -->
									</table>

								</div>
								<button
									class='btn btn-info btn-sm float-right margin-right-10 margin-top-13 disN'
									id="btn-modify-d-con" type="submit">수정완료</button>
								<!-- <input class="btn btn-info btn-sm disN"  id="btn-modify-con" type="submit'" value="수정완료"/> -->
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div
							class="media media-services-menu right scrollpoint sp-effect2"
							style="overflow: auto;">

							<div class="media-body">
								<div class="menu_head">
									<i class="fa fa-cutlery fa-2x color-pro" aria-hidden="true"></i>
									<h4>식품</h4>
									<h3 class="modify">
										<a href="#" onclick="modify('food')" id=modify_btn_f
											class="fl_right margin-right-num "> <i
											class="fa fa-pencil-square-o color-modify size-2x"
											aria-hidden="true"></i>
										</a> <a href="#" onclick="modify('food')" id="modify_btn_f_x"
											class="fl_right margin-right-num disN"> <i
											class="fa fa-undo color-modify size-2x" aria-hidden="true"></i>
										</a>
									</h3>
								</div>
								<div class="table-responsive order_ing">
									<table
										class="table table-striped table-hover table-bordered_tB"
										id="food">
										<thead>
											<tr>
												<th width=40% class="padding-left-20 border-top-bot">메뉴</th>
												<th width=40% class="padding-left-20 border-top-bot">가격</th>
												<th class="border-top-bot">&nbsp;</th>
											</tr>
										</thead>
										<c:forEach var="menu" items="${mlist }">
											<c:if test="${menu.m_type=='식품' }">
												<tr style="background-color: #fbfbfb" class="menu-list">
													<td><input
														class="input-disabled form-control input-sm font-size-15"
														type="text" id="input-modify-f" name="m_name"
														value="${menu.m_name}" disabled required /></td>
													<td><input
														class="input-disabled form-control input-sm font-size-15"
														type="number" id="input-modify-f-num" name="m_cost"
														value="${menu.m_cost}" min=0 disabled required /></td>


													<td><input class="btn btn-default btn-sm"
														type="button" value="메뉴삭제"
														onclick="delete_menu(${menu.m_no})" /></td>
												</tr>
												<tr id="menu-recipe" class="hide">
													<td colspan=3><i
														class="fa fa-angle-double-left fa-rotate-180"
														aria-hidden="true"></i> recipe : ${menu.m_recipe }</td>
												</tr>

												<%-- <tr>
													<td colspan=3>recipe : ${menu.m_recipe }</td>
												</tr> --%>
												<input type="hidden" name="m_no" value="${menu.m_no }"
													disabled />
											</c:if>
										</c:forEach>
									</table>
								</div>
								<button
									class='btn btn-info btn-sm float-right margin-right-10 margin-top-13 disN'
									id="btn-modify-f-con" type="submit">수정완료</button>
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div
							class="media media-services-menu right scrollpoint sp-effect2"
							style="overflow: auto;">

							<div class="media-body">
								<div class="menu_head">
									<i class="fa fa-beer fa-2x color-pro" aria-hidden="true"></i>
									<h4>상품</h4>
									<h3 class="modify">
										<a href="#" onclick="modify('product')" id="modify_btn_p"
											class="fl_right margin-right-num"><i
											class="fa fa-pencil-square-o size-2x color-modify"
											aria-hidden="true"></i></a> <a href="#"
											onclick="modify('product')" id="modify_btn_p_x"
											class="fl_right margin-right-num disN"> <i
											class="fa fa-undo color-modify size-2x" aria-hidden="true"></i>
										</a>
									</h3>
								</div>
								<div class="table-responsive order_ing">
									<table
										class="table table-striped table-hover table-bordered_tB"
										id="product">
										<thead>
											<tr>
												<th width=40% class="padding-left-20 border-top-bot">메뉴</th>
												<th width=40% class="padding-left-20 border-top-bot">가격</th>
												<th class="border-top-bot">&nbsp;</th>
											</tr>
										</thead>
										<c:forEach var="menu" items="${mlist}">
											<c:if test="${menu.m_type=='상품' }">
												<tr style="background-color: #fbfbfb" class="menu-list">
													<td><input
														class="input-disabled form-control input-sm font-size-15"
														type="text" id="input-modify-p" name="m_name"
														value="${menu.m_name}" disabled required /></td>
													<td><input
														class="input-disabled form-control input-sm font-size-15"
														type="number" id="input-modify-num-p" name="m_cost"
														value="${menu.m_cost}" min=0 disabled required /></td>
													<td><input class="btn btn-default btn-sm"
														type="button" value="메뉴삭제"
														onclick="delete_menu(${menu.m_no})" /></td>
												</tr>

												<tr id="menu-recipe" class="hide">
													<td colspan=3><i
														class="fa fa-angle-double-left fa-rotate-180"
														aria-hidden="true"></i>recipe : ${menu.m_recipe }</td>
												</tr>
												<%-- <tr>
													<td colspan=3>recipe : ${menu.m_recipe }</td>
												</tr> --%>
												<input type="hidden" name="m_no" value="${menu.m_no}"
													disabled />
											</c:if>
										</c:forEach>
									</table>
									<!-- <button
										class='btn btn-info btn-sm float-right margin-right-10 margin-top-13 disN'
										id="btn-modify-p-con" type="submit'">수정완료</button> -->
								</div>
							</div>
						</div>
					</div>

				</div>

			</form>
			
		</div>
	