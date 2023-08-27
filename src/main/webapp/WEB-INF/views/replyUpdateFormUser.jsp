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
<title>TRIPSPOT_USER_REPLYUPDATE</title>
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
<style type="text/css">
* {
	box-sizing: border-box;
}

.file-input {
	display: inline-block;
	text-align: left;
	background: #fff;
	padding: 3px; /* 버튼 padding */
	width: 450px;
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

.form-item {
	display: flex;
	flex-direction: row-reverse;
	width: 370px;
	align-items: center;
}

.form-item input {
	width: 100%;
	font-size: 18px;
	color: #111111;
	border: 0;
	border: 1px #cccccc solid;
}

.form-item input:focus {
	border-color: #000;
	outline: none;
}

/* textarea 박스*/
.form-item1 {
	display: flex;
	flex-direction: row-reverse;
	align-items: center;
}

.form-item1 textarea {
	width: 100%;
	font-size: 18px;
	color: #111111;
	border: 0;
	border: 1px #cccccc solid;
}

.form-item1 textarea:focus {
	border-color: #000;
	outline: none;
}

.navbar {
	position: fixed;
	top: 0;
	left: 0;
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
						href="bookmarklist.do?user_seq=${user.MEMBER_SEQ }">MyList</a></li>
					<li class="nav-item"><a class="nav-link"
						href="memberdetail.me">MyInfo</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.me">Logout</a>
					</li>

				</ul>
				<form class="d-flex" action="getTravelSpotListuser.do" method="get">
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
	<!-- <header class="masthead" style="background-color: #9E6F21;">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>Reply Update</h1>
					</div>
				</div>
			</div>
		</div>
	</header> -->
	<!-- Main Content-->

	<main class="mb-4">
		<br>
		<br>
		<br>
		<br>
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<!-- <div class="col-md-10 col-lg-8 col-xl-7"> -->
			<div align="center" class="card border-primary mb-3"
				style="width: 900px;">
				<!-- <h1>댓글 수정</h1> 
						<hr>-->
				<br>
				<form action="updateReplyuser.do" method="post"
					enctype="multipart/form-data">
					<input name="reseq" type="hidden" value="${reply.reseq}" />
					<table cellpadding="0" cellspacing="0" width="800">
						
						<tr style="height: 15px;">
						</tr>
						
						<tr>
							<td bgcolor="#f5f5f5" width="80" class="b">글쓴이</td>
							<td align="left"><input type="hidden" name="writer"
								style="width: 650px;" value="${reply.writer}" />
								${reply.writer}</td>
						</tr>

						<tr style="height: 30px;">
						</tr>

						<tr>
							<td bgcolor="#f5f5f5" class="b">내용</td>
							<td align="left" class="form-item1"><textarea name="content"
									cols="103" rows="15" style="padding: 15px;  font-size: 16px;" class="b">${reply.content}</textarea></td>
						</tr>

						<tr style="height: 20px;">
						</tr>

						<tr>
							<!--<td bgcolor="#f5f5f5">사진첨부1</td>
									<td align="left"><input type="file" name="uploadFile1"
										accept="image/*"></td> -->

							<td colspan="2">
								<div class='file-input'>
									<input type='file' id="file1" name="uploadFile1"
										accept="image/*"> <span
										class="btn btn-secondary disabled">Image Upload1</span> <label
										for="file1" class='label'>image1</label>
								</div>
							</td>
						</tr>
						<tr>
							<!--<td bgcolor="#f5f5f5">사진첨부2</td>
									<td align="left"><input type="file" name="uploadFile2"
										accept="image/*"></td> -->
							<td colspan="2">
								<div class='file-input'>
									<input type='file' id="file2" name="uploadFile2"
										accept="image/*"> <span
										class="btn btn-secondary disabled">Image Upload2</span> <label
										for="file2" class='label'>image2</label>
								</div>
							</td>
						</tr>
						<tr>
							<!--<td bgcolor="#f5f5f5">사진첨부3</td>
									<td align="left"><input type="file" name="uploadFile3"
										accept="image/*"></td> -->
							<td colspan="2">
								<div class='file-input'>
									<input type='file' id="file3" name="uploadFile3"
										accept="image/*"> <span
										class="btn btn-secondary disabled">Image Upload3</span> <label
										for="file3" class='label'>image3</label>
								</div>
							</td>
						</tr>
						<tr>
							<!--<td bgcolor="#f5f5f5">사진첨부4</td>
									<td align="left"><input type="file" name="uploadFile4"
										accept="image/*"></td> -->
							<td colspan="2">
								<div class='file-input'>
									<input type='file' id="file4" name="uploadFile4"
										accept="image/*"> <span
										class="btn btn-secondary disabled">Image Upload4</span> <label
										for="file4" class='label'>image4</label>
								</div>
							</td>
						</tr>
						
						<tr style="height: 20px;">
						</tr>
						
						<tr>
							<td colspan="2" align="center" class="b"><input type="submit"
								value="수정" class="btn btn-secondary text-uppercase" />&nbsp;&nbsp;
								<span class="btn btn-secondary"> <a
									href="getTravelSpotuser.do?reseq=${reply.reseq}&seq=${reply.seq}"
									style="color: white; text-decoration: none;">취소</a>
							</span></td>
						</tr>
						
						<tr style="height: 10px;">
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

					</table>
				</form>
				<br>
				<%-- <a href="getReplyList.do?seq=${travel.seq}">목록 가기</a> --%>
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
	<script src="<c:url value="/resources/js/scripts.js"/>" />
</body>
</html>
