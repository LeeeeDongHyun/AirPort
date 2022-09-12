<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, AIR.*, java.text.SimpleDateFormat, java.util.Calendar, java.util.Date"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<title>ASRS</title>
</head>
<body>
	<jsp:include page="header2.jsp" flush="false"/>
	<section>
		<div id="main">
	<h3>빠른예약</h3>
	<form action=route.jsp method="post">
    <select name="start" class="sct">
     <option value="인천">인천</option>
     <option value="오사카">오사카</option>
     <option value="제주">제주</option>
     <option value="뉴욕">뉴욕</option>
     <option value="괌">괌</option>
     <option value="파리">파리</option>
	</select>
	=>
	<select name="arrive" class="sct">
     <option value="인천">인천</option>
     <option value="오사카">오사카</option>
     <option value="제주">제주</option>
     <option value="뉴욕">뉴욕</option>
     <option value="괌">괌</option>
     <option value="파리">파리</option>
	</select>
	<br><br>
	인원수 : <input type=number name="num" min="1" max="10" class="forms"><br><br>
	<%
		// 현재 날짜 출력
		Date now = Calendar.getInstance().getTime();       
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter2 = new SimpleDateFormat("dd");
		String min = formatter.format(now);
	%>
	출발날짜 : <input type="date" value=<%=min %> min=<%=min%> name="date" class="forms"><br><br>
	<input type="submit" value="검색하기" class="searchbtn">
	</form>
		</div>
	</section>
</body>
</html>
	