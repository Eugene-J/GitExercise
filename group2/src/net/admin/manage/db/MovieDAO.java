package net.admin.manage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import javafx.scene.input.KeyCombination.ModifierValue;

public class MovieDAO {
	private Connection getConnection() throws Exception {
		Context init=new InitialContext();
		//자원의 이름 불러오기 자원 위치 java:comp/env 자원이름 jdbc/Mysql
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con=ds.getConnection();
		
		return con;
	}
	
	//카테고리마다 뿌려주는 폼
	public List getCategoryList(String mv_genre){
		List categoryList=new ArrayList();
		  Connection con = null;
	      PreparedStatement pstmt =null;
	      ResultSet rs = null;
	      StringBuffer sql=new StringBuffer();
	      try{
    	  con = getConnection();
    	  System.out.println(mv_genre);
    	  sql.append("select * from movie ");
          if(mv_genre.equals("thriller")){
        	  sql.append("where mv_genre in(?,'horror')");
          }else if(mv_genre.equals("romance")){
        	  sql.append("where mv_genre in(?,'drama')");
          }else {
        	  sql.append("where mv_genre =?");
          }
          pstmt=con.prepareStatement(sql.toString());
          if(mv_genre.equals("thriller")){
        	  pstmt.setString(1, mv_genre);
          }else if(mv_genre.equals("romance")){
        	  pstmt.setString(1, mv_genre);
          }else{
        	  pstmt.setString(1, mv_genre);
          }
          //4 rs 실행 저장
          rs=pstmt.executeQuery();
          //5 rs 데이터 있으면 자바빈 객체 생성
          // rs => 자바빈  => 배열 한칸 저장
          while(rs.next()){
        	  MovieBean moviebean = new MovieBean();
        	  moviebean.setMv_num(rs.getInt("mv_num"));
        	  moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
        	  moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
        	  moviebean.setMv_year(rs.getInt("mv_year"));
        	  moviebean.setMv_country(rs.getString("mv_country"));
        	  moviebean.setMv_age(rs.getInt("mv_age"));
        	  moviebean.setMv_genre(rs.getString("mv_genre"));
        	  moviebean.setMv_time(rs.getInt("mv_time"));
        	  moviebean.setMv_director(rs.getString("mv_director"));
        	  moviebean.setMv_actor(rs.getString("mv_actor"));
        	  moviebean.setMv_story(rs.getString("mv_story"));
        	  moviebean.setMv_video(rs.getString("mv_video"));
        	  categoryList.add(moviebean);
        	  
          }
	      }catch(Exception e){
		         e.printStackTrace();
		      }finally {
		         if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
		         if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}
		         if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
		      }
	      return categoryList;
	}
	
	public MovieBean getMovie(int mv_num){
		 Connection con = null;
	      String sql = "";
	      PreparedStatement pstmt =null;
	      ResultSet rs = null;
	      MovieBean moviebean = null;
	      try{
			con = getConnection();
			sql = "select * from movie where mv_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mv_num);
			rs = pstmt.executeQuery();
			
		         //Step.04 객체실행
			if (rs.next()) {
				moviebean = new MovieBean();
				moviebean.setMv_num(mv_num);
	        	  moviebean.setMv_kor_title(rs.getString("mv_kor_title"));
	        	  moviebean.setMv_eng_title(rs.getString("mv_eng_title"));
	        	  moviebean.setMv_year(rs.getInt("mv_year"));
	        	  moviebean.setMv_country(rs.getString("mv_country"));
	        	  moviebean.setMv_age(rs.getInt("mv_age"));
	        	  moviebean.setMv_genre(rs.getString("mv_genre"));
	        	  moviebean.setMv_time(rs.getInt("mv_time"));
	        	  moviebean.setMv_director(rs.getString("mv_director"));
	        	  moviebean.setMv_actor(rs.getString("mv_actor"));
	        	  moviebean.setMv_story(rs.getString("mv_story"));
	        	  moviebean.setMv_video(rs.getString("mv_video"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	         if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
	         if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}
	         if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
		}
		return moviebean;
	}

	//영화 DB에 넣는 폼
	public void insertMovie(MovieBean mob){

	      Connection con = null;
	      String sql = "";
	      PreparedStatement pstmt =null;
	      ResultSet rs = null;
	      int num=0;
	      
	      try{
	    	 con = getConnection();
	         	sql = "select max(mv_num) from movie";
				pstmt = con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					num= rs.getInt(1);
					num=num+1;
				}
	         sql = "insert into movie(mv_num, mv_kor_title,mv_eng_title,mv_year,mv_country,mv_age,mv_genre,mv_time,mv_director,mv_actor,mv_story,mv_video) values(?,?,?,?,?,?,?,?,?,?,?,?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.setString(2, mob.getMv_kor_title());
	         pstmt.setString(3, mob.getMv_eng_title());
	         pstmt.setInt(4, mob.getMv_year());
	         pstmt.setString(5, mob.getMv_country());
	         pstmt.setInt(6, mob.getMv_age());
	         pstmt.setString(7, mob.getMv_genre());
	         pstmt.setInt(8, mob.getMv_time());
	         pstmt.setString(9, mob.getMv_director());
	         pstmt.setString(10, mob.getMv_actor());
	         pstmt.setString(11, mob.getMv_story());
	         pstmt.setString(12, mob.getMv_video());
	         //Step.04 객체실행
	         pstmt.executeUpdate();      
	      }catch(Exception e){
	         e.printStackTrace();
	      }finally {
	         if(pstmt != null)try{pstmt.close();}catch(SQLException ex){ex.printStackTrace();}
	         if(con != null)try{con.close();}catch(SQLException ex){ex.printStackTrace();}
	         if(rs != null)try{rs.close();}catch(SQLException ex){ex.printStackTrace();}
	      }
	   }
	}//insertMoive END

