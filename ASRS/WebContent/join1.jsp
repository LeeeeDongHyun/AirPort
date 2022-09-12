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
		<div id="join1">
			<h3 class="blue">1.약관동의</h3><h3> -> 2.정보입력 -> 3.완료</h3>
			<h4>약관동의</h4>
     		<label><input type="checkbox" name="agree" value="1" id="one">개인정보 수집 동의</label><br>
   		    <label><input type="checkbox" name="agree" value="2" id="two">개인정보 이용 동의</label><br>
      		<br>
      		<input type="button" value="다음" onclick="test()" class="joinbtn">
      	</div>
	</section>
      <script type="text/javascript">
      function test() {
    	  const one = document.getElementsByName("agree")[0].checked;
    	  const two = document.getElementsByName("agree")[1].checked;
    	  if(one==true&&two==true){
    		  location.href = "join2.jsp";
    	  }
		  else{
		  alert("전부 동의하셔야합니다.");
		  }
      }
</script>
</body>
</html>
	