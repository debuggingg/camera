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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/qna/product_detial.css">
    <title>카메라 상세페이지</title>
   <%
    ReviewDAO reviewDAO = ReviewDAO.getDAO();

    int prodNo = Integer.parseInt(request.getParameter("prodNo"));

    int pageNum = 1;
    if (request.getParameter("pageNum") != null) {
        pageNum = Integer.parseInt(request.getParameter("pageNum"));
    }

    int pageSize = 10;
    if (request.getParameter("pageSize") != null) {
        pageSize = Integer.parseInt(request.getParameter("pageSize"));
    }

    int totalReview = reviewDAO.selectTotalReviewByProduct(prodNo);
    int totalPage = (int) Math.ceil((double) totalReview / pageSize);

    if (pageNum <= 0 || pageNum > totalPage) {
        pageNum = 1;
    }

    int startRow = (pageNum - 1) * pageSize + 1;
    int endRow = pageNum * pageSize;

    if (endRow > totalReview) {
        endRow = totalReview;
    }

    List<ReviewDTO> reviewList = reviewDAO.selectReviewListByProduct(prodNo, startRow, endRow);
    String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    int displayNum = totalReview - (pageNum - 1) * pageSize;
%>
   
   <style type="text/css">
    body {
        font-family: 'Do Hyeon', sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #ffffff;
    }

    .do-hyeon-regular {
        font-family: "Do Hyeon", sans-serif;
        font-weight: 400;
        font-style: normal;
    }

    .product-container {
        display: flex;
        justify-content: space-between;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #a6a6a6;
        border-radius: 10px;
    }

    .product-images {
        flex: 1;
        margin-right: 20px;
    }

    .product-images img {
        width: 100%;
        max-width: 500px;
        border: 1px solid #e8e8e8;
    }

    .thumbnail-images {
        display: flex;
        margin-top: 10px;
    }

    .thumbnail-images img {
        width: 70px;
        margin-right: 10px;
        cursor: pointer;
    }

    .product-details {
        flex: 1;
        color: #a8a8a8;
    }

    .product-details h1 {
        font-size: 35px;
        color: #414141;
        margin-bottom: 10px;
    }

    .product-details .price {
        font-size: 24px;
        color: #555555;
        margin-bottom: 10px;
    }

    .product-details .description {
        font-size: 16px;
        margin-bottom: 20px;
    }

    .product-details .product-info {
        list-style: none;
        padding: 0;
        margin-bottom: 20px;
    }

    .product-details .product-info li {
        margin-bottom: 10px;
    }

    .quantity {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .quantity span {
        margin-right: 10px;
    }

    .quantity button {
        width: 30px;
        height: 30px;
        background-color: #f6d365;
        border: 1px solid #f6d365;
        cursor: pointer;
        font-size: 16px;
        text-align: center;
    }

    .quantity input {
        width: 40px;
        text-align: center;
        margin: 0 5px;
        border: 1px solid #ccc;
        height: 30px;
    }

    .total-price {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .total-price .price {
        font-size: 24px;
        color: #ff6a00;
    }

    .buttons {
        display: flex;
        justify-content: space-between;
    }

    button {
        margin: 20px;
    }
    .uni-btn {
        width: 250px;
        height: 60px;
        color: #fff;
        border-radius: 5px;
        padding: 0;
        font-family: 'Do Hyeon', sans-serif;
        font-weight: 500;
        background: transparent;
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
        display: inline-block; 
        outline: none;
        border: none;
        font-size: 20px; 
        text-align: center;
    }

    .btn-buy {
        background: linear-gradient(0deg,#f6d365 0%,#fda085 100%);
        line-height: 60px;
        padding: 0;
        border: none;
    }
    .btn-buy span {
        position: relative;
        display: block;
        width: 100%;
        height: 100%;
    }
    .btn-buy:before,
    .btn-buy:after {
        position: absolute;
        content: "";
        right: 0;
        bottom: 0;
        background:#fda085;
        box-shadow:
        -7px -7px 20px 0px rgba(255,255,255,.9),
        -4px -4px 5px 0px rgba(255,255,255,.9),
        7px 7px 20px 0px rgba(0,0,0,.2),
        4px 4px 5px 0px rgba(0,0,0,.3);
        transition: all 0.3s ease;
    }
    .btn-buy:before {
        height: 0%;
        width: 2px;
    }
    .btn-buy:after {
        width: 0%;
        height: 2px;
    }
    .btn-buy:hover {
        color:#fda085;
        background: transparent;
    }
    .btn-buy:hover:before {
        height: 100%;
    }
    .btn-buy:hover:after {
        width: 100%;
    }
    .btn-buy span:before,
    .btn-buy span:after {
        position: absolute;
        content: "";
        left: 0;
        top: 0;
        background:#fda085;
        box-shadow:
        -7px -7px 20px 0px rgba(255,255,255,.9),
        -4px -4px 5px 0px rgba(255,255,255,.9),
        7px 7px 20px 0px rgba(0,0,0,.2),
        4px 4px 5px 0px rgba(0,0,0,.3);
        transition: all 0.3s ease;
    }
    .btn-buy span:before {
        width: 2px;
        height: 0%;
    }
    .btn-buy span:after {
        height: 2px;
        width: 0%;
    }
    .btn-buy span:hover:before {
        height: 100%;
    }
    .btn-buy span:hover:after {
        width: 100%;
    }

    .btn-basket {
        background: linear-gradient(0deg,#f6d365 0%,#fda085 100%);
        line-height: 60px;
        padding: 0;
        border: none;
    }
    .btn-basket span {
        position: relative;
        display: block;
        width: 100%;
        height: 100%;
    }
    .btn-basket:before,
    .btn-basket:after {
        position: absolute;
        content: "";
        right: 0;
        bottom: 0;
        background:#fda085;
        box-shadow:
        -7px -7px 20px 0px rgba(255,255,255,.9),
        -4px -4px 5px 0px rgba(255,255,255,.9),
        7px 7px 20px 0px rgba(0,0,0,.2),
        4px 4px 5px 0px rgba(0,0,0,.3);
        transition: all 0.3s ease;
    }
    .btn-basket:before {
        height: 0%;
        width: 2px;
    }
    .btn-basket:after {
        width: 0%;
        height: 2px;
    }
    .btn-basket:hover {
        color:#fda085;
        background: transparent;
    }
    .btn-basket:hover:before {
        height: 100%;
    }
    .btn-basket:hover:after {
        width: 100%;
    }
    .btn-basket span:before,
    .btn-basket span:after {
        position: absolute;
        content: "";
        left: 0;
        top: 0;
        background:#fda085;
        box-shadow:
        -7px -7px 20px 0px rgba(255,255,255,.9),
        -4px -4px 5px 0px rgba(255,255,255,.9),
        7px 7px 20px 0px rgba(0,0,0,.2),
        4px 4px 5px 0px rgba(0,0,0,.3);
        transition: all 0.3s ease;
    }
    .btn-basket span:before {
        width: 2px;
        height: 0%;
    }
    .btn-basket span:after {
        height: 2px;
        width: 0%;
    }
    .btn-basket span:hover:before {
        height: 100%;
    }
    .btn-basket span:hover:after {
        width: 100%;
    }

    .floating {
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 1000;
    }

    .floating a {
        color: #fda085;
        font-size: 2rem;
        text-decoration: none;
    }

    @media (max-width: 768px) {
        .product-container {
            flex-direction: column;
        }

        .product-images {
            margin-right: 0;
            margin-bottom: 20px;
        }

        .buttons {
            flex-direction: column;
        }

        .buttons button {
            margin: 10px 0;
        }
    }

    body {
        background: #ffffff;
        color: #000000;
        font-family: "Do Hyeon", sans-serif; 
        font-size: 16px;
        font-weight: 300;
        letter-spacing: 0.01em;
        line-height: 1.6em;
        margin: 0;
        padding: 100px;
    }

    h1 {
        font-size: 40px;
        line-height: 0.8em;
        color: rgba(0, 0, 0, 0.2);
    }

    button:focus,
    input:focus,
    textarea:focus,
    select:focus {
        outline: none;
    }

    .tabs {
        display: flex;
        margin: 0;
        overflow: hidden;
        text-align: center;
    }

    .tabs [class^="tab"] label,
    .tabs [class*=" tab"] label {
        color: #000000;
        cursor: pointer;
        display: block;
        font-size: 1.1em;
        font-weight: 300;
        line-height: 1em;
        padding: 2rem 0;
        text-align: center;
        width: 33.33%;
    }

    .tabs [class^="tab"] [type="radio"],
    .tabs [class*=" tab"] [type="radio"] {
        border-bottom: 5px solid rgba(239, 237, 239, 0.5); 
        cursor: pointer;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        display: block;
        width: 100%;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }

    .tabs [class^="tab"] [type="radio"]:hover, 
    .tabs [class^="tab"] [type="radio"]:focus,
    .tabs [class*=" tab"] [type="radio"]:hover,
    .tabs [class*=" tab"] [type="radio"]:focus {
        border-bottom: 5px solid #f6d365; 
    }

    .tabs [class^="tab"] [type="radio"]:checked,
    .tabs [class*=" tab"] [type="radio"]:checked {
        border-bottom: 5px solid #fda085;
    }

    .tabs [class^="tab"] [type="radio"]:checked + div,
    .tabs [class*=" tab"] [type="radio"]:checked + div {
        opacity: 1;
    }

    .tabs [class^="tab"] [type="radio"] + div,
    .tabs [class*=" tab"] [type="radio"] + div {
        display: block;
        opacity: 0;
        padding: 2rem 0;
        width: 300%;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }

    .tabs .tab-menu {
        width: 33.33%;
    }

    .tabs .tab-menu[type="radio"] + div {
        width: 300%;
        margin-left: 300%;
    }

    .tabs .tab-menu [type="radio"]:checked + div {
        margin-left: 0;
    }

    .tabs .tab-menu:nth-child(2) [type="radio"]:checked + div {
        margin-left: -100%;
    }

    .tabs .tab-menu:last-child [type="radio"]:checked + div {
        margin-left: -200%;
    }
    
   
* { font-family: 'Jua', sans-serif; }
 a {text-decoration: none !important}

#review_title {
    font-size: 30px;
}

#review_list {
    width: 1000px;
    margin: 0 auto;
    text-align: center;
    margin-top: 40px;
    margin-bottom: 50px;
}

.board {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    font-size: 17px;
}

.board th, .board td {
    border: 1px solid #dee2e6;
    padding: 12px;
    text-align: center;
}

.board th {
    background-color: #ffc107;
    color: white;
    font-weight: bold;
}

.board tr:nth-child(even) {
    background-color: #f2f2f2;
}

.board tr:hover {
    background-color: #e9ecef;
}

.subject {
    text-align: left;
    padding: 5px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

#review_list a:hover {
    text-decoration: none;
    color: blue;
    font-weight: bold;
}

.subject_hidden {    
    color: black;
    font-size: 14px;
   
}

#page_list {
    font-size: 1.5em;
    margin: 10px;
}

</style>  
</head>
<body>

<%
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
            <div class="buttons">
                <button type="button" class="uni-btn btn-buy"><span>구매하기</span></button>
               
               <%-- 폼태그 추가 --%>
                <form  action="<%=request.getContextPath()%>/index.jsp?workgroup=cart&work=addtocart2" method="post">   
                	<button type="submit" class="uni-btn btn-basket"><span>장바구니</span></button>
               	 	<input type="hidden" name="prodNo" value="<%= prodNo %>">
         		 	<input type="hidden" id="finalQuantity" name="finalQuantity" value=""> <!-- /index.jsp?workgroup=cart&work=addtocart"2 --> 
               <!--	 <input type="hidden" id="prodAmount" name="prodAmount" value="<%= prodAmount %>"> --> <!-- /index.jsp?workgroup=cart&work=addtocart" -->
                 
             	</form> 
             	
             	
            </div>
        </div>
        <div class="floating">
            <a href="#top"><i class="fa fa-arrow-circle-up"></i></a>
        </div>
    </div>
    <br>
    <br>
    <div class="tabs">
        <div class="tab-menu">
            <label for="tab3-1">상품 정보</label>
            <input id="tab3-1" name="tabs-three" type="radio" checked="checked">
            <div>
                <h4></h4>
               
            </div>
        </div>
        <div class="tab-menu">
            <label for="tab3-2">Q & A</label>
            <input id="tab3-2" name="tabs-three" type="radio">
            <div>
                <h4>Q & A</h4>
                <p>내용</p>
            </div>
        </div>
        <div class="tab-menu">
            <label for="tab3-3">리뷰</label>
            <input id="tab3-3" name="tabs-three" type="radio">
            <div>
            	<h4>리뷰</h4>                                          
               
	<div id="review_list">
    <div id="review_title">Product Review (<%= totalReview %>)</div>
    
    <div style="text-align: right; font-size: 19px;">
        게시글 :
        <select id="pageSize">
            <option value="10" <% if (pageSize == 10) { %> selected <% } %>>&nbsp;10개&nbsp;</option>
            <option value="20" <% if (pageSize == 20) { %> selected <% } %>>&nbsp;20개&nbsp;</option>
            <option value="50" <% if (pageSize == 50) { %> selected <% } %>>&nbsp;50개&nbsp;</option>
            <option value="100" <% if (pageSize == 100) { %> selected <% } %>>&nbsp;100개&nbsp;</option>
        </select>
        &nbsp;&nbsp;&nbsp;
      
    </div>

    <table class="board">
        <thead>
            <tr>
                <th width="100">글번호</th>
                <th width="500">제목</th>
                <th width="100">작성자</th>
                <th width="200">작성일</th>
            </tr>
        </thead>

        <% if (totalReview == 0) { %>
            <tr>
                <td colspan="4">작성된 게시글이 없습니다.</td>
            </tr>
        <% } else { %>
            <% for (ReviewDTO review : reviewList) { %>
                <tr>
                    <td><%= displayNum %></td>
                    <% displayNum--; %>
                    <td class="subject">
                        <%
                        String currentUrl = request.getRequestURI();
                        String queryString = request.getQueryString();
                        String returnUrl = currentUrl + (queryString != null ? "?" + queryString : "");

                        String url = request.getContextPath() + "/index.jsp?workgroup=review&work=review_detail"
                            + "&reviewNo=" + review.getReviewNo()
                            + "&pageNum=" + pageNum
                            + "&pageSize=" + pageSize
                            + "&returnUrl=" + URLEncoder.encode(returnUrl, "UTF-8");
                        %>
                        <% if (review.getReviewStatus() == 1) { %>
                            <a href="<%= url %>"><%= review.getReviewTitle() %></a>
                        <% } else if (review.getReviewStatus() == 0) { %>
                            <span class="subject_hidden">
                                게시글 작성자 또는 관리자에 의해 삭제된 게시글입니다.
                            </span>
                        <% } %>
                    </td>

                    <% if (review.getReviewStatus() != 0) { %>
                        <td><%= review.getUsersName() %></td>
                        <td>
                            <% if (currentDate.equals(review.getReviewDate().substring(0, 10))) { %>
                                <%= review.getReviewDate().substring(11) %>
                            <% } else { %>
                                <%= review.getReviewDate() %>
                            <% } %>
                        </td>
                    <% } else { %>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>                     
                    <% } %>
                </tr>
            <% } %>
        <% } %>
    </table>

    <% // 페이지 번호 출력 
        int blockSize = 5; // 페이지 블럭 크기
        int startPage = (pageNum - 1) / blockSize * blockSize + 1; // 시작 페이지 번호
        int endPage = startPage + blockSize - 1; // 종료 페이지 번호

        if (endPage > totalPage) {
            endPage = totalPage;
        }

        String myUrl = request.getContextPath() + "/index.jsp?workgroup=review&work=review"
                + "&pageSize=" + pageSize;
    %>

    <div id="page_list">
        <% if (startPage > blockSize) { %>
            <a href="<%= myUrl %>&pageNum=<%= startPage - blockSize %>">[이전]</a>
        <% } else { %>
            [이전]
        <% } %>

        <% for (int i = startPage; i <= endPage; i++) { %>
            <% if (pageNum != i) { %>
                <a href="<%= myUrl %>&pageNum=<%= i %>">[<%= i %>]</a>
            <% } else { %>
                [<%= i %>]
            <% } %>
        <% } %>

        <% if (endPage != totalPage) { %>
            <a href="<%= myUrl %>&pageNum=<%= startPage + blockSize %>">[다음]</a>
        <% } else { %>
            [다음]
        <% } %>
    </div>
</div>


               
            </div>
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
                //추가) 최종수량 저장
                finalQuantity = newQuantity;
               
                var productPrice = <%= productPrice %>;
                var totalPriceElement = document.querySelector('.total-price .price');
                totalPriceElement.textContent = (newQuantity * productPrice).toLocaleString('ko-KR') + '원';
           		//추가) 최종수량
                document.getElementById('finalQuantity').value = finalQuantity;
            }
        }
        
        document.getElementById("pageSize").addEventListener("change", function() {
            location.href = "<%= request.getContextPath() %>/index.jsp?workgroup=review&work=review"
                + "&pageNum=<%= pageNum %>&pageSize=" + this.value;
        });
    </script>
</main>
</body>
</html>