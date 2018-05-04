package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;

public class CommentDAO {
	
	
	//Connection
		private Connection getConnection() throws Exception{
			
			Connection con=null;
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
			con=ds.getConnection();
			
			return con;
		}//Connection
		
		
	//insertComment
	public void insertComment(CommentBean cb) {
		int num=0;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			sql="select max(num) as num from comment";
			pstmt=con.prepareStatement(sql);

			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("num")+1;
			}
			
			sql="insert into comment(num,name,content,board_num,date) values(?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, cb.getName());
			pstmt.setString(3, cb.getContent());
			pstmt.setString(4, cb.getBoard_num()); //현재 게시물 번호 
			
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
	}//insertComment
	
	
	
	//getComment
	public CommentBean getComment(int num){
			
			CommentBean cb=null;   
			Connection con=null;
			String sql="";
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try{
				con=getConnection();
				sql="select*from board where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1,num);
				
				rs=pstmt.executeQuery();
			
				if(rs.next()){
					
					cb=new CommentBean();
					cb.setNum(rs.getInt("num"));
					cb.setName(rs.getString("name"));
					cb.setDate(rs.getDate("date"));
					cb.setContent(rs.getString("content"));
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
			return cb;
		}//getComment
	
	
	
	
	//getCommentCount
		public int getCommentCount(String board_num) {
			int count=0;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				con=getConnection();
				
				String sql="select count(*) from comment where board_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,board_num);
				
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
		}//getCommentCount
		
			
			
			
		
		//getCommentList
		public List<CommentBean> getCommentList(int c_startRow, int c_pageSize){//괄호 안의 것을 안 썼다.
			
			List<CommentBean> CommentList=new ArrayList<CommentBean>();
			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			CommentBean cb=null;
			
			try{
				con=getConnection();
				
				//sql구문으로 게시판 전체의 글을 정렬 최근 글위로.
				//limit 시작행-1, 몇개
				//String sql="select*from board order by num desc limit ?,?"; 
				String sql="select*from comment order by num asc limit ?,?"; 
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1,c_startRow-1);  
				pstmt.setInt(2,c_pageSize); 
				rs=pstmt.executeQuery();
				
				
				while(rs.next()){
					cb=new CommentBean();
					cb.setNum(rs.getInt("num"));
					cb.setName(rs.getString("name"));
					cb.setContent(rs.getString("content"));
					cb.setDate(rs.getDate("date"));
					cb.setBoard_num(rs.getString("board_num"));
					

					CommentList.add(cb);
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
			return CommentList;
		}//getCommentlist

}
