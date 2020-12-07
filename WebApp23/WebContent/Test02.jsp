<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>JSTL 코어(Core) if문 실습</h1>
</div>
<%-- 
<%
	String su = request.getParameter("su");

	int s = Integer.parseInt(su);
	
	String result = "";
	
	if (s % 2 == 0)
	{
		result = "짝수입니다.";
	}
	else
	{
		result = "홀수입니다.";
	}
%>
 --%>
<div>
	<!-- form 태그에서 action 속성 생략 → 전송하는 데이터의 수신처는 자기 자신 -->
	<form action="" method="post">
		정수 <input type="text" name="su" class="txt" />
		<br><br>
		
		<button type="submit" class="btn"
		style="width: 120px; font-size: 16px;">결과 확인</button>
		<br><br>
		<%-- 결과 : <%=result %> --%>
	</form>
</div>

<div>
	<%-- <h2>${param.su }</h2> --%>
	
	<%-- 비어있는 상황이 아니라면 --%>
	<%-- 『<c:if test=""></c:if>』 : JSTL Core if문 --%>
	<%-- 『test=""』: 조건식 지정. 즉, 파라미터로 수신한 su 에 값이 있으면... --%>
	<%-- 『param.su』: EL 을 이용한 폼 전송 데이터 수신하는 부분 --%>
	<%-- JSTL Core 에는 else 가 없다. --%>
	<c:if test="${!empty param.su }"><!-- 조건 ① -->
	
		<%-- ①번 조건문의 수행 영역 → 『test=""』의 결과가 true 일 경우 수행하는 영역 --%>
		<c:if test="${param.su % 2 == 0 }"><%-- 조건 ② --%>
		
			<%-- ②번 조건문의 수행 영역 --%>
			<h2>${param.su } : 짝수</h2>
		
		</c:if>
		
		<%-- JSTL Core if문에는 else 가 없다. --%>
		<c:if test="${param.su % 2 != 0 }"><%-- 조건 ③ --%>
		
			<%-- ③번 조건문의 수행 영역 --%>
			<h2>${param.su } : 홀수</h2>
		
		</c:if>
		
	</c:if>
</div>

</body>
</html>