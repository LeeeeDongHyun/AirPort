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
      String start = request.getParameter("start");
      String arrive = request.getParameter("arrive");
      String routeName = start + "-" + arrive;
      String numString = request.getParameter("num");
      System.out.println(numString);
      int num = Integer.parseInt(numString);
      String date = request.getParameter("date");
      System.out.println(date);
      AIRDB.loadConnectAir();		
  	  ResultSet result = AIRDB.getRoute(date, routeName);
  	  request.setAttribute("num", num);
  	  request.setAttribute("title", date); 
      request.setAttribute("RS", result); 
      request.getRequestDispatcher("reserve.jsp").forward(request, response);
   %>
  </BODY>
</HTML>