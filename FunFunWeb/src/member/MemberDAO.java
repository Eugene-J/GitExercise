package member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	
	
	
	//디비 연결 메서드
	private Connection getConnection() throws Exception{
		
		Connection con=null;
		Context init=new InitialContext();
		
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		
		return con;	
	}//Connection
	
	
	//insertMember
	public void insertMember(MemberBean mb){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();
			
			sql="insert into member(id, pass, name, reg_date, email, address, phone, mobile, address2, postcode) values(?, ?, ?, ?, ? ,?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPass() );
			pstmt.setString(3, mb.getName() );
			pstmt.setTimestamp(4,mb.getReg_date() );
			pstmt.setString(5, mb.getEmail() );
			pstmt.setString(6, mb.getAddress());
			pstmt.setString(7, mb.getPhone() );
			pstmt.setString(8, mb.getMobile() );
			pstmt.setString(9, mb.getAddress2());
			pstmt.setString(10, mb.getPostcode());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{pstmt.close();
				}catch(SQLException ex){}
			}
			if(con!=null){
				try{con.close();
				}catch(SQLException ex){}
			}
		}
	}//insertMember

	
	//userCheck
	public int userCheck(String id, String pass){
		int check=-1; 
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
				
		try{
			con=getConnection();
			sql="select*from member where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1,id);
			
			rs=pstmt.executeQuery();
			
			//id, pass checking
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
						check=1;
				}else{
					check=0;
				}
			}else{
				check=-1;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{pstmt.close();
				}catch(SQLException ex){}
			}
			if(con!=null){
				try{con.close();
				}catch(SQLException ex){}
			}
		}
		return check;
		
	}//userCheck
	
	
	
	//getMember
	public MemberBean getMember(String id){
		MemberBean mb=null;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=getConnection();
			sql="select*from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				mb=new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				mb.setEmail(rs.getString("email"));
				mb.setAddress(rs.getString("address"));
				mb.setPhone(rs.getString("phone"));
				mb.setMobile(rs.getString("mobile"));
				mb.setAddress2(rs.getString("address2"));
				mb.setPostcode(rs.getString("postcode"));
				
				
			}	
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{pstmt.close();
				}catch(SQLException ex){}
			}
			if(con!=null){
				try{con.close();
				}catch(SQLException ex){}
			}
		}
		return mb;
	}
	
	
	//updateMember
	public void updateMember(MemberBean mb) {
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();
			
			sql="update member set name=?, email=?, postcode=?, address=?, address2=?, phone=?, mobile=? where pass=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1,mb.getName());
			//pstmt.setString(2,mb.getPass());
			pstmt.setString(2,mb.getEmail());
			pstmt.setString(3,mb.getPostcode());
			pstmt.setString(4,mb.getAddress());
			pstmt.setString(5,mb.getAddress2());
			pstmt.setString(6,mb.getPhone());
			pstmt.setString(7,mb.getMobile());
			pstmt.setString(8,mb.getPass());
			
			pstmt.executeUpdate();   
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{
				pstmt.close();
				}catch(SQLException ex){}
			}
			if(con!=null){
				try{
					con.close();
				}catch(SQLException ex){}
			}			
		}
	}//updateMember
	
	
	
	//changePass
	public void changePass(MemberBean mb) {
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();
			
			sql="update member set pass=? where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1,mb.getPass());
			pstmt.setString(2,mb.getId());
			
			pstmt.executeUpdate();   
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{
				pstmt.close();
				}catch(SQLException ex){}
			}
			if(con!=null){
				try{
					con.close();
				}catch(SQLException ex){}
			}			
		}
	}//updateMember


	//deleteMember
	/*public void deleteMember(MemberBean mb){
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();
				
			sql="delete from member where id=? AND pass=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId()); 
			pstmt.setString(2, mb.getPass()); 
			 		
			pstmt.executeUpdate();	
			
		}catch(Exception e){	
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{
				pstmt.close();
				}catch(SQLException ex){}
			}		
			if(con!=null){
				try{
					con.close();
				}catch(SQLException ex){}
			}
		}
	}//deleteMemeber*/
	
		
/*	public void deleteMember (MemberBean mb){
		Connection con = null;
		String sql = "";
		PreparedStatement pre = null; 
		try {
			// 드라이버 불러오기	// DB 연결
			con = getConnection();
			// sql 구문 이용
			sql = "delete from member where id=? and pass=?";
			pre = con.prepareStatement(sql);
			pre.setString(1, mb.getId());
			pre.setString(2, mb.getPass());
			pre.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pre != null) try { pre.close(); } catch(SQLException ex) { ex.printStackTrace(); }
			if (con != null) try { con.close(); } catch(SQLException ex) { ex.printStackTrace(); }
		}
	} // end of deletePro
*/	

	//deleteMember
	public void deleteMember(String id, String pass) {
		
		Connection con = null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try {
			con=getConnection();
			
			sql="delete from member where id=? and pass=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {pstmt.close();
				}catch(SQLException ex) {}
			}
			if(con!=null) {
				try {con.close();
				}catch(SQLException ex) {}
			}
		}
	}
	
//getMemberList
	public List<MemberBean> getMemberList(){
		
		List<MemberBean> memberList=new ArrayList<>(); 
		//List는 인터페이스라서 객체 생성 못하고 그걸 상속받은 ArrayList가 객체 생성하게 해야한다.
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=getConnection();
			//3.sql 조건 id에 만족하는 회원정보 가져오기
			sql="select*from member";
			pstmt=con.prepareStatement(sql);

			//4. 결과값 저장 
			rs=pstmt.executeQuery();
				
			while(rs.next()){ //몇명인지 모르니까 while
				
				//rs에서 가져온걸 mb에 저장
				MemberBean mb= new MemberBean();//새로운 객체생성   
				mb.setId(rs.getString("id")); //열이름은 큰 따옴표로 묶고
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				mb.setEmail(rs.getString("email"));
				mb.setPostcode(rs.getString("postcode"));
				mb.setAddress(rs.getString("address"));
				mb.setAddress2(rs.getString("address2"));
				mb.setPhone(rs.getString("phone"));
				mb.setMobile(rs.getString("mobile"));
				//만들어 놓은 배열에 저장
				memberList.add(mb);  
			}
	
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{
				pstmt.close();
				}catch(SQLException ex){/*ex.printStackTrace(); - 생략가능*/}
			}
			if(con!=null){
				try{
					con.close();
				}catch(SQLException ex){}
			}			
		}
		return memberList;
	}//getMemberList
	
	
	
	//idCheck
	public int idCheck(String id){
		int check=0; 
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
				
		try{
			con=getConnection();
			sql="select*from member where id=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1,id);
			
			rs=pstmt.executeQuery();
			
			//id  checking
			if(rs.next()){
				if(id.equals(rs.getString("id"))){
					check=1;
				}else{
					check=0;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{
				pstmt.close();
				}catch(SQLException ex){}
			}
			if(con!=null){
				try{
					con.close(); 
				}catch(SQLException ex){}
			}			
		}
	
		return check;
	}//idCheck
	
	
	
	
	
	
	
}//class
