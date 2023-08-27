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
<title>TRIP_LOGIN</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
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
.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 9999;
}

@font-face {
    font-family: 'OTWelcomeRA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

@font-face {
    font-family: 'OTWelcomeRA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

@font-face { /* 귀여운 느낌의 글씨체 */
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face { /* 정형화된 느낌이면서 단정 */
    font-family: 'KBIZHanmaumGothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'SeoulNamsanM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
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
	function check() {
		var id = loginform.MEMBER_ID.value;
		var pass = loginform.MEMBER_PW.value;

		if (id.length == 0) {
			alert("아이디를 입력하세요.");
			loginform.MEMBER_ID.focus();
			return false;
		}
		if (pass.length == 0) {
			alert("비밀번호를 입력하세요.");
			loginform.MEMBER_PW.focus();
			return false;
		}

		return true;
	}
</script>

<script src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous"></script>
<c:choose>
<c:when test="${ id != null}">
	<script type="text/javascript">
		$(document).ready(function() {
			alert("등록되지 않은 아이디이거나 또는 비밀번호를 잘못 입력했습니다.");
		});
	</script>
	<%
		session.invalidate();
	%>
</c:when>
</c:choose>

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
	<header class="masthead" style="background-color: #B8E7E1;">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>LOGIN</h1>
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
					<!-- <p>Want to get in touch? Fill out the form below to send me a
						message and I will get back to you as soon as possible!</p> -->
					<div class="my-5">

						<form action="login.me" method="post" name="loginform"
							onsubmit="return check()">
							<div class="form-floating">
								<input class="form-control" id="name" type="text"
									name="MEMBER_ID" placeholder="Enter your id..."
									data-sb-validations="required" /> <label for="name">ID</label>
								<div class="invalid-feedback" data-sb-feedback="name:required">A
									ID is required.</div>
							</div>
							<div class="form-floating">
								<input class="form-control" type="password" name="MEMBER_PW"
									placeholder="Enter your password..."
									data-sb-validations="required" /> <label for="name">PW</label>
								<div class="invalid-feedback" data-sb-feedback="name:required">A
									PW is required.</div>
							</div>
							<br />
							<div class="d-none" id="submitSuccessMessage">
								<div class="text-center mb-3">
									<div class="fw-bolder">Form submission successful!</div>
									To activate this form, sign up at <br /> <a
										href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
								</div>
							</div>

							<div class="d-none" id="submitErrorMessage">
								<div class="text-center text-danger mb-3">Error sending
									message!</div>
							</div>
							<!-- Submit Button
							<button class="btn btn-primary text-uppercase" id="submitButton"
								type="submit">Login</button>-->
							<button class="btn btn-primary text-uppercase" id="submitButton"
								type="submit" style="width: 100%; height: 50px;">Login</button>
							&nbsp;&nbsp;
						</form>
						
						<span style="color: #e2e2e2;">
						<a href="memberjoin.me" style="text-decoration: none; color: #545454;">sign up</a> |
						<a href="findpassword.me" style="text-decoration: none; color: #545454;">find password</a>
						</span>

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
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
