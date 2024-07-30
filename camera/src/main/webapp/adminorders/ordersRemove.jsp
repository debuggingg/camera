<%@page import="xyz.itwill.dao.AdminOrdersDAO"%>
<%@page import="xyz.itwill.dto.AdminOrdersDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
      //비정상적인 요청에 대한 응답 처리
      	if(request.getParameter("no") == null) {
      		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
      		return;
      	}

      	//전달값을 반환받아 저장
      	int no=Integer.parseInt(request.getParameter("no"));
      	
      	AdminOrdersDTO order=AdminOrdersDAO.getDAO().selectOrderByNo(no);
    
      	if(order ==null){
      		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=error&work=error_400");
      		return;	
      	}
      	order.setOrdersStatus(2);
      	AdminOrdersDAO.getDAO().updateOrder(order);
      	
      	request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=adminorders&work=orders");
      %>