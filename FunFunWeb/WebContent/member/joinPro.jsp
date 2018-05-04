<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberBean"%>
<%@page import="mail.MailDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>


<%



	request.setCharacterEncoding("UTF-8");
%>
	
	<%
	MemberBean mb=new MemberBean();
	
	mb.setId(request.getParameter("id"));
	mb.setPass(request.getParameter("pass"));
	mb.setName(request.getParameter("name"));
	mb.setReg_date(new Timestamp(System.currentTimeMillis()));
	mb.setEmail(request.getParameter("email"));
	mb.setAddress(request.getParameter("address"));
	mb.setPhone(request.getParameter("phone"));
	mb.setMobile(request.getParameter("mobile"));
	mb.setAddress2(request.getParameter("address2"));
	mb.setPostcode(request.getParameter("postcode"));
	
	MemberDAO mdao=new MemberDAO();
	mdao.insertMember(mb);
	
	
	
	
	String from = "huileoil@naver.com";
	String to = request.getParameter("email");
	String subject = "WAVE 회원가입을 환영합니다";
	String content = "Art Creative Group WAVE의 회원이 되신것을 환영합니다.";
	// 입력값 받음
	 
	Properties p = new Properties(); // 정보를 담을 객체
	 
	p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
	 
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들
	 
	try{
	    Authenticator auth = new SMTPAuthenticatior();
	    Session ses = Session.getInstance(p, auth);
	     
	    ses.setDebug(true);
	     
	    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
	    msg.setSubject(subject); // 제목
	     
	    Address fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr); // 보내는 사람
	     
	    Address toAddr = new InternetAddress(to);
	    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
	     
	    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
	     
	    Transport.send(msg); // 전송
	    
	} catch(Exception e){
	    e.printStackTrace();
	    out.println("<script>alert('Send Mail Failed..');history.back();</script>");
	    // 오류 발생시 뒤로 돌아가도록
	    return;
	}
	 
	out.println("<script>alert('WAVE의 회원이 되신것을 환영합니다');location.href='../main/main.jsp';</script>");
	// 성공 시
	%>
	


	
	
	
	