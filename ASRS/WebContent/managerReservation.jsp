<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>ASRS</TITLE>
  </HEAD>
  <BODY>
    <%  
    
      // 세션 정보 불러오기
      AIRDB.loadConnectAir();		
  	  ResultSet result = AIRDB.getManagerReserve();
  	  request.setAttribute("title", "모든 예약현황"); 
      request.setAttribute("RS", result); 
      request.getRequestDispatcher("ListRS2.jsp").forward(request, response);
   %>
  </BODY>
</HTML>