<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 쿠키들이 들어있으니 배열 타입으로 선언 초기화
	Cookie[] ck = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>쿠키 정보 얻어내기</h1>
	<hr />
</div>

<div>
	<table class="table">
		<tr>
			<th style="width: 120px;">쿠키 이름</th>
			<th style="width: 120px;">쿠키 값</th>
		</tr>
		<%
		for(Cookie c : ck)
		{
		%>
		<tr>
			<td><%=c.getName() %></td>
			<td><%=c.getValue() %></td>	
		</tr>
		<%
		}
		%>
	</table>
</div>
<br>

<div>
	<a href="TestSetCookie.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
	
	<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
</div>


</body>
</html>