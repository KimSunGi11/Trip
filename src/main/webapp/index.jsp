<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TRIP</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min1.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.kontainer {
	display: flex;
	width: 100%;
	padding: 4% 2%;
	box-sizing: border-box;
	height: 45vh;
	max-width: 2000px; /* 최대 넓이 */
	margin-left: auto; /* 좌우 여백 자동 조절 */
	margin-right: auto;
}

.boxz {
	flex: 1;
	overflow: hidden;
	transition: 1s;
	/* box-shadow: 0 20px 30px rgba(0,0,0,.1);*/
	line-height: 0;
	display: flex;
	align-items: center;
	justify-content: center; /* 가운데 정렬 */
	font-family: 'Nanum Gothic', sans-serif;
}

.boxz>img {
	height: 70vh; /* 높이 조정 */
	object-fit: cover;
	transition: 1s;
}

.boxz>.content {
	height: 20vh;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	background-color: rgba(0, 0, 0, 0.6);
	opacity: 0;
	transition: opacity 0.5s ease;
}

.boxz>.content>span {
	font-size: 3.8vh;
	display: block;
	text-align: center;
	line-height: 2.6;
	color: white;
	text-transform: uppercase;
}

.boxz:hover {
	flex: 1 1 50%;
}

.boxz:hover>img {
	width: 100%;
	height: 100%;
}

.boxz:hover>.content {
	opacity: 1;
}

