<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- header, footer -->
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- header, footer -->

<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />


<!-- header, footer -->
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
	
<link
   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
   rel="stylesheet">
<!-- header, footer -->

<!-- header, footer -->
<script type="text/javascript" src="/resources/js/category.js"></script>
<!-- header, footer -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<title>주문/결제 페이지</title>
<style>
* {
   font-family: "Gowun Batang", serif;
   font-weight: 600;
   font-style: normal;
}

body {

	margin: 0;
	padding: 20px;
}

.paymentContainer {
	width: 1180px;
	margin: 0 auto;
	padding-left: 25px;
	display: flex;
	justify-content: space-between;
	gap: 20px;
}

/* 왼쪽 섹션 스타일 */
.left-section {
	width: 70%;
}

.section {
	background: #fff;
	padding: 20px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.section-title {
	font-weight: bold;
	margin-bottom: 10px;
	font-size: 18px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}

.address-info, .order-info, .point-info, .payment-method {
	margin-bottom: 20px;
}

.address-info div, .point-info div {
	display: inline-block;
}

.address-info .button-change {
	display: inline-block;
	border: none;
	margin-left: 15px;
	padding: 5px 10px;
	background: #7fad39;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

.button-change:hover{
	background: #719932;
}

.address-request select {
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.order-info {
	display: flex;
	gap: 10px;
	align-items: center;
	border-bottom: 1px solid #ddd; 
}

.order-info img {
	width: 100px;
	height: 140px;
	object-fit: cover;
	margin-bottom: 10px;
}

.order-info-details {
	
	flex: 1;
}

.price-details {
	text-align: right;
}

.point-info {
	display: flex;
	align-items: center;
}

.point-info div {
	margin-right: 10px;
}

.point-info input {
	border: 1px solid #ddd;
	padding: 5px;
	width: 100px;
	margin-right: 10px;
	border-radius: 4px;
	text-align: right;
}

.point-info button {
	padding: 8px 15px;
	border: none;
	background: #7fad39;;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

.point-info button:hover {
	background: #719932;
}

.payment-method {
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 8px;

}

.payment-method label {
	margin-left: 10px;
	font-size: 16px;
}

/* 오른쪽 섹션 스타일 */
.right-section {
	width: 30%;
	height: fit-content;
	background: #fff;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	position: sticky;
	top: 20px;
}

.right-section .summary-title {
	font-weight: bold;
	font-size: 18px;
	margin-bottom: 20px;
}

.summary-details p {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
}

.total-price {
	font-weight: bold;
	font-size: 22px;
}

.btn-submit {
	width: 100%;
	padding: 15px;
	background: #7fad39;;
	color: #fff;
	border: none;
	border-radius: 8px;
	font-size: 18px;
	cursor: pointer;
}

.btn-submit:hover {
	background: #719932;
}
.arrivalDate {
	text-align: right;
	padding-left: 20px;
	flex: 1;
}


/* 툴팁 */
.questionTooltip {
	position: relative;
	display: inline-block;
	cursor: pointer;
}

.questionTooltip .tooltiptext {
	width: 170px;
	background-color: #BDBDBD;
	color: #fff;
	text-align: left;
	border-radius: 6px;
	padding: 10px;
	position: absolute;
	z-index: 1;
	opacity: 0;
	margin-left: 10px;
	transition: opacity 1s;
	font-size: 0.5em;
    }

.questionTooltip:hover .tooltiptext {
	opacity: 1;
}
    
.deliveryContainer {
	display: flex;
}
span.help-icon {
    font-size: 14px;
    line-height: 1.9;
    padding-left: 5px;
}

.nearby-icon {
	color: #7FAD39;
	font-size: 20px;
	vertical-align: middle;
	

}

/* The Modal (background) */
.addressModal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.6); /* 반투명 검은색 배경 */
}

/* Modal Content/Box */
.addressModal-content {
    background-color: #ffffff;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #4CAF50;
    width: 50%; /* 모달 크기 고정 */
    max-width: 600px; /* 최대 너비 */
    min-width: 300px; /* 최소 너비 */
    height: auto;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    font-family: 'Noto Sans KR', Arial, sans-serif;
    color: #333;
    font-size: 14px; /* 기본 글자 크기 줄임 */
}

/* The Close Button */
span.addressModalClose {
    color: #aaa;
    float: right;
    font-size: 24px; /* 닫기 버튼 크기 조금 줄임 */
    font-weight: bold;

}

.addressModalClose:hover, .addressModalClose:focus {
    color: #4CAF50;
    text-decoration: none;
    cursor: pointer;
}

#list table {
    width: 100%;
    border-collapse: collapse;
}

#list th, #list td {
    border: 1px solid #cccccc;
    padding: 8px;
    text-align: left;
    font-size: 13px; 
}

