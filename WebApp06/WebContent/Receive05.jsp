<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send05.html) 로 부터 데이터 수신
	// → dan
	
	request.setCharacterEncoding("UTF-8");

	String dan = request.getParameter("dan");

	int numDan = Integer.parseInt(dan);
	
	String strDan = "";
	
	for(int i = 1; i <= 9; i++)
	{
		// strDan += (numDan + " * " + i + " = " + (numDan*i) + "<br>");
		strDan += String.format("%d * %d = %d<br>", numDan, i, (numDan*i));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 05
	   
	   - 구구단 결과를 출력하는 JSP 페이지를 구성한다.
	     (Receive05.jsp)
	   
	   - 원하는 단수를 입력받아 결과를 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	     (Send05.html)
	     
	     단 수 선택 [    1단 ▼   ]
	     
	   - 단 선택 시
	     『1 * 1 = 1
	       1 * 2 = 2
	       1 * 3 = 3
	         :
	       1 * 9 = 9
	     』
	     와 같이 처리될 수 있도록 한다.
	     (Receive05.jsp)
	     
	   - 사용자 최초 요청 페이지의 주소는
	     『http://localhost:8090/WebApp06/Send05.html』로 한다.
 -->

	<p><%=strDan %></p>
	

</body>
</html>