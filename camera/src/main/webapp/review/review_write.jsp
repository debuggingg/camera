<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/write.css">
<title>리뷰 작성하기</title>
</head>
<style type="text/css">

#write-wrap{
width: 720px;
height:230px;
font-size: 17px;
margin:0 auto;
margin-top:60px;
}

table {
	margin: 0 auto;
}

th {
	width: 100px;
}

td {
	text-align: left;
}
</style>
<div id="write-wrap">	
	<form action="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_write_action"
	method="post" enctype="multipart/form-data" id="reviewForm">
	<table>
	<h1 style="text-align: center; font-size: 22px;">글쓰기</h1>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="reviewTitle" id="reviewTitle" size="40">
			</td>	
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="7" cols="60" name="reviewContent" id="reviewContent"></textarea>
			</td>
		</tr>
		<tr>
			<th>이미지파일</th>
			<td>
				<input type="file" name="reviewImage">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit">글저장</button>
				<button type="reset" id="resetBtn">다시쓰기</button>
			</th>
		</tr>
	</table>
</form>
</div>
	<script type="text/javascript">
$("#reviewTitle").focus();

$("#reviewForm").submit(function() {
	if($("#reviewTitle").val() == "") {
		$("#message").text("제목을 입력해 주세요.");
		$("#reviewTitle").focus();
		return false;
	}
	
	if($("#reviewContent").val() == "") {
		$("#message").text("내용을 입력해 주세요.");
		$("#reviewContent").focus();
		return false;
	}
});

$("#resetBtn").click(function() {
	$("#reviewTitle").focus();
	$("#message").text("");
});
</script>

</html>