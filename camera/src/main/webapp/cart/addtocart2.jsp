<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dto.UsersDTO"%>
<%@ page import="xyz.itwill.dto.CartDTO" %>
<%@ page import="xyz.itwill.dao.CartDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	
     //세션에서 로그인 사용자 정보 가져오기
    // 만약 필요하다면 다음과 같이 세션에서 상품 정보도 가져올 수 있습니다.
    ProductDTO product = (ProductDTO)session.getAttribute("product");
	UsersDTO loginUsers = (UsersDTO)session.getAttribute("loginUsers");
    
	
	// 로그인 여부 확인
  if (loginUsers == null) {
        // 로그인되지 않았거나 세션에 사용자 정보가 없는 경우 처리
        response.sendRedirect(request.getContextPath()+"/users/users_login.jsp"); // 로그인 페이지로 리다이렉트
        return; // 리다이렉트 후 종료
    }
  
  // 사용자가 전달한 데이터 가져오기
  	String id = loginUsers.getUsersId();
  	int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		
	int finalQuantity;
	if (request.getParameter("finalQuantity") == null || request.getParameter("finalQuantity").isEmpty()) {
	    finalQuantity = 1; // 기본값 설정
	} else {
	    finalQuantity = Integer.parseInt(request.getParameter("finalQuantity"));
	}
	   
    
    // CartDTO 객체 생성 및 값 설정
    CartDTO cart = new CartDTO();
    cart.setCartproductNo(prodNo);
    cart.setCartusersId(loginUsers.getUsersId()); // 로그인 사용자의 ID 사용
    cart.setCartQuantity(finalQuantity);

    // CartDAO를 사용하여 데이터베이스에 장바구니에 상품 추가
    CartDAO.getDAO().insertCart(cart);
  
    
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니 추가 결과</title>
<style>
       #order-box{
width:100%;
height:500px;
border:1px solid red;
}

#order-box-wrap{
width:50%;
height:500px;
border:1px solid red;
margin: 0 auto;
text-align: center;
font-size: 20px;
}
    </style>
</head>
<body>
<div id="order-box">
	<div id="order-box-wrap">
    <h1>장바구니 추가 결과</h1>
    <p>주문자 아이디: <%= id %></p>
    <p>상품 번호: <%= prodNo %></p>
	<p>주문 수량: <%= finalQuantity%></p>
   		<div>
        	<a href="<%= request.getContextPath() %>/index.jsp">메인 페이지로 이동</a>
    	</div>
    	<div>
        	<a href="<%= request.getContextPath() %>/index.jsp?workgroup=cart&work=cart">장바구니로 이동</a>
    	</div>
    </div>
</div>
    
</body>
</html>

