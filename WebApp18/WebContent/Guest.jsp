<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	
	function sendIt()
	{
		// alert("확인");
		
		var f = document.myForm;
		
		// 체크 및 검증할 내용의 코드 작성...
		f.submit();
	}
	
</script>

</head>
<body>

<div>
	<h1>JSP 액션태그 실습</h1>
	<hr />
</div>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr>
</div>

<div>
	<form action="Guest_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<!-- DTO name 속성값을 가져와야지 나중에 매핑할 때 편함 -->
					<input type="text" name="userName">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject">
				</td>
			</tr>
			<tr>	
				<th>내용</th>
				<td>
					<textarea rows="5" cols="30" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">	
					<button type="button" onclick="sendIt()" style="width: 100%;">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>