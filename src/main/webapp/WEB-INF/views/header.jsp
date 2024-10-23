<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Fonts에서 Gowun Batang 폰트 불러오기 -->
<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
   rel="stylesheet">

<!-- Google Font -->
<script type="text/javascript" src="/resources/js/category.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Css Styles -->
<link rel="stylesheet" href="/resources/template/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/template/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/template/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/template/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/template/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/resources/template/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet"
	href="/resources/template/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/template/css/style.css"
	type="text/css">
<link rel="stylesheet" href="/resources/template/css/style.css"
	type="text/css">

<script>
$(function(){
	
	let userId = '${sessionScope.loginMember.userId}' 
	
	if(userId){
		var heartCount = 0;
		$.ajax({
	        url: '/admin/zzimCount',
	        type: 'POST',
	        data: { userId: userId },
	        success: function(data) {
	        	 console.log(data);
	        	heartCount = data;
	        	// 클릭된 div 내의 img 태그의 src 속성 변경
		        $('#heartCount').text(heartCount);
	        	
	        },
	        error: function(error) {
	            console.log("heartCount 불러오지못함");
	        }
	    });
	} else {
		$('#heartCount').text(0);
	}
	
});


</script>


<style>



* {
   font-family: "Gowun Batang", serif;
   font-weight: 550;
   font-style: normal;
}

</style>
<script type="text/javascript">
$(function(){
	$('#low_class').next().hide();
	$('.showInfo').show();
	$('.hideInfo').hide();
	
})
function showHide(){
	$('.myInfo').toggle('myInfoHide');
	$('.showInfo').toggle();
	$('.hideInfo').toggle();
}


</script>



</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img
				src="${pageContext.request.contextPath}/resources/images/TKlogo.png"
				alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<!-- <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li> -->
			</ul>
			<div class="header__cart__price">
				item: <span>$150.00</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">
				<img
					src="${pageContext.request.contextPath}/resources/template/img/language.png"
					alt="">
				<div>English</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="#">Spanish</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu" >
			<ul>
				<li class="active"><a href="./index.html">Home</a></li>
				<li><a href="./shop-grid.html">Shop</a></li>
				<li><a href="#">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shopping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="./blog.html">Blog</a></li>
				<li><a href="./contact.html">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
				<li>Free Shipping for all Order of $99</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="/"><img
							src="/resources/images/TKlogo.png"
							alt="" style="width: 60px; height: 80px;"></a>
							<span style="font-weight: 700; font-size: 25px; padding: 5px; cursor:pointer;" onclick="location.href='/'">   떡잎 서점</span>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu" style="margin-left: 80px;">
						<ul>
							<li class="active"><a href="/">Home</a></li>
							
							<li><a href="/member/myPage">myPages</a>
								<ul class="header__menu__dropdown">
									<li><a href="./shop-details.html">Shop Details</a></li>
									<li><a href="./shoping-cart.html">Shopping Cart</a></li>
									<li><a href="./checkout.html">Check Out</a></li>
									<li><a href="./blog-details.html">Blog Details</a></li>
								</ul></li>
								<li><a href="/qa/qaList">Q&A</a></li>
							
							<c:if test="${sessionScope.loginMember == null }">
								<li><a href="/member/register">Sign up</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul style="margin-right: -26px;">
							<!-- 마이페이지 이동 -->
							<li><a
								href="${pageContext.request.contextPath}/member/myPage"><i
									class="fa fa-user"></i></a></li>

							<!-- 관리자페이지이동 -->
							<c:if test="${sessionScope.loginMember.userId == 'admin'}">
								<li><a href="${pageContext.request.contextPath}/admin/home"><i
										class="fa fa-user-secret"></i></a></li>
							</c:if>

              <li><a href="/member/myPage"><i class="fa fa-heart"></i> <span id="heartCount"></span></a></li>
							<li><a href="/cart/cartPage"><i class="fa fa-shopping-bag"></i>
								<c:if test="${sessionScope.CartCnt > 0}">
            						<span>${sessionScope.CartCnt}</span>
        						</c:if>
							</li>
							<li><a href="/qa/qaList"><i class="fa fa-question-circle"></i></a></li>
							<c:if test="${sessionScope.loginMember == null}">
								<li><a
									href="${pageContext.request.contextPath}/member/loginPage"><button class="site-btn">로그인</button></a></li>
							</c:if>
							<c:if test="${sessionScope.loginMember != null}">
								<li><a
									href="${pageContext.request.contextPath}/member/logout"><button class="site-btn">로그아웃</button></a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>메뉴</span>
						</div>
						<ul id="categoryList" style="display: none">
							<c:if test="${loginMember != null}">
								<li><a href="/member/myPage">마이페이지</a></li>
							</c:if>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Fruit & Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Fruit & Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Fruit & Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									검색 조건 <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="검색어를 입력하세요.">
								<button type="submit" class="site-btn">검색</button>
							</form>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	
</body>


</html>
