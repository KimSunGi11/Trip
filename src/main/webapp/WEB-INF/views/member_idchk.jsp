<%@page import="com.springproj.biz.user.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String id = request.getParameter("MEMBER_ID");
%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 확인</title>
<script>
function windowclose(){
	opener.document.joinform.MEMBER_ID.value = "<%=id%>";
		self.close();
	}
	
</script>

<style type="text/css">
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
<body class="b" style="font-weight: bold;">
	<%	
		int result = (Integer) session.getAttribute("result");
	if (result >= 1) {
	%>
	<table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr align="center">
			<td height="30"><font size="2"><%=id%> 는 이미 사용 중인 아이디입니다.</font></td>
		</tr>
	</table>

	<form action="./MemberIDCheckAction.me" name="joinform">
		<table width="360" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center"><font size="2">다른 아이디를 선택하세요.</font>
					<p>
						<input type="text" size="10" maxlength="12" name="MEMBER_ID" /> <input
							type="submit" class="btn btn-primary text-uppercase"  value="id_check" /></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<table width="360" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center"><font size="2">입력하신 <%=id%> 는 사용할 수 있는
					아이디입니다.
			</font> <br /> <br /> <input type="button" value="close" class="btn btn-primary text-uppercase" 
				onclick="windowclose()" /></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>
