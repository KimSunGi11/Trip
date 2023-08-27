<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TRIP_BOOKMARK</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styles.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min1.css">
<style>
.autocomplete-layer {
        right: 5%;
        top: 100%;
        font-size:large;
    }
.rel_search {
	position: absolute;
	width: 100%; /* To match the width of the search input */
	top: 100%; /* Position right below the search input */
	float: right;
}

.autocomplete-layer{
	margin-bottom: 5px;
	padding: 5px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 3px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과 부드럽게 변경 */
}

.autocomplete-layer div:hover {
	background-color: #f0f0f0;
}
</style>
<style type="text/css">
@font-face {
	font-family: 'OTWelcomeRA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'OTWelcomeRA1';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2')
		format('woff2');
	font-weight: 400;
	font-style: normal;
}

@font-face { /* 귀여운 느낌의 글씨체 */
	font-family: 'omyu_pretty';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face { /* 정형화된 느낌이면서 단정 */
	font-family: 'KBIZHanmaumGothic';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'SeoulNamsanM';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.b {
	font-family: 'SeoulNamsanM';
}

.a {
	font-family: 'SeoulNamsanM';
	font-size: 17px;
	color: #3a3a3a;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="memberInfo.me">TRIP</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor03"
				aria-controls="navbarColor03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><span class="nav-link active">${user.MEMBER_ID}님</span></li>
					<li class="nav-item"><a class="nav-link"
						href="getTravelSpotListuser.do">TravelList</a></li>
					<%-- <li class="nav-item"><a class="nav-link"
						href="bookmarklist.do?user_seq=${user.MEMBER_SEQ}">MyList</a></li> --%>
					<li class="nav-item"><a class="nav-link"
						href="memberdetail.me">MyInfo</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.me">Logout</a></li>
				</ul>
				<form class="d-flex" action="getTravelSpotListuser.do" method="get">
					<select name="searchCondition" class="b">
						<c:forEach items="${ conditionMap }" var="option">
							<option value="${ option.value }">${ option.key }
						</c:forEach>
					</select> <input class="form-control me-sm-2" type="text"
						placeholder="Search" id="searchKeyword" name="searchKeyword"
						oninput="handleInput(this.value)"
						aria-controls="autocompleteResults" aria-autocomplete="list"
						aria-expanded="false" role="combobox" aria-live="polite"
						autocomplete="off"> <input
						class="btn btn-secondary my-2 my-sm-0" type="submit"
						value="Search">
				</form>
				<div class="rel_search">
					<!-- This div will serve as the container for the autocomplete-layer -->

				</div>
				<script type="text/javascript">
    const ul = document.querySelector(".autocompleteResults");
    const searchInput = document.querySelector("#searchKeyword");
    const relContainer = document.querySelector(".rel_search");
    const autocompleteLayer = document.createElement('div'); // 추가: 자동 완성 결과를 보여줄 레이어

    autocompleteLayer.classList.add('autocomplete-layer'); // 추가: 레이어 스타일 적용
    relContainer.appendChild(autocompleteLayer); // 추가: 레이어를 상위 컨테이너에 추가

    const handleInput = (input) => {
        if (!input) {
            autocompleteLayer.innerHTML = ''; // 변경: ul 대신 레이어의 내용을 지움
            return;
        }

        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const data = JSON.parse(xhr.responseText);
                    autocompleteLayer.innerHTML = ''; // 변경: ul 대신 레이어의 내용을 지움

                    data.forEach(result => {
                        const resultItem = document.createElement('div'); // 변경: li 대신 div 사용
                        resultItem.textContent = result;
                        autocompleteLayer.appendChild(resultItem); // 변경: 레이어에 추가
                    });

                    autocompleteLayer.style.display = 'block'; // 추가: 레이어를 보여줌
                } else {
                    console.error('Error:', xhr.statusText);
                }
            }
        };

        xhr.open('GET', '/controller/autocomplete.do?prefix=' + encodeURIComponent(input), true);
        xhr.send();
    };

    // 변경된 부분: 레이어 클릭 시 해당 내용을 검색 입력 필드에 설정하고 레이어를 숨김
    autocompleteLayer.addEventListener('click', (event) => {
        if (event.target.tagName === 'DIV') {
            searchInput.value = event.target.textContent;
            autocompleteLayer.style.display = 'none';
        }
    });
    document.addEventListener('click', (event) => {
        if (!relContainer.contains(event.target)) {
            autocompleteLayer.style.display = 'none';
        }
    });
