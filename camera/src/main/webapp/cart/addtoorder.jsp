<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="xyz.itwill.dto.UsersDTO"%>
<%@ page import="xyz.itwill.dto.CartDTO" %>
<%@ page import="xyz.itwill.dao.CartDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%



// 세션에서 로그인 사용자 정보 가져오기
UsersDTO loginUsers = (UsersDTO) session.getAttribute("loginUsers");

// 만약 필요하다면 세션에서 상품 정보도 가져올 수 있습니다.
ProductDTO product = (ProductDTO) session.getAttribute("product");

// 로그인 여부 확인
if (loginUsers == null) {
    // 로그인되지 않았거나 세션에 사용자 정보가 없는 경우 처리
    response.sendRedirect(request.getContextPath() + "/users/users_login.jsp"); // 로그인 페이지로 리다이렉트
    return; // 리다이렉트 후 종료
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
CartDAO.getDAO().insertCart(cart);

// 장바구니에 추가된 상품 정보를 리스트에 저장하기 위해 세션에서 리스트 가져오기
List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
if (cartList == null) {
    cartList = new ArrayList<>();
}

// 리스트에 추가된 상품 정보 추가
cartList.add(cart);

// 세션에 업데이트된 리스트 객체 저장
session.setAttribute("cartList", cartList);

request.setAttribute("returnUrl", request.getContextPath()+"/index.jsp?workgroup=cart&work=cartorder0719");
%>
