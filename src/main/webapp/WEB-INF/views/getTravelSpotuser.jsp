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
<title>TRIPSPOT_USER</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
@import url(https://fonts.googleapis.com/css?family=Varela+Round);

.slides {
	padding: 0;
	width: 600px;
	height: 600px;
	display: block;
	margin: 0 auto;
	position: relative;
}

.slides * {
	user-select: none;
	-ms-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	-webkit-touch-callout: none;
}

.slides input {
	display: none;
}

.slide-container {
	display: block;
}

.slide {
	top: 0;
	opacity: 0;
	width: 600px;
	height: 600px;
	display: block;
	position: absolute;
	transform: scale(0);
	transition: all .7s ease-in-out;
}

.slide img {
	width: 100%;
	height: 100%;
}

.nav label {
	width: 200px;
	height: 100%;
	display: none;
	position: absolute;
	opacity: 0;
	z-index: 9;
	cursor: pointer;
	transition: opacity .2s;
	color: #FFF;
	font-size: 156pt;
	text-align: center;
	line-height: 600px;
	font-family: "Varela Round", sans-serif;
	background-color: rgba(255, 255, 255, .3);
	text-shadow: 0px 0px 15px rgb(119, 119, 119);
}

.slide:hover+.nav label {
	opacity: 0.5;
}

.nav label:hover {
	opacity: 1;
}

.nav .next {
	right: 0;
}

input:checked+.slide-container  .slide {
	opacity: 1;
	transform: scale(1);
	transition: opacity 1s ease-in-out;
}

input:checked+.slide-container .nav label {
	display: block;
}

.nav-dots {
	width: 100%;
	bottom: 9px;
	height: 11px;
	display: block;
	position: absolute;
	text-align: center;
}

.nav-dots .nav-dot {
	top: -5px;
	width: 11px;
	height: 11px;
	margin: 0 4px;
	position: relative;
	border-radius: 100%;
	display: inline-block;
	background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.8);
}

input#img-1:checked ~ .nav-dots label#img-dot-1, input#img-2:checked ~
	.nav-dots label#img-dot-2, input#img-3:checked ~ .nav-dots label#img-dot-3,
	input#img-4:checked ~ .nav-dots label#img-dot-4, input#img-5:checked ~
	.nav-dots label#img-dot-5, input#img-6:checked ~ .nav-dots label#img-dot-6
	{
	background: rgba(0, 0, 0, 0.8);
}

/* ========== 이미지 업로드 css ============= */
* {
	box-sizing: border-box;
}

.file-input {
	display: inline-block;
	text-align: left;
	background: #fff;
	padding: 3px; /* 버튼 padding */
	width: 300px; /* 파일 첨부 넓이 450px에서 수정함 */
	position: relative;
	border-radius: 3px;
}

.file-input>[type='file'] { /* 기존 디자인 없애기 */
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	z-index: 10;
	cursor: pointer;
}

.file-input:hover>.button {
	background: dodgerblue;
	color: white;
}

.file-input>.label {
	color: #333;
	white-space: nowrap;
	opacity: .3;
}

.file-input.-chosen>.label {
	opacity: 1;
}

* {
	box-sizing: border-box;
}

.file-input>.button {
	display: inline-block;
	cursor: pointer;
	background: #eee;
	padding: 4px 12px;
	border-radius: 12px; /* 버튼 radius */
	margin-right: 8px;
}

.file-input:hover>.button {
	background: dodgerblue;
	color: white;
}

.file-input>.label {
	color: #333;
	white-space: nowrap;
	opacity: .3;
}

.file-input.-chosen>.label {
	opacity: 1;
}
/* ========== 이미지 업로드 css 종료============= */
table {
	border-collapse: collapse;
	width: 100%;
	margin: auto;
}

hr {
	background: #828282;
	height: 2px;
	border: 0;
}

.tab {
	white-space: pre;
}

body {
	background-color: #fff;
}

.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 9999;
}

/*-----------------------------------------스크롤바-----------------------------------------*/
/* 아래의 모든 코드는 영역::코드로 사용 */
.scrollBar::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
}

