<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>로그아웃</TITLE>
  </HEAD>
  <BODY>
    <%     
       Customer customerLogout = (Customer) session.getAttribute("customer");
       
       session.setAttribute("customer", null);
       session.setAttribute("customerLogout", customerLogout);
       System.out.println("  <<for debug >> logout ID: '" + customerLogout.getId() + "'\n");
       out.print("<script>location='login.jsp'</script>");

    %>
  </BODY>
</HTML>