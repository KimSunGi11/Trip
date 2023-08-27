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
<title>TRIP_JOIN</title>
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
<script>
	var idIsConfirmed = false;
	function check() {
		var id = joinform.MEMBER_ID.value;
		var password1 = joinform.MEMBER_PW.value;
		var password2 = joinform.MEMBER_PW_RE.value;
		var email1 = joinform.MEMBER_EMAIL.value;
		var email2 = joinform.MEMBER_EMAIL_GET.value;
		var phone = joinform.MEMBER_PHONE.value;

		var forms = document.getElementById("joinform");

		if ((forms.MEMBER_NAME.value == "")
				|| (forms.MEMBER_NAME.value.length <= 1)) {
			alert("이름을 입력해 주세요.");
			forms.MEMBER_NAME.focus();
			return false;
		}
		if (id.length == 0) {
			alert("아이디를 입력해 주세요.");
			joinform.MEMBER_ID.focus();
			return false;
		}

		if (password1.length == 0) {
			alert("비밀번호를 입력해 주세요.");
			joinform.MEMBER_PW.focus();
			return false;
		}
		if (password1 != password2) {
			alert("비밀번호가 일치하지 않습니다.");
			joinform.MEMBER_PW.value = "";
			joinform.MEMBER_PW_RE.value = "";
			joinform.MEMBER_PW.focus();
			return false;
		}

		if (email1.length == 0 || email2.length == 0) {
			alert("이메일을 입력해 주세요.");
			joinform.MEMBER_EMAIL1.focus();
			return false;
		}

		if (phone.length == 0) {
			alert("휴대폰 번호를 입력해 주세요.");
			joinform.MEMBER_PHONE.focus();
			return false;
		}
		if (!idIsConfirmed) {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}

		return true;
	}
	function openConfirmId(joinform) {

		var id = joinform.MEMBER_ID.value;
		var url = "./MemberIDCheckAction.me?MEMBER_ID="
				+ joinform.MEMBER_ID.value;

		var win = open(url, "confirm",
				"toolbar=no,location=no,status=no,menubar=no,"
						+ "scrollbars=no,resizable=no,width=400,height=200");

		win.onbeforeunload = function() {
			if (!idIsConfirmed) { // 중복확인 완료 여부에 따라 분기 처리
				setIdConfirmed();
			} else {
				alert("중복확인이 완료되지 않았습니다. 그래도 페이지를 나가시겠습니까?");
			}
		}

	}
	function setIdConfirmed() {
		idIsConfirmed = true;
	}
</script>
<style>
.navbar {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 9999;
}
</style>
<body>
	<!-- Navigation-->
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
					<li class="nav-item"><a class="nav-link"
						href="getTravelList.do">TravelList</a></li>

				</ul>
				<form class="d-flex" action="getTravelList.do" method="get">
					<select name="searchCondition" class="b">
						<option value="PLACE">관광지</option>
						<option value="CONTENT">주소</option>
					</select> <input class="form-control me-sm-2" type="text"
						placeholder="Search" name="searchKeyword"> <input
						class="btn btn-secondary my-2 my-sm-0" type="submit"
						value="Search">
				</form>
			</div>
		</div>
	</nav>
	<!-- Page Header-->
	<header class="masthead" style="background-color: #B8E7E1">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>JOIN</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Main Content-->
	<main class="mb-4">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<p>Want to get in touch? Fill out the form below to send me a
						message and I will get back to you as soon as possible!</p>
					<div class="my-5">

						<form name="joinform" id="joinform" action="memberjoin.me"
							method="post" onsubmit="return check()">
							<div class="form-floating">
								<input class="form-control b" type="text" name="MEMBER_NAME"
									placeholder="Enter your name..." /> <label for="name">Name</label>

							</div>
							<div class="form-floating">
								<input class="form-control" type="text" name="MEMBER_ID"
									placeholder="Enter your name..." /> <label for="name">ID</label><input
									type="button" name="confirm_id" value="id_check"
									onclick="openConfirmId(joinform);" style="margin-left: 10px;" />
								<!-- window.open('./MemberIDCheckAction.me?MEMBER_ID='
							+ this.form.MEMBER_ID.value, 'confirm', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=200')" -->
							</div>
							<div class="form-floating">
								<input class="form-control" type="password" name="MEMBER_PW"
									placeholder="Enter your password..." /> <label for="name">PW</label>

							</div>
							<div class="form-floating">
								<input class="form-control" type="password" name="MEMBER_PW_RE"
									placeholder="Enter your password..." /> <label for="name">PW_RE</label>

							</div>
							<div class="d-flex">

								<input class="form-control" id="email" name="MEMBER_EMAIL"
									type="text" placeholder="Enter your email..." /> <label
									for="email">@</label> <select class="form-control"
									name="MEMBER_EMAIL_GET" id="MEMBER_EMAIL_GET">
									<option>----- 선택하세요 -----</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
							</div>

							<div class="form-floating">
								<input class="form-control" id="phone" name="MEMBER_PHONE"
									type="text" placeholder="Enter your phone number..." /> <label
									for="phone">Phone Number</label>

							</div>

							<br />
							<!-- <input id="submitButton" type="submit"> -->
							<button class="btn btn-primary text-uppercase" id="submitButton"
								type="submit">Join</button>
						</form>
					</div>
				</div>
			</div>
		</div>
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
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
