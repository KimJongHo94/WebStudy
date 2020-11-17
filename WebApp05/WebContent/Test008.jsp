<%@ page contentType="text/html; charset=UTF-8"%>
<%

	/* StringBuffer sb = new StringBuffer();

	int money = 980;
	int fiveHund = money / 500;
	int oneHund = (money % 500) / 100;
	int fiveTen = ((money % 500) % 100) / 50;
	int ten = (((money % 500) % 100) % 50) / 10;
	
	
	sb.append(String.format("대상 금액 : %d원<br>", money));
	sb.append(String.format("화폐 단위<br>"));
	sb.append(String.format("오백원 %d개<br>", fiveHund));
	sb.append(String.format("  백원 %d개<br>", oneHund));
	sb.append(String.format("오십원 %d개<br>", fiveTen));
	sb.append(String.format("  십원 %d개<br>", ten)); */
	
	int money, initMoney;
	money = initMoney = 980;
	int m500=0, m100=0, m50=0, m10=0;
	
	m500 = money/500;
	money = money%500;		// money %= 500;
	
	m100 = money/100;
	money = money%100;		// money %= 100;
	
	m50 = money/50;
	money = money%50;		// money %= 50;
	
	m10 = money/10;
	money = money%10;		// money %= 10;
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<!-- 
	○ 980원을 화폐 단위로 구분하여 JSP 페이지를 작성한다.
	   요청 주소는 『http://localhost:8090/WebApp05/Test008.jsp』로 한다.
 -->

<div>
	<h2>대상 금액 : <%=initMoney %>원</h2>
	<h2>화폐 단위</h2>
	<h3>- 오백원 <%=m500 %>개</h3>
	<h3>-   백원 <%=m100 %>개</h3>
	<h3>- 오십원 <%=m50 %>개</h3>
	<h3>-   십원 <%=m10 %>개</h3>
</div>

<div>
	<%-- 결과값을 출력하는 영역 --%>
	<%-- <%=sb.toString() %> --%>
</div>

</body>
</html>