</script>
			</div>
		</div>
	</nav>
	<!-- Page Header-->
	<!-- <header class="masthead" style="background-color: #B8E7E1">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>BookMark</h1>
					</div>
				</div>
			</div>
		</div>
	</header> -->
	<!-- Main Content-->
	<div>
		<br> <br> <br> <br>
		<div class="container" id="map" style="width: 1000px; height: 500px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=295d614a0a5527cc0638fb8a4f22068f&libraries=services"></script>

		<style>
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

@import url(https://fonts.googleapis.com/css?family=Roboto:300,400);

@import
	url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css)
	;

img {
	height: 300px;
	width: auto;
}

figure.snip1368 {
	display: inline-block; /* 추가 */
	font-family: 'Roboto', Arial, sans-serif;
	position: relative;
	overflow: hidden;
	margin: 5px;
	min-width: 380px;
	max-width: 380px;
	min-height: 300px;
	max-height: 300px;
	width: 100%;
	color: #ffffff;
	line-height: 1.4em;
	text-align: left; /* 추가 */
	display: inline-block;
}

figure.snip1368 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

figure.snip1368 img {
	opacity: 1;
	width: 100%;
	vertical-align: top;
}

figure.snip1368 h3 {
	position: absolute;
	top: 0%;
	width: 100%;
	background-color: #212121;
	z-index: 1;
	text-align: right;
	padding: 15px 25px 0px;
	margin: 0;
	font-weight: 300;
	font-size: 1.3em;
	-webkit-transform: translateY(-200%);
	transform: translateY(-200%);
}

figure.snip1368 h3:before {
	position: absolute;
	content: '';
	top: 100%;
	left: 0;
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 415px 55px 0; /* 기울이기 조정 */
	border-color: transparent #212121 transparent transparent;
}

figure.snip1368 figcaption {
	padding: 5px 25px 15px;
	position: absolute;
	width: 100%;
	z-index: 2;
	bottom: 0%;
	background-color: #141414;
	-webkit-transform: translateY(200%);
	transform: translateY(200%);
}

figure.snip1368 figcaption:before {
	position: absolute;
	content: '';
	bottom: 100%;
	left: 0;
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 55px 0 0 415px; /* 기울이기 조정 */
	border-color: transparent transparent transparent #141414;
}

figure.snip1368 .icons {
	margin-top: -20px;
}

figure.snip1368 i {
	padding: 0px 8px;
	display: inline-block;
	font-size: 24px;
	color: #ffffff;
	text-align: center;
	opacity: 0.7;
}

