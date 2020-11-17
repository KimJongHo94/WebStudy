<%@ page contentType="text/html; charset=UTF-8"%>
<%

	/* // 범위 
	for(int i = 1; i <= 100; i++)
	{
		// 4의 배수 조건
		if(i % 4 == 0)
		{
			out.print(i + " ");
			
			if(i % 20 == 0)
			{
				out.print("<br>");
			}
			
		}
	} */
	
	String str = "";
	
	for(int i=4; i <= 100; i+=4)
	{
		str += String.format("%5d", i);
		if (i % (4*5)==0)
			str += "<br>";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<!-- 
	○ - 1부터 100까지의 수 중에서
	     4의 배수만 출력하는 JSP 페이지를 작성한다.
	   - 한 줄에 5개씩만 출력할 수 있도록 한다.
	   - 빈 줄 바꿈은 『<br>』을 활용한다.
	   - for 반복문을 활용한다.
	   - 요청 주소는 『http://localhost:8090/WebApp05/Test010.jsp』로 한다.
 -->
 
<div>
	<%=str %>
</div>

</body>
</html>