#list th {
    background-color: #f4f4f4;
    font-weight: bold;
}

#list td {
    font-size: 13px; /* 리스트 내부 텍스트 크기 */
}

</style>
</head>
<body>

<!-- header -->
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
<!-- header -->



	<div class="paymentContainer">
		<!-- 왼쪽 섹션 -->
		<div class="left-section">
			<!-- 배송지 정보 섹션 -->
			<div class="section">
				<div class="section-title">배송지 정보</div>
				<div class="address-info">
					<div>
						<span class="material-symbols-outlined nearby-icon">explore_nearby</span> <span id="addressKey">${orderInfo.defaultAddress.address_key}</span><br> <span id="receiverName">받는 사람 : ${orderInfo.defaultAddress.receiver_name}</span><br>
						<span id="deliveryAddress">${orderInfo.defaultAddress.address}</span>
					</div>
					<button class="button-change" onclick="addressChange();">변경</button>
				</div>
				<div class="address-request">
					<label for="deliveryRequest">배송요청사항:</label>
					 
					
					<select id="deliveryRequest">
						<c:forEach var="request" items="${orderInfo.address}">
							<c:if test="${request.isDefault =='Y'}">
								<option>${request.request}</option>
							</c:if>
						</c:forEach>
						<c:forEach var="request" items="${orderInfo.address}">
							<c:if test="${request.isDefault != 'Y'}">
								<option>${request.request}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>

			<!-- 주문상품 정보 섹션 -->
			<div class="section">
				<div class="section-title">주문상품</div>
				<c:forEach var="index" begin="0" end="${fn:length(orderInfo.thumbNail) - 1 }">
				<div class="order-info">
					<img src="${orderInfo.thumbNail[index]}" alt="책 이미지">
					<div class="order-info-details">
						<span>${orderInfo.title[index]}</span>
						<p>
						
						<span>수량:  </span><span>${orderInfo.cartQty[index]}</span>
						</p>
					</div>
					
					<div class="price-details">
						<p>
    						<span>상품 금액:  </span>
    						<span class="price">${orderInfo.price[index]}</span>
						</p>
						<p>
    						<span>상품 할인:  </span>
    						<span class="discount">${orderInfo.salePrice[index]}</span>
						</p>

					</div>
				</div>
				</c:forEach>
				<div class="deliveryContainer">
					<span class="delivery">배송 예정일</span>
					<span class="questionTooltip"><span class="material-symbols-outlined help-icon">help</span><span class="tooltiptext">
