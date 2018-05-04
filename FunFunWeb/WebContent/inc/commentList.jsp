<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentBean"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	
	//한글처리 
	request.setCharacterEncoding("UTF8");
	
	//num 
	int num=Integer.parseInt(request.getParameter("num"));
	String board_num=request.getParameter("num");//이걸 해줘야 함 
	
	//객체생성
	CommentDAO cdao = new CommentDAO();

	//getCommentCount 함수 호출 
	int count=cdao.getCommentCount(board_num);

	//한페이지에 몇개씩 나오게 할건지
	int c_pageSize=10;
	
	//페이지 넘버 매기기 
	String c_pageNum=request.getParameter("c_pageNum");
	//페이지 번호가 없으면 무조건 '1'인것 수정
	if(c_pageNum==null){
		c_pageNum="1";
	}
	
	
	//첫번째페이지 쪽수 
	int c_currentPage=Integer.parseInt(c_pageNum);
	
	//각페이지 첫행 : 1페이지 10 =>1  2페이지 10 => 11     3페이지 10=>21
	int c_startRow=(c_currentPage-1)*c_pageSize+1;
	
	//각페이지 마지막행 : 1페이지 10 =>10   2페이지 10 =>20   3페이지 10 =>30
	int c_endRow=c_currentPage*c_pageSize; 
	
	//게시판 글 LIST에 담아서 가져오기
	List<CommentBean> commentList=null;
	
	if(count!=0){
		commentList = cdao.getCommentList(c_startRow, c_pageSize);
	}
	
	BoardDAO bdao=new BoardDAO();
	BoardBean bb=bdao.getBoard(num);

	CommentBean cb=cdao.getComment(num);
	%>


 <p id="c_count">댓글 수 | <%=count %> 개</p> <!-- 페이지넘버[<%=c_pageNum %> page] boardnum=<%=board_num %> -->
<!--  댓글의 넘버 -->

	<table border="1" id="c_table">	
			
			
			<%	
			if(count!=0){ 
			
			
				for(int i=0;i<commentList.size();i++){
					cb=(CommentBean)commentList.get(i);
					if(board_num.equals(cb.getBoard_num())){  //if문이 for안에 들어가야 함 
					%>
	
			
				<tr>	
					<!-- <td><%=cb.getNum() %></td>	-->
					<!--  <td><%=cb.getBoard_num() %></td> -->
					<td><%=cb.getName()%></td>
					<td><%=cb.getDate()%></td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="80" rows="5"><%=cb.getContent() %></textarea></td>
				</tr>
			<%	
					}else{}//if 
				}//for
			}else if(count==0){
		%>		
				<tr>	
					<td><%="댓글이 없습니다"%></td>
				</tr>
		
	<%} %>
			
	</table>	


	<%
	if(count!=0){	
		//게시판 전체 페이지수 구하기
			//전체 글 개수 count 50개 한화면에 보여눌 글개수 pageSize 10개
			//count50 pageSize10 =>전체페이지수50/10+나머지0=>5+0=0
			//count58 pageSize10 =>전체페이지수58/10+나머지1=>5+1=6
			//삼항 (조건)연산자 조건?참값:거짓값	
		int c_pageCount=count/c_pageSize+(count%c_pageSize==0?0:1);
		
		//한화면에 보여줄 페이지수 설정
		int c_pageBlock=3;
			
		//시작하는 페이지 번호 구하기
			//1~10 => 1   , 11~20=>11, 21~30 =>21
			//
		//int startPage=(((currentPage/pageBlock)+0.9-1)*pageBlock))+1;
		int c_startPage=((c_currentPage-1)/c_pageBlock)*c_pageBlock+1;	
		
		//끝나는 페이지 번호 구하기
		int c_endPage=c_startPage+c_pageBlock-1;
	
	
		//구한 끝페이지 보다 전체페이지 수가 작은 경우 
		if(c_endPage>c_pageCount){
			c_endPage=c_pageCount;
		}
	
	
	
		//이전
		if(c_startPage>c_pageBlock){
			%><a href="../inc/commentList.jsp?pageNum=<%=c_startPage-c_pageBlock%>">[이전]</a><%  //이전은 문자니까 <%=  필요 없음
		}
		
		for(int i=c_startPage;i<=c_endPage;i++){
			%><a href="../inc/commentList.jsp?pageNum=<%=i%>"><%=i%></a><%
			//근데 i는 변수니까 <%=  필요하다
		}
		
		//다음
		if(c_endPage<c_pageCount){
			%><a href="../inc/commentList.jsp?pageNum=<%=c_startPage+c_pageBlock%>">[다음]</a>
		<%
		}//if
	}
%>

</body>
</html>