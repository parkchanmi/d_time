<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- /.col-lg-12 -->
<meta charset="utf-8">

	<div class="col-lg-6">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="map_area">
					<!-- 지도를 표시할 div 입니다 -->
					<div id="map" style="height: 600px;"></div>

					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6860c17f933c111ae484eb77bc0cc287"></script>

					<script>
						var list = new Array();

						list.push({
							s_no : "${storedto.s_no}",
							s_name : "${storedto.s_name}",
							s_lat : "${storedto.s_lat}",
							s_lon : "${storedto.s_lon}"
						});

						//DB에서목록뽑아옴

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new daum.maps.LatLng(list[0].s_lat,
									list[0].s_lon), // 지도의 중심좌표
							level : 5
						// 지도의 확대 레벨
						};

						// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
						var map = new daum.maps.Map(mapContainer, mapOption);

						var positions = new Array();
						for (var i = 0; i < list.length; i++) {
							positions.push({
								title : list[i].s_name,
								lat : list[i].s_lat,
								lng : list[i].s_lon,
								code : list[i].s_no

							});
						}
						//db에서 뽑아온 목록
						for (var i = 0; i < positions.length; i++) {
							addMarker(positions[i]);
						}
						function addMarker(position) {
							// 마커 이미지의 이미지 주소입니다
							var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
							// 마커 이미지의 이미지 크기 입니다
							var imageSize = new daum.maps.Size(24, 35);

							// 마커 이미지를 생성합니다    
							var markerImage = new daum.maps.MarkerImage(
									imageSrc, imageSize);

							var marker = new daum.maps.Marker({
								map : map, // 마커를 표시할 지도
								position : new daum.maps.LatLng(position.lat,
										position.lng), // 마커를 표시할 위치
								title : position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								image : markerImage,
								clickable : true
							// 마커 이미지 
							});

							// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
							marker.code = position.code;
							marker.lat = position.lat;
							marker.lng = position.lng;

							// 마커에 click 이벤트를 등록합니다

						}
					</script>

				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<form method="POST">
			<h3 class="store_title">${storedto.s_name}</h3>
			<i class="fa fa-tags fa-2x" aria-hidden="true"></i>
			<div class="store_area" style="margin-bottom: 158px">
				<ul>
					<li><i class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>${storedto.s_loc}</li>
					<li><i class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>${storedto.s_type}</li>
					<li><i class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>${storedto.s_code}</li>
					<li><i class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>${storedto.s_lat}</li>
					<li><i class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>${storedto.s_lon}</li>
					<li><i class="fa fa-angle-right color_arrow margin_right"
						aria-hidden="true"></i>${storedto.s_hp}</li>
				</ul>

				<div class="form-group">
					<div class="col-lg-6 col-lg-offset-2">
						<a href="store_modify.do?s_no=${storedto.s_no}"
							class="btn btn-primary">수정</a> <a href="#alertDel"
							class="btn btn-secondary" data-toggle="modal">삭제</a>
					</div>
				</div>
			</div>
		</form>
		<div class="panel panel-default">
			<div class="panel-heading">
				<strong><i class="fa fa-user"></i></span>담당자 정보</strong>
			</div>
			<div class="manage_info">

				<dl>
					<dt>
						<i class="fa fa-user-circle-o fa-2x" aria-hidden="true"
							style="margin-right: 15px"></i>이름 :
					</dt>
					<dd>${memdto.mem_name}</dd>
				</dl>
				<dl>
					<dt>
						<i class="fa fa-user-o fa-2x" aria-hidden="true"
							style="margin-right: 15px"></i>전화번호 :
					</dt>
					<dd>${memdto.mem_hp}</dd>
				</dl>
			</div>
		</div>
	</div>
	<!-- /.panel-body -->

<!-- /.panel -->
<!-- 삭제 alert 창 -->
<div class="modal fade" id="alertDel" " tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">지점삭제</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form accept-charset="UTF-8" role="form" method="post" action="">
					<div class="form-group">
						<h4 class="alertDelfont">삭제하시겠습니까?</h4>
					</div>
					<div class="form-group">
						<a href="store_delete.do?s_no=${storedto.s_no}"
							class="btn btn-default btn-login-submit btn-block m-t-md">확인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fa fa-angle-up"></i>
</a>

