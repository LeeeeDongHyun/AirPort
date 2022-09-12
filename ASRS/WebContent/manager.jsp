<%@ page language="java" contentType="text/html; charset=euc_kr" 
   import="java.sql.*, AIR.*, java.text.SimpleDateFormat, java.util.Calendar, java.util.Date"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mng.css">
<meta charset="EUC-KR">
<title>매니저 화면</title>
</head>
<body>
<jsp:include page="header3.jsp" flush="false" />
<section>
	<div id="mainmng">
	<%
		// 현재 날짜 출력
		Date now = Calendar.getInstance().getTime();       
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter2 = new SimpleDateFormat("dd");
		String date = formatter.format(now);
	 %>
	 <h3>Manager Mode </h3>
	 <form action="managerRoute.jsp">
	 <input type="date" value=<%=date %> min=<%=date%> name="date" class="forms">
	 <br>
	 <input type="submit" value="노선관리" class="routebtn">
	 </form>
	
	</div>
</section>
</body>
</html>