<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
  <HEAD>
  <meta charset="EUC-KR">
  <TITLE>회원가입 처리</TITLE>
  </HEAD>
  <BODY>
	<jsp:useBean class="AIR.Customer" id="customer" scope="request" />
	<jsp:setProperty name="customer" property="*" />
    <% 
        String id = customer.getId();
    	String password = request.getParameter("password");
    	String password2 = request.getParameter("password2");
    	// 재입력 비밀번호 다를시
    	if(!password.equals(password2)){
    		out.print("<script>alert('다시 입력한 비밀번호가 다릅니다.')</script>");
			out.print("<script>location='join2.jsp'</script>");
    	}

    	// 비밀번호 포맷 확인(영문, 특수문자, 숫자 포함 8자 이상)
    	Pattern passPattern1 = Pattern.compile("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,20}$");
    	Matcher passMatcher1 = passPattern1.matcher(password);
    	if(!passMatcher1.find()){
			out.print("<script>alert('비밀번호는 영문과 특수문자 숫자를 포함하며 8자 이상이어야 합니다.')</script>");
			out.print("<script>location='join2.jsp'</script>");
    	}
    	
    	//아이디가 중복 일시
    	AIRDB.loadConnectAir();	
    	boolean result1 = AIRDB.idDuplication(id);
    	if(result1 == false){
    	out.print("<script>alert('이미 존재하는 아이디가 있습니다.')</script>");
		out.print("<script>location='join2.jsp'</script>");
    	}
    	
    	// 비밀번호 암호화
       	SHA256 sha256 = new SHA256();
       	String secPassword = (sha256.encrypt(password));// 기존 비밀번호 암호화
       	customer.setPassword(secPassword);// 암호화된 비밀번호 삽입
       	customer.output();
       	Customer c = customer;
       	
       	AIRDB.loadConnectAir();	
    	boolean result2 = AIRDB.insertCustomer(c);
    	if(result2 == true){
    		out.print("<script>alert('회원가입 완료!')</script>");
    	}
        out.print("<script>location='join3.jsp'</script>");
    %>
    
  </BODY>
</HTML>