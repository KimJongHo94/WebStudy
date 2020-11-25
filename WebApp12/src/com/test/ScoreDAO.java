package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;
	
	// DB연결 메소드
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	
	// 데이터 입력 메소드
	public int add(ScoreDTO dto) throws SQLException 
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_SCORE (SID, NAME, KOR, ENG, MAT)" 
				+ " VALUES (SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		// 작업 객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		// INSERT → executeUpdate 사용하기
		result = pstmt.executeUpdate();
		
		// 다 쓴 자원 닫아주기
		pstmt.close();
				
		return result;
	}
	
	// 등록된 인원 세는 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		 
		// 다 쓴 자원 닫아주기
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	// 리스트 전체 출력 메소드
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT," 
				+ " ROUND(((KOR+ENG+MAT)/3),2) AS AVG "
				+ " FROM TBL_SCORE";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			
			result.add(dto);
		}
		
		// 다 쓴 자원 닫아주기
		rs.close();
		stmt.close();
		
		// 결과값 반환
		return result;
		
	}
	
	// 종료 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
}