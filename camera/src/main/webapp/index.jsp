<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="camera_project/main/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre:wght@300..900&display=swap" rel="stylesheet">
    <title>Camera</title> 
    
    <style type="text/css">
@charset "UTF-8";
*{margin: 0; padding: 0; list-style: none; box-sizing: border-box; text-decoration: none;  font-family: "Frank Ruhl Libre", serif; }
html{font-size: 62.5%;}/* 15px는 1.5rem!! */
.main-header{width: 100%;height: 22.0rem; ; position: fixed; top: 0; left: 0; right: 0;  z-index: 100;} 
#main-header-middle{width: 150rem; height: 22rem;  margin: 0 auto;}
#account-box{width: 52rem; height: 12rem;  float: right;  }
#account-box nav{width: 52rem; height: 8rem; }
#account-box ul {width: 50rem; height: 5.5rem;  float: right;  margin-top: 10px; }
#account-box ul li{ float: left; width: 15rem;  font-size: 2.1rem;  text-align: center; margin-top: 20px; padding-left: 10px; }
#logo-box{width: 65rem; height: 14.7rem;  margin: 0 auto; position: relative; top: 70px;}
#logo-img{width: 30rem; height: 9rem;  margin: 0 auto; font-size: 2rem; text-align: center; font-family: "Frank Ruhl Libre", serif;}
#nav-bar{width: 70rem; height: 4rem;  margin: 0 auto;}
#nav-bar ul{width: 552px; height: 4rem;  margin: 0 auto;   display: flex; position: relative; left: 70px;} 
/* #nav-bar ul::after{display:block;clear:both;content: '';} */
#nav-bar ul li{ font-size: 1.9rem; width: 15rem;   text-align: center; margin-top: 5px;}
#nav-bar ul li:nth-child(1):hover ul,
#nav-bar ul li:nth-child(2):hover ul {display: block;}
#nav-bar ul li:nth-child(1):hover ul li,
#nav-bar ul li:nth-child(2):hover ul li {display: block;}
#nav-bar ul li ul { display: none; position: absolute; background-color: #FFF7D9;  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); z-index: 200; width: 140px;  height: 100px; padding: 10px 0;}
#nav-bar ul li ul li {text-align: center; padding: 10px 0; padding-right: 25.5px;}
#nav-bar ul li ul li:last-child { border-bottom: none;}

#welcome{width: 50rem; height: 4rem;  margin-left: 20px;}
#welcome span{font-size: 20px; font-family: "Noto Sans KR", sans-serif;}
#welcome a{ font-size: 20px; color: black; }
#welcomeleft{width: 20rem; height: 4rem;  float: left; float: right;}
#welcomeright{width: 25rem; height: 4rem; float: left;}
#manager{width: 10rem; height: 4rem; float: left; margin-top: 3px;  margin-left: 5px;} 
#logout{width: 13rem; height: 4rem; float: left;text-align: center; margin-top: 3px;}


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


.main-body{width: 100%; height: 200rem;  padding-top: 220.4px;}
#mylogo{width: 40rem; height: 5rem;  float: right; }
#mylogobox{ width: 40rem; height: 5rem;  margin: 0 auto;}
#searchicon{width: 200px; height: 35px; font-weight: bold; font-family: "Noto Sans KR", sans-serif; color: black; border: 2px solid black; position: relative; bottom: 25px;}

#content{width: 100%; height: 305.2rem;  }
#img-box{width: 145rem; height: 63rem;  text-align: center;  margin: 0 auto; overflow: hidden; position: relative;  }
#img-slider{display: flex; transition: transform 0.5s ease;}
.img-slide{min-width: 750px; flex: 0 0 auto;}
.productmain{width: 100%; height: 90rem; }
#product{width: 100%; height: 200rem; }

#pdbox{width: 100%; height: 220rem;  }

#product{width: 170rem; height: 60rem;  margin: 0 auto; position: relative; top: 200px; display: flex; flex-direction: row; flex-wrap: wrap; justify-content:  center;}
#product1{width: 170rem; height: 60rem;  margin: 0 auto; position: relative; top: 200px; display: flex; flex-direction: row; flex-wrap: wrap; justify-content:  center; margin-top: 100px;}
#product-title{width: 160rem; height: 10rem;  margin: 0 auto;}
#product-box{width: 40rem; height: 50rem; }
#add-box{width: 50%; height: 3.9rem;  text-align: center; font-size: 18px; color: white; margin-top: 10px; margin: 0 auto;}
#add-box:hover h1{background-color: #32343E; transition: 1s;}
#add-box h1 a:hover{ transition: 1s; color: white;}
#productimg{width: 40rem; height: 35rem;} 
#textbox{width: 40rem; height: 10rem; text-align: center;}
#textbox h1{font-size: 20px;}
#textbox p{font-size: 20px; font-family: "Noto Sans KR", sans-serif;}
.seeimgbox-main{width: 100%; height: 125rem;   margin: 0 auto;}
#imgbox{width: 100rem; height: 100rem; margin: 0 auto;}
#seeimg{width: 70rem; height: 98.5rem;   margin: 0 auto;} 
#font-box{width: 70rem; height: 13rem; background-color: #C9AD8D; margin: 0 auto; position: relative; top: 70px; text-align: center; border: 1px solid black;}
#font-box-wrap{width: 50rem; height: 13rem; border: 1px solid #D0AC88; margin: 0 auto;}
#font-box h1{font-size: 26px; margin-top: 20px; font-family: "Noto Sans KR", sans-serif;}
#font-box p{font-size: 15px; font-family: "Noto Sans KR", sans-serif;}
#font-box a{font-size: 25px; margin-top: 15px; border-radius: 1px solid #D0AC88; position: relative; top:12px; color: black;}


