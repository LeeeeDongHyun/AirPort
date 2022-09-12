<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher, AIR.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>회원가입 처리</TITLE>
  </HEAD>
  <BODY>
    <% 
    	String reserveIdString = request.getParameter("reserveId");
  		int reserveId = Integer.parseInt(reserveIdString);
   		AIRDB.loadConnectAir();	
	    boolean result = AIRDB.cancelReserve(reserveId);
		
		if(result == true){
			out.print("<script>alert('취소가 완료되었습니다!')</script>");
			out.print("<script>location='reservation.jsp'</script>");
		}
		else{
			out.print("<script>alert('취소가 안됐습니당~!')</script>");
			out.print("<script>location='reservation.jsp'</script>");
		}
    %>
  </BODY>
</HTML>