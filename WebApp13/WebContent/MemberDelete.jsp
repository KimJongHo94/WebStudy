<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberDelete.jsp
	
	String sid = request.getParameter("sid");

	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		// dao에 있는 connection() 연결
		dao.connection();
		
		// 레퍼런스 카운트 확인 먼저 확인하고 삭제가 들어가야함
		
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블의 제거하고자 하는 데이터의
		//   SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수 확인
		
		if(checkCount==0)
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else
		{
			strAddr = "Notice.jsp";
			//-- 제거하지 못하는 사유를 안내하는 페이지...
			//   + 리스트로 돌아가기 버튼
		}
		
		
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
	
	response.sendRedirect(strAddr);
%>
