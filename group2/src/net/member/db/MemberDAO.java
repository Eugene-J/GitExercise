package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		//자원의 이름 불러오기 자원위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con= ds.getConnection();
		return con;
		
}
	public void  insertMember(MemberBean memberbean) {
	 Connection con = null;
	 String sql =null;
	 PreparedStatement pstmt =null;
	 try {
		con=getConnection();
		
		sql = "insert into member(m_id, m_pass, m_name,m_id_num1,m_id_num2,m_pay,m_grade, m_reg_date) values(?,?,?,?,?,?,?,?)";
		 pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberbean.getM_id());			
		pstmt.setString(2, memberbean.getM_pass());		
		pstmt.setString(3, memberbean.getM_name());	
		pstmt.setInt(4, memberbean.getM_id_num1());	
		pstmt.setInt(5, memberbean.getM_id_num2());	
		pstmt.setInt(6, 0);	//pay
		pstmt.setString(7, memberbean.getM_grade()); //grade	
		pstmt.setDate(8, memberbean.getM_reg_date());
		
		pstmt.executeUpdate();
		
	}catch(Exception e) {
		//예외를 잡아서 처리 --> 메세지 출력 
		e.printStackTrace();
		
	}finally {
		//예외가 발생하든 말든 상관없이 마무리작업
		//객체 기억장소 마무리
		if(con!=null)try {con.close();}catch(SQLException ex) {};
		if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
	}
	
 }//insertMember() 메서드

	public int idcheck(String id) {
		int check =0;
		Connection con=null;
		String sql =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			con=getConnection();
			
		sql="select * from member where m_id = ?";
		 pstmt= con.prepareStatement(sql);
		pstmt.setString(1, id);
		 rs= pstmt.executeQuery();
		if(rs.next()){
			if(id.equals(rs.getString("m_id"))){
				check=1;
			}else {
				check=0;
			}
		
		}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {};
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			
		}return check;
	}
	
	public int userCheck(String id,String pass) {
		int check =3;
		Connection con=null;
		String sql =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			con=getConnection();
			
		sql="select * from member where m_id = ?";
		 pstmt= con.prepareStatement(sql);
		pstmt.setString(1, id);
		 rs= pstmt.executeQuery();
		if(rs.next()){
			if(pass.equals(rs.getString("m_pass"))){
				check=1;
			}else {
				check=0;
			}
		}else {
			check=-1;
		}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			if(rs!=null)try {rs.close();}catch(SQLException ex) {};
			
		}return check;
	}
	
	public MemberBean getMember(String id) {
		MemberBean memberbean = null;
		String sql =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		Connection con = null;
		try {
			con=getConnection();
			
			sql = "select * from member where m_id=?"; 
			 pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberbean = new MemberBean(); //자바빈 객체생성
				//자바빈 멤버변수 id=rs.getString("id");
				memberbean.setM_id(rs.getString("id"));  
				memberbean.setM_pass(rs.getString("pass"));  
				memberbean.setM_name(rs.getString("name"));  
				memberbean.setM_grade(rs.getString("grade"));  
				memberbean.setM_reg_date(rs.getDate("m_reg_date"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			
			if(con!=null)try {con.close();}catch(SQLException ex) {};
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
			if(rs!=null)try {rs.close();}catch(SQLException ex) {};
		}
		
		return memberbean;
	
	}
}
//	public String getUserEmail(String userID) {
//
//		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
//
//		try {
//
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//
//			pstmt.setString(1, userID);
//
//			rs = pstmt.executeQuery();
//
//			while(rs.next()) {
//
//				return rs.getString(1); // 이메일 주소 반환
//
//			}
//
//		} catch (SQLException e) {
//
//			e.printStackTrace();
//
//		}
//
//		return null; // 데이터베이스 오류
//
//	}
//
//	

	
	/*
	

	public String EmailChecked(String id){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql =null;
		Connection con = null;
		String jun= "준회원";
		MemberBean memberbean = null;
		try {
			con=getConnection();
			sql = "SELECT m_grade FROM member WHERE m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				return rs.getString(memberbean.getM_grade()); // 이메일 등록 여부 반환
			}

		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return jun;
	}


	public boolean setUserEmailChecked(String id) {
		Connection con = null;
		MemberBean memberbean = null;

		try {
			String SQL = "UPDATE member SET userEmailChecked = true WHERE m_id = ?";

			PreparedStatement pstmt = con.prepareStatement(SQL);

			pstmt.setString(1, memberbean.getM_id());

			pstmt.executeUpdate();

			return true; // 이메일 등록 설정 성공

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false; // 이메일 등록 설정 실패

	}

}

	*/
//	public void updateMember(MemberBean mb) {
//		Connection con=null;
//		String sql ="";
//		PreparedStatement pstmt=null;
//			try {
//				//d예외가 발생할것 같은 명령, 필수적으로 외부파일 접근,디비접근
//				
//				con=getConnection();
//				
//				 sql = "update member set name=? where id=? and pass=?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, mb.getName());		
//				
//				pstmt.setString(2, mb.getId());
//				pstmt.setString(3, mb.getPass());
//									
//				//? 세번째 물음표, 이름값
//				
//				pstmt.executeUpdate();
//			}catch(Exception e) {
//				//예외를 잡아서 처리 --> 메세지 출력 
//				e.printStackTrace();
//				
//			}finally {
//				//예외가 발생하든 말든 상관없이 마무리작업
//				//객체 기억장소 마무리
//				if(pstmt!=null) {
//					try{
//						pstmt.close();
//						   //예외처리 안해주면 에러남
//				}catch(SQLException ex) 
//					{
//					
//					}
//				}
//			}if(con!=null)try {con.close();}catch(SQLException ex) {};
//			 if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
//			
//		 }
//		
//	public void deleteMember(String id,String pass) {
//		Connection con = null;
//		String sql = null;
//		PreparedStatement pstmt = null;
//		try {
//			//d예외가 발생할것 같은 명령, 필수적으로 외부파일 접근,디비접근
//			con=getConnection();
//			
//			sql = "delete from member where id=? and pass=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			pstmt.setString(2, pass);
//			
//			pstmt.executeUpdate();
//			
//			
//		}catch(Exception e) {
//			//예외를 잡아서 처리 --> 메세지 출력 
//			e.printStackTrace();
//			
//		}finally {
//			//예외가 발생하든 말든 상관없이 마무리작업
//			//객체 기억장소 마무리
//			if(con!=null)try {con.close();}catch(SQLException ex) {};
//			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {};
//		}
//	}
//	
//	public List<MemberBean> getMemberList(){
//		//기본적으로 10개생성 추가되면 또 10개 늘어나고 .. 이런식
//		List<MemberBean> memberList = new ArrayList<MemberBean>();
//		Connection con = null;
//		String sql = null;
//		ResultSet rs = null;
//		Statement stmt =null;
//		try {
//			
//			con=getConnection();
//			
//			sql = "select * from member";
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql);
//				
//			while(rs.next()) {
//				MemberBean mb = new MemberBean();
//				
//					mb.setId(rs.getString("id"));
//					mb.setPass(rs.getString("pass"));  
//					mb.setName(rs.getString("name"));  
//					mb.setReg_date(rs.getTimestamp("reg_date"));  
//					memberList.add(mb);
//			
//			//MBean mb 객체 생성
//			//한사람의 정보를 저장 멤버변수 id<=rs.get("id")
//			//큰바구니 배열 memberList 한칸에 저장 .add(mb)
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally{
//			//닫기
//		}
//		return memberList;
//	}
//	
	
	
	
	

