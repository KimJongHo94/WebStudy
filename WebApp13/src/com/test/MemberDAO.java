/* ======================================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 클래스
	  (TBL_MEMBER 테이블 전용 DAO)
   ======================================
   
DB연동 방법
1) 클래스를 로드 - 프로그램 전체에서 1번만 수행하면 된다. → static 초기화를 이용
2) DB연결 → Connection 객체를 이용(메서드를 만들어서 사용하자)
※ 접속 연결이 실패하면 DB사용, 결과출력, 자원해제 등을 실행하면 안됨.
   (메서드로 만들어서 성공하면 사용하고, 실패하면 끄는게 좋다.)
3) DB사용
4) 자원을 해제   
 
*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;

	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}

	// 데이터 입력 담당 메소드
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;

		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());

		result = pstmt.executeUpdate();

		pstmt.close();

		return result;
	}

	// 회원 리스트 출력 담당 메소드
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();

		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";

		// 작업 객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		MemberDTO member = null;
		while (rs.next())
		{
			member = new MemberDTO();
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));

			result.add(member);
		}

		rs.close();
		pstmt.close();

		return result;
	}

	// 인원 수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;

		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		rs.close();
		pstmt.close();

		return result;

	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 메소드 추가 -----------------------------------------------
	
	
	// 회원 데이터 검색 담당 메소드(sid 를 가지고 데이터 조회)
	public MemberDTO searchMember(String sid) throws SQLException
	{
		MemberDTO result = new MemberDTO();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setTel(rs.getString("TEL"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 회원 데이터 수정 담당 메소드 
	// sid를 넘겨주는거 절대 아님!!!!!
	public int modify(MemberDTO member) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE TBL_MEMBER "
				+ " SET NAME=?, TEL=? "
				+ " WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());
		pstmt.setString(3, member.getSid());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 회원 데이터 삭제 담당 메소드
	public int remove(String sid) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM TBL_MEMBER WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 자식 테이블의 참조 데이터 레코드 수 확인 메소드
	public int refCount(String sid) throws SQLException
	{
		int result = 0;

		String sql = "SELECT COUNT(*) AS COUNT "
				+ " FROM TBL_MEMBERSCORE "
				+ " WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		rs.close();
		pstmt.close();

		return result;
	}
}
