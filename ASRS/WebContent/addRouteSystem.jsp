<%@ page language="java" contentType="text/html; charset=euc_kr" 
import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>회원가입 처리</TITLE>
  </HEAD>
  <BODY>
	<jsp:useBean class="AIR.Route" id="route" scope="request" />
	<jsp:setProperty name="route" property="*" />
    <% 
       	AIRDB.loadConnectAir();	
    	boolean result = AIRDB.insertRoute(route);
    	if(result == true){
    		out.print("<script>alert('노선 추가 완료!')</script>");
    	}
        out.print("<script>location='manager.jsp'</script>");
    %>
    
  </BODY>
</HTML>