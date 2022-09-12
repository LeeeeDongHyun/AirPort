<%@ page language="java" contentType="text/html; charset=euc_kr" 
	import="java.sql.*, AIR.*, util.*, java.util.regex.Pattern, java.util.regex.Matcher"%>
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
<head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rs.css">
  <meta charset="EUC-KR">
</head>
  <BODY>
  
  <jsp:include page="header2.jsp" flush="false"/>
  <section>
   <div id="rsvWindow">
    <br> 
	<%	
 	       ResultSet rs = (ResultSet) request.getAttribute("RS");
 	       if (rs == null) {
 	    	   out.println("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
 	    	   return;
 	       }
 	       
 	%>
 	   <H3 align=center class="rsvstat"> <% out.println(request.getAttribute("title"));   %> </H3>
 	         
 	<% 
			rs.last();  // rs 커서를 끝으로 이동하여 투플 개수 확인
			int cntTuples = rs.getRow();  // 투플 개수를 구함
			rs.beforeFirst();  // rs 커서를 처음으로 이동
			System.out.println("   >> cntTuples = " + cntTuples + "\n");	
			 
			if (cntTuples == 0) { // 투플 개수가 0이면
				out.println("<center>(결과 없음)</center>");
				return;
			}
			
 	       
 System.out.println("   >> rs : " + rs + "\n");	       
 
		   ResultSetMetaData md = rs.getMetaData();
		   int count = md.getColumnCount();
		   String[] columns = new String[count];
		   String[] columnTypes = new String[count];
		   
		   
		   for(int i=0; i<count; i++){
			   columns[i] = md.getColumnLabel(i+1);
			   columnTypes[i] = md.getColumnTypeName(i+1);
			   
System.out.println("   >> clms : " + columns[i] + " " + columnTypes[i]+ "\n");							
     	   }
			   
	  %>
	  
	  <table id=table align=center valign=top border=1 cellpadding=8 cellspacing=0 bordercolor=#999999>
	   <%      		
	    // 예약번호 따로빼기
	    int[] reserveId = new int[cntTuples];
	   
	   // js에 튜플개수 인원수 넣기
	   out.println("<input type=\"hidden\" id=\"cnt\" value=\" "+ cntTuples+ "\">"  );
			out.println("<tr bgcolor=#6c7ae0 class=\"ftable\" >" );

			for(int i=0; i<columns.length; i++){
				out.println("<th>" + columns[i]  + "</th>" );	
			}
			out.println("</tr>" );

			int cnt = 0;
			while(rs.next()) {
				reserveId[cnt] = rs.getInt("예약번호");
				out.println("<input type=\"hidden\" id=\"reserveId" +cnt+ "\" value=\"" + reserveId[cnt] + "\">" );
				cnt++;
				out.println("<tr onClick=\"HighlightRow(this)\">" );

				for(int i=0; i<columns.length; i++){
					Object obj= rs.getObject(columns[i]);
					out.println("<td>" + obj+  "</td>");
				}
				out.println("</tr>" );
			}
			
      %>
      
	  </table >
	  
	  <%-- 취소버튼누르면 정보전달 --%>
	  <form action="reserveCancelSystem.jsp">
	  	<input type="hidden" id ="reserveIdTarget"name="reserveId" value="">
	  	<input type="submit" value="취소" class="canbtn"> 
	  </form>
	  
	  <script type="text/javascript">
	  const cnt = document.querySelector("#cnt").value;// 총튜플개수
	  const reserveId = new Array();// 고유번호
	  const reserveIdTarget = document.querySelector("#reserveIdTarget");// 노선번호
	  let select = 0;
	  for(var i = 0; i < cnt; i++){
		  reserveIdQ = document.querySelector("#reserveId"+ i);
		  reserveId[i] = reserveIdQ.value;
		  console.log(reserveId[i]);
	  }
	  function HighlightRow(obj){
		  const index = obj.rowIndex-1;
	  	  obj.classList.toggle("clickColor2");
	  	  if(obj.className == "clickColor2"){
	  		if(select >= 1){
	  			alert("2개 이상 설정할 수 없습니다.");
	  			obj.classList.toggle("clickColor2");
	  			return 0;
	  		}
	  		select++;
	  	  }else{
	  		select--;
	  	  }
	  	  reserveIdTarget.value = reserveId[index];
		}
	</script>
    <br>
    </div>
    </section>
  </BODY>
</HTML>