body {
	overflow-x: hidden;
	overflow-y: auto;
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

@font-face {
	font-family: 'MYYeongnamnu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/MYYeongnamnu.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.b {
	font-family: 'SeoulNamsanM';
}

.c {
	font-family: 'MYYeongnamnu';
}

.a {
	font-family: 'SeoulNamsanM';
	font-size: 17px;
	color: #3a3a3a;
}
</style>
<style>
.masthead {
    background-attachment: fixed; /* 배경 이미지 고정 */
    background-size: cover; 
}
/* .autocomplete-layer {
	right: 5%;
	top: 100%;
	font-size: large;
	z-index: 999;
}
 */
.rel_search {
	position: relative;
	width: 100%; /* To match the width of the search input */
	top: 100%; /* Position right below the search input */
	float: right;
}

.autocomplete-layer {
	position: absolute;
	margin-bottom: 5px;
	padding: 5px;
	top: 100%;
	left:10%;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 3px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과 부드럽게 변경 */
	z-index: 1;
	display: none;
	text-align: left;
}

.autocomplete-layer.show {
	display: block; /* 검색 결과가 있을 때 레이어를 보여줌 */
}

.autocomplete-layer div:hover {
	background-color: #f0f0f0;
}


</style>

</head>

<body style="background-color: #deebf7; height: 500px;">
	<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top"
		style="background-color: #00ff0000">

		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">TRIP</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor03"
				aria-controls="navbarColor03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor03">
				<div class="navbar-nav ms-auto">
					<ul class="navbar-nav me-auto">
						<li class="nav-item">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							href="#" role="button" aria-haspopup="true" aria-expanded="false">detailed
								menu</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="getTravelList.do">detail
									screen</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="login.me">log &nbsp;in </a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="memberjoin.me">sign up</a>

							</div></li>
					</ul>
				</div>

			</div>
		</div>
	</nav>

	<!-- Page Header-->

	<header class="masthead"
		style="background-image: url('./images/111.jpg')">
		<!-- -->
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">


						<h1>TRIP</h1>
						<form class="d-flex" action="getTravelList.do" method="get">
							<select name="searchCondition" class="b">
								<option value="PLACE">관광지</option>
								<option value="CONTENT">주소</option>
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
    autocompleteLayer.style.backgroundColor = '#f9f9f9';
    autocompleteLayer.style.border = '1px solid #ddd';
    autocompleteLayer.style.width = '200px';
    autocompleteLayer.style.boxShadow = '0 2px 4px rgba(0, 0, 0, 0.1)';
    autocompleteLayer.style.zIndex = '1';
    autocompleteLayer.style.display = 'none';
    
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
                        resultItem.style.color = 'black';
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
					<div class="kontainer">

						<div class="boxz" style="background-color: #00ff0000;">
							<a href="getTravelList.do" style="text-decoration: none;"> <!-- <img src=".//images/1.jpg" alt="Image 1"> -->
								<div class="content">
									<h1 style="color: white;">TRIPLIST</h1>
								</div>
							</a>
						</div>
						<div class="boxz" style="background-color: #00ff0000;">
							<a href="login.me" style="text-decoration: none;"> <!-- <img src=".//images/2.jpg"> -->
								<div class="content">
									<h1 style="color: white;">LOGIN</h1>
								</div>
							</a>
						</div>
						<div class="boxz" style="background-color: #00ff0000;">
							<a href="memberjoin.me" style="text-decoration: none;"> <!--  <img src=".//images/3.jpg"> -->
								<div class="content">
									<h1 style="color: white;">JOIN</h1>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</header>	
	
	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- 1 -->
	<style>
.post-title {
	width: 100%;
	text-align: center;
}

.post-subtitle {
	width: 100%;
	text-align: center;
}
</style>
	<div>

		<div
			style="display: flex; align-items: center; height: 600px; background-color: #deebf7; justify-content: center;">
			<div
				style="position: absolute; left: 50%; transform: translateX(-140%);">
				<div
					style="width: 500px; height: 500px; background-color: #deebf7; border-radius: 50%; overflow: hidden; border: 3px solid black;">
					<img src=".//images/35.png"
						style="width: 100%; height: 100%; object-fit: cover;">
				</div>
			</div>
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="post-preview">
						<h1 class="post-title b">로그인/회원가입</h1>
						<h4 class="post-subtitle b">
							<br> 로그인 회원가입 이후 더 <br> <span class="c"
								style="font-size: 50px;">"<span class="b"
								style="font-size: 26px; font-weight: bold;">&nbsp;다양한&nbsp;</span>"
							</span><br>
							<div style="line-height: 9px;">
								<br>
							</div>
							혜택을 누려보세요 좋아요, 즐겨찾기, 동선관리 등등.
							<style>
.login-link {
	text-decoration: none;
	color: inherit;
}

.login-link:hover {
	color: blue;
}
</style>
							<br> <a href="login.me" class="login-link">로그인 하러가기</a>
							</h3>
					</div>
					<div class="d-flex justify-content-end mb-4"></div>
				</div>
			</div>
		</div>

	</div>


	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!--  2 -->
	<style>
.post-title {
	width: 100%;
	text-align: center;
}

.post-subtitle {
	width: 100%;
	text-align: center;
}
</style>

	<div
		style="display: flex; align-items: center; height: 600px; background-color: #FFFFFF; justify-content: center;">
		<div
			style="position: absolute; left: 50%; transform: translateX(40%);">

			<div
				style="width: 500px; height: 500px; background-color: yellow; border-radius: 50%; overflow: hidden; border: 3px solid black;">
				<img src=".//images/67.png"
					style="width: 100%; height: 100%; object-fit: cover;">
			</div>
			<div
				style="position: absolute; top: 0; left: 80%; transform: translate(-30%, -30%);">
				<!-- <div style="width: 300px; height: 300px; background-color: red; border-radius: 50%; box-shadow: 0px 0px 0px 2px black; overflow: hidden;">
				<img src=".//images/35.png" style="width: 100%; height: 100%; object-fit: cover;">
			</div> -->
			</div>
		</div>
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-10 col-lg-8 col-xl-7">
				<div class="post-preview">
					<h1 class="post-title b">여행자의 위치</h1>
					<h1 class="post-title b">/포토 리뷰</h1>
					<h4 class="post-subtitle b">
						<br>여행지 리스트에서 여행지를<br> 누르면 상세 위치와 설명,<br> 여행지
						사진까지~! <br> 회원의 포토리뷰를 통해
						여행지의&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 생생한 후기도 전달받을 수 있어요
					</h4>
				</div>
				<div class="d-flex justify-content-end mb-4"></div>
			</div>
		</div>
	</div>




	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!-- 3 -->

	<style>
.post-title {
	width: 100%;
	text-align: center;
}

.post-subtitle {
	width: 100%;
	text-align: center;
}
</style>

	<div
		style="display: flex; align-items: center; height: 600px; background-color: #deebf7; justify-content: center;">
		<div
			style="position: absolute; left: 50%; transform: translateX(-140%);">
			<div
				style="width: 500px; height: 500px; background-color: #deebf7; border-radius: 50%; overflow: hidden; border: 3px solid black;">
				<img src=".//images/api.png"
					style="width: 100%; height: 100%; object-fit: cover;">
			</div>
		</div>
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-10 col-lg-8 col-xl-7">
				<div class="post-preview">
					<h1 class="post-title b">카카오맵 api 연동</h1>
					<h4 class="post-subtitle b">
						<br>카카오 맵 API를 활용하여<br>각 페이지별 관광지에<br> 각 위치에 마커로
						표시합니다.<br> 관광지의 위치 정보를<br> 알고싶다면 지도를 확대 하여 상세 관광지의 위치를
						확인하세요~!
						<style>
.login-link {
	text-decoration: none;
	color: inherit;
}

.login-link:hover {
	color: blue;
}
</style>

					</h4>
				</div>
				<div class="d-flex justify-content-end mb-4"></div>
			</div>
		</div>
	</div>

	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<!--  4 -->
	<style>
.post-title {
	width: 100%;
	text-align: center;
}

.post-subtitle {
	width: 100%;
	text-align: center;
}
</style>

	<div
		style="display: flex; align-items: center; height: 600px; background-color: #FFFFFF; justify-content: center;">
		<div
			style="position: absolute; left: 50%; transform: translateX(40%);">
			<div
				style="width: 500px; height: 500px; background-color: yellow; border-radius: 50%; overflow: hidden; box-shadow: 0px 0px 0px 3px black;">
				<img src=".//images/31.png"
					style="width: 100%; height: 100%; object-fit: cover;">
			</div>
		</div>
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-10 col-lg-8 col-xl-7">
				<div class="post-preview">
					<h1 class="post-title b">즐겨찾기</h1>
					<h2 class="post-title b">국내여행</h2>
					<h4 class="post-subtitle b">
						<br> 즐겨찾기 저장후 나의<br> 여행장소를 지도에<br> <span class="c"
							style="font-size: 50px;">"<span class="b"
							style="font-size: 26px; font-weight: bold;">&nbsp;한
								눈에&nbsp;</span>"
						</span><br>
						<div style="line-height: 9px;">
							<br>
						</div>
						나만의 최적의 여행지 동선을 관리해 보세요.
					</h4>
				</div>
				<div class="d-flex justify-content-end mb-4"></div>
			</div>
		</div>
	</div>

	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

	<!-- Footer-->
	<footer>
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-10 col-lg-8 col-xl-7">
				<div class="post-preview">
					<h2 class="post-title"></h2>
					<h3 class="post-subtitle"></h3>

					Posted by <a href="#!" style="text-decoration: none;">Start</a> on
					may 10, 2023
					</p>
				</div>
				<hr class="my-4" />
				<div class="d-flex justify-content-end mb-4">
					<a class="btn btn-primary text-uppercase b" href="index.jsp">사이트
						맨 위로가기 ↑</a>
				</div>
			</div>

			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5 justify-content-center">
					<div class="col-md-10 col-lg-8 col-xl-7">
						<ul class="list-inline text-center">

							<li class="list-inline-item b"><img src=".//images/g.png">
								<br> 김선기</li>
							<li class="list-inline-item b"><img
								src=".//images/KakaoTalk_20230508_131209381.png"> <br>
								신선미</li>

							<li class="list-inline-item b"><img src=".//images/Kaka.png">
								<br> 양경민</li>

							<li class="list-inline-item b"><img
								src=".//images/KakaoTalk_20230508_131652228.png"
								style="width: 32px;"> <br> 진영웅</li>

							<li class="list-inline-item b"><img
								src=".//images/KakaoTalk_20230508_131209464.png"> <br>
								최윤아</li>

							<li class="list-inline-item b"><img
								src=".//images/free-icon-snake-1067840.png"> <br> 최현준</li>

						</ul>
						<div class="small text-center text-muted fst-italic">we
							Website 2023</div>
					</div>
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
	<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>