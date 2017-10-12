<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8">

	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i>지점수정
			</h3>
		</div>

		<!-- /.col-lg-12 -->
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="marginR5"><i class="fa fa-check-square-o"></i>수정</span>

				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<fieldset>
							<form class="form-horizontal" method="POST">
								<input type="hidden" name="s_lat" id="s_lat" /> <input
									type="hidden" name="s_lon" id="s_lon" />
								<div class="form-group">
									<label for="inputEmail" class="col-lg-2 control-label"
										style="float: left">지점명</label>
									<div class="col-lg-6 marginbt">
										<input type="text" class="form-control" id="inputEmail"
											placeholder="지점명" name="s_name" value="${storedto.s_name}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword" class="col-lg-2 control-label "
										style="float: left">지점주소</label>
									<div class="col-lg-6 marginbt">
										<!-- 
												<input type="text" class="form-control" id="inputPassword"
													placeholder="지점주소" name="s_loc"> -->
										<input type="text" class="form-control" id="sample5_address"
											placeholder="주소" style="float: left;" name="s_loc"
											value="${storedto.s_loc}"> <input type="button"
											onclick="sample5_execDaumPostcode()" value="주소 검색"
											class="btn btn-default">
										<div id="map"
											style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

										<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


										<script
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6860c17f933c111ae484eb77bc0cc287&libraries=services"></script>
										<script>
											var latitude = "";
											var longitude = "";
											var mapContainer = document
													.getElementById('map'), // 지도를 표시할 div
											mapOption = {
												center : new daum.maps.LatLng(
														37.537187, 127.005476), // 지도의 중심좌표
												level : 5
											// 지도의 확대 레벨
											};

											//지도를 미리 생성
											var map = new daum.maps.Map(
													mapContainer, mapOption);
											//주소-좌표 변환 객체를 생성

											//마커를 미리 생성
											var marker = new daum.maps.Marker(
													{
														position : new daum.maps.LatLng(
																37.537187,
																127.005476),
														map : map
													});

											function sample5_execDaumPostcode() {
												new daum.Postcode(
														{
															oncomplete : function(
																	data) {
																// 각 주소의 노출 규칙에 따라 주소를 조합한다.
																// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																var fullAddr = data.address; // 최종 주소 변수
																var extraAddr = ''; // 조합형 주소 변수

																// 기본 주소가 도로명 타입일때 조합한다.
																if (data.addressType === 'R') {
																	//법정동명이 있을 경우 추가한다.
																	if (data.bname !== '') {
																		extraAddr += data.bname;
																	}
																	// 건물명이 있을 경우 추가한다.
																	if (data.buildingName !== '') {
																		extraAddr += (extraAddr !== '' ? ', '
																				+ data.buildingName
																				: data.buildingName);
																	}
																	// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
																	fullAddr += (extraAddr !== '' ? ' ('
																			+ extraAddr
																			+ ')'
																			: '');
																}

																// 주소 정보를 해당 필드에 넣는다.
																document
																		.getElementById("sample5_address").value = fullAddr;
																// 주소로 좌표를 검색

																var geocoder = new daum.maps.services.Geocoder();

																geocoder
																		.addressSearch(
																				fullAddr,
																				function(
																						result,
																						status) {
																					// 정상적으로 검색이 완료됐으면
																					if (status === daum.maps.services.Status.OK) {
																						// 해당 주소에 대한 좌표를 받아서
																						var coords = new daum.maps.LatLng(
																								result[0].y,
																								result[0].x

																						);

																						latitude = coords.jb;
																						longitude = coords.ib;

																						document
																								.getElementById('s_lat').value = latitude;
																						document
																								.getElementById('s_lon').value = longitude;

																						// 지도를 보여준다.
																						mapContainer.style.display = "block";
																						map
																								.relayout();
																						// 지도 중심을 변경한다.
																						map
																								.setCenter(coords);
																						// 마커를 결과값으로 받은 위치로 옮긴다.
																						marker
																								.setPosition(coords)
																					}
																				});
															}
														}).open();
											}
										</script>


									</div>
									<!-- <script>
												$('input.DaumZipFinder').each(
														DaumZipFinder);
											</script> -->
									<!-- <button id="searchBtn">우편번호</button> -->
								</div>
								<div class="form-group">
									<label for="inputPassword" class="col-lg-2 control-label "
										style="float: left">코드명</label>
									<div class="col-lg-6 marginbt">
										<input type="text" class="form-control" id="inputPassword"
											placeholder="코드명" name="s_code" value="${storedto.s_code}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label" style="float: left;">지점
										타입</label>
									<div class="col-lg-10" style="display: inline-flex">
										<div class="radio">
											<label> <input type="radio" name="s_type"
												id="optionsRadios1" value="직영" checked="">직영
											</label>
										</div>
										<div class="radio">
											<label> <input type="radio" name="s_type"
												id="optionsRadios2" value="가맹">가맹
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword" class="col-lg-2 control-label "
										style="float: left">H.P</label>
									<div class="col-lg-6 marginbt">
										<input type="tel" class="form-control" id="inputPassword"
											placeholder="전화번호" name="s_hp" value="${storedto.s_hp}">
									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-6 col-lg-offset-2">
										<button type="submit"
											href="store_modify.do?s_no=${storedto.s_no}"
											" class="btn btn-primary">수정</button>
									</div>
								</div>
							</form>
						</fieldset>
					</div>
				</div>
			</div>


		</div>


	</div>




<!-- 우편번호 검색 -->
<div class="modal fade" id="zip_codeModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-center">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h3 class="modal-title" id="myModalLabel">우편번호</h3>
			</div>
			<div class="modal-body text-center">
				<form id="zip_codeForm">
					<div class="input-group">
						<span class="input-group-addon">동 입력</span> <input type="text"
							class="form-control" name="query" id="query"> <span
							class="input-group-btn"> <input type="submit"
							class="btn btn-warning" value="검색" id="searchBtn"
							onkeydown="javascript:if(event.keyCode==13)">
						</span>
					</div>
				</form>
				<p></p>
				<div>
					<div style="width: 100%; height: 200px; overflow: auto">
						<table class="table text-center">
							<thead>
								<tr>
									<th style="width: 150px;">우편번호</th>
									<th style="width: 600px;">주소</th>
								</tr>
							</thead>
							<tbody id="zip_codeList"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 우편번호 검색 -->


<!-- /.content-wrapper-->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fa fa-angle-up"></i>
</a>

