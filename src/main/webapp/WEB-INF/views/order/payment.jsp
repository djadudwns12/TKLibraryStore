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

/* header */
.searchType {
   
   position: relative;
   
   
}
/* 모달 스타일 */

.modal {
   display: none; /* 기본적으로 숨김 */
   position: absolute; /* 검색창 아래 고정 */
   z-index: 4;
   width: 100%; /* 검색창과 동일한 가로 길이 */
   
   overflow-y: auto; /* 스크롤 가능 */
   height: auto;
}

/* 모달 내부 콘텐츠 스타일 */
.modal-content {
   width: 600px;
   padding: 20px;
   border-radius: 10px;
}

.content-body {
   display: flex;
   justify-content: space-between;
   align-items: flex-start;
}

.recent-searches, .popular-searches {
   width: 45%; /* 각각 45%의 공간을 차지 */
}

.divider {
   width: 1px;
   background-color: #ccc; /* 세로선 색상 */
   height: 100%;
   margin: 0 20px; /* 좌우 여백 */
}

.recent-searches, .popular-searches {
   width: 45%; /* 두 영역을 나누어 균형 있게 배치 */
}

h5 {
   margin-top: 0;
}

ul {
   list-style-type: none;
   padding: 0;
}

.modal {
   display: none; /* 필요에 따라 모달을 숨기거나 보여줄 수 있습니다 */
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   justify-content: center;
   align-items: center;
   margin-top: 10px;
}

.close {
   cursor: pointer;
   font-size: 20px;
}

/* 최근 검색어 */
a:link {
   color: #000000;
   text-decoration: inherit;
   
}

a:hover {
   color: 5C636A;
   text-decoration: inherit;
}

a:visited {
   color: #5C636A;
   text-decoration: none;
}

.rcContent-top {
   display: flex;
   justify-content: space-between; /* 두 요소 사이에 공간을 분배 */
   align-items: center; /* 세로 방향에서 가운데 정렬 */
   margin-bottom: 20px;
}

.rcContent-top h6 {
   margin: 0; /* 기본 마진 제거 */
}

