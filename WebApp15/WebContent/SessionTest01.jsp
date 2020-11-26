<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String userName = (String)session.getAttribute("userName");

	session.setMaxInactiveInterval(100);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />

<script>

	function sendIt()
	{
		// alert("테스트");
		
		//var f = document.myForm;
		
		var f = document.forms[0];
		// 구성한 forms를 가져옴 
		
		if(!f.userName.value)
		{
			alert("이름 입력~!!!");
			f.userName.focus();
			return;
		}
		
		if(!f.userBirth.value)
		{
			alert("생일 입력~!!!");
			f.userBirth.focus();
			return;
		}
		
		f.submit();
	}

</script>

</head>
<body>

<!-- 
	○ SessionTest01 에서 SessionTest02 로
	   이름과 생일을 입력받아 전송~!!!
	   
	   SessionTest02 에서 SessionTest03 으로
	   아이디와 패스워드를 입력받고
	   앞에서 전달받은 이름과 생일을 함께 전송~!!!
	   
	   SessionTest03 에서 전달받은 이름, 생일, 아이디, 패스워드 출력~!!!
	   
	   01 ---------------- → 02 ---------------- → 03
	   이름, 생일             아이디, 패스워드       이름, 생일, 아이디, 패스워드
	   입력                   입력					 출력
	          - getParameter                - getAttribute
	   ※ 즉, 01 에서 02로 넘겨줄 땐 getParmeter
	      02 에서 03 으로 넘겨줄 땐 getParmeter 와 getAttribute 로 세션 활용
	      01 에서 03 으로 넘겨줄 수 없기 때문에 세션에 저장
	      
	      ※ session 외에 hidden 태그를 이용한 정보 전달 가능
 -->
 
<div>
	<h1>테이터 전송 및 수신</h1>
	<hr />
</div>

<div>
	<p>이름과 생일(SessionTest01.jsp)</p>
	<form action="SessionTest02.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="userName" class="txt" name="userName" size="10" />
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<input type="text" id="userBirth" class="txt" name="userBirth" size="10"  />
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<button type="button" class="btn" style="width: 400px; height:40px; font-size: 17pt;"
				onclick="sendIt()">다음 페이지로 전송</button>
				</th>
			</tr>
		</table>
	</form>
</div>

</body>
</html>