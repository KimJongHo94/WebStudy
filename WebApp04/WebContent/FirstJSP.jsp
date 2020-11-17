<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String name = "안혜리";
	String str = String.format("%tF", java.util.Calendar.getInstance());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First.jsp</title>
</head>
<body>

<!-- 메롱~ 바보야~!!! : HTML 주석문 -->

<%-- 일꾼~ 바보야~!!! : JSP 주석문 --%>

<div>
	<h1><%=name %></h1>
</div>

<div>
	<h2><%=str %></h2>

</div>
</body>
</html>