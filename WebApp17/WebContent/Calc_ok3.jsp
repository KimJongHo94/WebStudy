<%@ page contentType="text/html; charset=UTF-8"%>

<!-- jsp에게 일 시킴, useBean(객체화) -->
<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>세 번째 방법의 처리 결과</h1>
	<hr>
</div>

<div>
	<h2><%=ob.result() %></h2>
</div>
</body>
</html>