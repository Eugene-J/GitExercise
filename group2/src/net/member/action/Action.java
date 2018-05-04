package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//추상메서드
	//public 리턴할형 함수이름();
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}
