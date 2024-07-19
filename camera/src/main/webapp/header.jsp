<%@page import="xyz.itwill.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UsersDTO loginUsers=(UsersDTO)session.getAttribute("loginUsers");
%>
<div id="main-header-middle">
	<div id="account-box">
		<nav>
			<ul>
				<% if(loginUsers == null) { %>
					<li><a href="index.jsp?workgroup=users&work=users_login" id="good">Sing in</a></li>
					<li><a href="index.jsp?workgroup=users&work=users_agreement" id="good">Sing up</a></li>
				<% } else {	%>
					<li><a href="index.jsp?workgroup=users&work=users_mypage" id="good">My account</a></li>
			</ul>
		</nav>
		<%--로그아웃, 관리자 없음 --%>
		<div id="welcome">
			<div id="welcomeleft">
				<span>[<%=loginUsers.getUsersName()%>]님 환영합니다!</span>
				<% } %>
			</div>
		</div>
	</div>

	<div id="logo-box">
		<div id="logo-img">
			<h1>
				<a href="">FILLI CAMERA</a>
			</h1>
		</div>
		<div id="nav-bar">
			<nav>
				<ul>
					<li><a href="index.jsp?workgroup=product&work=product_list1" id="good">Camera</a></li>
					<li><a href="index.jsp?workgroup=product&work=product_list2" id="good">Film</a></li>
					<li><a href="index.jsp?workgroup=product&work=product_list3" id="good">Acc</a></li>
					<li><a href="index.jsp?workgroup=notice&work=notice_list" id="good">Notice</a></li>
					<li><a href="index.jsp?workgroup=order&work=order_list" id="good">Order List</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div id="mylogo">
		<div id="mylogobox">
			<form action="" method="post">
				<input type="text" name="search" id="searchicon"
					placeholder="입력해주세요!" style="position: relative; left: 45px;">
				<a href=""><img src="img/search.svg" alt="" width="55px"
					style="margin-top: 5px; position: relative; left: 40px; bottom: 2px;"></a>
				<a href="index.jsp?workgroup=cart&work=cart_list"><img
					src="img/market.svg" alt="" width="55px" style="margin-left: 57px;"></a>
			</form>
		</div>
	</div>
</div>
