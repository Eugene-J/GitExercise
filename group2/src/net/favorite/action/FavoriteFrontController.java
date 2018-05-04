package net.favorite.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FavoriteFrontController extends HttpServlet{



	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FavoriteFrontController doProcess()");
		String requestURI=request.getRequestURI();
		System.out.println(requestURI);
		String context=request.getContextPath();
		String command=requestURI.substring(context.length());
		ActionForward forward=null;
		Action action=null;
		
		
		//주소 비교
		if(command.equals("/Favorite.fa")){
			action = new Favorite();
			try{
			forward=action.execute(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}
			
		
		
		
		//이동(주소비교에서 이동방식, 이동할곳 정보를 찾아올것)
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
			RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);	
			}		
		}
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FavoriteFrontController doGet()");	
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FavoriteFrontController doPost()");
		doProcess(request, response);
		
	}
	
	
	
	
	
	
}
