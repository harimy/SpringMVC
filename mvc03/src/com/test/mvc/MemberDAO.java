/*===========================================
   MemberDAO.java
   - 데이터베이스 액션 처리 클래스.
   - Connection 객체에 대한 의존성 주입.
     → setter 메소드 추가.
===========================================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MemberDAO implements IMemberDAO
{
	// ※ Connection 객체에 대한 의존성 주입을 위한 준비
	//    ① 인터페이스 형태의 데이터타입을 취하는 속성 구성
	private DataSource dataSource;
	//-- DataSource 는 인터페이스이다.
	
	//    ② setter 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	//-- 여기서는 준비를 하는 것이고
	// 실제 주입은 dispatcher-servlet.xml 에서 스프링이 수행한다.
	// 매개변수 타입을 인터페이스로 구성하여야 
	// Spring 의 핵심가치인 Ioc/DI 를 해치지 않고 구성할 수 있다.
	// 즉, DataSource 인터페이스를 구현한 모든 클래스를 매개변수로 넘겨받을 수 있는 형태이다.

	
	// ※ IMemberDAO 인터페이스의 메소드 오버라이딩 
	
	@Override
	public int add(MemberDTO member) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)"
				+ " VALUES(MEMBERLISTSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,  member.getName());
		pstmt.setString(2, member.getTelephone());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int count() throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public ArrayList<MemberDTO> list() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT MID, NAME, TELEPHONE FROM TBL_MEMBERLIST ORDER BY MID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setMid(rs.getInt("MID"));
			dto.setName(rs.getString("NAME"));
			dto.setTelephone(rs.getString("TELEPHONE"));
			
			result.add(dto);
		}
		
		pstmt.close();
		rs.close();
		conn.close();
		
		return result;
	}

}
