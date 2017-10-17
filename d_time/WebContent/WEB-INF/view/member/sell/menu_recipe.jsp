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


		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-th-large"></i>주문메뉴
				</h3>
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
									
								</div>
								<div class="table-responsive">
									<table
										class="table table-striped table-hover table-bordered_tB"
										id="drink">
										<thead>
											<tr>
												<th width=40% class="padding-left-20 border-top-bot">메뉴</th>
												<th width=40% class="padding-left-20 border-top-bot">가격</th>
											
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
													
												</tr>

												<tr id="menu-recipe" >

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
									
								</div>
								<div class="table-responsive order_ing">
									<table
										class="table table-striped table-hover table-bordered_tB"
										id="food">
										<thead>
											<tr>
												<th width=40% class="padding-left-20 border-top-bot">메뉴</th>
												<th width=40% class="padding-left-20 border-top-bot">가격</th>
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


												</tr>
												<tr id="menu-recipe" >
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
									
								</div>
								<div class="table-responsive order_ing">
									<table
										class="table table-striped table-hover table-bordered_tB"
										id="product">
										<thead>
											<tr>
												<th width=40% class="padding-left-20 border-top-bot">메뉴</th>
												<th width=40% class="padding-left-20 border-top-bot">가격</th>
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
													
												</tr>

												<tr id="menu-recipe" >
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
								
								</div>
							</div>
						</div>
					</div>

				</div>

			</form>
			
		</div>
	