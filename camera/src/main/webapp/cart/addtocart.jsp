<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dto.UsersDTO"%>
<%@ page import="xyz.itwill.dto.CartDTO" %>
<%@ page import="xyz.itwill.dao.CartDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	UsersDTO loginUsers = (UsersDTO) session.getAttribute("loginUsers");


	if(loginUsers == null) {
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=users&work=users_login");
		return;	
	}

	
	// 사용자가 전달한 데이터 가져오기
	int prodNo = Integer.parseInt(request.getParameter("prodNo"));
	int quantity = Integer.parseInt(request.getParameter("prodAmount"));
	
	// CartDTO 객체 생성 및 값 설정
	CartDTO cart = new CartDTO();
	cart.setCartproductNo(prodNo);
	cart.setCartusersId(loginUsers.getUsersId()); // 로그인 사용자의 ID 사용
	cart.setCartQuantity(quantity);
	
	// CartDAO를 사용하여 데이터베이스에 장바구니에 상품 추가
	CartDAO cartDAO = CartDAO.getDAO();
	cartDAO.insertCart(cart);
		
	
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
.button-container {
        display: flex; /* Flexbox 사용으로 가로 정렬 */
        justify-content: center; /* 가운데 정렬 */
        margin-top: 20px; /* 상단 여백 */
    }

    .button {
        display: inline-block; /* 블록 요소로 변경 */
        margin: 0 10px; /* 좌우 여백 추가 */
        padding: 10px 20px; /* 내부 패딩 추가 */
        text-decoration: none; /* 밑줄 제거 */
        color: white; /* 글자색 흰색 */
        background-color: #4CAF50; /* 배경색 */
        border-radius: 5px; /* 모서리 둥글게 */
        transition: background-color 0.3s; /* 배경색 전환 효과 */
    }

    .button:hover {
        background-color: #45a049; /* 마우스 오버 시 색상 변경 */
    }

    </style>
</head>
<body>
<div id="order-box">
	<div id="order-box-wrap">
 		<h1>장바구니 추가 결과</h1>
   		<p>상품수량 : <%= quantity %></p>
    	<p>상품 번호: <%= prodNo %></p>
	
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
