<%@ page language="java" contentType="text/html; charset=utf-8" 
	import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
<title>로그인</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
		<section>
			<div id="loginw">
			<h3>로그인</h3>
			<form action="loginSystem.jsp" method="post">
			아이디  <br><input type="text" name="id" class="forms"><br><br>
			비밀번호  <br><input type="password" name="password" class="forms"><br><br>
			<input type="submit" value="로그인" class="loginbtn">
			</form>
			<a href="join1.jsp"><button class="joinbtn">
			회원가입
			</button></a>
			</div>
		</section>
</body>
</html>