figure.snip1368 i:hover {
	opacity: 1;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

figure.snip1368:hover h3, figure.snip1368.hover h3 {
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

figure.snip1368:hover figcaption, figure.snip1368.hover figcaption {
	-webkit-transform: translateY(0%);
	transform: translateY(0%);
}

.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 9999;
}
</style>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 12
			// 지도의 확대 레벨
			};

			//지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			//주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			//주소 목록
			var addresses = [];
			var placename = [];

			// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
			var bounds = new kakao.maps.LatLngBounds();

			var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
			var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
			var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
			var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
			var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

				// 마우스로 클릭한 위치입니다 
				var clickPosition = mouseEvent.latLng;

				// 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
				if (!drawingFlag) {

					// 상태를 true로, 선이 그리고있는 상태로 변경합니다
					drawingFlag = true;

					// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
					deleteClickLine();

					// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
					deleteDistnce();

					// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
					deleteCircleDot();

					// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
					clickLine = new kakao.maps.Polyline({
						map : map, // 선을 표시할 지도입니다 
						path : [ clickPosition ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#db4040', // 선의 색깔입니다
						strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다
					});

					// 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
					moveLine = new kakao.maps.Polyline({
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#db4040', // 선의 색깔입니다
						strokeOpacity : 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다    
					});

					// 클릭한 지점에 대한 정보를 지도에 표시합니다
					displayCircleDot(clickPosition, 0);

				} else { // 선이 그려지고 있는 상태이면

					// 그려지고 있는 선의 좌표 배열을 얻어옵니다
					var path = clickLine.getPath();

					// 좌표 배열에 클릭한 위치를 추가합니다
					path.push(clickPosition);

					// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
					clickLine.setPath(path);

					var distance = Math.round(clickLine.getLength());
					displayCircleDot(clickPosition, distance);
				}
			});

			// 지도에 마우스무브 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
			kakao.maps.event
					.addListener(
							map,
							'mousemove',
							function(mouseEvent) {

								// 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
								if (drawingFlag) {

									// 마우스 커서의 현재 위치를 얻어옵니다 
									var mousePosition = mouseEvent.latLng;

									// 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
									var path = clickLine.getPath();

									// 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
									var movepath = [ path[path.length - 1],
											mousePosition ];
									moveLine.setPath(movepath);
									moveLine.setMap(map);

									var distance = Math.round(clickLine
											.getLength()
											+ moveLine.getLength()), // 선의 총 거리를 계산합니다
									content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">'
											+ distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

									// 거리정보를 지도에 표시합니다
									showDistance(content, mousePosition);
								}
							});

			// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
			kakao.maps.event
					.addListener(
							map,
							'rightclick',
							function(mouseEvent) {

								// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
								if (drawingFlag) {

									// 마우스무브로 그려진 선은 지도에서 제거합니다
									moveLine.setMap(null);
									moveLine = null;

									// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
									var path = clickLine.getPath();

									// 선을 구성하는 좌표의 개수가 2개 이상이면
									if (path.length > 1) {

										// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
										if (dots[dots.length - 1].distance) {
											dots[dots.length - 1].distance
													.setMap(null);
											dots[dots.length - 1].distance = null;
										}

										var distance = Math.round(clickLine
												.getLength()), // 선의 총 거리를 계산합니다
										content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

										// 그려진 선의 거리정보를 지도에 표시합니다
										showDistance(content,
												path[path.length - 1]);

									} else {

										// 선을 구성하는 좌표의 개수가 1개 이하이면 
										// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
										deleteClickLine();
										deleteCircleDot();
										deleteDistnce();

									}

									// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
									drawingFlag = false;
								}
							});

			// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
			function deleteClickLine() {
				if (clickLine) {
					clickLine.setMap(null);
					clickLine = null;
				}
			}

			// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
			// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
			function showDistance(content, position) {

				if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

					// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
					distanceOverlay.setPosition(position);
					distanceOverlay.setContent(content);

				} else { // 커스텀 오버레이가 생성되지 않은 상태이면

					// 커스텀 오버레이를 생성하고 지도에 표시합니다
					distanceOverlay = new kakao.maps.CustomOverlay({
						map : map, // 커스텀오버레이를 표시할 지도입니다
						content : content, // 커스텀오버레이에 표시할 내용입니다
						position : position, // 커스텀오버레이를 표시할 위치입니다.
						xAnchor : 0,
						yAnchor : 0,
						zIndex : 3
					});
				}
			}

			// 그려지고 있는 선의 총거리 정보와 
			// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
			function deleteDistnce() {
				if (distanceOverlay) {
					distanceOverlay.setMap(null);
					distanceOverlay = null;
				}
			}

			// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
			function displayCircleDot(position, distance) {

				// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
				var circleOverlay = new kakao.maps.CustomOverlay({
					content : '<span class="dot"></span>',
					position : position,
					zIndex : 1
				});

				// 지도에 표시합니다
				circleOverlay.setMap(map);

				if (distance > 0) {
					// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
					var distanceOverlay = new kakao.maps.CustomOverlay(
							{
								content : '<div class="dotOverlay">거리 <span class="number">'
										+ distance + '</span>m</div>',
								position : position,
								yAnchor : 1,
								zIndex : 2
							});

					// 지도에 표시합니다
					distanceOverlay.setMap(map);
				}

				// 배열에 추가합니다
				dots.push({
					circle : circleOverlay,
					distance : distanceOverlay
				});
			}

			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
			function deleteCircleDot() {
				var i;

				for (i = 0; i < dots.length; i++) {
					if (dots[i].circle) {
						dots[i].circle.setMap(null);
					}

					if (dots[i].distance) {
						dots[i].distance.setMap(null);
					}
				}

				dots = [];
			}

			// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
			// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
			// HTML Content를 만들어 리턴하는 함수입니다
			function getTimeHTML(distance) {

				// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
				var walkkTime = distance / 67 | 0;
				var walkHour = '', walkMin = '';

				// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
				if (walkkTime > 60) {
					walkHour = '<span class="number">'
							+ Math.floor(walkkTime / 60) + '</span>시간 '
				}
				walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

				// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
				var bycicleTime = distance / 227 | 0;
				var bycicleHour = '', bycicleMin = '';

				// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
				if (bycicleTime > 60) {
					bycicleHour = '<span class="number">'
							+ Math.floor(bycicleTime / 60) + '</span>시간 '
				}
				bycicleMin = '<span class="number">' + bycicleTime % 60
						+ '</span>분'

				// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
				var content = '<ul class="dotOverlay distanceInfo">';
				content += '    <li>';
				content += '        <span class="label">총거리</span><span class="number">'
						+ distance + '</span>m';
				content += '    </li>';
				content += '    <li>';
				content += '        <span class="label">도보</span>' + walkHour
						+ walkMin;
				content += '    </li>';
				content += '    <li>';
				content += '        <span class="label">자전거</span>'
						+ bycicleHour + bycicleMin;
				content += '    </li>';
				content += '</ul>'

				return content;
			}

			<c:forEach items="${bookmarklist}" var="bookmark">
			addresses.push("${bookmark.address_travel}");
			placename.push("${bookmark.place_travel}");
			</c:forEach>

			//주소 검색 함수를 정의합니다
			function searchAddress(address, i) {
				geocoder
						.addressSearch(
								address,
								function(result, status) {
									if (status === kakao.maps.services.Status.OK) {
										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);
										var imageSrc = "images/marker/KakaoTalk_20230504_141607445.png", imageSize = new kakao.maps.Size(
												27, 28), markerImage = new kakao.maps.MarkerImage(
												imageSrc, imageSize);
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords,
											image : markerImage
										});
										// 인포윈도우를 생성합니다
										var iwContent = '<div style="padding:5px;">'
												+ placename[i] + '</div>';
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : iwContent
												});
										// 마커에 마우스오버 이벤트를 등록합니다
										kakao.maps.event.addListener(marker,
												'mouseover', function() {
													// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
													infowindow
															.open(map, marker);
												});
										// 마커에 마우스아웃 이벤트를 등록합니다
										kakao.maps.event.addListener(marker,
												'mouseout', function() {
													// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
													infowindow.close();
												});

										// LatLngBounds 객체에 좌표를 추가합니다
										bounds.extend(coords);
									}
									// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
									// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
									map.setBounds(bounds);
								});
			}

			// 모든 주소를 검색합니다
			for (var i = 0; i < addresses.length; i++) {
				searchAddress(addresses[i], i);
			}
		</script>
		<main class="mb-4">
			<br>


			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<table width="100%" cellspacing="0" cellpadding="0" border="0"
						align="center">
						<tr>
							<td>
								<hr> <br>
								<table class="table table-hover">
									<thead>
										<tr align="center" class="b">
											<th scope="col" width="15%">관광지</th>
											<th scope="col">주&nbsp;소</th>
											<th scope="col" width="15%">관&nbsp;리</th>

										</tr>
									<tbody>
										<c:forEach items="${bookmarklist}" var="bookmark">
											<form action="deleteBookmark.do">
												<input type="hidden" name="seq_travel"
													value="${bookmark.seq_travel}"> <input
													type="hidden" name="user_seq" value="${user.MEMBER_SEQ}">
												<input type="hidden" name="address_travel"
													value="${bookmark.address_travel}"><input
													type="hidden" name="place_travel"
													value="${bookmark.place_travel}"> <input
													type="hidden" name="content_travel"
													value="${bookmark.content_travel}">


												<tr class="table-light b">
													<td>
														<p align="center">
															<a href="getTravelSpotuser.do?seq=${bookmark.seq_travel}"
																style="text-decoration: none;">
																${bookmark.place_travel}</a>
														</p>
													</td>

													<td>
														<p align="center">
															<a href="getTravelSpotuser.do?seq=${bookmark.seq_travel}"
																style="text-decoration: none;">${bookmark.address_travel}</a>
														</p>
													</td>

													<td align="center"><input type="submit"
														value="즐겨찾기 삭제"
														style="text-decoration: none; color: black;" class="b">
													</td>
												</tr>

											</form>
										</c:forEach>
									</tbody>
								</table>
								<div
									style="display: flex; justify-content: center; text-align: center;">
									<ul class="pagination">
										<c:if test="${paging.startPage != 1 }">
											<li class="page-item disabled"><a class="page-link"
												href="bookmarklist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&user_seq=${user.MEMBER_SEQ}">&lt;</a>

											</li>
										</c:if>
										<c:forEach begin="${paging.startPage }"
											end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<li class="page-item active"><a class="page-link"
														href="#">${p }</a></li>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<li class="page-item"><a class="page-link"
														href="bookmarklist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&user_seq=${user.MEMBER_SEQ}">${p }</a>
													</li>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${paging.endPage != paging.lastPage}">
											<li class="page-item"><a class="page-link"
												href="bookmarklist.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&user_seq=${user.MEMBER_SEQ}">&gt;</a>
											</li>
										</c:if>
									</ul>
								</div>
							</td>
						</tr>
					</table>
					<!-- 관광지 목록 -->

				</div>
			</div>
		</main>
	</div>
	<!-- Footer-->
	<footer class="border-top">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a href="#!"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#!"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#!"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<div class="small text-center text-muted fst-italic">Copyright
						&copy; Your Website 2023</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>


</body>
</html>
