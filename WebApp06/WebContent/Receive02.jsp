<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String userName = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	int tot = kor + eng + mat;
	double avg = tot / 3.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span><%=userName %></span> , 성적 처리가 완료되었습니다.<br>
	회원님의 점수는 국어: <%=kor %>점, 영어: <%=eng %>점, 수학: <%=mat %>점 입니다.<br>
	총점은 <%=tot %>점, 평균은 <%=avg %>점 입니다.<br>
</body>
</html>