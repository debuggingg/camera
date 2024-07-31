<%@page import="xyz.itwill.util.Utility"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="xyz.itwill.dao.QnaDAO"%>
<%@page import="xyz.itwill.dto.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="/security/login_check.jspf" %>
<%	
	if(request.getMethod().equals("GET")) {
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=error&work=error_400");
		return;
	}
	//POST 방식으로 요청하여 전달된 값을 읽기 위한 문자형태 변경
request.setCharacterEncoding("utf-8");
	
int qnaNo=Integer.parseInt(request.getParameter("qnaNo"));
String pageNum=request.getParameter("pageNum");
String pageSize=request.getParameter("pageSize");



String qnaType = request.getParameter("qnaType");
String title = Utility.escapeTag(request.getParameter("title"));
String content = Utility.escapeTag(request.getParameter("content"));

	
QnaDTO qna = new QnaDTO();
qna.setQnaNo(qnaNo);
qna.setQnaType(qnaType);
qna.setQnaTitle(title);
qna.setQnaContent(content);

	
int rows = QnaDAO.getDAO().updateQna(qna);





/* if (rows > 0) { */
   /*  response.sendRedirect("index.jsp?workgroup=qna&work=qna_list"); */
	request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=qna&work=qna_detail"
			+"&qnaNo="+qnaNo+"&pageNum="+pageNum+"&pageSize="+pageSize);
/* } else {
    out.println("<script>alert('QnA 작성에 실패했습니다. 다시 시도해 주세요.'); history.back();</script>");
} */
%>