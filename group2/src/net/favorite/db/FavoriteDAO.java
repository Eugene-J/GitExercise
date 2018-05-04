package net.favorite.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*import net.mypage.db.CouponBean;*/

public class FavoriteDAO {
	//디비연결 메서드
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	public List <FavoriteBean>getFavoritelist(String id){
		List<FavoriteBean> favoritelist = new ArrayList<FavoriteBean>();
		Connection con = null;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = getConnection();
			sql="select * from favorite where f_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){			
				FavoriteBean fb = new FavoriteBean();
				fb.setF_id(rs.getString("f_id"));
				fb.setF_num(rs.getInt("f_num"));
							
				favoritelist.add(fb);
				}
		 }catch(Exception e) {
			//예외 생기면 변수 e에 저장
			//예외를 잡아서 처리 -> 메시지 출력
			e.printStackTrace();
			}finally{
				//예외가 발생하든 말든 상관없이 마무리작업
				//객체 기억장소 마무리
				if(rs!=null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
				if(con!=null)try{con.close();}catch(SQLException e){e.printStackTrace();}
			}
		return favoritelist;
	}//end getFavoritelist

	
}
