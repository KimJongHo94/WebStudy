<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#div01 { display: none; }
	#div02 { display: none; }
</style>

<script>

	function checkGender(obj)
	{
		// alert("호출 확인");
		
		var div01 = document.getElementById("div01");
		var div02 = document.getElementById("div02");
		
		div01.style.display = "none";
		div02.style.display = "none";
		
		if (obj.value=="남자")
		{
			div02.style.display = "inline";
		}
		else 
		{
			div01.style.display = "inline";
		}
	}


	function sendIt()
	{
		// alert("확인");
		
		var f = document.myForm;
		
		f.submit();
	}

</script>

</head>
<body>

<div>
	<h1>JSP 액션태그 실습</h1>
	<hr></hr>
</div>

<div>
	<p>데이터 등록</p>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="name" />
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" class="txt" name="age"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label for="">
						<input type="radio" name="gender" id="male" value="남자" 
						onclick="checkGender(this)" /> 남자
						<input type="radio" name="gender" id="female" value="여자" 
						onclick="checkGender(this)" /> 여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<div id="div01">
						<label for="">
							<input type="checkbox" name="idelType" id="idelType1"
							value="최우식" />최우식
						</label>
						<label for="">
							<input type="checkbox" name="idelType" id="idelType2"
							value="현빈" />현빈
						</label>
						<label for="">
							<input type="checkbox" name="idelType" id="idelType3"
							value="김수현" />김수현
						</label>
					</div>
					<div id="div02">
						<label for="">
							<input type="checkbox" name="idelType" id="idelType4"
							value="신세경" />신세경
						</label>
						<label for="">
							<input type="checkbox" name="idelType" id="idelType5"
							value="아이유" />아이유
						</label>
						<label for="">
							<input type="checkbox" name="idelType" id="idelType6"
							value="조현" />조현
						</label>
					</div>
				</td>
			<tr style="height: 20px;">
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn"
					style="width: 100%; font-size: 16pt;" onclick="sendIt()">등록</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>