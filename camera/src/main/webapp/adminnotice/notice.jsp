<%@page import="xyz.itwill.dao.AdminNoticeDAO"%>
<%@page import="xyz.itwill.dto.AdminNoticeDTO"%>


<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<AdminNoticeDTO> adminNotice=AdminNoticeDAO.getDAO().selectNoticeList();
/* UsersDTO users=(UsersDTO)session.getAttribute("users");
if(users.getUsersNo() != 9){
	response.sendError(HttpServletResponse.SC_BAD_REQUEST);
} */
%> 
    
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>Admin notice</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    

    <div class="container">
        <h1>관리자 페이지</h1>
        
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="이름으로 검색">
            <button id="searchButton">검색</button>
        </div>
<div>
    <button type="button" id="addBtn" class="status-button" data-status="100">추가</button>
    
</div>
       
        <table class="member-table">
            
                <tr>
                    <th>공지번호 </th>
                    <th>공지제목 </th>
                    <th>공지내용 </th>
                    <th>공지상태 </th>
                    <th>공지 작성일 </th>
                    <td>공지 삭제</td>
                    <td>공지 변경</td> 
                </tr>
         
            
      <%
                           for(AdminNoticeDTO notice : adminNotice){
       %>
                <tr>
                    <td><%=notice.getNoticeNo() %></td>
                    <td><%=notice.getNoticeTitle() %></td>
                    <td><%=notice.getNoticeContent()%></td>
                    <td><%=notice.getNoticeStatus() %></td>
                    <td><%=notice.getNoticeDate() %></td>
                 
            
                  
                    <td><button type="button" onclick="removeNotice(<%=notice.getNoticeNo()%>);" class="status-button" data-status="300">삭제</button></td>
                    <td><button type="button" onclick="updateNotice(<%=notice.getNoticeNo()%>);"class="status-button" data-status="100">변경</button></td>
                
                </tr>
        <% } %>
        
        </table>
    </div>

    <script type="text/javascript"> 
       document.getElementById("addBtn").onclick=function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=adminnotice&work=noticeAddForm";	
	}
	
 	function updateProduct(no) {
 		location.href="<%=request.getContextPath()%>/adminproduct/productUpdateForm.jsp?no="+no;	 
 	}
	
 	function removeProduct(no) {
 		if(confirm("상품을  정말로 삭제 하시겠습니까?")) {
 		location.href="<%=request.getContextPath()%>/adminproduct/productRemove.jsp?no="+no; 
 		}
 	}
        
        
     </script> 

</body>
</html>