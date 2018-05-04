package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VipResResult implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("VipResResult execute");
		request.setCharacterEncoding("utf-8");
		
		
		
		
		
		
		
		
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./vip/vip_reservation_test.jsp");	
		
		return forward;
	}

}
