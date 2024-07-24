
<%@page import="xyz.itwill.dto.AdminNoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 AdminNoticeDTO notice=(AdminNoticeDTO)session.getAttribute("notice");
 	if(notice != null) {
 		session.removeAttribute("notice");
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
h1 {
	margin: 0 auto;
	width: 300px; 
	text-align: center; 
}

table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse; 	
}

th, td {
	border: 1px solid black;
	text-align: center;
	padding: 5px;	
}

.title { width: 100px; }
.input { width: 200px; }
</style>
</head>
<body>
	<h1>Notice</h1>
	<hr>
	<form name="noticeForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=adminnotice&work=noticeAdd" method="post" >
	<table>
	
		<tr>
			<th class="title">Notice title</th>
			<td class="input">
				<input type="text" name="title" <% if(notice != null) { %>value="<%=notice.getNoticeTitle()%>"<% } %>>
			</td>
		</tr>
		<tr>
			<th class="title">Notice Content </th>
			<td class="input">
				<input type="text" name="content" <% if(notice != null) { %>value="<%=notice.getNoticeContent()%>"<% } %>>
			</td>
		</tr>
		<tr>
			<th class="title">Notice Status </th>
			<td class="input">
				<input type="text" name="status" <% if(notice != null) { %>value="<%=notice.getNoticeStatus()%>"<% } %>>
			</td>
	
		<tr>
			<td colspan="2">
				<button type="submit">Submit</button> 
				<button type="reset">reset</button> 
				<button type="button" id="listBtn">Back list</button> 
			</td>
		</tr>
	</table>
	</form>

	
	<script type="text/javascript">
	noticeForm.no.focus();

	
	
	document.getElementById("listBtn").onclick=function() {
		location.href="<%=request.getContextPath()%>/index.jsp?workgroup=adminnotice&work=notice";	
	}
	</script>

</body>
</html>