.restockLI{
   margin-bottom:10px;
   display:flex;
   justify-content: space-between;
   align-items: center;
}
.searchType{
   display: none;
}
.modal-content{
   width: auto; !important 
}
.hero__search__form form .hero__search__categories{
      width: 16%;
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
      <nav class="humberger__menu__nav mobile-menu">
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
   <!-- Humberger End myPage

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
                           href="${pageContext.request.contextPath}/member/loginPage"><button
                                 class="site-btn">로그인</button></a></li>
                     </c:if>
                     <c:if test="${sessionScope.loginMember != null}">
                        <li><a
                           href="${pageContext.request.contextPath}/member/logout"><button
                                 class="site-btn">로그아웃</button></a></li>
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
                     <li id="bookList"><a href="/bookList/listAll">도서리스트 보기</a></li>
                     <!-- <li><a href="/member/myPage">마이페이지</a></li> -->
                     <li><a href="/qa/qaList">Q&A</a></li>
                     <li><a href="/cart/cartPage">장바구니</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-9">
               <div class="hero__search">
                  <div class="hero__search__form">
                     <form class="search" action="/bookList/listAll" method="post">
                        <div class="hero__search__categories" name="searchType"
                           id="searchType" >제목 검색
                           <input type="hidden" class="searchType" name="searchType" id="searchType"
                              style="text-align: center" value="title"/>
                              
                              
                        

                        </div>
                        <input type="text" class="searchWord" name="searchWord"
                           id="searchWord" placeholder="검색어를 입력하세요." autocomplete="off"> <input
                           type="hidden" name="pageNo" value="${param.pageNo}" /> <input
                           type="hidden" name="pagingSize" value="${param.pagingSize}" />
                        <button type="submit" class="site-btn"
                           onclick="return isValid()">검색</button>
                     </form>
                  </div>

               </div>

            </div>
         </div>
      </div>

      <!-- 모달 영역 시작 -->
      <div id="recentSearchModal" class="modal">
         <div class="modal-content">
            <div class="content-top">
               <span class="close" style="margin-left: 500px; height: 10px;">&times;</span>
            </div>
            <div class="content-body">
               <div class="recent-searches">
                  <h5>최근 검색 기록</h5>
                  <ul id="recentSearchesList">
                     <!-- 검색 기록이 동적으로 삽입될 곳 -->
                  </ul>
               </div>
               <div class="divider"></div>
               <!-- 세로선 -->
               <div class="popular-searches">
                  <h5>인기 검색어</h5>
                  <ul id="popularSearchesList">
                     <!-- 인기 검색어가 동적으로 삽입될 곳 -->

                  </ul>
               </div>

            </div>

         </div>
      </div>

      <div id="recentSearchModal" class="modal">
         <div class="modal-content">
            <div class="rccontent-top">
               <div>
                  <h5>최근 검색 기록</h5>
               </div>
               <div>
                  <h5>인기 검색어</h5>
               </div>
               <div>
                  <span class="close" style="margin-left: 500px; height: 10px;">&times;</span>
               </div>




            </div>
            <div class="content-body">
               <!-- 최근 검색 기록 영역 -->
               <div class="recent-searches">

                  <ul id="recentSearchesList">
                     <!-- 검색 기록이 동적으로 삽입될 곳 -->
                  </ul>
               </div>

               <!-- 세로선 -->
               <div class="divider"></div>

               <!-- 인기 검색어 영역 -->
               <div class="popular-searches">

                  <ul id="popularSearchesList">
                     <!-- 인기 검색어가 동적으로 삽입될 곳 -->
                  </ul>
               </div>
            </div>
         </div>
      </div>

      <div id="recommendSearchModal" class="modal">
         <div class="modal-content">
            <div class="rcContent-top">

               <div>
                  <h6>추천 검색어</h6>
               </div>
               <div>
                  <span class="close" style="height: 10px;">&times;</span>
               </div>
            </div>
            <div class="content-body">
               <div class="recommend-searches">

                  <ul id="searchRecommend">
                     <!-- 추천 검색어가 동적으로 삽입될 곳 -->
                  </ul>
               </div>

            </div>

         </div>
      </div>

      <div class="modal" id="restockModal" style="height: 800px;">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

               <!-- Modal Header -->
               <div class="modal-header">
                  <h4 class="modal-title">입고 신청</h4>
                  <button type="button" class="btn-close close"
                     data-bs-dismiss="modal"></button>
               </div>

               <!-- Modal body -->
               <div class="modal-body">
                  <div style="display: flex;">
                     <input type="text" style="width: 330px; margin-right: 20px;"
                        placeholder="검색할 책을 입력하세요." id="searchValue" />
                     <button class="btn btn-outline-dark btn" id="searchBtn">검색</button>
                  </div>
                  <ul id="restockList">
                     <!-- 추천 검색어가 동적으로 삽입될 곳 -->
                  </ul>

               </div>

               <!-- Modal footer -->
               <div class="modal-footer">
                  <button type="button" class="btn btn-danger close"
                     data-bs-dismiss="modal">Close</button>
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


function showHide(){
      $('.myInfo').toggle('myInfoHide');
      $('.showInfo').toggle();
      $('.hideInfo').toggle();
   }
   
   
function restockBook(item) {
      console.log(item.title);
      console.log(item.author);
      console.log(item.image);
      
      //ajax로 해당 책 정보를 현재시간과 함께 보내준다
      
      const currentTime = new Date().toLocaleString();
      
      $.ajax({
          url: '/admin/restock', // 서버의 엔드포인트 URL
          type: 'POST', // 요청 방식 (POST)
          contentType: 'application/json', // 데이터 타입을 JSON으로 설정
          data: JSON.stringify({
            title: item.title,
            author: item.author,
            image: item.image,
            timestamp: currentTime // 현재 시간 추가
          }),
          success: function(response) {
            // 성공 시 처리
            console.log('서버로 데이터 전송 성공:', response);
            alert('입고 신청되었습니다!');
          },
          error: function(error) {
            // 에러 발생 시 처리
            console.error('데이터 전송 중 오류 발생:', error);
          }
        });
      
   }

   // 재입고 모달 출력
   function showRestockModal(searchWord) {
      $('#restockModal').show();
      $('#searchValue').val(searchWord);
   }


   function pagingInfo() {
      let productList = '${param.productList}';
      console.log(productList);
   }

   function isValid() {
      // 검색 버튼을 눌렀을 때 searchType == -1 이거나 , searchWord에 ''이면 
      // 검색어가 제대로 입력되지 않았으므로 백엔드 단으로 데이터를 넘기면 안된다

      let result = false;
      if ($('#searchType').val() == -1 || $('#searchWord').val() == '') {
         alert('검색 조건과 검색어를 입력해 주세요');
         $('#searchType').focus();
         return result;
      } else {
         result = true;
      }

      return result;

   }

   function selectAll(selectAll) {
      // 모든 체크박스 선택
      const checkboxes = $('input[type="checkbox"]');

      // jQuery의 each 메서드를 사용하여 모든 체크박스 요소의 checked 속성을 selectAll.checked 값으로 설정
      checkboxes.each(function() {
         $(this).prop('checked', $(selectAll).prop('checked'));
      });

      // 버튼 업데이트 함수 호출
      updateButton();
   }

   // 상품을 삭제처리하는 함수
   function deleteProduct() {
      let pro_check = document
            .querySelectorAll('input[name="proCheck"]:checked').length;
      let delNo = [];
      if (pro_check == 0) {
         alert('하나 이상의 제품을 선택해주세요.');
         return false;
      }
      $('input:checkbox[name=proCheck]').each(function(index) {
         if ($(this).is(":checked") == true) {
            delNo.push($(this).val());

         }
      });
      if (confirm(pro_check + "개의 상품을 삭제하시겠습니까?")) {

         $
               .ajax({
                  url : "/admin/deleteProduct",
                  type : "post",
                  dataType : "json",
                  traditional : true,
                  data : {
                     "delNo" : delNo
                  },
                  success : function(data) {
                     // 실행시키기 위해선 컨트롤러단에서 json데이터로 변환 후 데이터를 보내주어야한다.
                     alert(pro_check + "개의 상품을 삭제했습니다.");
                     location.href = '/admin/productAdmin?ra=${param.ra}&pageNo=${param.pageNo}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}';

                  },
                  error : function(data) {
                     console.log(data);

                  },
               });

      } else {
         alert("취소");
      }
   }

   // 상품의 재고를 0으로 만드는 함수
   function soldOutProduct() {
      let pro_check = document
            .querySelectorAll('input[name="proCheck"]:checked').length;
      let soldOutNo = [];
      if (pro_check == 0) {
         alert('하나 이상의 제품을 선택해주세요.');
         return false;
      }
      $('input:checkbox[name=proCheck]').each(function(index) {
         if ($(this).is(":checked") == true) {
            soldOutNo.push($(this).val());
         }

      });
      if (confirm(pro_check + "개의 상품을 품절 처리하시겠습니까?")) {

         console.log(soldOutNo)
         $
               .ajax({
                  url : "/admin/soldOutProduct",
                  type : "post",
                  dataType : "json",
                  // 배열보낼때 넣어줘야함
                  traditional : true,
                  data : {
                     "soldOutNo" : soldOutNo
                  },
                  success : function(data) {
                     // 실행시키기 위해선 컨트롤러단에서 json데이터로 변환 후 데이터를 보내주어야한다.
                     console.log(data)
                     alert(pro_check + "개의 상품을 품절 처리했습니다.");
                     location.href = '/admin/productAdmin?ra=${param.ra}&pageNo=${param.pageNo}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}';

                  },
                  error : function(data) {
                     console.log(data);

                  },
               });

      } else {
         alert("취소");
      }
   }

   function updateButton() {
      // 체크박스 선택된 개수 가져오기
      let pro_check = $('input[name="proCheck"]:checked').length;
      // 버튼 텍스트 업데이트
      $('#delBtn').text(pro_check + "개 삭제");
      $('#soldOutBtn').text(pro_check + "개 품절");
   }

   
   
<!-- header, footer -->


$(function(){
   
   <!-- header, footer -->
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
         
         isSelect();
         $('.pagingSize')
               .change(
                     function() {
                        console.log($(this).val());

                        let pageNo = '${param.pageNo}';
                        if (pageNo == '') {
                           pageNo = 1;
                        } else {
                           pageNo = parseInt(pageNo);
                        }

                        location.href = '/admin/productAdmin?pagingSize='
                              + $(this).val()
                              + '&pageNo=1&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}';
                     });

         $('.sortByWhat')
               .change(
                     function() {
                        console.log($(this).val());

                        location.href = '/admin/productAdmin?ra='
                              + $(this).val()
                              + '&pageNo=${param.pageNo}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}';
                     });
         function isSelect() {
            let selectSort ='${ra}'
            $('#sortByWhat').val(selectSort).prop('selected', true);
            let pagingSize= '${pagingInfo.viewPostCntPerPage}'
            $('.pagingSize').val(pagingSize).prop('selected',true);
            let searchWord = '${search.searchWord}'
            $('.searchWord').val(searchWord);
            
         }
         
         
         <!-- 최근 검색어 기능 구현 -->
         
         // 모달을 숨기거나 보여주는 기능
          var recentModal = $("#recentSearchModal");
          var recommendModal = $("#recommendSearchModal");
          var searchInput = $("#searchWord");
          var restockModal = $("#restockModal");

          // 검색창 클릭 시 모달 띄우기
          searchInput.on("click", function () {
              // 검색창의 위치와 크기 정보 가져오기
              recommendModal.hide();
              var offset = searchInput.offset();
              var width = searchInput.outerWidth();

              // 모달을 검색창 바로 아래로 위치시키기
              recentModal.css({
                  top: offset.top + searchInput.outerHeight(),  // 검색창 바로 아래
                  left: offset.left,  // 검색창의 왼쪽에 맞추기
                  width: width  // 검색창과 동일한 너비로 설정
              }).show();  // 모달 열기

              //loadRecentSearches();  // 최근 검색 기록을 가져오는 함수 호출
          });

          // 모달 닫기 버튼 클릭 시 모달 닫기
          $(".close").on("click", function () {
              recentModal.hide();  // 모달 닫기
              recommendModal.hide();
              restockModal.hide();
          });

          // 모달 외부 클릭 시 모달 닫기
          $(window).on("click", function (event) {
              if (!$(event.target).closest("#recentSearchModal, #searchWord").length) {
                 recentModal.hide();  // 모달 닫기
                  recommendModal.hide();
                 
              }
          });

          function getCookie(name) {
             // 앞에 세미콜론과 공백이 추가된 이유는, 쿠키가 첫 번째 위치에 있는 경우도 쉽게 찾을 수 있게 하기 위함입니다. 
             // 이 방식으로 모든 쿠키 항목 앞에 세미콜론이 있다고 가정해 처리할 수 있습니다.
              let value = "; " + document.cookie;
              // name이라는 이름의 쿠키 분리
              let parts = value.split("; " + name + "=");
              // parts.length가 1인경우는 "; " 만 있는 것이기때문에 해당 쿠키가 존재하지 않는것이다
              // 따라서 parts.length === 2는 해당 쿠키가 존재하는 것을 의미하며 존재하면 해당 쿠키의 배열의 첫 번째 값을 반환
              if (parts.length === 2) return parts.pop().split(";").shift();
          }

          // 최근 검색어 쿠키 가져오기
          let recentSearch = getCookie("recentSearch");
          if (recentSearch) {
             // 쿠키 문자열의 +를 공백으로 대체후 ,을 기준으로 나눈다.
             let searchArray = decodeURIComponent(recentSearch.replace(/\+/g, ' ')).split(',');

              // 검색어 목록 표시
              searchArray.forEach(function(keyword) {
                  $("#recentSearchesList").append('<li><a href= "/bookList/listAll?searchType=title&searchWord=' + keyword + '";>' + keyword + '</a></li>');
              });
          }
          
          <!-- 인기 검색어 기능 구현 -->
          // 인기 검색어 목록 불러오기
          function loadPopularKeywords() {
             
             $
            .ajax({
               url : "/admin/popularKeywords",
               type : "get",
               dataType : "json",
               data : {
                  limit : 5
               },
               success : function(data) {
                  console.log(data)
                   var popularList = $('#popularSearchesList');
                         popularList.empty();
                         $.each(data, function(index, keyword) {
                            var index = index+1
                             //popularList.append('<li>' + index + "　　" + keyword + '</li>');
                            popularList.append('<li><a href= "/bookList/listAll?searchType=title&searchWord=' + keyword + '";>' +  index + "　　" + keyword + '</a></li>');
                            
                         });
               },
               error : function(data) {
                  console.log(data);

               },
            });
             
                                    
          }

          // 페이지 로드 시 인기 검색어 불러오기
          loadPopularKeywords();
          
          <!-- 추천 검색어 기능 구현-->
          $('.searchWord').keyup(function (evt) {
             
             
              var searchInput = $("#searchWord");

            
                  // 검색창의 위치와 크기 정보 가져오기
                  var offset = searchInput.offset();
                  var width = searchInput.outerWidth();
               
                  // 인기검색어, 최근검색어 모달 닫기
                  recentModal.hide();
                  
                  // 모달을 검색창 바로 아래로 위치시키기
                  recommendModal.css({
                      top: offset.top + searchInput.outerHeight(),  // 검색창 바로 아래
                      left: offset.left,  // 검색창의 왼쪽에 맞추기
                      width: width  // 검색창과 동일한 너비로 설정
                  }).show();  // 모달 열기

             
             
            let searchWord = $('.searchWord').val();
            var isComposing = false;

             // compositionstart: 조합 입력 시작 시 플래그 설정
             $('#searchWord').on('compositionstart', function() {
                 isComposing = true;
             });

             // compositionend: 조합 입력이 끝나면 플래그 해제하고 AJAX 요청
             $('#searchWord').on('compositionend', function() {
                 isComposing = false;
            });   
            
            if(searchWord.length >1 && !isComposing){
               $.ajax({
                       url: "/admin/searchRecommend", 
                       type: "get", 
                       dataType: "json", 
                       data: {
                         searchWord : searchWord
                       },
                       success: function (data) {
                        
                        
                         if (data.msg === "notPresent") {
                            $("#searchRecommend").empty();
                           $("#searchRecommend").append('<li> 일치하는 상품이 없습니다. </li><input type="button" value= "입고 신청" style="margin-top:20px;" onclick="showRestockModal(\'' + searchWord + '\')" />');
                           
                           // 일치하는 책이 있을 때
                         } else if (data.msg === "isPresent") {
                            console.log(data.data)
                            $("#searchRecommend").empty();
                            $.each(data.data, function(index, title) {
                                $("#searchRecommend").append('<li style="margin-bottom:10px;"><a href= "/bookList/listAll?searchType=title&searchWord=' + title + '";>' + title + '</a></li>');
                             });
                         }
                       },
                       error: function (data) {
                          console.log(data)
                       },
                     });
            }
         });
          
          $('#searchBtn').click(function() {
            let searchValue = $('#searchValue').val();

            if (searchValue != '') {
               $.ajax({
                  url : '/admin/searchBook',
                  type : 'GET',
                  data : {
                     "searchValue" : searchValue
                  },
                  dataType : 'json',
                  success : function(data) {
                     
                     if(data.total==0){
                        $("#restockList").empty();
                            $("#restockList").append('<li> 일치하는 상품이 없습니다. </li>');
                     }else if(data.total > 0){
                        $("#restockList").empty();
                        console.log(data.items);
                        
                        data.items.forEach(function(item) {
                             let itemWithoutDescription = { ...item };
                             delete itemWithoutDescription.description; // \n때문인지 넘겨줄때 오류가 나서 description 속성 삭제
                             
                                $("#restockList").append('<div class="restockLI"><li><img src="'+item.image+'" style="width : 50px; height: 80px;">'+item.title+'<span style="font-size: 10px; color: gray;">  '+item.author+'</span></li><input type="button" style="width:50px; justify-content:flex-end; text-align:center;" value="신청" onclick=\'restockBook(' + JSON.stringify(itemWithoutDescription) + ')\'/></div>');
                             });
                     }

                  }

               });
            }
         });
          

   
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
<%-- <script src="${pageContext.request.contextPath}/resources/template/js/jquery.nice-select.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/template/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>
<!-- header, footer -->
</html>