<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="xyz.itwill.dto.UsersDTO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.ReviewDAO"%>
<%@page import="xyz.itwill.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xyz.itwill.dao.ProductDAO" %>
<%@ page import="xyz.itwill.dto.ProductDTO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/47ee32fc29.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/product/product_detail.css">
    <title>카메라 상세페이지</title>

</head>
<body>

<%
int prodNo = Integer.parseInt(request.getParameter("prodNo"));

    if(request.getParameter("prodNo") == null) {
        request.setAttribute("returnUrl", request.getContextPath() + "/index.jsp?workgroup=error&work=error_400");
        return;
    }   

    ProductDAO productDAO = ProductDAO.getDAO();
    ProductDTO product = productDAO.selectProductByNo(prodNo);

    if (product == null) {
        // 오류 처리
        out.println("<script>alert('존재하지 않는 상품입니다.'); history.back();</script>");
        return;
    }
    //추가
    int prodAmount=product.getProdAmount();
    
    String productName = product.getProdName();
    String productDescription = product.getProdInfo();
    int productPrice = product.getProdPrice();
    String[] productImages = {
        product.getProdImage1(), 
        product.getProdImage2(), 
        product.getProdImage3(), 
        product.getProdImage4()
    };
%>

<main>
<div id="container-wrap">
    <div class="product-container">
        <div class="product-images">
            <img id="mainImage" src="<%=request.getContextPath()%>/product_image/<%= productImages[0] %>" alt="메인 이미지 <%= product.getProdName() %>">
            <div class="thumbnail-images">
                <% for (int i = 0; i < 3; i++) { 
                    if (productImages[i] != null && !productImages[i].isEmpty()) { %>
                    <img src="<%=request.getContextPath()%>/product_image/<%= productImages[i] %>" alt="작은 이미지<%= i + 1 %> <%= productName %>" onclick="changeMainImage('<%=request.getContextPath()%>/product_image/<%= productImages[i] %>')">
                <% }} %>
            </div>
        </div>
        <div class="product-details">
            <h1><%= productName %></h1>
            <p class="description"><%= productDescription %></p>
            <p class="price"><%= String.format("%,d원", productPrice) %></p>
            <ul class="product-info">
                <li>배송 방법: 택배</li>
                <li>배송비: 무료 (50,000원 이상 무료배송) | 도서산간 배송비 추가</li>
            </ul>
            <div class="quantity">
                <span>수량</span>
                <button type="button" onclick="changeQuantity(-1)">-</button>
                <input type="text" id="quantityInput" value="1">
                <button type="button" onclick="changeQuantity(1)">+</button>
            </div>
            <div class="total-price">
                <p>총 상품금액(1개)</p>
                <p class="price"><%= String.format("%,d원", productPrice) %></p>
            </div>
            <div class="buttons-container">
                <form action="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=addtoorder2" method="post">   
                    <button type="submit" class="uni-btn btn-buy"><span>구매하기</span></button>
                    <input type="hidden" name="prodNo" value="<%= prodNo %>">
                    <input type="hidden" id="finalQuantity" name="finalQuantity" value="">
                </form>
                <form action="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=addtocart2" method="post">   
                    <button type="submit" class="uni-btn btn-basket"><span>장바구니</span></button>
                    <input type="hidden" name="prodNo" value="<%= prodNo %>">
                    <input type="hidden" id="finalQuantity" name="finalQuantity" value="">
                </form> 
            </div>
        </div>
        <div class="floating">
            <a href="#top"><i class="fa fa-arrow-circle-up"></i></a>
        </div>
    </div>
    </div>
    <br>
    <br>
    <div class="tabs">
        <div class="tab-menu">
            <label for="tab3-1">상품 정보</label>
           
        </div>
        <div class="tab-menu">
            <label for="tab3-2">Q & A</label>
           
        </div>
        <div class="tab-menu">
            <label for="tab3-3">리뷰</label>
           
        </div>
    </div>
    <script type="text/javascript">
        function changeMainImage(imageSrc) {
            document.getElementById('mainImage').src = imageSrc;
        }
        function changeQuantity(amount) {
            var quantityInput = document.getElementById('quantityInput');
            var currentQuantity = parseInt(quantityInput.value);
            if (isNaN(currentQuantity)) {
                currentQuantity = 1;
            }
            var newQuantity = currentQuantity + amount;
            if (newQuantity > 0) {
                quantityInput.value = newQuantity;
                finalQuantity = newQuantity;
                var productPrice = <%= productPrice %>;
                var totalPriceElement = document.querySelector('.total-price .price');
                totalPriceElement.textContent = (newQuantity * productPrice).toLocaleString('ko-KR') + '원';
                document.getElementById('finalQuantity').value = finalQuantity;
            }
        }
      
        document.addEventListener('DOMContentLoaded', function () {
            const tabs = document.querySelectorAll('.tab-menu input[type="radio"]');
            const contents = document.querySelectorAll('.tab-content');
            const urlParams = new URLSearchParams(window.location.search);
            const currentTab = urlParams.get('tab') || '1';
            tabs.forEach(tab => {
                tab.addEventListener('change', function () {
                    contents.forEach(content => {
                        content.style.display = 'none';
                    });
                    const targetContent = tab.nextElementSibling;
                    if (targetContent) {
                        targetContent.style.display = 'block';
                    }
                });
            });
            document.querySelector(`.tab-menu input[type="radio"][value="${currentTab}"]`).checked = true;
            document.querySelector('.tab-menu input[type="radio"]:checked').dispatchEvent(new Event('change'));
            if (currentTab === '3') {
                const reviewTab = document.querySelector('.tab-menu input[type="radio"][value="3"]').nextElementSibling;
                if (reviewTab) {
                    setTimeout(() => {
                        reviewTab.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }, 500); // 페이지 로드 후 0.5초 후 스크롤
                }
            }
        });
    </script>
</main>
</body>
</html>
