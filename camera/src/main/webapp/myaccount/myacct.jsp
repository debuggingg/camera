<%@page import="xyz.itwill.dao.UsersDAO"%>
<%@page import="xyz.itwill.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/security/login_check.jspf" %> 
<style type="text/css">
 #account-wrap{
width: 700px;
height:450px;

margin: 0 auto;
}

#account-wrap-middle{

width: 700px;
height:350px;

margin-top: 50px;}


#detail1 {
	font-size:17px;
	width: 500px;
	margin: 0 auto;
	text-align: left;
	background-color: gray;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	color: white;
	font-family: Arial, sans-serif;
	line-height: 1.5; 
}
#detail2 {
font-size:15px;
	width: 500px;
	margin: 0 auto;
	text-align: left;
	background-color: gray;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	color: white;
	font-family: Arial, sans-serif;
	line-height: 1.5; 
}

#detail p:first-child {
	font-weight: bold; 
	margin-bottom: 10px;
}

#detail .date-info {
	font-size:5px;
	margin-top: 10px; 
}

#link {
	font-size: 1.2em; 
	margin-top: 20px;
	text-align: center;
	
}

#link a {
	text-decoration: none;
	color: white;
	background-color: #C9AD8D;
	padding: 8px 15px;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

#link a:hover {
	background-color: black;
} 
#account-box{width: 1300px; height: 700px;  margin: 0 auto; /* border:1px solid gray; */}
#acc1-box{width: 200px; height: 600px;  float: left; /* border:1px solid gray; */}
#acc2-box{width: 1090px; height: 600px;  float: right; /* border:1px solid gray; */}

#acc1-box nav ul{ height: 400px; margin: 0 auto; margin-top: 100px;; /* border:1px solid gray; */}
#acc1-box nav ul li{ width: 200px; text-align: center; height: 70px;/*  border:1px solid gray; */ }

#acc1-box nav ul li a{margin-top:20px; font-size: 23px; color: black; /* border:1px solid gray; */}

#detail {
	width: 500px;
	margin: 0 auto;
	text-align: left;
}
#link {
	font-size: 1.1em;
}
#link a:hover {
	color: white;
	background: black;
}

#good { 
    color: #000;
    display:inline-block; 
    margin:0;
    text-transform:uppercase; }
    #good:after {
    display:block;
    content: '';
    border-bottom: solid 3px #BBDEF0;  
    transform: scaleX(0);  
    transition: transform 250ms ease-in-out;
  }
  #good:hover:after { transform: scaleX(1); }
  #good:after{ transform-origin:100% 50%; }
  #good:after{  transform-origin:  0% 50%; }

</style>

 <div id="account-box">
        <div id="acc1-box">
            <nav>
                <ul>
                <li><a href="index.jsp?workgroup=myaccount&work=myacct" id="good">회원정보</a></li>
                <li><a href="index.jsp?workgroup=myaccount&work=myacct_review" id="good">리뷰</a></li>
                <li><a href="index.jsp?workgroup=myaccount&work=myacct_qna" id="good">Q&A</a></li>
                <li><a href="index.jsp?workgroup=myaccount&work=myacct_orderlist" id="good">주문내역</a></li>
                </ul>

            </nav>

        </div>
        <div id="acc2-box">
        
        
        <div id="account-wrap">
<div id="account-wrap-middle">
<h1 style="text-align: center; margin-bottom: 20px;">내정보</h1>
<div id="detail1">
	<p><strong>아이디 =</strong> <%=loginUsers.getUsersId() %></p>
</div>
<div id="detail2">	
	<p><strong>이름 =</strong> <%=loginUsers.getUsersName() %></p>
	<p><strong>이메일 =</strong> <%=loginUsers.getUsersEmail() %></p>
	<p><strong>전화번호 =</strong> <%=loginUsers.getUsersPhone() %></p>
	<p><strong>주소 =</strong> [<%=loginUsers.getUsersZipcode() %>]<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=loginUsers.getUsersAddress1() %> <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=loginUsers.getUsersAddress2() %></p>
</div>
<div id="link">
	<a href="<%=request.getContextPath()%>/index.jsp?workgroup=myaccount&work=password_confirm&action=modify" style="font-size:17px; background-color: gray;">[회원정보변경]</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()%>/index.jsp?workgroup=myaccount&work=password_confirm&action=remove" style="font-size:17px; background-color: gray;">[회원탈퇴]</a>
</div>
	<div class="date-info">
    <p><strong style="font-size:17px;">회원가입날짜 =</strong> <strong style="font-size:17px;"><%= loginUsers.getUsersSigndate().substring(0, 10) %></strong>
    <% if(loginUsers.getUsersLastLogin() == null) { %>
        <p style="display: none;"><strong style="font-size:17px;">마지막 로그인 날짜 =</strong></p>
    <% } else { %>
        <p><strong style="font-size:17px;">마지막 로그인 날짜 =</strong> <strong style="font-size:17px;"><%=loginUsers.getUsersLastLogin() %></strong></p>
    <% } %>
</div>
 </div>
</div>


        </div>
    </div>
