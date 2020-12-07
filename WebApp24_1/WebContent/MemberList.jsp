<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>

<div>
	<h1>회원 명단 출력</h1>
	<hr />
</div>

<div>
	<table class="table">
		<tr>
			<th>이    름</th>
			<th>전화번호</th>
			<th>주    소</th>
		</tr>
		
		<c:forEach var="dto" items="${lists }">
			<tr>
				<td>${dto.name }</td>
				<td>${dto.tel }</td>
				<td>${dto.addr }</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>