<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String scoreCount = "<span id='scoreCount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th>"
		         + "<th>총점</th><th>평균</th></tr>");
		
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + score.getName() + "</td>");
			str.append("<td class='record'>" + score.getKor() + "</td>");
			str.append("<td class='record'>" + score.getEng() + "</td>");
			str.append("<td class='record'>" + score.getMat() + "</td>");
			str.append("<td class='record'>" + score.getTot() + "</td>");
			str.append("<td class='record'>" + score.getAvg() + "</td>");
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	Connection conn = DBConn.getConnection();
	
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND(((KOR+ENG+MAT)/3),1) AS AVG FROM TBL_SCORE";
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	input { width: 200px;}
	button { width: 200px; height: 50px; font-weight: bold; }
	.errMsg { font-size: small; color:red; display: none;}
	th { background-color: gray; color: white; }
	#numTitle { width: 50px; }
	#nameTitle { width: }
</style>

<script type="text/javascript">

	function formCheck()
	{
		
		var name = document.getElementById("userName");
		var nameErr = document.getElementById("nameMsg");
		
		var kor = document.getElementById("scoreKor");
		var korErr = document.getElementById("korMsg");
		
		var eng = document.getElementById("scoreEng");
		var engErr = document.getElementById("engMsg");
		
		var mat = document.getElementById("scoreMat");
		var matErr = document.getElementById("matMsg");
		
		nameErr.style.display = "none";
		korErr.style.display = "none";
		engErr.style.display = "none";
		matErr.style.display = "none";
		
		
		if(name.value == "")
		{
			nameErr.style.display = "inline";
			name.focus();
			return false;
		}
		
		if(Number(kor.value) > 100 || Number(kor.value) < 0 || isNaN(kor.value) || kor.value == "")
		{
			korErr.style.display = "inline";
			return false;
		}
		
		if(Number(eng.value) > 100 || Number(eng.value) < 0 || isNaN(eng.value) || eng.value == "")
		{
			engErr.style.display = "inline";
			return false;
		}
		
		if(Number(mat.value) > 100 || Number(mat.value) < 0 || isNaN(mat.value) || mat.value == "")
		{
			matErr.style.display = "inline";
			return false;
		}
		
		return true;
		
	}
</script>

</head>
<body>

<!-- 
	■■■ WebApp12 ■■■
	
	○ 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	   총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
	   
	○ 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	 
	○ 데이터베이스 연동하여 처리한다.
	   (TBL_SCORE, SCORESEQ 활용)
	  
	○ 즉, 성적 처리 프로그램을 데이터베이스 연동하여 JSP로 구성할 수 있도록 한다.
	
	○ 페이지 레이아웃(구성)
	
	데이터베이스 연결 및 데이터 처리
	--------------------------------------------------------------------
	성적 처리
	
	이름(*)	  [		]			→ 이름 입력 확인
	국어점수  [     ]           → 0 ~ 100 사이의 정수가 입력되었는지 확인
	영어점수  [     ]           → 0 ~ 100 사이의 정수가 입력되었는지 확인
	수학점수  [     ]           → 0 ~ 100 사이의 정수가 입력되었는지 확인
	
	< 성적 등록 >
	
	번호	이름	국어점수	영어점수	수학점수	총점	평균
	 1     진영은      90          80          70       xxx     xx.x
	 2     주재완      80          70          60       xxx     xx.x
	 3     강정우      70          60          50       xxx     xx.x
	 
	○ 파일 구성
	   - ScoreList.jsp
	   - ScoreInsert.jsp
	   - com.util.DBConn.java
	   - com.test.ScoreDAO.java
	   - com.test.ScoreDTO.java
	   - WebApp12_scott.sql


 -->

<div>
	<h1>데이터베이스 숙제</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>	
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해주세요.</span>
 				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="userKor" name="userKor">
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="userEng" name="userEng">
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="userMat" name="userMat">
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<!-- 인원 수 -->
		<%=scoreCount %>
	</div>
	
	<div>
		<%=str %>
	</div>
</div>

</body>
</html>