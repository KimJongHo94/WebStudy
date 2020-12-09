<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String name = request.getParameter("name");
	String age  = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>결과 수신 페이지</h1>
	<hr />
</div>

<div>
	<!-- 수신된 결과 처리 -->
	<ul>
		<li>이름 : <%=name %></li>
		<li>나이 : <%=age %></li>
	</ul>
</div>

</body>
</html>