<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	/* //이 영역을 스크립트릿(scriptlet) 영역(자바영역)
	StringBuffer sb = new StringBuffer();
	
	sb.append("<ul>");
	
	int i = 5;
	int result = 0;
	
	for(int j = 1; j <= 9; j++)
	{
		result = i * j;
		sb.append(String.format("<li>%d x %d = %d</li>", i, j, result));
	}
	sb.append("</ul>"); */
	
	// -----------------------
	
	// 스크립트 영역
	
	// 구구단 5단을 구성하는 연산 수행
	StringBuilder sb = new StringBuilder();
	
	for(int i = 1; i <=9; i++)
		sb.append(String.format("%d * %d = %d<br>", 5, i, (5*i)));
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<!-- 
	○ 스크립릿과 표현식을 이용하여
	   구구단 5단을 구성하여 출력하는 JSP 페이지를 작성한다.
 -->

<div>
	<%-- 결과값을 출력하는 영역 --%>
	<%=sb.toString() %>
</div>

</body>
</html>