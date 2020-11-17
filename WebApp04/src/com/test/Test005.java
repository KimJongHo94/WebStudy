/* ======================
	  Test005.java
	  - Servlet 관련 실습
   ======================
*/

// 현재... 자바의 기본 클래스 Test005
// 이를 서블릿(Servlet)으로 구성하는 방법

// HttpServlet 을 상속받는 클래스로 설계 → Servlet
// 1. 나도 Servlet 가 될테야
// 2. 메소드 사용

// 서비스 메소드 -> 클라이언트 요청이 있을 때 마다 불려와진다.
// form method 요청 방식에 따라서 get or post 호출 방식이 정해진다.

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test005 extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// post 방식의 요청에 대해 호출되어 실행되는 메소드
		doGetPost(request, response);
	}
	
	// 어떤 요청이 들어와도 다 처리할려고 한다면
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// get 방식의 요청이든 post 방식의 요청이든
		// 모두 처리할 수 있는 사용자 정의 메소드
		
		// request.getParameter("userId");
		// → 이전 페이지(Test005.jsp)로 부터 데이터 수신
		
		String userId = request.getParameter("userId");
		
		// request.getParameter("userPwd");
		// → 이전 페이지(Test005.jsp)로 부터 데이터 수신
		
		String userPwd = request.getParameter("userPwd");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String str = "아이디 : " + userId + ", 패스워드 : " + userPwd;
		
		PrintWriter out = response.getWriter();	
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset='UTF-8'>");
		out.print("<title>Test005.java</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<div>");
		out.print("<h1>서블릿 관련 실습</h1>");
		out.print("<hr>");
		out.print("</div>");
		out.print("");
		out.print("<div>");
		out.print("<h2>HttpServlet 클래스를 활용한 서블릿 테스트</h2>");
		out.print("");
		out.print("<p>" + str + "</p>");
		out.print("</div>");
		out.print("");
		out.print("</body>");
		out.print("</html>");
		out.print("");
		out.print("");
		
		
	}
	
}