배송 예정일이란?<br><br>
주문상품의 결제(입금)가 확인 된 날 기준으로 상품을 준비/포장하여 물류센터에서 택배사로 전달하는 예상 일정입니다.</span></span>
					<span class="arrivalDate">${orderInfo.arrivalDate} - 도착예정</span>
				</div>
			</div>

			<!-- 포인트 정보 섹션 -->
			<div class="section">
				<div class="section-title">포인트</div>
				<div class="point-info">
					<div>
						보유 포인트: <strong class="price" id="userPoint" >${orderInfo.userPoint}</strong>
					</div>
					<input type="text"  id="userPointInput" value="0" /> 원
					<button id="useAllPoints">전액사용</button>
				</div>
			</div>

			<!-- 결제수단 정보 섹션 -->
			<div class="section">
				<div class="section-title">결제수단</div>
				<div class="payment-method">
					<p>
						<input type="radio" id="creditCard" name="paymentMethod" checked>
						<label for="creditCard">신용카드</label>
					</p>
					<p>
						<input type="radio" id="cash" name="paymentMethod" >
						<label for="cash">현금 직접 결제</label>
					</p>
				</div>
			</div>
		</div>

		<!-- 오른쪽 섹션 -->
		<div class="right-section">
			<div class="summary-title">결제 요약</div>
			<div class="summary-details">
				<p>
					총 상품 금액 <span class="price">${orderInfo.totalPrice}</span>
				</p>
				<p>
					총 상품 할인 <span class="price">${orderInfo.totalSalePrice}</span>
				</p>
				<p>
					포인트 사용 <span class="discount usePoint">0</span>
				</p>
				<hr>
				<p class="total-price">
					최종 결제 금액 <span class="price" id="totalPay">${orderInfo.totalPay}</span>
				</p>
				<p>
					적립 예정 포인트 <span class="price">${orderInfo.totalPoint}</span>
				</p>
			</div>
			<button class="btn-submit" onclick="requestPayment();">결제하기</button>
		</div>
	</div>


<!-- footer -->
   <!-- Footer Section Begin -->
   <footer class="footer spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
               <div class="footer__about" style="width: 350px;">
                  <div class="header__logo">
                     <a href="/"><img src="/resources/images/TKlogo.png" alt=""
                        style="width: 60px; height: 80px;"></a> <span
                        style="font-weight: 700; font-size: 25px; padding: 5px; margin-left: 20px;">
                        떡잎 서점</span>
                  </div>
                  <ul>
                     <li>TK Library</li>
                     <li>Git: <span><a href="https://github.com/djadudwns12/TKLibraryStore.git" style="color:black;">github.com/djadudwns12/TKLibraryStore.git </a></span></li>
                     <li>Phone: 02-2675-1750</li>
                     
                  </ul>
               </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
               <div class="footer__widget">
                  <h6 style="margin-top:30px;">프로젝트 팀원</h6>
                  <ul>
                     <li class="liTeam">엄영준</li>
                     <li class="liTeam">이아림</li>
                     <li class="liTeam">박근영</li>
                     <li class="liTeam">최미설</li>
                     <li class="liTeam">한준형</li>
                     <li class="liTeam">김가윤</li>
                  </ul>
                  <ul>
                     <li class="liTeam">djadudwns12@naver.com</li>
                     <li class="liTeam">ahrimbau@gmail.com </li>
                     <li class="liTeam">pgyseven@naver.com</li>
                     <li class="liTeam">miseol93@naver.com</li>
                     <li class="liTeam">wnsgud6388@naver.com</li>
                     <li class="liTeam">kgykgy1123@naver.com</li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-4 col-md-12">
               <div class="footer__widget">
                  
                  <form action="#" style="margin-left: 50px; margin-top: 50px;">
                     <input type="text" placeholder="Enter your mail" >
                     <button type="submit" class="site-btn">Subscribe</button>
                  </form>
                  <div class="footer__widget__social" style="margin-left: 50px;">
                     <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                        class="fa fa-instagram"></i></a> <a href="#"><i
                        class="fa fa-twitter"></i></a> <a href="#"><i
                        class="fa fa-pinterest"></i></a>
                  </div>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-12">
               <div class="footer__copyright">
                  <div class="footer__copyright__text">
                     <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>
                           document.write(new Date().getFullYear());
                        </script>
                        All rights reserved | This template is made with <i
                           class="fa fa-heart" aria-hidden="true"></i> by <a
                           href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     </p>
                  </div>
                  <div class="footer__copyright__payment">
                     <img
                        src="${pageContext.request.contextPath}/resources/template/img/payment-item.png"
                        alt="">
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>
   <!-- Footer Section End -->
