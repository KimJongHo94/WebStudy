<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page  contentType="text/html; charset=UTF-8" %>
<%
	String str = "";
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	
	// 쿼리문 준비 -> select
	String sql ="SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND(((KOR+ENG+MAT)/3), 2) AS AVG FROM TBL_SCORE ORDER BY SID ASC";
		
	// 쿼리문 실행
	Statement stmt = conn.createStatement();
		
	ResultSet rs = stmt.executeQuery(sql);
		
	str += "<table class='tbl'>";
	str += "<tr>";
	str += "<th>번호</th>";
	str += "<th>이름</th>";
	str += "<th>국어점수</th>";
	str += "<th>영어점수</th>";
	str += "<th>수학점수</th>";
	str += "<th>총점</th>";
	str += "<th>평균</th>";
	str += "</tr>";
		
	while(rs.next())
	{
		str += "<tr>";
		str += "<td class='listTd'>" + rs.getInt("SID") + "</td>";
		str += "<td class='listTd'>" + rs.getString("NAME") + "</td>";
		str += "<td class='listTd'>" + rs.getInt("KOR") + "</td>";
		str += "<td class='listTd'>" + rs.getInt("ENG") + "</td>";
		str += "<td class='listTd'>" + rs.getInt("MAT") + "</td>";
		str += "<td class='listTd'>" + rs.getInt("TOT") + "</td>";
		str += "<td class='listTd'>" + rs.getDouble("AVG") + "</td>";
		str += "</tr>";
	}
		
	str += "</table>";
		
	rs.close();
	stmt.close();
	DBConn.close();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>

<style type="text/css">
	.listTd { text-align: center;}
	.errMsg { font-weight: small; color: red; display: none;}
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

<div>
	<h1>데이터 처리 실습</h1>
	<hr>
</div>

<!-- 
	■■■ WebApp10 ■■■
	
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
	   - WebApp10_scott.sql


 -->

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck();">
		<table class='tbl'>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="scoreKor" name="scoreKor">
					<span class="errMsg" id="korMsg">0 에서 100 사이의 점수 입력</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="scoreEng" name="scoreEng">
					<span class="errMsg" id="engMsg">0 에서 100 사이의 점수 입력</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="scoreMat" name="scoreMat">
					<span class="errMsg" id="matMsg">0 에서 100 사이의 점수 입력</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<input type="submit" value="등록" class="btn" style="width: 280px; height: 50px; font-weight: bold;">
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<%=str %>
	</div>
</div>

</body>
</html>