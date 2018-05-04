package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DataDAO {
	
	

	//Connection
	private Connection getConnection() throws Exception{
		
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		
		return con;
	}//Connection
	
	
	
	
	//insertData
	public void insertData(DataBean db) {
		int num=0;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			con=getConnection();
			
			sql="select max(num) as num from data";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("num")+1;
			}
			
			sql="insert into data(num,name,pass,subject,content,file,date) values(?,?,?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, db.getName());
			pstmt.setString(3, db.getPass());
			pstmt.setString(4, db.getSubject());
			pstmt.setString(5, db.getContent());
			pstmt.setString(6, db.getFile());
			
			
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
	}//insertData
	
	
	
	//getDataCount
	public int getDataCount() {
		int count=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select count(*) as num from data";
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
	}//getDataCount
	
	
	
	
	
	
	//getDataCount(String search)
		public int getDataCount(String search) {
			int count=0;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				con=getConnection();
				
				//String sql="select count(*) as num from gallery where subject like '%?%'";  
				//like -> 포함   //'%?%' -> ?(검색어) 앞뒤로 
				String sql="select count(*) from data where subject like ?";  
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
		}//getDataCount(String search)
	
		
		
		
	
	//getDataList
	public List<DataBean> getDataList(int startRow, int pageSize){//괄호 안의 것을 안 썼다.
		
		List<DataBean> DataList=new ArrayList<DataBean>();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			con=getConnection();
			
			String sql="select*from data order by num desc limit ?,?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,startRow-1);  
			pstmt.setInt(2, pageSize); 
			rs=pstmt.executeQuery();
			
			
			while(rs.next()){
				DataBean db=new DataBean();
				db.setNum(rs.getInt("num"));
				db.setSubject(rs.getString("subject"));
				db.setName(rs.getString("name"));
				db.setContent(rs.getString("content"));
				db.setDate(rs.getDate("date"));
				db.setFile(rs.getString("file"));
				DataList.add(db);
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
		return DataList;
	}//getDataList
	
	
	
	
	
	
	
	
	//getgalleryList @overload
		public List<DataBean> getDataList(String search, int startRow, int pageSize){//괄호 안의 것을 안 썼다.
			
			List<DataBean> DataList=new ArrayList<DataBean>();
			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			try{
				con=getConnection();
				
				String sql="select*from data where subject=? order by num desc limit ?,?"; 
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, search);
				pstmt.setInt(2,startRow-1);  
				pstmt.setInt(3, pageSize); 
				rs=pstmt.executeQuery();
				
				
				while(rs.next()){
					DataBean db=new DataBean();
					db.setNum(rs.getInt("num"));
					db.setSubject(rs.getString("subject"));
					db.setName(rs.getString("name"));
					db.setContent(rs.getString("content"));
					db.setDate(rs.getDate("date"));
					db.setFile(rs.getString("file"));
					DataList.add(db);
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
			return DataList;
		}//getDataList
		
		
		
		
		
		
	
	
	//getData
	public DataBean getData(int num){
		
		DataBean db=null;   //이렇게 해놓는 것의 의미: 다음에 쓸거라고 일단 선언만 해 놓는거다 
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			//1,2. 디비연결
			con=getConnection();
			//3. sql구문 : 조건 num에 맞는 게시판 가져오기	
			sql="select*from data where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			//4. rs 실행 결과 저장	
			rs=pstmt.executeQuery();
				
			//5. rs 첫행 이동. 데이터 있으면 gb 객체 생성
			if(rs.next()){
				//자바빈 변수에 디비의 열데이터 저장
				db=new DataBean();
				db.setNum(rs.getInt("num"));
				db.setName(rs.getString("name"));
				db.setDate(rs.getDate("date"));
				db.setSubject(rs.getString("subject"));
				db.setContent(rs.getString("content"));
				db.setFile(rs.getString("file"));
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
		return db;
	}//getData
	
	
	

	
	public int userCheck(int num, String pass){
		int check=-1;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			con=getConnection();
			
			sql="select*from data where num=?";
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
	public void updateData(DataBean db){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();
			
			sql="update data set subject=?, content=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, db.getSubject());
			pstmt.setString(2, db.getContent());
			pstmt.setInt(3, db.getNum());
			
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
	}//updateData
	
	
	
	//deleteData
	public void deleteData(int num, String pass){
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int check;
		
		try{
			con=getConnection();
			
			sql="delete from data where num=?";
			
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
	}//deleteData
	

}//class
