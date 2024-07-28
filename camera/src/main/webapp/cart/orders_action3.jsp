<%@page import="xyz.itwill.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.CartDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dto.UsersDTO"%>
<%@page import="xyz.itwill.dao.OrdersDAO"%>
<%@page import="xyz.itwill.dto.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	//세션에서 로그인 사용자 정보 가져오기
	UsersDTO loginUsers = (UsersDTO) session.getAttribute("loginUsers");

	//로그인 여부 확인
	if(loginUsers == null) {
		request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=users&work=users_login");
		return;	
	}

	String userId = loginUsers.getUsersId();

	//CartDAO를 사용하여 사용자 카트에서 상품 목록 가져오기
	CartDAO cartDAO = CartDAO.getDAO();
	List<CartDTO> cartList = cartDAO.selectAllCartList(userId);

	//카트에 담긴 상품이 없으면 처리
	if (cartList == null || cartList.isEmpty()) {
	 System.out.println("카트에 담긴 상품이 없습니다.");
	 
	 return;
	}

	//요청 파라미터 가져오기
	String id = loginUsers.getUsersId();
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = loginUsers.getUsersEmail();
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String ordersrequest = request.getParameter("ordersrequest");
	String payment = request.getParameter("payment");
	int orderscartprice = Integer.parseInt(request.getParameter("price"));
	int orderstotalprice = Integer.parseInt(request.getParameter("selectedTotal"));
	//OrdersDAO 객체 생성
	OrdersDAO ordersDAO = OrdersDAO.getDAO();
	
	//카트 리스트를 반복하여 주문 처리
	for (CartDTO cartItem : cartList) {
	 OrdersDTO orders = new OrdersDTO();
	 orders.setOrdersProdNo(cartItem.getCartproductNo());
	 orders.setOrdersUsersId(userId);
	 orders.setOrdersUsersName(name);
	 orders.setOrdersUsersPhone(phone);
	 orders.setOrdersUsersEmail(email);
	 orders.setOrdersUsersZipcode(zipcode);
	 orders.setOrdersUsersAddress1(address1);
	 orders.setOrdersUsersAddress2(address2);
	 orders.setOrdersRequest(ordersrequest);
	 orders.setOrdersPayment(payment);
	 orders.setOrdersCartAmount(cartItem.getCartQuantity());
	 orders.setOrdersCartPrice(orderscartprice*cartItem.getCartQuantity());
	
	 // OrdersDAO를 통해 주문을 데이터베이스에 저장
	 ordersDAO.insertOrder(orders);
	 
	 
	 cartDAO.clearCart(loginUsers.getUsersId());
}
	
	
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결과</title>
<style type="text/css">

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

.continue-shopping a {
            text-decoration: none;
            color: black;
            padding: 10px 20px;
            background-color: #f7f7f7;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .continue-shopping a:hover {
            background-color: #e3e3e3;
        }

</style>
</head>
<body>
<div id="order-box">
	<div id="order-box-wrap">
    <h1>주문 결과</h1>
    
    <p>주문자 아이디: <%= id %></p>
    <p>수령인 이름: <%= name %></p>
    <p>이메일 : <%= email %></p>
    <p>전화번호: <%= phone %></p>
    <p>우편번호: <%= zipcode %></p>
    <p>기본 주소: <%= address1 %></p>
    <p>상세 주소: <%= address2 %></p>
    <p>배송 요청 사항: <%= ordersrequest %></p>
    <p>결제 수단: <%=payment %></p>    
    <p>총 결제 가격 : <%=orderstotalprice %></p>
    <br>
    <div class="continue-shopping">
           <a href="./index.jsp">메인 페이지로 이동</a>
    </div>
    
    </div>
    
</div>

</body>
</html>
