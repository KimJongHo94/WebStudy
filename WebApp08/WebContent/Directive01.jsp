<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true"%> 기본 설정 --%>
<%-- <%@ page buffer="1kb" autoFlush="false"%> 일 경우 에러 발생 --%>
<!-- 임시적으로 담는 저장 공간 buffer
     autoFlush=false 다 채워져 있음에도 불구하고 내보내지 못 함 -->
<%-- <%@ page buffer="10kb" autoFlush="false"%> 일 경우 에러 발생 --%>
<%@ page buffer="1kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>page 디렉티브 관찰 및 실습</h1>
	<hr />
</div>

<div>
	<h2>buffer 속성 및 autoFlush 실습</h2>
	
	<h3>반복문 구성</h3>
	<%
	for(int i=1; i<=1000; i++)
	{
	%>1234<%	
	}
	%>
	
</div>

</body>
</html>