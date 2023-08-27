<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TRIPLIST</title>
<style>
.autocomplete-layer {
	position: absolute;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	max-height: 150px;
	overflow-y: auto;
	z-index: 1000;
}
</style>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300,400);

@import
	url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css)
	;

img {
	height: 210px;
}

figure.snip1368 {
	display: inline-block; /* 추가 */
	font-family: 'Roboto', Arial, sans-serif;
	position: relative;
	overflow: hidden;
	margin: 10px;
	min-width: 320px;
	max-width: 320px;
	min-height: 210px;
	max-height: 210px;
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
	border-width: 0 320px 30px 0; /* 기울이기 조정 */
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
	border-width: 30px 0 0 320px; /* 기울이기 조정 */
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
<style>
.autocomplete-layer {
	right: 10%;
	top: 100%;
	font-size: large;
}

.rel_search {
	position: absolute;
	width: 100%; /* To match the width of the search input */
	top: 100%; /* Position right below the search input */
	float: right;
}

.autocomplete-layer {
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
<!-- ======================== CSS 종료 =========================== -->

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">TRIP</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor03"
				aria-controls="navbarColor03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" href="login.me">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="memberjoin.me">Join</a>
					</li>
				</ul>
				<form class="d-flex" action="getTravelList.do" method="get">
					<select name="searchCondition" class="b">
						<c:forEach items="${ conditionMap }" var="option">
							<option value="${ option.value }">${ option.key }</option>
							<!-- 닫는 태그를 추가 -->
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

	<div class="container px-4 px-lg-5" align="center">

		<br> <br> <br> <br>

		<div align="center" class="card border-primary mb-3"
			style="position: relative; width: 90%;">
			<div style="position: absolute; top: -65px; left: 50px;">
				<img src="./images/icon2.png" style="height: 90px">
			</div>
			<div style="position: absolute; top: -65px; left: 950px;">
				<img src="./images/icon2.png" style="height: 90px">
			</div>

			<table border="1" style="text-align: center;">
				<tr>
					<td align="center"><font size="15" color="#629e95">top3</font></td>
				</tr>
				<tr>
					<td><span style="text-align: center; font-family: serif;">
							<c:forEach items="${top3}" var="travel">
								<a href="getTravelSpotNonUser.do?seq=${travel.seq}"
									style="text-decoration: none;">
									<figure class="snip1368">
										<img src=".//boardUpload/admin/${travel.imageFile3 }"
											alt="이미지에 대한 대체 텍스트"
											onerror="this.onerror=null;this.src='.//boardUpload/admin/basic.jpg';"
											height="" />
										<h3>
											<font class="b" style="font-weight: bold;">${travel.place}</font>
										</h3>
										<figcaption>
											<div class="b">${ travel.address}</div>
										</figcaption>
									</figure>
								</a>
							</c:forEach>
					</span> <script>
						$(".hover").mouseleave(function() {
							$(this).removeClass("hover");
						});
					</script></td>
				</tr>
			</table>
		</div>

		<table align="center">

			<tr>
				<td align="center">
					<!-- Main Content--> <!-- ========================================카카오 맵 API 시작=========================================== -->

					<div align="center" style="position: relative;">
						<div
							style="position: absolute; z-index: 10; bottom: 5px; padding-left: 15px;">
							<p style="margin: 20 auto; text-align: center;" class="b">
								<button onclick="panTo10()" id='your-button-id11'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">전체보기</button>
								<button onclick="panTo0()" id='your-button-id1'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">서울특별시</button>
								<button onclick="panTo1()" id='your-button-id2'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">경기도</button>
								<button onclick="panTo2()" id='your-button-id3'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">강원도</button>
								<button onclick="panTo3()" id='your-button-id4'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">충청남도</button>
								<button onclick="panTo4()" id='your-button-id5'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">충청북도</button>
								<button onclick="panTo5()" id='your-button-id6'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">경상북도</button>
								<button onclick="panTo6()" id='your-button-id7'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">경상남도</button>
								<button onclick="panTo7()" id='your-button-id8'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">전라북도</button>
								<button onclick="panTo8()" id='your-button-id9'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">전라남도</button>
								<button onclick="panTo9()" id='your-button-id10'
									class="btn btn-secondary text-uppercase"
									style="margin: 5px; font-size: 13.5px;">제주특별자치도</button>
							</p>
						</div>


						<div class="container" id="map"
							style="width: 1090px; height: 500px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=295d614a0a5527cc0638fb8a4f22068f&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(33.450701,
										126.570667), // 지도의 중심좌표
								level : 12
							// 지도의 확대 레벨
							};

							//지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							//주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();

							//주소 목록
							var addresses = [];
							var placename = [];

							// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
							var bounds = new kakao.maps.LatLngBounds();

							<c:forEach items="${travelList}" var="travel">
							addresses.push("${travel.address}");
							placename.push("${travel.place}");
							</c:forEach>

							//주소 검색 함수를 정의합니다
							function searchAddress(address, i) {
								geocoder
										.addressSearch(
												address,
												function(result, status) {
													if (status === kakao.maps.services.Status.OK) {
														var coords = new kakao.maps.LatLng(
																result[0].y,
																result[0].x);
														var imageSrc = "images/marker/maker1.png", imageSize = new kakao.maps.Size(
																30, 30), markerImage = new kakao.maps.MarkerImage(
																imageSrc,
																imageSize);
														var marker = new kakao.maps.Marker(
																{
																	map : map,
																	position : coords,
																	image : markerImage
																});
														// 인포윈도우를 생성합니다
														var iwContent = '<div>'
																+ placename[i]
																+ '</div>';
														var infowindow = new kakao.maps.InfoWindow(
																{
																	content : iwContent
																});
														// 마커에 마우스오버 이벤트를 등록합니다
														kakao.maps.event
																.addListener(
																		marker,
																		'mouseover',
																		function() {
																			// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
																			infowindow
																					.open(
																							map,
																							marker);
																		});
														// 마커에 마우스아웃 이벤트를 등록합니다
														kakao.maps.event
																.addListener(
																		marker,
																		'mouseout',
																		function() {
																			// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
																			infowindow
																					.close();
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
							function panTo10() { //전체보기
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}";
							}
							function panTo1() { //경기도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=경기";
							}
							function panTo2() { //강원도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=강원";
							}
							function panTo3() { //충청남도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=충남";
							}
							function panTo4() { //충청북도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=충북";
							}
							function panTo5() { //경상북도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=경북";
							}
							function panTo6() { //경상남도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=경남";
							}
							function panTo7() { //전라북도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=전북";
							}
							function panTo8() { //전라남도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=전남";
							}
							function panTo9() { //제주특별자치도
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=제주";
							}
							function panTo0() { //서울특별시
								window.location.href = "getTravelList.do?nowPage=1&cntPerPage=${paging.cntPerPage}&searchCondition=ADDRESS&searchKeyword=서울";
							}

							const urlParams = new URLSearchParams(
									window.location.search);
							const searchKeyword = urlParams
									.get('searchKeyword');
							const searchCondition = urlParams
									.get('searchCondition');

							// searchKeyword에 따라 특정 버튼의 백그라운드 컬러를 변경합니다.
							if (searchCondition === 'ADDRESS'
									&& searchKeyword === '서울') {
								const button = document
										.getElementById('your-button-id1');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '경기') {
								const button = document
										.getElementById('your-button-id2');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '강원') {
								const button = document
										.getElementById('your-button-id3');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '충남') {
								const button = document
										.getElementById('your-button-id4');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '충북') {
								const button = document
										.getElementById('your-button-id5');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '경북') {
								const button = document
										.getElementById('your-button-id6');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '경남') {
								const button = document
										.getElementById('your-button-id7');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '전북') {
								const button = document
										.getElementById('your-button-id8');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '전남') {
								const button = document
										.getElementById('your-button-id9');
								button.style.backgroundColor = '#212121';
							} else if (searchCondition === 'ADDRESS'
									&& searchKeyword === '제주') {
								const button = document
										.getElementById('your-button-id10');
								button.style.backgroundColor = '#212121';
							} else if (searchKeyword === null) {
								const button = document
										.getElementById('your-button-id11');
								button.style.backgroundColor = '#212121';
							}
						</script>
						<!-- ========================================카카오 맵 API 종료=========================================== -->
					</div>

				</td>
				<!--  <td align="center">-->

			</tr>


		</table>
		<style>
html {
	background: #f5f7f8;
	font-family: 'Roboto', sans-serif;
	-webkit-font-smoothing: antialiased;
}

.band {
	width: 90%;
	max-width: 1000px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: auto;
	grid-gap: 20px;
}

@media only screen and (min-width: 500px) {
	.band {
		grid-template-columns: 1fr 1fr;
	}
	.item-1 h1 {
		font-size: 30px;
	}
}

@media only screen and (min-width: 850px) {
	.band {
		grid-template-columns: repeat(auto-fill, 1fr 1fr);
	}
	.item-1 {
		grid-column: 1/3;
	}
}

.card1 {
	overflow: hidden;
}

.card1:hover {
	top: -2px;
	box-shadow: 0 4px 5px rgba(0, 0, 0, 0.2);
}

.card1 article {
	padding: 20px;
	display: flex;
	flex: 1;
	justify-content: space-between;
	flex-direction: column;
}

.card1 .thumb {
	padding-bottom: 60%;
	background-size: cover;
	background-position: center center;
}

/* typography */
h1 {
	font-size: 20px;
	margin: 0;
	color: #333;
}

.card1 span {
	font-size: 12px;
	font-weight: bold;
	color: #999;
	text-transform: uppercase;
	letter-spacing: .05em;
	margin: 2em 0 0 0;
}

.card1 .thumb {
	padding-bottom: 0;
	background-size: cover;
	background-position: center center;
}

.cardimg {
	min-width: 300px;
	min-height: 300px;
	align-self: center;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	position: relative;
}

.cardimg img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -70%);
	min-width: 100%;
	min-height: 100%;
	object-fit: cover;
	transform: scale(1.0);
	transition: transform .5s;
}

.card1:hover img {
	transform: scale(1.03);
	transition: transform .5s;
}

input:hover {
	background-color: #212121;
	color: #fff;
}
</style>

		<table width="100%" cellspacing="0" cellpadding="0" border="0"
			align="center">
			<tr>
				<td colspan="2"><br>
					<div align="right">
						<span></span>
					</div>
					<hr> <br> <!-- 화면에 보여줄 리스트 갯수에 대한 select 위치 변경 -->
					<div align="left">
						<form method="get" action="getTravelSpotList.do">
							<label for="cntPerPage">Page size:</label> <select
								id="cntPerPage" name="cntPerPage" onchange="this.form.submit()">
								<option value="4" ${paging.cntPerPage == 4 ? 'selected' : ''}>4</option>
								<option value="8" ${paging.cntPerPage == 8 ? 'selected' : ''}>8</option>
								<option value="16" ${paging.cntPerPage == 16 ? 'selected' : ''}>16</option>
							</select> <input type="hidden" name="nowPage" value="${paging.nowPage}">
						</form>
					</div>
			</tr>

			<tr>
				<form method="post">
					<table class="table table-hover" align="center">
						<tbody>
							<c:set var="count" value="0" />
							<c:forEach items="${travelList}" var="travel">
								<c:if test="${count % 4 == 0}">
									<tr class="table-light">
								</c:if>
								<form action="insertBookmark.do" method="post">
									<input type="hidden" name="seq_travel" value="${travel.seq}">
									<input type="hidden" name="user_seq" value="${user.MEMBER_SEQ}">
									<input type="hidden" name="place_travel"
										value="${travel.place}"> <input type="hidden"
										name="address_travel" value="${travel.address}"> <input
										type="hidden" name="content_travel" value="${travel.content}">
									<td>
										<div class="item-1" style="overflow: hidden; width: 300px;"
											align="center">
											<a href="getTravelSpotNonUser.do?seq=${travel.seq}"
												class="card1 card" style="text-decoration: none;">
												<div class="thumb" style="width: 300px; height: 300px;">
													<img class="cardimg"
														src="./boardUpload/admin/${travel.imageFile1}">
												</div>
												<article>
													<h1 class="b" style="font-weight: bold;">${travel.place}</h1>
													<p>
													<table>
														<tr class="b">
															<td align="left">조회수 : ${travel.cnt}</td>
															<td align="right"><img id="like-img"
																style="width: 20px; height: 20px; cursor: pointer;"
																alt="" src="resources/img/heart.png">
																${travel.likes}</td>
														</tr>
														<tr>
															<td colspan="2" align="center"></td>
														</tr>
													</table>
												</article>
											</a>
										</div>
									</td>
								</form>
								<c:set var="count" value="${count + 1}" />
								<c:if test="${count % 4 == 0}">
									</tr>
								</c:if>
							</c:forEach>
							<c:if test="${count % 4 != 0}">
								</tr>
							</c:if>
						</tbody>

					</table>


					<!-- ========= 카드 ui 종료 ========== -->
					<div
						style="display: flex; justify-content: center; text-align: center;">
						<ul class="pagination">
							<c:if test="${paging.startPage != 1 }">
								<li class="page-item"><a class="page-link"
									href="getTravelList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword}">&lt;</a>
								</li>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li class="page-item active"><a class="page-link"
											href="#">${p }</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li class="page-item"><a class="page-link"
											href="getTravelList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword}">${p }</a>

										</li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li class="page-item"><a class="page-link"
									href="getTravelList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${paging.searchCondition }&searchKeyword=${paging.searchKeyword}">&gt;</a>
								</li>
							</c:if>
						</ul>
					</div>
			</tr>

		</table>

		<br>


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