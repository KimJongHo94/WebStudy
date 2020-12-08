package com.test.svt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest01 extends HttpServlet
{
	// 직렬화를 위한 ID 
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		// 서블릿 관련 코딩
		
		// 요청 내용
		// http://localhost:8090/WebApp26/mvctest01
		
		// 1부터 100까지의 수를 객체(컬렉션)에 저장하는 과정
		List<String> lists = new ArrayList<String>();
		for (int i = 1; i <= 100; i++)
			lists.add(String.valueOf(i));

		request.setAttribute("lists", lists);

		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/MVCTest01.jsp");
		rd.forward(request, response);

	}

}
