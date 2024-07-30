<%@page import="xyz.itwill.dto.AdminNoticeDTO"%>
<%@page import="xyz.itwill.dao.AdminNoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/security/login_check.jspf" %>
  
<%
      //비정상적인 요청에 대한 응답 처리
      	if(request.getParameter("no") == null) {
      		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
      		return;
      	}

      	//전달값을 반환받아 저장
      	int no=Integer.parseInt(request.getParameter("no"));
      	
      	AdminNoticeDTO notice=AdminNoticeDAO.getDAO().selectNoticeNo(no);
    
      	if(notice ==null){
      		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=error&work=error_400");
      		return;	
      	}
      	notice.setNoticeStatus(2);
      	AdminNoticeDAO.getDAO().updateNotice(notice);
      	
      	request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=adminnotice&work=notice");
      %>