<%@ page language="java" contentType="text/html; charset=euc_kr" import="java.sql.*, AIR.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<title>ASRS</title>
</head>
<body>
	<div id="header">
	<div class="logo"><a href="manager.jsp">ASRS</a></div>
	<div class="menu">
	<a href="logoutSystem.jsp">로그아웃</a>
	<a href="managerReservation.jsp"> 모든예약현황</a>
	</div>
	</div>
</body>
</html>