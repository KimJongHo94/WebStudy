/*=========================================
 
    Test004.java
    - Servlet 관련 실습
 
 =========================================*/

// 현재... 자바 기본 클래스 Test004
// 이를 서블릿(Servlet)으로 구성하는 방법

//GenericServlet 을 상속받는 클래스 설계하면 서블릿이 됨. → Servlet
 
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//CA 아이콘 확인. GenericServlet은 추상클래스로 Test004 도 추상클래스. 제대로 된 기능을 할 수 없어 에러.
public class Test004 extends GenericServlet
{
   
   private static final long serialVersionUID = 1L;
   
   
   //메소드가 추가적으로 필요하여 아래와 같이 작성. 서비스라는 메소드가 필요함. 그래야 추상클래스라는 꼬리가 떨어짐.
   @Override
   public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
   {
      response.setContentType("text/html; charset=UTF-8");
      
      try
      {
         
         PrintWriter out = response.getWriter();
         
         out.print("<html>");
         
         out.print("<head>");
         out.print("<title>");
         out.print("Test004.java");
         out.print("</title>");
         out.print("</head>");
         
         out.print("<body>");
         out.print("<div>");
         out.print("<h1>");
         out.print("서블릿 관련 실습");
         out.print("</h1>");
         out.print("<hr>");
         out.print("</div>");
         
         out.print("<div>");
         out.print("<h2>");
         out.print("GenericServlet 클래스를 이용한 서블릿 테스트");
         out.print("</h2>");
         out.print("</div>");
         out.print("</body>");
         
         out.print("</html>");
         
         
         
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
   }

   
   
   
   
   
   
}