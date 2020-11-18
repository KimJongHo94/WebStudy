<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/* 
	int x = Integer.parseInt(request.getParameter("num1"));
	int y = Integer.parseInt(request.getParameter("num2"));
	
	int result = 0;
	
	String op = request.getParameter("op");
	
	if(op.equals("+"))
	{
		result = x + y;
	}
	else if(op.equals("-"))
	{
		result = x - y;
	}
	else if(op.equals("*"))
	{
		result = x * y;
	}
	else if(op.equals("/"))
	{
		result = x / y;
	}
	*/
	
	// 스크립릿 영역
	
	request.setCharacterEncoding("UTF-8");
	//-- 수신 내용에 한글 데이터가 없으므로 설정하지 않아도 됨.
	
	// Send03.html 페이지로 부터 데이터 수신(num1, num2, op)
	// num1 과 num2 는 형 변환
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	String op = request.getParameter("op");
	String result = "";
	
	if(op.equals("add"))
		result = String.valueOf(num1 + num2);
	else if(op.equals("sub"))
		result = String.valueOf(num1 - num2);
	else if(op.equals("mul"))
		result = String.valueOf(num1 * num2);
	else if(op.equals("div"))
		result = String.format("%.1f", num1/(double)num2);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	입력하신 <%=num1 %> 와 <%=num2 %> 의 연산 결과는 <%=result %> 입니다.
	
</body>
</html>