<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh'>이름</th>");
		str.append("<th>국어점수</th><th>영어점수</th><th>수학점수</th>");
		str.append("<th>총점</th><th>평균</th><th>석차</th>");
		str.append("<th>성적처리</th>");
		str.append("</tr>");
		
		for (MemberScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			
			str.append("<td>" + score.getSid() + "</td>");
			str.append("<td>" + score.getName() + "</td>");
			str.append("<td class='txtScore'>" + score.getKor() + "</td>");
			str.append("<td class='txtScore'>" + score.getEng() + "</td>");
			str.append("<td class='txtScore'>" + score.getMat() + "</td>");
			str.append("<td class='txtScore'>" + score.getTot() + "</td>");
			str.append("<td class='txtScore'>" + String.format("%.2f", score.getAvg()) + "</td>");
			str.append("<td class='txtScore'>" + score.getRank() + "</td>");
			
			/*
			분기별로 다르게 랜더링
			str.append("<td>");
			str.append("<button type='button' class='btn02'>");
			str.append("입력");
			str.append("</button>");
			str.append("<button type='button' class='btn01'>");
			str.append("수정");
			str.append("</button>");
			str.append("<button type='button' class='btn01'>");
			str.append("삭제");
			str.append("</button>");
			str.append("</td>");
			*/
			
			// 점수가 등록이 안 되어 있는 상황
			// 입력만 가능하게 하고 수정/삭제는 불가능하게 해야 함
			if (score.getKor() == -1 && score.getEng() == -1 && score.getMat() == -1)
			{
				str.append("<td>");
				
				/* 입력 버튼 활성화 → 성적 데이터 입력만 가능 */
				str.append("<a href='MemberScoreInsertForm.jsp?sid=" + score.getSid() + "'>");
				str.append("<button type='button' class='btn01'>");
				str.append("입력");
				str.append("</button>");
				str.append("</a>");
				
				/* 수정 및 삭제 버튼 비활성화 */
				str.append("<button type='button' class='btn02'>");
				str.append("수정");
				str.append("</button>");
				str.append("<button type='button' class='btn02'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</td>");
			}
			else
			{
				// else 구문은 성적이 입력되어 있는 상황이니
				// 입력을 비활성하고 수정 삭제만 가능하게 함
				str.append("<td>");
				
				/* 입력 버튼 활성화 */
				str.append("<button type='button' class='btn02'>");
				str.append("입력");
				str.append("</button>");
				
				/* 수정 버튼 활성화 */
				str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + score.getSid() + "'>");
				str.append("<button type='button' class='btn01'>");
				str.append("수정");
				str.append("</button>");
				str.append("</a>");
				
				/* 삭제 버튼 활성화 */
				str.append("<a href='javascript:memberScoreDelete(" + score.getSid() 
				           + ", \"" + score.getName() + "\")'>");	
				str.append("<button type='button' class='btn01'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</a>");
				
				str.append("</td>");
			}
			
			str.append("</tr>");
		}
		
		str.append("</table>");
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" href="css/MemberSelect.css" />

<script type="text/javascript">

	function memberScoreDelete(sid, name)	// memberScoreDelete(3, '김승범')
	{
		// ※ name 문자열을 넘기는 과정에서 따옴표 구성 주의~!!!
		
		//alert(sid + ", " + name);
		
		var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 성적 정보를 삭제하시겠습니까?");
		
		if (res)
			window.location.href="MemberScoreDelete.jsp?sid=" + sid;
		
	}
</script>

</head>
<body>

<div>
	<h1>회원 성적 관리<span style="font-size: 10pt; color: green;">출력 페이지</span></h1>
	<hr />
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button" class="btn">회원 명단 관리</button></a>
</div>
<br>

<div>
	<!-- 리스트 출력 -->
	<%=str.toString() %>
</div>

</body>
</html>