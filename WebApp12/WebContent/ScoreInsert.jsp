<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 한글 깨짐 -> UTF-8로 설정
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	int userKor = Integer.parseInt(request.getParameter("userKor"));
	int userEnG = Integer.parseInt(request.getParameter("userEng"));
	int userMat = Integer.parseInt(request.getParameter("userMat"));
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO score = new ScoreDTO();
		
		score.setName(userName);
		score.setKor(userKor);
		score.setEng(userEnG);
		score.setMat(userMat);
		
		dao.add(score);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
		try
		{
			dao.close();
		}
		catch(Exception e) 
		{
			System.out.println(e.toString());	
		}
		
	// URL 주소가 기록되어 있는 쪽지를 사용자에게 전달
	response.sendRedirect("ScoreList.jsp");
	
%>