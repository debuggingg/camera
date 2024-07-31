<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<div id="img-box">
	<div id="img-slider">
		<div class="img-slide">
			<img src="img/main1.png" alt="">
		</div>
		<div class="img-slide">
			<img src="img/main2.png" alt="">
		</div>
		<div class="img-slide">
			<img src="img/main3.png" alt="">
		</div>
	</div>
</div>


<div class="productmain">
	<div id="pdbox">
		<div id="product">
			<div id="product-title">
				<div id="title-box">
					<h1>New Film Camera</h1>
					<p>새롭게 입고된 상품들을 만나보세요</p>
				</div>
			</div>
			<div id="product-box">
				<div id="productimg">
					<div id="productimglist1">
						<img src="img/camera3.png" alt="" width="280px">
					</div>
				</div>
				<div id="textbox">
					<h1>키디캡쳐 필름 카메라</h1>
					<P>₩700,000</P>
				</div>
				<div id="add-box">
					<h1>
						<a href="index.jsp?workgroup=product&work=camera_list">More +</a>
					</h1>
				</div>
			</div>
			<div id="product-box">
				<div id="productimg">
					<div id="productimglist2">
						<img src="img/camera1.png" alt="" width="330px">
					</div>
				</div>
				<div id="textbox">
					<h1>롱위캔드 필름 카메라</h1>
					<P>₩500,000</P>

				</div>
				<div id="add-box">
					<h1>
						<a href="index.jsp?workgroup=product&work=camera_list">More +</a>
					</h1>
				</div>
			</div>
			<div id="product-box">
				<div id="productimg">
					<div id="productimglist3">
						<img src="img/camera4.png" alt="" width="330px">
					</div>
				</div>
				<div id="textbox">
					<h1>아그파 필름 카메라</h1>
					<P>₩800,000</P>
				</div>
				<div id="add-box">
					<h1>
						<a href="index.jsp?workgroup=product&work=camera_list">More +</a>
					</h1>
				</div>
			</div>
			<div id="product-box">
				<div id="productimg">
					<div id="productimglist4">
						<img src="img/productimg4.png" alt="" width="277px">
					</div>
				</div>
				<div id="textbox">
					<h1>하이라라 필름 카메라</h1>
					<P>₩400,000</P>
				</div>
				<div id="add-box">
					<h1>
						<a href="index.jsp?workgroup=product&work=camera_list">More +</a>
					</h1>
				</div>
			</div>
		</div>


		<div id="product1">
			<div id="product-title">
				<div id="title-box">
					<h1>New Film</h1>
					<p>새롭게 입고된 상품들을 만나보세요</p>
				</div>
			</div>
			<div id="product-box">
				<div id="productimg">
					<div id="flimimglist1">
						<img src="img/flimimg1.png" alt="" width="417px">
					</div>
				</div>
				<div id="textbox">
					<h1>Film11</h1>
					<P>₩16,000</P>
				</div>
				<div id="add-box">
					<h1>
						<a href="index.jsp?workgroup=product&work=film_list">More +</a>
					</h1>
				</div>
			</div>
			<div id="product-box">
				<div id="productimg">
					<div id="flimimglist2">
						<img src="img/film2.png" alt="" width="340px">
					</div>
				</div>
				<div id="textbox">
					<h1>Film2</h1>
					<P>₩15,000</P>

				</div>
				<div id="add-box">
					<h1>
						<a href="index.jsp?workgroup=product&work=film_list">More +</a>
					</h1>
				</div>
			</div>
			<div id="product-box">
				<div id="productimg">
					<div id="flimimglist3">
						<img src="img/film6.png" alt="" width="340px">
					</div>
				</div>
				<div id="textbox">
					<h1>Film6</h1>
					<P>₩13,000</P>
				</div>
				<div id="add-box">
					<h1>
						<a href="index.jsp?workgroup=product&work=film_list">More +</a>
					</h1>
				</div>
			</div>
			<div id="product-box">
				<div id="productimg">
					<div id="flimimglist4">
						<img src="img/film9.png" alt="" width="340px">
					</div>
				</div>
				<div id="textbox">
					<h1>Film9</h1>
					<P>₩12,000</P>
				</div>
				<div id="add-box">
					<h1>
						<a href="index.jsp?workgroup=product&work=film_list">More +</a>
					</h1>
				</div>
			</div>
		</div>

	</div>

	

	<div class="lastbox">
		<div id="font-box">
			<div id="font-box-wrap">
				<h1>새로운 상품들을 만나보세요!</h1>
				<p>우리 매장만의 유니크하고 다양한 상품들을 만나볼 수 있습니다.</p>
				<a href="index.jsp?workgroup=product&work=camera_list" id="good"> Go Products</a>
			</div>
		</div>
	</div>
	


</div>



<script>
	$(document).ready(
			function() {
				var slideIndex = 0;
				var slideWidth = $('.img-slide').width();
				var slideCount = $('.img-slide').length;

				function slideRight() {
					slideIndex = (slideIndex + 1) % slideCount;
					var slidePosition = -slideIndex * slideWidth;
					$('#img-slider').css('transform',
							'translateX(' + slidePosition + 'px)');
				}

				setInterval(slideRight, 3000);
			});
</script>