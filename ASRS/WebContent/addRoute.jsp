<%@ page language="java" contentType="text/html; charset=utf-8" 
	import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mng.css">
<meta charset="EUC-KR">
<title>ASRS</title>
</head>
<body>
	<jsp:include page="header3.jsp" flush="false"/>
	<section>
	<div id="mng">
	<h3>노선 추가</h3>
	<%
	String date = request.getParameter("date");
	System.out.println(date);
	%>
	
	<form action="addRouteSystem.jsp">
		출발지-도착지: <input type="text" class="addforms" name="routeName" required><br>
		출발공항번호: <input type="text" class="addforms" name="sAirNo" required><br>
		도착공항번호: <input type="text" class="addforms" name="aAirNo" required><br>
		출발공항: <input type="text" class="addforms" name="sAirName" required><br>
		출발시간: <input type="text" class="addforms" name="sTime" required><br>
		도착공항: <input type="text" class="addforms" name="aAirName" required><br>
		도착시간: <input type="text" class="addforms" name="aTime" required><br>
	    <input type="hidden" name="date" value="<%=date %>" required>
		가격: <input type="text" class="addforms" name="price" required><br><br>
		<input type="submit" value="추가" class="addbtn">
	</form>
	</div>
	</section>
</body>
</html>
