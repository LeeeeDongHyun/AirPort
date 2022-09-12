<%@ page language="java" contentType="text/html; charset=euc_kr" import="java.sql.*, AIR.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/join.css">
<title>ASRS</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<section>
		<div id="join3">
			<h3>1.약관동의 -> 2.정보입력 -></h3><h3 class="blue"> 3.완료</h3>
			<br>
			<br>
     	 	<div class="txt">회원가입이 완료되었습니다.<br>로그인 해주시길 바랍니다.</div>
     	 	<br>
      		<a href="login.jsp"><button class="loginbtn">로그인</button></a>
      	</div>
	</section>
</body>
</html>
	