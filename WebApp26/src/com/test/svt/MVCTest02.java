package com.test.svt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest02 extends HttpServlet
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
		
		// 모델 객체 생성 및 결과 수신(View)
		MVCTest02Model model = new MVCTest02Model();
		String view = model.actionCount(request, response);


		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);

	}

}