.scrollBar::-webkit-scrollbar-thumb {
	height: 30%; /* 스크롤바의 길이 */
	background: #636363; /* 스크롤바의 색상 */
	border-radius: 10px;
}

.scrollBar::-webkit-scrollbar-track {
	background: #e8e8e8; /*스크롤바 뒷 배경 색상*/
}

/*-------------------------댓글 이미지 모달--------------------------*/
.modal {
	display: none;
	z-index: 500;
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.8);
}

.modalBox {
	margin: 10%;
	position: relative;
	text-align: center;
	top: 50%;
	left: 50%;
	position: sticky;
}

span img:hover {
	cursor: -webkit-zoom-in;
}

.navbar { /* 상단바 고정 */
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

input:hover {
	background-color: #212121;
	color: #fff;
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
					<li class="nav-item"><span class="nav-link active">${user.MEMBER_ID }님</span>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="getTravelSpotListuser.do">TravelList</a></li>
					<li class="nav-item"><a class="nav-link"
						href="bookmarklist.do?user_seq=${user.MEMBER_SEQ }">MyList</a>
					<li class="nav-item"><a class="nav-link"
						href="memberdetail.me">MyInfo</a>
					<li class="nav-item"><a class="nav-link" href="logout.me">Logout</a>
					</li>

				</ul>
				<form class="d-flex" action="getTravelSpotListuser.do" method="get">
					<select name="searchCondition" class="b">
						<c:forEach items="${ conditionMap }" var="option">
							<option value="${ option.value }">${ option.key }
						</c:forEach>
					</select> <input class="form-control me-sm-2" type="text"
						placeholder="Search" name="searchKeyword"> <input
						class="btn btn-secondary my-2 my-sm-0" type="submit"
						value="Search">
				</form>
			</div>
		</div>
	</nav>
	<!-- Page Header
	<header class="masthead"
		style="background-image: url('resources/assets/img/about-bg.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>member travel spot</h1>
						<span class="subheading">member area</span>
					</div>
				</div>
			</div>
		</div>
	</header>-->
	<!-- Main Content-->
	<main class="mb-4">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div align="center">
				<br> <br> <br> <br>
			</div>

			<br> <input name="seq" type="hidden" value="${travel.seq}" />



			<div align="center" class="card border-primary mb-3"
				style="width: 1400px;">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<%-- <tr>
								<td colspan="2" bgcolor="#f5f5f5" align="center"><h1>${travel.place}</h1></td>
							</tr> --%>
					<%-- <tr><div align="center" style="margin-top: 30px;"><h3>${travel.place}</h3></div></tr> --%>
					<tr>

						<td><div align="left" class="b">조회수 : ${travel.cnt}</div></td>
						<td><div align="center" style="margin-top: 30px;">
								<h2 class="b" style="font-weight: bold;">${travel.place}&nbsp;&nbsp;&nbsp;&nbsp;</h2>
							</div></td>
						<td>
							<div align="right"
								style="display: flex; justify-content: right; text-align: right;"
								class="b">

								<script type="text/javascript">
										function add() {
											frm.submit();
										}
									</script>

								<!-- 좋아요 버튼 -->
								<form action="spotLikes.do" name="frm">
									<input type="hidden" name="MEMBER_ID" value="${id}"> <input
										type="hidden" name="seq" value="${travel.seq}"> <input
										type="hidden" name="likes" value="${travel.likes}"> <a
										href="javascript:add()"> <c:choose>
											<c:when test="${result == 1}">
												<img id="like-img"
													style="width: 20px; height: 20px; cursor: pointer;" alt=""
													src="resources/img/heart.png">
											</c:when>
											<c:otherwise>
												<img id="like-img"
													style="width: 20px; height: 20px; cursor: pointer;" alt=""
													src="resources/img/emptyHeart.png">
											</c:otherwise>
										</c:choose>

									</a>
								</form>
								&nbsp;공감 ${travel.likes}
							</div>
						</td>
						<!-- 좋아요 버튼 -->
					</tr>
					<%-- <tr>
								<td colspan="2" bgcolor="#f5f5f5" align="center"><h2>${travel.address}</h2>
							</tr> --%>
				</table>




				<hr>
				<table>
					<tr>
						<!-- ===================== 카카오맵 api ===================== -->
						<td>
							<div id="map"
								style="width: 600px; height: 600px; margin: 0 auto;"></div> <script
								type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=295d614a0a5527cc0638fb8a4f22068f&libraries=services"></script>
							<script>
                              var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                              mapOption = {
                                 center : new kakao.maps.LatLng(
                                       33.450701, 126.570667), // 지도의 중심좌표
                                 level : 10
                              // 지도의 확대 레벨
                              };

                              // 지도를 생성합니다    
                              var map = new kakao.maps.Map(
                                    mapContainer, mapOption);

                              // 주소-좌표 변환 객체를 생성합니다
                              var geocoder = new kakao.maps.services.Geocoder();

                              // 주소로 좌표를 검색합니다
                              geocoder.addressSearch(
                                          '${travel.address}',
                                          function(result, status) {

                                             // 정상적으로 검색이 완료됐으면 
                                             if (status === kakao.maps.services.Status.OK) {

                                                var coords = new kakao.maps.LatLng(
                                                      result[0].y,
                                                      result[0].x);

                                                // 마커 이미지의 이미지 주소입니다
                                                var imageSrc = "images/marker/maker1.png";
                                                // 마커 이미지의 이미지 크기 입니다
                                                var imageSize = new kakao.maps.Size(
                                                      30, 30);
                                                // 마커 이미지를 생성합니다    
                                                var markerImage = new kakao.maps.MarkerImage(
                                                      imageSrc,
                                                      imageSize);

                                                // 결과값으로 받은 위치를 마커로 표시합니다
                                                var marker = new kakao.maps.Marker(
                                                      {
                                                         map : map,
                                                         position : coords,
                                                         image : markerImage
                                                      // 마커 이미지 
                                                      });

                                                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                                map.setCenter(coords);
                                             }
                                          });
                           </script>
						</td>
						<!-- ===================== 카카오맵 api 종료 =================== -->
						<!-- ================= 슬라이더 ================== -->
						<td>

							<ul class="slides">
								<input type="radio" name="radio-btn" id="img-1" checked />
								<li class="slide-container">
									<div class="slide">
										<img src="./boardUpload/admin/${travel.imageFile1}" />
									</div>
									<div class="nav">
										<label for="img-6" class="prev">&#x2039;</label> <label
											for="img-2" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-2" />
								<li class="slide-container">
									<div class="slide">
										<img src="./boardUpload/admin/${travel.imageFile2}" />
									</div>
									<div class="nav">
										<label for="img-1" class="prev">&#x2039;</label> <label
											for="img-3" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-3" />
								<li class="slide-container">
									<div class="slide">
										<img src="./boardUpload/admin/${travel.imageFile3}" />
									</div>
									<div class="nav">
										<label for="img-2" class="prev">&#x2039;</label> <label
											for="img-4" class="next">&#x203a;</label>
									</div>
								</li>

								<input type="radio" name="radio-btn" id="img-4" />
								<li class="slide-container">
									<div class="slide">
										<img src="./boardUpload/admin/${travel.imageFile4}" />
									</div>
									<div class="nav">
										<label for="img-3" class="prev">&#x2039;</label> <label
											for="img-5" class="next">&#x203a;</label>
									</div>
								</li>
								<li class="nav-dots"><label for="img-1" class="nav-dot"
									id="img-dot-1"></label> <label for="img-2" class="nav-dot"
									id="img-dot-2"></label> <label for="img-3" class="nav-dot"
									id="img-dot-3"></label> <label for="img-4" class="nav-dot"
									id="img-dot-4"></label></li>
							</ul> </script>
						</td>
						<!-- ================= 슬라이더 종료 ================== -->
						</div>
					</tr>
				</table>
				
				<hr>
				
				
				<table>
					<tr align="right">
						<td><form action="insertBookmark.do" method="post">
								<input type="hidden" name="seq_travel" value="${travel.seq}">
								<input type="hidden" name="seq" value="${travel.seq}">
								<input type="hidden" name="user_seq" value="${user.MEMBER_SEQ}">
								<input type="hidden" name="place_travel" value="${travel.place}">
								<input type="hidden" name="address_travel"
									value="${travel.address}"> <input type="hidden"
									name="content_travel" value="${travel.content}">
								<td><input type="submit" value="즐겨찾기 추가" class="b">&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</form></td>
					</tr>
				</table>
				
				<table style="width: 90%">

					<tr style="height: 10px;"></tr>

					<tr>
						<!-- <td style="width:6%; text-align: center;">주소</td> -->
						<td bgcolor="#f5f5f5" style="width: 70%;">
							<div style="width: 6%; text-align: left; padding-bottom: 5px;"
								class="a">위치</div>
							<div style="text-align: left;" class="b">${travel.address}</div>
						</td>
					</tr>

					<tr style="height: 30px;"></tr>

					<tr>
						<!-- <td style="width:6%; text-align: center;"><font>내용</font></td> -->
						<td bgcolor="#f5f5f5" style="width: 70%;">
							<div style="width: 6%; text-align: left; padding-bottom: 5px;">
								<font class="a">내용</font>
							</div>
							<div class="scrollBar b"
								style="text-align: left; height: 200px; overflow-y: scroll;">${travel.content}</div>
						</td>
					</tr>

					<tr style="height: 10px;"></tr>
				</table>
				<br><br>
				


				<!-- ========================= 주변 관광지 ====================== -->
<style>
/*css 초기화*/
.nearby-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start; /* 왼쪽 정렬 */
    gap: 30px; /* 카드 사이 간격 */
}

.nearbycard {
    position: relative;
    height: 200px;
    width: calc(25% - 30px); /* 가로 최대 4개 카드만 보이게 설정 */
    border-radius: 15px;
    display: inline-block;
    margin-bottom: 30px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    overflow: hidden;
}

.nearbycard-body {
    height: 100%;
    display: flex;
    flex-direction: column;
    position: relative; /* 부모 기준으로 위치 설정 */
}

.nearbyimg {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.nearbycard-title {
    position: absolute;
    bottom: 0;
    right: 0;
    margin: 0;
    padding: 10px;
    font-family: "SeoulNamsanM";
    font-size: 26px;
    font-weight: bold;
    color: white; /* 흰색 글자 색 */
    text-shadow: 2px 2px 12px rgba(0, 0, 0, 0.9); /* 텍스트 그림자 추가 */
}
.nearbycard {
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* 부드러운 애니메이션을 위한 transition 속성 추가 */
}
.nearbycard:hover .nearbycard-title {
    bottom: 1px; /* 제목을 조금 위로 이동하여 호버 시 나타나게 함 */
}

.nearbycard:hover {
    transform: translateY(-5px); /* 카드를 조금 위로 올려 호버 시 띄워 보이게 함 */
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3), 0 12px 40px 0 rgba(0, 0, 0, 0.25); /* 그림자 효과 향상 */
}
</style>
				<h3 class="b" style="font-weight: bold;">주변 추천지역</h3>
				<div class="nearby-container">   
				    <c:forEach items="${nearbyPlaces}" var="nearby" varStatus="status">
				        <c:if test="${status.index < 4}">
				            <div class="nearbycard">
				                <a href="getTravelSpotuser.do?seq=${nearby.seq}" style="text-decoration: none;">
				                    <div class="nearbycard-body">
				                        <img class="nearbyimg" src=".//boardUpload/admin/${nearby.place}1.jpg">
				                        <h1 class="nearbycard-title">${nearby.place}</h1>
				                    </div>
				                </a>
				            </div>
				        </c:if>
				    </c:forEach>
				</div>
					      <!-- ========================= 주변 관광지 ====================== -->
			<div style="height: 30px;"></div>


			<div align="center" style="width: 1400px;">
				<h3>Review</h3>
				<hr>
				<br> <br>

				<div align="center" style="position: relative;">
					<div style="position: absolute; left: 47%; top: -25px;">
						<img src="./images/icon4.png" style="height: 50px;" />
					</div>
					<form action="insertReplyuser.do" method="post"
						enctype="multipart/form-data">
						<input name="seq" type="hidden" value="${travel.seq}" /> <input
							type="hidden" name="writer" value="${id}" />
						<table border="1" style="width: 50%; background-color: white;">
							<tr>
								<td bgcolor="#f5f5f5"><div
										style="padding-left: 30px; padding-top: 15px;">
										<span class="tab b">작성자 : &#9;</span>${id}</div></td>

								<td colspan="2" rowspan="2" style="padding-left: 45px;">
									<!-- =============== 파일업로드 ui =============== -->
									<table board="1" style="width: 100%;">

										<tr style="height: 20px;">
										</tr>

										<tr>


											<td colspan="2">
												<div class='file-input'>
													<input id="file1" type='file' id="file" name="uploadFile1"
														accept="image/*"> <span
														class="btn btn-secondary disabled">Image Upload1</span> <label
														for="file1" class='label b'>사진을 고르세요</label>
												</div>
										</tr>
										<tr>
											<td colspan="2"><div class='file-input'>
													<input id="file2" type='file' name="uploadFile2"
														accept="image/*"> <span
														class="btn btn-secondary disabled">Image Upload2</span> <label
														for="file2" class='label b' data-js-label>사진을 고르세요</label>
												</div></td>
										</tr>
										<tr>
											<td colspan="2"><div class='file-input'>
													<input id="file3" type='file' name="uploadFile3"
														accept="image/*"> <span
														class="btn btn-secondary disabled">Image Upload3</span> <label
														for="file3" class='label b' data-js-label>사진을 고르세요</label>
												</div></td>
										</tr>
										<tr>
											<td colspan="2"><div class="file-input">
													<input id="file4" type='file' name="uploadFile4"
														accept="image/*"> <span
														class="btn btn-secondary disabled">Image Upload4</span> <label
														for="file4" class='label b' data-js-label>사진을 고르세요</label>
												</div></td>
										</tr>

										<script>
											  const fileInput1 = document.querySelector('#file1');
											  const fileName1 = document.querySelector('label[for="file1"]');
											
											  fileInput1.addEventListener('change', (event) => {
											    const { name } = event.target.files[0];
											    fileName1.textContent = name;
											  });
											  
											  const fileInput2 = document.querySelector('#file2');
											  const fileName2 = document.querySelector('label[for="file2"]');
											
											  fileInput2.addEventListener('change', (event) => {
											    const { name } = event.target.files[0];
											    fileName2.textContent = name;
											  });
											  
											  const fileInput3 = document.querySelector('#file3');
											  const fileName3 = document.querySelector('label[for="file3"]');
											
											  fileInput3.addEventListener('change', (event) => {
											    const { name } = event.target.files[0];
											    fileName3.textContent = name;
											  });
											  
											  const fileInput4 = document.querySelector('#file4');
											  const fileName4 = document.querySelector('label[for="file4"]');
											
											  fileInput4.addEventListener('change', (event) => {
											    const { name } = event.target.files[0];
											    fileName4.textContent = name;
											  });
											</script>

									</table> <!-- 파일업로드 ui 종료 -->
								</td>
							</tr>
							
							<tr>
								<td colspan="2" align="left"><div
										style="padding-left: 30px;">
										<textarea name="content" cols="40" rows="5" class="b"></textarea>
									</div></td>
							</tr>

							<tr>
								<td>
									<div style="padding-bottom: 20px; padding-left: 30px;"
										align="left">
										<input type="submit" class="btn btn-secondary b"
											value=" 댓글 작성" />
									</div>
								</td>
							<tr>
						</table>
					</form>

					<br> <br> <br> <br>
				</div>


				<div align="center" style="position: relative;">
					<c:forEach items="${replyList}" var="reply">
						<c:if test="${! empty reply}">
							<div style="position: absolute; left: 47%; top: -25px;">
								<img src="./images/icon4copy.png" style="height: 50px;" />
							</div>
						</c:if>
						<table border="1" style="width: 60%; height: 100%;">
							<tr align="left">

								<td style="display: flex; justify-content: space-between;">
									<table style="height: 100%; margin: 15px;">
										<tr>
											<td>${reply.writer}</td>
										</tr>

										<tr style="height: 10px;"></tr>

										<tr>
											<%-- <div>
												<a href="updateReply.do?reseq=${reply.reseq}">수정</a>&nbsp;&nbsp;&nbsp;
												<a
													href="deleteReply.do?reseq=${reply.reseq}&seq=${reply.seq}">삭제</a>
											</div> --%>
											<td align="left"
												style="padding: 15px; width: 300px; margin-left: 15px; height: 200px;"
												class="card border-primary mb-3 b">${reply.content}</td>
										</tr>

										<c:if test="${reply.writer == id}">
											<tr>
												<td style="padding-left: 15px;"><a
													href="updateReplyuser.do?reseq=${reply.reseq}"
													style="text-decoration: none;" class="b">수정</a>&nbsp;&nbsp;&nbsp;
													<a
													href="deleteReplyuser.do?reseq=${reply.reseq}&seq=${reply.seq}"
													style="text-decoration: none;" class="b">삭제</a></td>
											</tr>
										</c:if>

									</table>
								</td>
								<!-- </tr> -->
								<!-- <tr align="left"> -->
								<%-- <td align="left" style="padding: 15px;">${reply.content}</td> --%>
								<!-- </tr> -->

								<!-- ============ 댓글이미지 출력 ============ -->
								<td
									style="padding: 10px; text-align: right; vertical-align: middle;">
									<div align="center">

										<c:if
											test="${not empty reply.image1 && empty reply.image2 && empty reply.image3 && empty reply.image4}">
											<span><img src="./boardUpload/user/${reply.image1}"
												height="200px" width="90%" border="0" align="middle"
												style="text-align: center; padding-right: 40px;"></span>
										</c:if>
										<c:choose>
											<c:when
												test="${not empty reply.image1 && not empty reply.image2}">
												<span><img src="./boardUpload/user/${reply.image1}"
													height="100" width="45%" border="0" align="middle"
													style="padding: 2px;"></span>
											</c:when>
										</c:choose>

										<c:choose>
											<c:when test="${not empty reply.image2}">
												<span><img src="./boardUpload/user/${reply.image2}"
													height="100" width="45%" border="0" style="padding: 2px;"></span>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${not empty reply.image3}">
												<span><img src="./boardUpload/user/${reply.image3}"
													height="100" width="45%" border="0" style="padding: 2px;"></span>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${not empty reply.image4}">
												<span><img src="./boardUpload/user/${reply.image4}"
													height="100" width="45%" border="0" style="padding: 2px;"></span>
											</c:when>
										</c:choose>
									</div>
								</td>
								<!-- ============ 댓글이미지 출력 종료 ============ -->
							</tr>



						</table>
					</c:forEach>

					<div class="modal">
						<div class="modalBox" align="center"></div>
					</div>

					<script src="https://code.jquery.com/jquery-3.4.1.js"
						integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
						crossorigin="anonymous"></script>
					<script type="text/javascript">
						$(function(){
						// 이미지 클릭시 해당 이미지 모달
						    $("span img").click(function(){
						        let img = new Image();
						        img.src = $(this).attr("src")
						        var img1 = $(img).attr("height","500px")
						        
						        $(".modalBox").html(img);
						        $(".modalBox").html(img1);
						        $(".modal").show();
						    });
						// 모달 클릭할때 이미지 닫음
						    $(".modal").click(function (e) {
						    $(".modal").toggle();
						  });
						});
						
						</script>


				</div>
			</div>
		</div>

		<div style="height: 30px;"></div>
	</main>
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
	<script src="<c:url value="/resources/js/scripts.js"/>" />
</body>
</html>
