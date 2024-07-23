<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 목록</title>
    <link rel="stylesheet" href="style_list_1_camera.css">
    <script src="https://kit.fontawesome.com/47ee32fc29.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap" rel="stylesheet">
    <style type="text/css">
    body {
    font-family: 'Do Hyeon', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.do-hyeon-regular {
    font-family: "Do Hyeon", sans-serif;
    font-weight: 400;
    font-style: normal;
}

main {
    padding: 20px;
}

.product-list {
    max-width: 1200px;
    margin: 0 auto;
}

.product-list h2 {
    text-align: center;
    margin-bottom: 20px;
}

.products {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.product {
    background-color: white;
    border: 1px solid #ddd;
    padding: 20px;
    width: calc(25% - 20px); 
    box-sizing: border-box;
    text-align: center;
    position: relative;
}

.product a {
    text-decoration: none;
    color: inherit;
}

.product img {
    width: 100%;
    max-width: 100%;
    height: auto;
    transition: transform 0.3s ease; 
}

.product img:hover {
    transform: scale(1.1);  
}

.product h3 {
    margin: 10px 0;
    font-size: 18px;
    transition: color 0.3s;
}

.product h3:hover {
    color: #0a56a9;
}

.product .price {
    color: #000000;
    font-size: 20px;
    margin: 10px 0;
}

.product .filter {
    position: absolute;
    top: -30px; 
    left: 0;
    right: 0;
    text-align: center;
    background: rgba(255, 255, 255, 0); 
    padding: 5px 0;
}

.product .filter a {
    color: #333;
    margin: 0 10px;
    text-decoration: none;
    font-size: 14px;
}

.pagination {
    display: flex;
    justify-content: center;
    margin-top: 1rem;
    font-family: 'Do Hyeon', sans-serif;
}

.pagination a {
    color: #333;
    padding: 0.5rem 1rem;
    text-decoration: none;
    border: 1px solid #ddd;
    margin: 0 0.2rem;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.pagination a.active,
.pagination a:hover {
    background: #f6d365; 
    color: #333;
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


.buttons {
    display: flex;
    justify-content: space-between;
}

.custom-btn {
    width: 100px;
    height: 40px;
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
    font-size: 14px; 
    line-height: 40px; 
    text-align: center; 
}

.btn-basket {
    background: linear-gradient(0deg, #f6d365 0%, #fda085 100%);
    line-height: 40px;
    padding: 0;
    border: none;
}
.btn-basket span {
    position: relative;
    display: block;
    width: 100%;
    height: 100%;
    text-align: center;
    line-height: 40px; 
}
.btn-basket:before,
.btn-basket:after {
    position: absolute;
    content: "";
    right: 0;
    bottom: 0;
    background:  #fda085;
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
    color: #fda085;
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
    background: #fda085;
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

.btn-buy {
    background: linear-gradient(0deg, #f6d365 0%, #fda085 100%);
    line-height: 40px; 
    padding: 0;
    border: none;
}
.btn-buy span {
    position: relative;
    display: block;
    width: 100%;
    height: 100%;
    text-align: center;
    line-height: 40px; 
}
.btn-buy:before,
.btn-buy:after {
    position: absolute;
    content: "";
    right: 0;
    bottom: 0;
    background:  #fda085;
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
    color: #fda085;
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
    background: #fda085;
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





@media (max-width: 1024px) {
    .product {
        width: calc(33.33% - 20px); 
    }
}

@media (max-width: 768px) {
    .products {
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .product {
        width: calc(50% - 20px); 
    }
}

@media (max-width: 480px) {
    header {
        padding: 10px 0;
    }

    footer {
        padding: 10px 0;
    }

    nav ul li {
        margin: 5px 0;
    }

    .product {
        width: 100%;
        margin-bottom: 15px;
    }

    .product-list h2 {
        font-size: 20px;
    }

    .product h3 {
        font-size: 16px;
    }

    .product .price {
        font-size: 18px;
    }

    .product button {
        font-size: 14px;
        padding: 8px 10px;
    }
}
    
    </style>
</head>
<body>
<%-- <form id="join" action="<%=request.getContextPath() %>/index.jsp?workgroup=member&work=member_join_action" method="post"> --%>
    <header>
    </header>
    <main>
        <section class="product-list">
            <h2>Camera</h2>
            <div class="products">
                <div class="product">
                    <a href="#"><img src="images/camera1.png" alt="카메라 1"></a>
                    <a href="#"><h3>camera 1</h3></a>
                    <p class="price">₩500,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="detail_page.html"><img src="images/camera2.png" alt="카메라 2"></a>
                    <a href="#"><h3>camera 2</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera3.png" alt="카메라 3"></a>
                    <a href="#"><h3>camera 3</h3></a>
                    <p class="price">₩200,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product" id="product-with-filter">
                    <a href="#"><img src="images/camera4.png" alt="카메라 4"></a>
                    <div class="filter">
                        <a href="#">신상품</a> | 
                        <a href="#">낮은가격</a> | 
                        <a href="#">높은가격</a>
                    </div>
                    <a href="#"><h3>카메라 4</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera5.png" alt="카메라 5"></a>
                    <a href="#"><h3>카메라 5</h3></a>
                    <p class="price">₩100,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera6.png" alt="카메라 6"></a>
                    <a href="#"><h3>camera 6</h3></a>
                    <p class="price">₩400,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera7.png" alt="카메라 7"></a>
                    <a href="#"><h3>camera 7</h3></a>
                    <p class="price">₩700,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera8.png" alt="카메라 8"></a>
                    <a href="#"><h3>camera 8</h3></a>
                    <p class="price">₩100,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera9.png" alt="카메라 9"></a>
                    <a href="#"><h3>camera 9</h3></a>
                    <p class="price">₩900,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera10.png" alt="카메라 10"></a>
                    <a href="#"><h3>camera 10</h3></a>
                    <p class="price">₩500,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera11.png" alt="카메라 11"></a>
                    <a href="#"><h3>camera 11</h3></a>
                    <p class="price">₩300,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera12.png" alt="카메라 12"></a>
                    <a href="#"><h3>camera 12</h3></a>
                    <p class="price">₩800,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera13.png" alt="카메라 13"></a>
                    <a href="#"><h3>camera 13</h3></a>
                    <p class="price">₩200,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera14.png" alt="카메라 14"></a>
                    <a href="#"><h3>camera 14</h3></a>
                    <p class="price">₩200,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera15.png" alt="카메라 15"></a>
                    <a href="#"><h3>camera 15</h3></a>
                    <p class="price">₩700,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera16.png" alt="카메라 16"></a>
                    <a href="#"><h3>카메라 16</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera17.png" alt="카메라 17"></a>
                    <a href="#"><h3>camera 17</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera18.png" alt="카메라 18"></a>
                    <a href="#"><h3>camera 18</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera19.png" alt="카메라 19"></a>
                    <a href="#"><h3>camera 19</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera20.png" alt="카메라 20"></a>
                    <a href="#"><h3>camera 20</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera21.png" alt="카메라 21"></a>
                    <a href="#"><h3>카메라 21</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera22.png" alt="카메라 22"></a>
                    <a href="#"><h3>camera 22</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera23.png" alt="카메라 23"></a>
                    <a href="#"><h3>camera 23</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-buy"><span>바로구매</span></button>
                </div>
                <div class="product">
                    <a href="#"><img src="images/camera24.png" alt="카메라 24"></a>
                    <a href="#"><h3>camera 24</h3></a>
                    <p class="price">₩600,000</p>
                    <button type="button" class="custom-btn btn-basket"><span>장바구니</span></button>
                    <button type="button" class="custom-btn btn-7"><span>바로구매</span></button>
                </div>
            </div>
            <br>
            <br>
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">&raquo;</a>
            </div>
            <div class="floating">
                <a href="#top"><i class="fa fa-arrow-circle-up"></i></a>
            </div>
        </section>
        <script>
        /*
        document.addEventListener("DOMContentLoaded", function() {
            const productsPerPage = 8;
            let currentPage = 1;
            let products = Array.from(document.querySelectorAll('.product'));
            const pagination = document.querySelector('.pagination');
            const filterLinks = document.querySelectorAll('.filter a');

            function showPage(page) {
                currentPage = page;
                const start = (page - 1) * productsPerPage;
                const end = start + productsPerPage;

                products.forEach((product, index) => {
                    if (index >= start && index < end) {
                        product.style.display = 'block';
                    } else {
                        product.style.display = 'none';
                    }
                });

                updatePagination();
            }

            function updatePagination() {
                pagination.innerHTML = '<a href="#">&laquo;</a>';
                const totalPages = Math.ceil(products.length / productsPerPage);

                for (let i = 1; i <= totalPages; i++) {
                    pagination.innerHTML += `<a href="#" class="${i === currentPage ? 'active' : ''}">${i}</a>`;
                }

                pagination.innerHTML += '<a href="#">&raquo;</a>';
            }

            pagination.addEventListener('click', function(e) {
                if (e.target.tagName === 'A') {
                    e.preventDefault();
                    const page = e.target.textContent;
                    if (page === '«') {
                        if (currentPage > 1) showPage(currentPage - 1);
                    } else if (page === '»') {
                        const totalPages = Math.ceil(products.length / productsPerPage);
                        if (currentPage < totalPages) showPage(currentPage + 1);
                    } else {
                        showPage(Number(page));
                    }
                }
            });

            filterLinks.forEach(filter => {
                filter.addEventListener('click', function(e) {
                    e.preventDefault();
                    const criteria = e.target.textContent;
                    let sortedProducts = [...products];

                    if (criteria === '신상품') {
                        sortedProducts = sortedProducts.reverse();
                    } else if (criteria === '낮은가격') {
                        sortedProducts.sort((a, b) => {
                            const priceA = parseInt(a.querySelector('.price').textContent.replace(/[₩,]/g, ''));
                            const priceB = parseInt(b.querySelector('.price').textContent.replace(/[₩,]/g, ''));
                            return priceA - priceB;
                        });
                    } else if (criteria === '높은가격') {
                        sortedProducts.sort((a, b) => {
                            const priceA = parseInt(a.querySelector('.price').textContent.replace(/[₩,]/g, ''));
                            const priceB = parseInt(b.querySelector('.price').textContent.replace(/[₩,]/g, ''));
                            return priceB - priceA;
                        });
                    }

                    const productContainer = document.querySelector('.products');
                    productContainer.innerHTML = '';
                    sortedProducts.forEach(product => {
                        productContainer.appendChild(product);
                    });

                    products = sortedProducts;
                    showPage(1);
                });
            });

            showPage(currentPage);
        });
        */
    </script>
    </main>
    <footer>
    </footer>
</body>
</html>