#footer{width: 100%; height: 60rem;  display: flex; justify-content: center;  align-items: center; } 
.footer-main{width: 160rem; height: 40rem; }
#info-left{width: 65rem; height: 40rem;  float: left;}
#info-right{width: 65rem; height: 40rem;  float: right;}

#productimglist1{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#productimglist2 img{ position: relative; top: -97px;}
#productimglist3 img{ position: relative; top: -130px;}
#productimglist4 img{ position: relative; top: 7px;}
#productimglist2{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#productimglist3{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#productimglist4{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}

#productimglist1-1{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#productimglist1-1 img{position: relative; top: -40px;}
#productimglist2-2 img{ position: relative; top: -30px;}
#productimglist3-3 img{ position: relative; top: -60px;}
#productimglist4-4 img{ position: relative; top: -1px;}
#productimglist2-2{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#productimglist3-3{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#productimglist4-4{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}

#flimimglist1{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#flimimglist1 img{position: relative; top: 25px;}
#flimimglist2 img{ position: relative; top: 20px; left: 30px;}
#flimimglist3 img{ position: relative; top: -3px;}
#flimimglist4 img{ position: relative; top: -26px;}
#flimimglist2{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#flimimglist3{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}
#flimimglist4{width: 36rem; height: 27rem; border: 1px solid #D0AC88; margin: 0 auto; position: relative; top: 40px; text-align: center;}




#title-box{width: 50rem; height: 10rem; margin: 0 auto; text-align: center; } 
#title-box h1{font-size: 45px;  border-top: 3px solid #D0AC88; } 
#title-box p{font-size: 15px; font-family: "Noto Sans KR", sans-serif;}



#info-left-box1{width: 65rem; height: 10rem; }
#info-left-box1 h1{font-size: 40px;}
#info-left-box2{width: 65rem; height: 30rem;  }
#divtitle-1{width: 65rem; height: 5rem;  font-size: 15.5px; font-weight: bold;}
#divtitle-1 span{font-family: "Noto Sans KR", sans-serif;}
#box1{width: 10rem; height: 3rem;  }
#box1 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#box2{width: 10rem; height: 3rem; }
#box2 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#box3{width: 30rem; height: 3rem;  }
#box3 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#box4{width: 30rem; height: 3rem;  }
#box4 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#box5{width: 30rem; height: 3rem; }
#box5 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#box6{width: 30rem; height: 3rem;  }
#box6 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#box7{width: 30rem; height: 3rem; }
#box7 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#block{width: 65rem; height:10rem;}
#right-box1{width: 25rem; height: 29.8rem; }
#right-box2{width: 25rem; height: 29.8rem;   float: left;}
#right-box1{width: 25rem; height: 29.8rem; float: left;}
#right-box3{width: 14.8rem; height: 29.8rem;  float: left;}
#rbox1{width: 10rem; height: 3rem;  }
#rbox1 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#rbox2{width: 20rem; height: 3rem;  }
#rbox2 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#rbox3{width: 20rem; height: 3rem; }
#rbox3 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#rbox4{width: 20rem; height: 3rem;  }
#rbox4 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#rbox5{width: 10rem; height: 3rem; }
#rbox5 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#rbox6{width: 30rem; height: 3rem; }
#rbox6 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#rrbox1{width: 10rem; height: 3rem;  }
#rrbox1 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#rrbox2{width: 15rem; height: 3rem;  }
#rrbox2 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#rrbox3{width: 25rem; height: 3rem; }
#rrbox3 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#sns1{width: 10rem; height: 3rem;  }
#sns1 span{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#sns2{width: 10rem; height: 3rem; }
#sns2 a{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#sns3{width: 10rem; height: 3rem;  }
#sns3 a{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#sns4{width: 10rem; height: 3rem; }
#sns4 a{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#sns5{width: 10rem; height: 3rem; }
#sns5 a{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}
#sns6{width: 10rem; height: 3rem;  }
#sns6 a{font-family: "Noto Sans KR", sans-serif; font-size: 15.5px; font-weight: bold;}



    </style>  
    
    <%
	request.setCharacterEncoding("utf-8");

	//페이지 몸체부에 포함될 JSP 문서의 작업 폴더명을 반환받아 저장
	String workgroup=request.getParameter("workgroup");
	if(workgroup == null) {
		workgroup="main";
	}

	//페이지 몸체부에 포함될 JSP 문서의 파일명을 반환받아 저장
	String work=request.getParameter("work");
	if(work == null) {
		work="main_page";
	}
	
	//전달값을 사용하여 페이지 몸체부에 포함될 JSP 문서의 컨텍스트 경로를 생성하여 저장
	String contentPath=workgroup+"/"+work+".jsp";
	
	String headerPath="/header.jsp";
	if(workgroup.equals("admin")) {
		headerPath="/header_admin.jsp";
	}
%>  
</head>


<body>
   <div id="main-header">
		<%-- <jsp:include page="header.jsp"/> --%>
		<jsp:include page="<%=headerPath %>"/>
	</div>
  
        <div id="content">
        <jsp:include page="<%=contentPath %>"/>		
		<%
			String returnUrl=(String)request.getAttribute("returnUrl");
			if(returnUrl != null) {
				response.sendRedirect(returnUrl);
				return;
			}
		%>

    </div>

    
    <div id="footer">
        <jsp:include page="footer.jsp"/>
    </div>


   
  
</body>
</html>