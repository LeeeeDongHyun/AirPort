<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>노선검색</TITLE>
  </HEAD>
  <BODY>
    <%  
      String date = request.getParameter("date");
      System.out.println(date);
      AIRDB.loadConnectAir();		
  	  ResultSet result = AIRDB.getManagerRoute(date);
  	  request.setAttribute("title", date); 
      request.setAttribute("RS", result); 
      request.setAttribute("date", date);
      request.getRequestDispatcher("routeList.jsp").forward(request, response);
   %>
  </BODY>
</HTML>