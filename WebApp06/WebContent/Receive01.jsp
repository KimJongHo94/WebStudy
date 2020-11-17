<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역 → 데이터 수신
	//-- 이전 페이지(Send01.html)로 부터 전송된 데이터(userName, userTel) 수신
	
	// request 요청 객체
	String userName = request.getParameter("userName");
	String userTel  = request.getParameter("userTel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 01
	   
	   - 이름과 전화번호를 입력받는 html 페이지를 작성한다.
	     (Send01.html)
	     
	     이름       [         ]
	     전화번호   [         ]
	     
	     <회원 가입>
	     
	     
	   - 회원 가입 버튼 클릭 시
	     『주재완님, 회원가입이 완료되었습니다.
	       회원님께서 등록하신 전화번호는 010-1111-1111 입니다.』
	     라는 내용을 출력하는 JSP 페이지를 작성한다.
	     (Receive01.jsp)
	     
	   - 사용자의 최초 요청 페이지의 주소는
	     『http://localhost:8090/WebApp06/Send01.html』로 한다.
 -->
 
<div>
	<h1>데이터 송수신 실습 01</h1>
	<h2>가입 확인</h2>
	<hr />
</div>


<div>
	<span style="color: blue;"><%=userName %></span>님, 회원가입이 완료되었습니다.<br>
	회원님께서 등록하신 전화번호는 <span style="color: red;"><%=userTel %></span> 입니다.<br>
</div>

</body>
</html>