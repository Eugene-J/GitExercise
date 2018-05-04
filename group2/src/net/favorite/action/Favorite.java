package net.favorite.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.favorite.db.FavoriteDAO;


public class Favorite implements Action{
	ActionForward forward;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Favorite execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");								
		FavoriteDAO fdao = new FavoriteDAO();						
		HttpSession session=request.getSession();		
		String id = (String)session.getAttribute("id");
		
		if(id==null){
			forward=new ActionForward();
			forward.setRedirect(true);		
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		
		List favoritelist = fdao.getFavoritelist(id);
		
		request.setAttribute("favoritelist", favoritelist);	
		
		forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./favorite/favorite2.jsp");						
			
		return forward;
	}
	
}
