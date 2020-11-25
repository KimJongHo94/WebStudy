<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// SessionTest01_ok.jsp
	
	// 이전 페이지(SessionTest01)로부터 데이터 수신
	// → userId, userPwd
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// dao 활용 → 로그인 관련 테이블의 데이터와 비교 → 로그인 액션 처리
	
	// 테이블에서 읽어온걸로 가정
	String memberId = "superman";
	String memberPwd = "123456";
	String memberName = "김종호";
	
	if (userId.equals(memberId) && userPwd.equals(memberPwd))
	{
		// session 에 키, 값 저장
		session.setAttribute("userName", memberName);
		
		// 클라이언트가 페이지를 다시 요청할 수 있도록 안내
		response.sendRedirect("SessionTest01.jsp");
	}
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
	<h1>로그인 실패</h1>
	<hr />
</div>4

<div>
	<a href="SessionTest01.jsp">로그인 페이지로 돌아가기</a>
</div>

</body>
</html>