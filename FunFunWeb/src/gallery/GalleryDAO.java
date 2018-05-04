package gallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import gallery.GalleryBean;

public class GalleryDAO {
	
	

	//Connection
	private Connection getConnection() throws Exception{
		
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		
		return con;
	}//Connection
	
	
	
	
	//insertGallery
	public void insertGallery(GalleryBean gb) {
		int num=0;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			con=getConnection();
			
			sql="select max(num) as num from gallery";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("num")+1;
			}
			
			sql="insert into gallery(num,name,pass,subject,content,readcount,file,date) values(?,?,?,?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, gb.getName());
			pstmt.setString(3, gb.getPass());
			pstmt.setString(4, gb.getSubject());
			pstmt.setString(5, gb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setString(7, gb.getFile());
			
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
	}//insertGallery
	
	
	
	//getgalleryCount
	public int getGalleryCount() {
		int count=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select count(*) as num from gallery";
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
	}//getgalleryCount
	
	
	
	
	
	
	//getgalleryCount(String search)
		public int getGalleryCount(String search) {
			int count=0;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				con=getConnection();
				
				//String sql="select count(*) as num from gallery where subject like '%?%'";  
				//like -> 포함   //'%?%' -> ?(검색어) 앞뒤로 
				String sql="select count(*) from gallery where subject like ?";  
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
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
		}//getgalleryCount(String search)
	
		
		
		
	
	//getgalleryList
	public List<GalleryBean> getGalleryList(int startRow, int pageSize){//괄호 안의 것을 안 썼다.
		
		List<GalleryBean> galleryList=new ArrayList<GalleryBean>();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			con=getConnection();
			
			String sql="select*from gallery order by num desc limit ?,?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,startRow-1);  
			pstmt.setInt(2, pageSize); 
			rs=pstmt.executeQuery();
			
			
			while(rs.next()){
				GalleryBean gb=new GalleryBean();
				gb.setNum(rs.getInt("num"));
				gb.setSubject(rs.getString("subject"));
				gb.setName(rs.getString("name"));
				gb.setContent(rs.getString("content"));
				gb.setDate(rs.getDate("date"));
				gb.setReadcount(rs.getInt("readcount"));
				gb.setFile(rs.getString("file"));
				galleryList.add(gb);
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
		return galleryList;
	}//getgalleryList
	
	
	
	
	
	
	
	
	//getgalleryList @overload
		public List<GalleryBean> getGalleryList(String search, int startRow, int pageSize){//괄호 안의 것을 안 썼다.
			
			List<GalleryBean> galleryList=new ArrayList<GalleryBean>();
			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			try{
				con=getConnection();
				
				String sql="select*from gallery where subject=? order by num desc limit ?,?"; 
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, search);
				pstmt.setInt(2,startRow-1);  
				pstmt.setInt(3, pageSize); 
				rs=pstmt.executeQuery();
				
				
				while(rs.next()){
					GalleryBean gb=new GalleryBean();
					gb.setNum(rs.getInt("num"));
					gb.setSubject(rs.getString("subject"));
					gb.setName(rs.getString("name"));
					gb.setContent(rs.getString("content"));
					gb.setDate(rs.getDate("date"));
					gb.setReadcount(rs.getInt("readcount"));
					gb.setFile(rs.getString("file"));
					galleryList.add(gb);
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
			return galleryList;
		}//getgalleryList
		
		
		
		
		
		
	
	
	//getGallery
	public GalleryBean getGallery(int num){
		
		GalleryBean gb=null;   //이렇게 해놓는 것의 의미: 다음에 쓸거라고 일단 선언만 해 놓는거다 
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			//1,2. 디비연결
			con=getConnection();
			//3. sql구문 : 조건 num에 맞는 게시판 가져오기	
			sql="select*from gallery where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			//4. rs 실행 결과 저장	
			rs=pstmt.executeQuery();
				
			//5. rs 첫행 이동. 데이터 있으면 gb 객체 생성
			if(rs.next()){
				//자바빈 변수에 디비의 열데이터 저장
				gb=new GalleryBean();
				gb.setNum(rs.getInt("num"));
				gb.setReadcount(rs.getInt("readcount"));
				gb.setName(rs.getString("name"));
				gb.setDate(rs.getDate("date"));
				gb.setSubject(rs.getString("subject"));
				gb.setContent(rs.getString("content"));
				gb.setFile(rs.getString("file"));
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
		return gb;
	}//getGallery
	
	
	
	
	//조회수 올라가기
	public void updateReadcount(int num){
		GalleryBean gb=null;   //이렇게 해놓는 것의 의미: 다음에 쓸거라고 일단 선언만 해 놓는거다 
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			//1,2. 디비열결
			con=getConnection();
			
			//3. sql 수정/ 조건은 num=?
			sql="update gallery set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(1,gb.getReadcount());
			pstmt.setInt(1,num);

			pstmt.executeUpdate();
			
			
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
	}//updateReadcount
	
	
	
	public int userCheck(int num, String pass){
		int check=-1;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			con=getConnection();
			
			sql="select*from gallery where num=?";
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
	
	
	
	
	//updateGallery
	public void updateGallery(GalleryBean gb){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();
			
			sql="update gallery set name=?, subject=?, content=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, gb.getName());
			pstmt.setString(2, gb.getSubject());
			pstmt.setString(3, gb.getContent());
			pstmt.setInt(4, gb.getNum());
			
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
	}//updateGallery
	
	
	
	//deleteGallery
	public void deleteGallery(int num, String pass){
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int check;
		
		try{
			con=getConnection();
			
			sql="delete from gallery where num=?";
			
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
	}//deleteGallery
	

}//class
