<%@page import="xyz.itwill.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    UsersDTO loginUsers=(UsersDTO)session.getAttribute("loginUsers");
    %>
            <div id="header-top">
                    <div id="profile">
                    <% if(loginUsers == null) { %>
                       <a href="index.jsp?workgroup=users&work=users_login">Login</a>
                       <a href="index.jsp?workgroup=users&work=users_agreement">Singup</a>
                    <% } else { %>
                       <span> [<%=loginUsers.getUsersName() %>]님, 환영합니다!</span>
                       <a href="index.jsp?workgroup=users&work=users_logout_action">Logout</a>
                       <a href="index.jsp?workgroup=myaccount&work=myacct">My account</a>
                       <% if(loginUsers.getUsersStatus() == 9) {//로그인 사용자가 관리자인 경우 %>
                       		<a href="index.jsp?workgroup=admin&work=admin_main">Manager</a>
                       <% } %>
                  <% } %>
                    </div>
            </div>
            <div id="header-bottom">
                <div id="header-bottom-middle">
                <div id="logo"><a href="index.jsp" style="color:orange;">Filli Camera</a></div>
                <div id="search_button">
                    <div id="search-middle">
                    <form action="" method="get">
                    <input id="search" type="text" name="search" placeholder="Search">
                </form>
                  </div>
                </div>
                <div id="nav-bar">
                <nav>
                <ul>
                     <li><a href="index.jsp?workgroup=product&work=camera_list" id="good">Camera</a></li>
                    <li><a href="index.jsp?workgroup=product&work=film_list" id="good">Film</a></li>
                    <li><a href="index.jsp?workgroup=users&work=acc_list" id="good">Acc</a></li>
                    <li><a href="index.jsp?workgroup=notice&work=notice" id="good">Notice</a></li>
                    <li><a href="index.jsp?workgroup=cart&work=cart" id="good">Cart</a></li>
                    <li><a href="index.jsp?workgroup=order&work=order_list" id="good">Review</a></li>
                </ul>
            </nav>
        </div>
        </div>
        </div>
       

