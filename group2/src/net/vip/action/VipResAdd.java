package net.vip.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.vip.db.VipResBean;

public class VipResAdd implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("VipResAdd execute");
		request.setCharacterEncoding("utf-8");
		
		
		
		
		
		VipResBean vrbean=new VipResBean();
		
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./VipResResult.vi");		
		return forward;
	}


}
