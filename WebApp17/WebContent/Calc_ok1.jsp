<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Calc.jsp)로 부터 데이터 수신
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2;
	su1=su2=0;
	
	String str = "";
	
	if(strSu1==null || strSu2==null)
	{
		response.sendRedirect("Calc.jsp");
	}
	else
	{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해... 객체 생성~!!!
		Calc ob = new Calc();
		//-- 이클립스 자동 완성 기능을 사요하여 구문을 작성할 경우
		//   『@page import="com.test.Calc"』구문도 함께 처리됨.
		//   혹은, 자동완성 기능을 사용하지 않을 경우도
		//   『@page import="com.test.Calc"』이와 같은 구문을
		//   직접 작성하여 해당 클래스를 사용할 수 있도록 처리해야 함.
		
		ob.setSu1(su1);
		ob.setOp(op);
		ob.setSu2(su2);
		
		str = ob.result();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>첫 번째 방법 처리 결과</h1>
	<hr>
</div>

<div>
 	<h2><%=str %></h2>
</div>

</body>
</html>