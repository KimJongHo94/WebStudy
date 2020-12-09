package com.test.svt;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	public String actionCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String age  = request.getParameter("age");
		
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		return result;
	}
}
