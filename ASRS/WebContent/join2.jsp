<%@ page language="java" contentType="text/html; charset=euc_kr" import="java.sql.*, AIR.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/join.css">
<title>ASRS</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="false"/>
	<section>
		<div id="join2">
			<h3>1.약관동의 -></h3><h3 class="blue"> 2.정보입력</h3><h3> -> 3.완료</h3>
			<h4>정보입력</h4>
      		<form action="joinSystem.jsp" method="post">
      			<div class="joinform2">
      			아이디: <input type=text class="forms" name="id" required><br><br>
      			비밀번호: <input type=password class="forms" name="password" required><br><br>
      			비밀번호확인: <input type=password class="forms" name="password2" required><br><br>
      			이름: <input type=text class="forms" name="name" required><br><br>
      			성별: <input type=text class="forms" name="gender" required><br><br>
      			전화번호: <input type=text class="forms" name="number" required><br><br>
      			나이: <input type=text class="forms" name="age" required><br><br>
      			여권번호: <input type=text class="forms" name="passportNo" required><br><br>
      			주소: <input type=text class="forms" name="address" required><br><br>
      			</div>
      			<br>
      			<input type="submit" value="다음" class="joinbtn">
      		</form>
      	</div>
     </section>
</body>
</html>