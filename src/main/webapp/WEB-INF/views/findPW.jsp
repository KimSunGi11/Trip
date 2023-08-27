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
<title>TRIPSPOT_USER_FIND</title>
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
<!-- Core theme CSS (includes Bootstrap) -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min1.css">
<script>
	window.addEventListener("scroll", function() {
		var navbar = document.querySelector(".navbar.fixed-top");
		if (window.scrollY > 0) {
			navbar.classList.add("scrolled");
		} else {
			navbar.classList.remove("scrolled");
		}
	});
</script>
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

<script>
	function check() {
		var id = findform.MEMBER_ID.value;
		var email = findform.MEMBER_EMAIL.value;
		var emailGet = findform.MEMBER_EMAIL_GET.value;

		if (id.length == 0) {
			alert("아이디를 입력하세요.");
			findform.MEMBER_ID.focus();
			return false;
		}
		if (email.length == 0) {
			alert("이메일을 입력하세요.");
			findform.MEMBER_EMAIL.focus();
			return false;
		}
		if (emailGet.includes('.') == false) {
			alert("유효하지 않은 이메일 형식입니다.");
			findform.MEMBER_EMAIL_GET.focus();
			return false;
		}

		return true;
	}
</script>

<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
		
<c:choose>
<c:when test="${ user == '2'}">
	<script type="text/javascript">
      $(document).ready(function() {
         alert("등록되지 않은 아이디이거나 이메일 주소를 잘못 입력했습니다.");
      });
   </script>
   <%
      session.invalidate();
   %>
</c:when>
</c:choose>	

</head>
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
					<li class="nav-item"><a class="nav-link"
						href="getTravelList.do">TravelList</a></li>
				</ul>
				<form class="d-flex" action="getTravelSpotListuser.do" method="get">
					<select name="searchCondition">
						<c:forEach items="${ conditionMap }" var="option">
							<option value="${ option.value }">${ option.key }
						</c:forEach>
					</select>  <input class="form-control me-sm-2" type="text"
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
	<header class="masthead" style="background-color: #B8E7E1;">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>FIND PASSWORD</h1>
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
				
				<h6 class="b" style="font-weight: bold;">회원가입하신 아이디와 이메일을 입력하시면 메일로 임시비밀번호가 발급됩니다.</h6>
				
					<div class="card border-secondary mb-3" style="max-width: 50rem;">
						<div class="card-body">
							<p class="card-text">
								<table width="auto" cellspacing="0" cellpadding="0" border="0" align="center">
									<tr>
										<td align="center">
											<form class="content" action="sendMail.me" method="post" name="findform" onsubmit="return check()">
												<div align="left">
													<font class="b">아이디&nbsp;&nbsp;</font>
													<input name="MEMBER_ID" type="text" size="38" />
												</div>
												<br>
												
												<div style="display: flex;" align="left">
													<font class="b">이메일&nbsp;&nbsp;&nbsp;</font>
													<div style="align-items: flex-start;">
														<input type="text" name="MEMBER_EMAIL" size="13" />
													</div>
													
													<div class="d-flex" style="font-size: 20px; vertical-align: middle;">@</div>
													
													<div style="align-items: flex-end;">
														<input type="text" name="MEMBER_EMAIL_GET" size="19"/> 
													</div>
													
												</div>
												<br>
												
												<button class="btn btn-primary text-uppercase" id="submitButton"
												type="submit" style="width: 33%; height: 40px;">send</button>
											</form>
										</td>
									</tr>
								</table>
							</p>
						</div>
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
</body>
</html>