<!-- footer -->


	
							<!-- The Modal -->
						<div id="myModal" class="addressModal">
							<!-- Modal content -->
							<div class="addressModal-content">
								<span class="addressModalClose">&times;</span>
								<div id="list">
								
								 <table>
								<tr><th>배송지</th><th>받는 사람</th><th>전화 번호</th><th>주 소</th></tr>
	    						
	    						<c:forEach var="index" begin="0" end="${fn:length(orderInfo.address) - 1}">
	    						<tr onclick="selectAddress(this);">
	    							<td>${orderInfo.address[index].address_key}</td>
	    							<td>${orderInfo.address[index].receiver_name}</td>
	    							<td>${orderInfo.address[index].receiver_phone}</td>
   									<td>${orderInfo.address[index].address}</td>
   								</tr>
								</c:forEach>
	    												
								</div>
								<!-- Pagination Controls -->
								<div id="pagination" class="pagination">
									<!-- Pagination buttons will be added dynamically here -->
								</div>
							</div>
						</div>
						
	
	
<script>

let totalPay = null; //변경하지 않는 최종 결제 금액(포인트 차감에 사용)

let remainingPoint = null; // 결제 후 insert할 남은 포인트 금액

let finalInputPoint = null; // 결제 후 insert할 최종 사용 포인트

let totalAmount = null; // 포인트 차감후 실제 결제되는 결제 금액

<!-- header, footer -->
let userId = '${sessionScope.loginMember.userId}' 

function showHide(){
	   $('.myInfo').toggle('myInfoHide');
	   $('.showInfo').toggle();
	   $('.hideInfo').toggle();
	}
<!-- header, footer -->


$(function(){
	
	<!-- header, footer -->
	$('#low_class').next().hide();
	$('.showInfo').show();
	$('.hideInfo').hide();
	
	
		
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

	
	
	<!-- header, footer -->
	
	
	
	
	
	totalPay = Number($('#totalPay').text().replace(/[^0-9]/g, ''));
	totalAmount =Number($('#totalPay').text().replace(/[^0-9]/g, ''));
	
	$('.price').each(function(){ 
		
		let price = $(this).text();
		let intPrice = price.replace(/[^0-9]/g, '')
		let formattedPrice = new Intl.NumberFormat().format(intPrice); 
		$(this).text(formattedPrice + "원");
		
	});
	$('.discount').each(function(){ 
		
		let price = $(this).text();
		let intPrice = price.replace(/[^0-9]/g, '')
		let formattedPrice = new Intl.NumberFormat().format(intPrice); 
		$(this).text("-" + formattedPrice + "원");
		
	});
	
	$('#userPointInput').on('blur keydown', function() {
		if (event.type === 'blur' || (event.type === 'keydown' && (event.key === 'Enter' || event.keyCode === 13))) {
	  
			let myPoints = Number($('#userPoint').text().replace(/[^0-9]/g, ''));
		       
		       
			let inputValue = Number($(this).val().replace(/[^0-9]/g, ''));
	
			// 보유 포인트 초과
			if (inputValue > myPoints) {
				if(myPoints > totalPay){
					alert(`보유 포인트(\${myPoints}원)를 초과할 수 없으며 결제 금액을 넘을 수 없습니다!`);
					$(this).val(totalPay); 
					pointPayment(totalPay);
					deduct(totalPay);
				}else{
					alert(`보유 포인트(\${myPoints}원)를 초과할 수 없습니다!`);
					$(this).val(myPoints); 
					pointPayment(myPoints);
					deduct(myPoints);
				}
			} else if(totalPay < inputValue){
				if(totalPay < myPoints){
				alert(`결제 금액(\${totalPay}원)를 초과할 수 없습니다!`);
				$(this).val(totalPay); 
				pointPayment(totalPay);
				deduct(totalPay);
				}
				
			}else{
				$(this).val(inputValue); 
				pointPayment(inputValue);
				deduct(inputValue);
			}

			
			
		}
	});

	$('#useAllPoints').click(function() {
		let myPoints = Number($('#userPoint').text().replace(/[^0-9]/g, ''));
		if (myPoints < totalPay){
			$('#userPointInput').val(myPoints);
			pointPayment(myPoints);
			deduct(myPoints);
		}else{
			$('#userPointInput').val(totalPay);
			pointPayment(totalPay);
			deduct(totalPay);
			
		}
		
		
	});

	
	
	
});




function addressChange() {
	$("#myModal").css('display', 'block');
	
}

let modal = $('#myModal'); 
let span = $('.addressModalClose');    


