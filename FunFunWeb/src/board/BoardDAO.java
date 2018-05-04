package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	//Connection
	private Connection getConnection() throws Exception{
		
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		
		return con;
	}//Connection
	
	
	
	
	public void insertBoard(BoardBean bb) {
		int num=0;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			con=getConnection();
			
			sql="select max(num) as num from board";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("num")+1;
			}
			
			sql="insert into board(num,name,pass,subject,content,readcount,file,re_ref,re_lev,re_seq,date) values(?,?,?,?,?,?,?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setString(7, bb.getFile());
			pstmt.setInt(8, num); //re_ref 기준 번호(num과 똑같이)
			pstmt.setInt(9, 0); //re_lev =0
			pstmt.setInt(10, 0);  //re_seq=0
			
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
	}//insertBoard
	
	//insertBoard
	/*public void insertBoard(BoardBean bb) {
		int num=0;
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			con=getConnection();
			
			sql="select max(num) as num from board";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("num")+1;
			}
			
			sql="insert into board(num,name,pass,subject,content,readcount,file,re_ref,re_lev,re_seq,date) values(?,?,?,?,?,?,?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setString(7, bb.getFile());
			pstmt.setInt(8, num); //re_ref 기준 번호(num과 똑같이)
			pstmt.setInt(9, 0); //re_lev =0
			pstmt.setInt(10, 0);  //re_seq=0
			
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
	}//insertBoard*/
	
	
	
	
	
	//reInsertBoard
		public void reInsertBoard(BoardBean bb) {
			int num=0;
			Connection con=null;
			String sql="";
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			
			try {
				con=getConnection();
				
			
				sql="select max(num) as num from board";
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					num=rs.getInt("num")+1;
				}
				
						  
				//같은 그룹내에서 seq에서 0보다 큰값이 있으면 1과 2를 한칸씩 내리는 작업/ 내 순서값보다 큰 순서값이 있는가 update 구문 
				
				sql="update board SET re_seq=re_seq+1 WHERE re_ref=? and re_seq>?";
				pstmt=con.prepareStatement(sql);
						
				pstmt.setInt(1, bb.getRe_ref());
				pstmt.setInt(2, bb.getRe_seq());
						
				pstmt.executeUpdate();
				
				
				
				
				sql="insert into board(num,name,pass,subject,content,readcount,file,re_ref,re_lev,re_seq,date) values(?,?,?,?,?,?,?,?,?,?,now())";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3, bb.getPass());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, 0);
				pstmt.setString(7, bb.getFile());
				pstmt.setInt(8, bb.getRe_ref()); //re_ref 기준 번호(num과 똑같이)
				pstmt.setInt(9, bb.getRe_lev()+1); //re_lev 하나씩 증가 
				pstmt.setInt(10, bb.getRe_seq()+1);
				
				
				
				
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
		}//reInsertBoard
	
		
		
	
	//getBoardCount
	public int getBoardCount() {
		int count=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select count(*) as num from board";
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
	}//getBoardCount
	
	
	
	
	
	
	//getBoardCount(String search)
		public int getBoardCount(String search) {
			int count=0;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			
			try {
				con=getConnection();
				
				//String sql="select count(*) as num from board where subject like '%?%'";  
				//like -> 포함   //'%?%' -> ?(검색어) 앞뒤로 
				sql="select count(*) as num from board where subject like ?";  
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					count=rs.getInt(1);
				}else {
					count=0;
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
		}//getBoardCount(String search)
	
		
		
		
	
	//getBoardList
	public List<BoardBean> getBoardList(int startRow, int pageSize){//괄호 안의 것을 안 썼다.
		
		List<BoardBean> boardList=new ArrayList<BoardBean>();
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			con=getConnection();
			
			//String sql="select*from board order by num desc limit ?,?"; 
			String sql="select*from board order by re_ref desc, re_seq asc limit ?,?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,startRow-1);  
			pstmt.setInt(2, pageSize); 
			rs=pstmt.executeQuery();
			
			
			while(rs.next()){
				BoardBean bb=new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setName(rs.getString("name"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setFile(rs.getString("file"));
				bb.setRe_lev(rs.getInt("re_lev"));
				boardList.add(bb);
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
		return boardList;
	}//getboardlist
	
	
	
	
	
	
	
	
	//getBoardList
		public List<BoardBean> getBoardList(String search, int startRow, int pageSize){//괄호 안의 것을 안 썼다.
			
			List<BoardBean> boardList=new ArrayList<BoardBean>();
			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			
			try{
				con=getConnection();
				
				sql="select*from board where subject like ? order by num desc limit ?,?"; 
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2,startRow-1);  
				pstmt.setInt(3, pageSize); 
				rs=pstmt.executeQuery();
				
				
				while(rs.next()){
					BoardBean bb=new BoardBean();
					bb.setNum(rs.getInt("num"));
					bb.setSubject(rs.getString("subject"));
					bb.setName(rs.getString("name"));
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setReadcount(rs.getInt("readcount"));
					bb.setFile(rs.getString("file"));
					boardList.add(bb);
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
			return boardList;
		}//getboardlist
		
		
		
		
		
		
	
	
	//gerBoard
	public BoardBean getBoard(int num){
		
		BoardBean bb=null;   //이렇게 해놓는 것의 의미: 다음에 쓸거라고 일단 선언만 해 놓는거다 
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			//1,2. 디비연결
			con=getConnection();
			//3. sql구문 : 조건 num에 맞는 게시판 가져오기	
			sql="select*from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			//4. rs 실행 결과 저장	
			rs=pstmt.executeQuery();
				
			//5. rs 첫행 이동. 데이터 있으면 bb 객체 생성
			if(rs.next()){
				//자바빈 변수에 디비의 열데이터 저장
				bb=new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setDate(rs.getDate("date"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setFile(rs.getString("file"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setRe_lev(rs.getInt("re_lev")); 
				System.out.println(bb.getRe_ref());
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
		return bb;
	}//getBoard
	
	
	
	
	//조회수 올라가기
	public void updateReadcount(int num){
		BoardBean bb=null;   //이렇게 해놓는 것의 의미: 다음에 쓸거라고 일단 선언만 해 놓는거다 
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{
			//1,2. 디비열결
			con=getConnection();
			
			//3. sql 수정/ 조건은 num=?
			sql="update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(1,bb.getReadcount());
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
			
			sql="select*from board where num=?";
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
	
	
	
	
	
	public void updateBoard(BoardBean bb){
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		
		try{
			con=getConnection();
			
			sql="update board set name=?, subject=?, content=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getName());
			pstmt.setString(2, bb.getSubject());
			pstmt.setString(3, bb.getContent());
			pstmt.setInt(4, bb.getNum());
			
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
	}//updateBoard
	
	
	
	
	public void deleteBoard(int num, String pass){
		
		Connection con=null;
		String sql="";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int check;
		
		try{
			con=getConnection();
			
			sql="delete from board where num=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			
			
			sql="delete from board where re_ref=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
			
			
			sql="delete from comment where board_num=?";
			
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
	}//deleteBoard
	
	
	
	
}//BoardDAO
