package media;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MediaDAO {
	
	

	//Connection
	private Connection getConnection() throws Exception{
		
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		
		return con;
	}//Connection
	
	
	
	
	//insertGallery
	public void insertMedia(MediaBean mmb) {
		int num=0;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			con=getConnection();
			
			sql="select max(num) as num from media";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("num")+1;
			}
			
			sql="insert into media(num,name,pass,subject,content,file,date) values(?,?,?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, mmb.getName());
			pstmt.setString(3, mmb.getPass());
			pstmt.setString(4, mmb.getSubject());
			pstmt.setString(5, mmb.getContent());
			pstmt.setString(6, mmb.getFile());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException ex) {}
			}
			if(con!=null) {
				try {
					con.close();
				}catch(SQLException ex) {}
			}
		}
	}//insertMedia
	
	
	
	//getMediaCount
	public int getMediaCount() {
		int count=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select count(*) as num from media";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException ex) {}
			}
			if(con!=null) {
				try {
					con.close();
				}catch(SQLException ex) {}
			}
		}
		
		return count;
	}//getMediaCount
	
	
	
	
	
	
		
		
	
	//getgalleryList
	public List<MediaBean> getMediaList(int startRow, int pageSize){//괄호 안의 것을 안 썼다.
		
		List<MediaBean> mediaList=new ArrayList<MediaBean>();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			con=getConnection();
			
			String sql="select*from media order by num desc limit ?,?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,startRow-1);  
			pstmt.setInt(2, pageSize); 
			rs=pstmt.executeQuery();
			
			
			while(rs.next()){
				MediaBean mmb=new MediaBean();
				mmb.setNum(rs.getInt("num"));
				mmb.setSubject(rs.getString("subject"));
				mmb.setName(rs.getString("name"));
				mmb.setContent(rs.getString("content"));
				mmb.setDate(rs.getDate("date"));
				mmb.setFile(rs.getString("file"));
				mediaList.add(mmb);
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
		return mediaList;
	}//getgalleryList
	
	
	
	

		
		
	
	
	//getMedia
	public MediaBean getMedia(int num){
		
		MediaBean mmb=null;   //이렇게 해놓는 것의 의미: 다음에 쓸거라고 일단 선언만 해 놓는거다 
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			//1,2. 디비연결
			con=getConnection();
			//3. sql구문 : 조건 num에 맞는 게시판 가져오기	
			sql="select*from media where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			//4. rs 실행 결과 저장	
			rs=pstmt.executeQuery();
				
			//5. rs 첫행 이동. 데이터 있으면 mmb 객체 생성
			if(rs.next()){
				//자바빈 변수에 디비의 열데이터 저장
				mmb=new MediaBean();
				mmb.setNum(rs.getInt("num"));
				mmb.setName(rs.getString("name"));
				mmb.setDate(rs.getDate("date"));
				mmb.setSubject(rs.getString("subject"));
				mmb.setContent(rs.getString("content"));
				mmb.setFile(rs.getString("file"));
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
		return mmb;
	}//getGallery
	
	
	
	
	public int userCheck(int num, String pass){
		int check=-1;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			con=getConnection();
			
			sql="select*from media where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					check=1;
				}else{
					check=0;
				}
			}else{
				check=-1;
			}
		}catch(Exception e){e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(SQLException ex){}
			}//if
			if(con!=null){
				try{
					con.close();
				}catch(SQLException ex){}
			}
		}
		return check;
	}//userCheck
	
	
	
	
	//updateMedia
	public void updateMedia(MediaBean mmb){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();
			
			sql="update media set name=?, subject=?, content=? file=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mmb.getName());
			pstmt.setString(2, mmb.getSubject());
			pstmt.setString(3, mmb.getContent());
			pstmt.setInt(4, mmb.getNum());
			pstmt.setString(5, mmb.getFile());
			
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
	}//updateMedia
	
	
	
	//deleteMedia
	public void deleteMedia(int num, String pass){
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int check;
		
		try{
			con=getConnection();
			
			sql="delete from media where num=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
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
	}//deleteMedia
	

}//class
