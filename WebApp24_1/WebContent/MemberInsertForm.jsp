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
</head>
<body>

<div>
	<h1>명단 출력하기</h1>
	<hr />
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
	
		<c:forEach var="member" begin="1" end="5" step="1">
			이    름 : <input type="text" class="txt" name="name" /><br>
			전화번호 : <input type="text" class="txt" name="tel" /><br>
			주    소 : <input type="text" class="txt" name="addr" /><br><br>
		</c:forEach>
		
		
		<button type="submit" style="width: 200px;">입력</button>
	
	</form>
</div>

</body>
</html>