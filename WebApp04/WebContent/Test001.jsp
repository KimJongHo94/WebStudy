<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//이 영역을 스크립트릿(scriptlet) 영역(자바영역)
	
	String name = "안혜지";
	name += "는 홍길동이 아니다.";
	
	int result = 0;
	result = 10 + 20;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<%-- 작업을 이렇게 이렇게 하고 저렇게 저렇게 해라~!! --%>

<div>
	<h2><%=name %></h2>
	<h2><%=result %></h2>

</div>



</body>
</html>











