<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Administrator</title>
<style>
    body {
        background-color: #f0f0f0; /* 배경색 설정 */
    }
    
    .welcome-message {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        font-size: 50px;
        color: #333; /* 글자색 */
        animation: fadeIn 2s ease-in-out; /* 페이드 인 애니메이션 */
    }
    
    @keyframes fadeIn {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }
</style>
</head>
<body>
    <div class="welcome-message">
        <p>관리자님 환영합니다.</p>
     
    </div>
</body>
</html>