span.on('click', function() {
  modal.hide(); 
});


$(window).on('click', function(event) {
  if ($(event.target).is(modal)) { 
    modal.hide(); 
  }
});


function selectAddress(trElement) {
    // 배열로 저장
    let values = $(trElement).find('td').map(function() {
        return $(this).text().trim(); 
    }).get();


    let addressKey = values[0];      // td 값
    let receiverName = values[1];   
    let receiverPhone = values[2];  
    let address = values[3];         

    
    $('#addressKey').text(addressKey);
    $('#receiverName').text(receiverName);
    $('#deliveryAddress').text(address);

    modal.hide();

}

function pointPayment(userPointInput) {
	let formattedPrice = new Intl.NumberFormat().format(userPointInput); 
	$('.usePoint').text("-" + formattedPrice + "원");
	
	
}

function deduct(userPointInput) {
	finalInputPoint = userPointInput; // 결제 정보에 insert 할때 보낼 차감에 사용된 최종 포인트
	let deductTotalPay = totalPay - userPointInput;
	
	let myPoints = Number($('#userPoint').text().replace(/[^0-9]/g, ''));
	
	remainingPoint = myPoints - userPointInput; // 결제후 member에서 update에 사용할 남은 포인트 
	
	console.log("최종 금액" + deductTotalPay);
	
	let formattedPrice = new Intl.NumberFormat().format(deductTotalPay); 
	$('#totalPay').text(formattedPrice);
	totalAmount = deductTotalPay;
	
}

// 서버에서 전달된 결제 정보를 받아옴


async function requestPayment() { 
	 const orderTitleList = [
	      <c:forEach var="title" items="${orderInfo.title}">
	         '${title}'<c:if test="${!status.last}">, </c:if>
	      </c:forEach>
	   ];
	 const cartIdList = [
	      <c:forEach var="cartId" items="${orderInfo.cartId}">
	         '${cartId}'<c:if test="${!status.last}">, </c:if>
	      </c:forEach>
	   ];
	 const address = $('#deliveryAddress').text();
	 const totalPoint = ${orderInfo.totalPoint}
	 const bookQty = [
	      <c:forEach var="bookQty" items="${orderInfo.cartQty}">
	         '${bookQty}'<c:if test="${!status.last}">, </c:if>
	      </c:forEach>
	   ];
	 
	console.log(orderTitleList);
	const paymentRequestData = {
		    storeId: "${orderInfo.storeId}",
		    channelKey: "${orderInfo.channelKey}",
		    paymentId: "${orderInfo.paymentId}",
		    totalAmount: totalAmount,
		    orderName: "${orderInfo.orderName}",
		    currency: "CURRENCY_KRW",
		    payMethod: "EASY_PAY"
		};

	console.log("진입확인"+ totalAmount);
	const response = await PortOne.requestPayment(paymentRequestData);
	console.log(response);
	
	  if (response.code != null) {
		    // 오류 발생
		    return alert(response.message);
		  }

		  // /payment/complete 엔드포인트를 구현해야 합니다. 다음 목차에서 설명합니다.
		  const notified = await fetch("/order/paymentInfo", {
		    method: "POST",
		    headers: { 
		    	"Content-Type": "application/json" 
		    	},
		    // paymentId와 주문 정보를 서버에 전달합니다
		    body: JSON.stringify({
		    	totalAmount: totalAmount,
		    	remainingPoint: remainingPoint,
		    	finalInputPoint: finalInputPoint,
    			paymentId: paymentRequestData.paymentId,
    			orderName: paymentRequestData.orderName,
    			titleName: orderTitleList,
    			cartId: cartIdList,
    			address: address,
    			totalPoint: totalPoint,
    			bookQty: bookQty
			})
		  });
		  if (notified.ok) {
				const redirectUrl =await notified.text();
		        window.location = redirectUrl;
		    } else {
		    	console.log(notified.message);
		        alert('결제 완료 요청에 실패했습니다.');
		        const redirectUrl =await notified.text();
		        window.location = redirectUrl;
		    }

		}



</script>
</body>
<!-- header, footer -->
<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/resources/template/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>
<!-- header, footer -->
</html>