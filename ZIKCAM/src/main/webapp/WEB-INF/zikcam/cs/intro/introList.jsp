<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

</head>
<body>
		
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h3>직캠소개</h3>
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> -->
						<font color="gray">당신이 <strong><U>직</U>접</strong> 고른 <strong><U>캠</U>핑</strong> 용품</font>
						<hr />
						<img alt="" src="../resources/images/KakaoTalk_20210908_124757248_01.jpg" style="width:500px;height:400px;"><br>
						
						<h5>안녕하세요. <strong>Team직캠</strong>입니다.<br></h5>
						직캠 홈페이지를 방문해주신 여러분, 반갑습니다.<br>
						지속적인 성장을 통해 더 나은 사이트를 만들고자 하는 Team직캠의 노력에<br>
						많은 관심과 성원을 부탁드립니다. 감사합니다.
						
						
						<hr />
						<h3>찾아오시는 길</h3>
						<hr/>
						본사주소 : 서울특별시 종로구 관철동 15-5 미려빌딩 3층 302호 1팀 직캠컴퍼니
						<div id="map" style="width:500px;height:400px;"></div>
						
						
						<hr/>
						<h3>고객센터</h3>
						<hr/>
						<h5>cs센터 연락처 : 02-xxxx-xxxx <br/>
						kakaoID : cat1234</h5>
					</div>
				</section>
			</main>
	
	<!-- 카카오지도 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?
		appkey=17aadccf621dd46cd8800068cb97f9ff&libraries=services,clusterer,drawing">
	</script>
	
	<script>	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
		center: new kakao.maps.LatLng(37.56997, 126.986029), // 지도의 중심좌표
			level: 4 // 지도의 확대 레벨
		};

		// 지도를 표시할 div와 지도 옵션으로 지도를 생성
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 마커가 표시될 위치 
		var markerPosition = new kakao.maps.LatLng(37.56997, 126.986029); 
												
		// 마커 생성
		var marker = new kakao.maps.Marker({
			position: markerPosition,
			text : '미려빌딩 3층 302호 1팀 직캠컴퍼니'
		});
												
		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);
												
		// 마커가 드래그 가능하도록 설정
		marker.setDraggable(true);
	</script>
</body>
</html>
