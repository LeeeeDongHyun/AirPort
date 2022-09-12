<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>회원가입 처리</TITLE>
  </HEAD>
  <BODY>
	<jsp:useBean class="AIR.Reserve" id="reserve" scope="request" />
	<jsp:setProperty name="reserve" property="*" />
    <% 
   		AIRDB.loadConnectAir();	
		boolean result = AIRDB.insertReserve(reserve);
		
		if(result == true){
			out.print("<script>alert('예약이 완료되었습니다!')</script>");
			out.print("<script>location='main.jsp'</script>");
		}
		else{
			out.print("<script>alert('예약이 안됐습니당~!')</script>");
			out.print("<script>location='main.jsp'</script>");
		}
    %>
  </BODY>
</HTML>