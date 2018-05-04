package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;


public class MemberLoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute()");
		request.setCharacterEncoding("utf-8");

		ActionForward forward= new ActionForward();
		MemberBean memberbean= new MemberBean();
		HttpSession session = request.getSession();
		
		MemberDAO mdao = new MemberDAO();
		memberbean.setM_id(request.getParameter("id"));
		memberbean.setM_pass(request.getParameter("pass"));
		
		response.setContentType("text/html;	charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check=mdao.userCheck(memberbean.getM_id(),memberbean.getM_pass());
		
		if(check==0) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}else if(check==-1){
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다');");
			out.println("history.back()");
			out.println("</script>");
		}else if(check==1){
			session.setAttribute("id",memberbean.getM_id());
		forward.setRedirect(true);
		forward.setPath("./Main.me");
		}
		return forward;
	}
		
}
	

