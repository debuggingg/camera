<%@page import="xyz.itwill.dto.AdminUsersDTO"%>
<%@page import="xyz.itwill.dto.AdminProductDTO"%>
<%@page import="xyz.itwill.dao.AdminProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int no=Integer.parseInt(request.getParameter("no"));
AdminProductDTO product=AdminProductDAO.getDAO().selectProductByNo(no);

if(product == null) {//검색된 게시글이 없는 경우 
	response.sendError(HttpServletResponse.SC_BAD_REQUEST);

	return;
}
%>
    
   