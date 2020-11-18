<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");
	
/* 
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String[] gender = request.getParameterValues("gender");
	String city = request.getParameter("sel_city");
	String[] subject = request.getParameterValues("check");
	
	String res_gen = "";
	
	for(int i = 0; i < gender.length; i++)
	{
		res_gen = gender[i];
	}
	
	String res_city = "";
	
	if(city.equals("city1"))
		res_city = "서울";
	else if(city.equals("city2"))
		res_city = "경기도";
	else if(city.equals("city3"))
		res_city = "강원도";
	else if(city.equals("city4"))
		res_city = "부산";
	
	
	String res_sub = "";
	
	for(int i = 0; i < subject.length; i++)
	{
		res_sub += subject[i] + " ";
	}
	 */
	 
	
	 
	// 이전 페이지(Send04.html) 로 부터 데이터 수신
	String userId = request.getParameter("userId");			// 필수항목 수신 - 아이디
	String userPwd = request.getParameter("userPwd");		// 필수항목 수신 - 패스워드
	String userName = request.getParameter("userName");		// 필수항목 수신 - 이름
	String userTel = request.getParameter("userTel");  		// 필수항목 수신 - 전화번호
	
	String userGender = request.getParameter("userGender"); // 성별
	String userCity = request.getParameter("userCity");		// 지역
	
	// 문자 배열 반환
	// checkbox
	// - 다중 선택 컨트롤
	// - 배열 수신
	String[] userSubject = request.getParameterValues("userSubject");	// 수강과목
	
	String strSubject = "";
	
	for(int i = 0; i < userSubject.length; i++)		// 배열방의 갯수만큼 반복
	{
		strSubject += userSubject[i].toString() + " ";
	}
	
	
	// 수신된 데이터를... 쿼리문을 통해 DB 액션 처리하는 과정을
	// 염두하며 작업을 진행하자~!!!
	
	
	
	
	 
	
	 
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
	○ 데이터 송수신 실습 04
	
	   - 회원 가입 요청 및 처리에 대한 과정을 JSP 페이지로 구성한다.
	   
	   - 전송 전에 (클라이언트 측에서 작성한 내용을 서버 측에 제출하기 전에)
	     입력 데이터에 대한 기본적인 검사 과정을 추가한다.
	     즉, 자바스크립트로 필수 입력 항목에 대한 입력 누락 여부 확인
	     (Send04.html)
	     
	     아이디(*)		[          ]
	     패스워드(*)    [          ]	패스워드를 입력해야 합니다.
	     이름(*)        [          ]
	     전화번호(*)    [          ]	전화번호를 입력해야 합니다.
	     
	     성별           ● 여자    ○ 남자
	     지역           [서울 ▼]
	     수강과목       □ 자바기초  □ 오라클중급  □ JDBC  □ JSP 심화
	     
	     <회원 가입>
	     
	   - 회원 가입 버튼 클릭 시
	     『
	     아이디   : superman
	     패스워드 : java006$
	     이름     : 이준구
	     전화번호 : 010-1111-1111
	     
	     성별     : 여성
	     지역     : 서울
	     수강과목 : 오라클중급 JDBC
	     』
	     과 같이 처리될 수 있도록 한다.
	     (Receive04.jsp)
	     
	   - 사용자의 최초 요청 페이지의 주소는
	     『http://localhost:8090/WebApp06/Send04.html』로 한다.
 -->

<%-- 아이디   : <%=userId %> <br>
패스워드 : <%=userPwd %> <br>
이름     : <%=userName %>   <br>
전화번호 : <%=userTel %>  <br>
	     
성별     : <%=userGender %>			  <br>
지역     : <%=userCity %>		      <br>
수강과목 : <%=strSubject %> <br>
 --%>
 
 
<div>
	<h1>데이터 송수신 실습 04</h1>
	<h2>회원 가입</h2>
	<hr />
</div>

<div>
	<h3>아이디 : <%=userId %></h3>
	<h3>패스워드 : <%=userPwd %></h3>
	<h3>이름 : <%=userName %></h3>
	<h3>전화번호 : <%=userTel %></h3>
	<br /><br />
	
	<h3>성별 : <%=userGender %></h3>
	<h3>지역 : <%=userCity %></h3>
	<h3>수강과목 : <%=strSubject %></h3>
	
</div>
</body>
</html>