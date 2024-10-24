<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>장바구니</title>
<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
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
   <script type="text/javascript" src="/resources/js/category.js"></script>
   <link
   href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
   rel="stylesheet">
<style>
/* 모든 td에 공통 스타일 적용 (cart.thumbNail 제외) */
* {
   font-family: "Gowun Batang", serif;
   font-weight: 600;
   font-style: normal;
}

.common-td {
   text-align: center !important;
   vertical-align: middle !important;
}

/* 이미지 td 스타일 (다르게 적용 가능) */
.thumbnail {
   width: 80px;
}

/* 버튼 */
.button-link {
   color: white;
   text-decoration: none;
   padding: 5px 10px;
   border: none;
   background-color: transparent;
   display: inline-block;
   font-size: 16px;
   transition: transform 0.1s ease, box-shadow 0.1s ease;
}

/* 마우스 올렸을 때 */
.button-link:hover {
   color: #f0f0f0;
}

/* 클릭 시 눌리는 효과 */
.button-link:active {
   transform: translateY(2px);
}

.quantity-control {
   display: inline-flex;
   align-items: center;
   border: 1px solid #ddd;
   border-radius: 5px;
   overflow: hidden; /* 경계선에 맞춰서 내용이 잘리지 않도록 */
}

.quantity-control button {
   background-color: #f8f9fa; /* 버튼 배경색 */
   border: none;
   padding: 5px 10px;
   cursor: pointer;
   font-size: 18px; /* 버튼 크기 */
   transition: background-color 0.3s;
}

.quantity-control button:hover {
   background-color: #e2e6ea; /* 버튼 마우스 오버 시 색상 */
}

.quantity-control input {
   width: 40px; /* 수량 입력창 너비 */
   text-align: center; /* 텍스트 중앙 정렬 */
   border: none;
   outline: none; /* 포커스 시 경계선 제거 */
   font-size: 18px; /* 입력 텍스트 크기 */
}

.change-btn {
   background-color: #7FAD39; /* 원하시는 배경색으로 변경 가능 */
   color: white;
   border: none;
   border-radius: 5px; /* 귀여운 느낌을 위해 둥글게 */
   padding: 5px 10px; /* 여백을 적게 설정 */
   font-size: 12px; /* 작게 설정 */
   transition: background-color 0.3s;
   margin-top: 0.5em;
}

.change-btn:hover {
   background-color: #6FAF2E; /* 호버 시 색상 변경 */
}
.searchType {
   
   position: relative;
   
   
}
/* 모달 스타일 */

.modagayoon {
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

   <div class="container">
      <button type="button" class="btn btn-outline-danger"
         id="deleteSelectedButton" style="margin-bottom:0.5em;">선택삭제</button>
      <form>
      <div style="max-height: 500px; overflow-y: auto;">
         <table class="table table-hover">
            <thead>
               <tr style="text-align: center;">
                  <th><input type="checkbox" id="selectAll" class="selectAll"
                     onclick="toggleSelectAll(this)" /></th>
                  <th>이미지</th>
                  <th>제목</th>
                  <th>판매가</th>
                  <th>할인가</th>
                  <th>수량</th>
                  <th>선택</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="cart" items="${cartList}">
                  <tr class="cartItem">
                     <td class="common-td"><input type="checkbox"
                        class="selectItem" data-price="${cart.price}"
                        data-salePrice="${cart.salePrice}" data-cart-id="${cart.cartId}"></td>
                     <td class="thumbnail"><img src="${cart.thumbNail}"
                        style="width: 70px; cursor: pointer;" name="thumbNail" onclick="location.href='/bookList/bookDetail?bookNo='+${cart.bookNo}"/></td>
                     <td class="common-td" name="title">${cart.title}</td>
                     <td class="common-td">
                        <div name="price">
                           <fmt:formatNumber value="${cart.price}" type="number"
                              groupingUsed="true"/>
                           원
                        </div>
                     </td>
                     <td class="common-td">
                        <div name="salePrice">
                           <fmt:formatNumber value="${cart.salePrice}" type="number"
                              groupingUsed="true"/>
                           원
                        </div>
                     </td>
                     <td class="common-td">
                        <div class="quantity-control">
                           <button type="button" class="decrease-btn"
                              data-cart-id="${cart.cartId}">-</button>
                           <input type="text" id="qtyInput-${cart.cartId}"
                              value="${cart.qty}" size="2" readonly name="cartQty"/> <input type="hidden"
                              id="inven-${cart.cartId}" value="${cart.inven}" />
                           <script>
                                console.log("생성된 qtyInput ID:", 'qtyInput-${cart.cartId}');
                                console.log("cartId : ", '${cart.cartId}', "재고수량 : ", '${cart.inven}');
                            </script>
                           <button type="button" class="increase-btn"
                              data-cart-id="${cart.cartId}">+</button>
                        </div>
                     </td>
                     <td class="common-td" style="cursor:pointer;"><img
                        src="/resources/images/cart_delete.png" width="30px"
                        onclick="showDeleteModal('${cart.cartId}', this);"></td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>

      <table class="table table-hover" name="totalExpectedPayment">
         <thead>
            <tr style="text-align: center;">
               <th>총 상품금액</th>
               <th></th>
               <th>배송비</th>
               <th></th>
               <th>총 할인금액</th>
               <th></th>
               <th>결제예정금액</th>
               <th>적립예정포인트</th>
            </tr>
         </thead>
         <tbody>
            <span id="pointRate" style="display: none;">${pointRate}</span>
            <!-- pointRate 추가 -->
            <c:set var="totalPrice" value="0" />
            <c:set var="totalSalePrice" value="0" />
            <c:set var="totalPoint" value="0" />

            <c:forEach var="cart" items="${cartList}">
               <!-- 총 상품 금액 (할인 전) -->
               <c:set var="totalPrice"
                  value="${totalPrice + cart.price * cart.qty}" />


            </c:forEach>

            <!-- 총 할인가 계산 (상품 가격의 10% 할인 적용) -->
            <c:set var="totalSalePrice"
               value="${totalSalePrice + totalPrice * 0.1}" />

            <!-- 결제 예정 금액 (총 상품 금액 - 할인된 금액) -->
            <c:set var="totalPay" value="${totalPrice - totalSalePrice}" />

            <!-- 적립 예정 포인트 계산 (결제 예정 금액 * pointRate) -->
            <c:set var="totalPoint" value="${totalPay * pointRate}" />

            <!-- 소수점 이하 제거 -->
            <c:set var="totalPoint"
               value="${fn:substringBefore(totalPoint, '.')}" />

            <tr>
               <td class="common-td" name="totalPrice"><strong id="totalPrice"> <fmt:formatNumber
                        value="${totalPrice}" type="number" groupingUsed="true"/>원
               </strong></td>
               <td class="common-td"><strong>-</strong></td>
               <td class="common-td"><strong>0원</strong></td>
               <td class="common-td"><strong>-</strong></td>
               <td class="common-td" name="totalSalePrice"><strong id="totalSalePrice"> <fmt:formatNumber
                        value="${totalSalePrice}" type="number" groupingUsed="true" />원
               </strong></td>
               <td class="common-td"><strong>=</strong></td>
               <td class="common-td" name="totalPay"><strong id="totalPay"> <fmt:formatNumber
                        value="${totalPay}" type="number" groupingUsed="true" />원
               </strong></td>
               <td class="common-td" name="totalPoint"><strong id="totalPoint"> <fmt:formatNumber
                        value="${totalPoint}" type="number" groupingUsed="true" />P
               </strong></td>
            </tr>
         </tbody>
      </table>
      </form>
      <div
         style="display: flex; justify-content: center; align-items: center;">
         <button type="button" id="paymentButton" class="btn btn-success"
            style="background: #7FAD39;">주문하기</button>
      </div>
   </div>

   <!-- The Modal -->
   <div class="modal" id="myModal" style="display: none;">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title"></h4>
               <button type="button" class="btn-close modalCloseBtn"
                  data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
               <button type="button" class="btn btn-info" id="deleteConfirmButton">삭제</button>
               <button type="button" class="btn btn-danger modalCloseBtn"
                  onclick="$('#myModal').modal('hide');">취소</button>
            </div>
         </div>
      </div>
   </div>

   <!-- 재고 부족 모달 -->
   <div class="modagayoon" id="stockModal" style="display: none;">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">재고 부족</h4>
               <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
               <p>재고가 부족합니다.</p>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-danger"
                  data-bs-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>

   <!-- 삭제 확인 모달 -->
   <div class="modal fade" id="confirmDeleteModal" tabindex="-1"
      aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="confirmDeleteModalLabel">삭제 확인</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">선택한 상품들을 삭제하시겠습니까?</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">취소</button>
               <button type="button" class="btn btn-danger"
                  id="confirmDeleteButton">삭제</button>
            </div>
         </div>
      </div>
   </div>

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

   <!-- jQuery 및 Bootstrap JS를 body 끝 부분에 배치 -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <!-- JavaScript 코드 -->
   <script>
    $(document).ready(function() {
        // 수량 증가 함수
        function increaseQty(cartId) {
            let qtyInput = document.getElementById('qtyInput-' + cartId);
            let currentQty = parseInt(qtyInput.value);
            let maxQty = parseInt(document.getElementById('inven-' + cartId).value);

            if (currentQty < maxQty) {
                qtyInput.value = currentQty + 1;
                updateTotals();
                updateQtyInDB(cartId, qtyInput.value);  // AJAX로 수량 업데이트
            } else {
                // 재고 부족 모달 표시
                $('#stockModal').modal('show');
            }
        }

        // 수량 감소 함수 (1보다 작은 값은 허용하지 않음)
        function decreaseQty(cartId) {
            let qtyInput = document.getElementById('qtyInput-' + cartId);
            let currentQty = parseInt(qtyInput.value);
            if (currentQty > 1) {
                qtyInput.value = currentQty - 1;
                updateTotals();
                updateQtyInDB(cartId, qtyInput.value);  // AJAX로 수량 업데이트
            } else {
                alert("수량은 1보다 작을 수 없습니다.");
            }
        }

        // AJAX로 DB에 수량 업데이트
        function updateQtyInDB(cartId, newQty) {
            $.ajax({
                url: '/cart/updateQty',
                type: 'POST',
                data: { cartId: cartId, qty: newQty },
                success: function(response) {
                    if (response.success) {
                        console.log("수량이 성공적으로 업데이트되었습니다.");
                    } else {
                        alert("수량 업데이트에 실패했습니다. 다시 시도해주세요.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 중 오류 발생:", error);
                    alert("에러가 발생했습니다: " + error);
                }
            });
        }

        // 이벤트 위임으로 수량 증가/감소 버튼 핸들러
        $(document).on('click', 'button.increase-btn', function() {
            const cartId = $(this).data('cart-id');
            increaseQty(cartId);
        });

        $(document).on('click', 'button.decrease-btn', function() {
            const cartId = $(this).data('cart-id');
            decreaseQty(cartId);
        });

        // 선택된 상품의 합계 업데이트 함수
        function updateTotals() {
            let totalPrice = 0;
            let totalSalePrice = 0;
            let totalPay = 0;
            let totalPoint = 0;

            // pointRate를 DOM에서 가져오기
            const pointRate = parseFloat(document.getElementById('pointRate').innerText) || 0; // 기본값 0

            const selectedItems = document.querySelectorAll('.selectItem:checked');
            selectedItems.forEach(item => {
                const price = parseInt(item.getAttribute('data-price')) || 0;  // NaN 방지
                const salePrice = parseInt(item.getAttribute('data-salePrice')) || 0;  // NaN 방지
                const cartId = item.getAttribute('data-cart-id');
                const qtyInput = document.getElementById('qtyInput-' + cartId);
                const qty = qtyInput ? parseInt(qtyInput.value) || 0 : 0;  // NaN 방지 및 요소 존재 확인

                totalPrice += price * qty;
                totalSalePrice += (price * 0.1) * qty;  // 10% 할인 적용
                totalPay += salePrice * qty;
                totalPoint += salePrice * pointRate * qty; // pointRate 적용
            });

            // 결과를 DOM에 반영
            document.getElementById('totalPrice').innerText = totalPrice.toLocaleString() + "원";
            document.getElementById('totalSalePrice').innerText = totalSalePrice.toLocaleString() + "원";
            document.getElementById('totalPay').innerText = totalPay.toLocaleString() + "원";
            document.getElementById('totalPoint').innerText = Math.floor(totalPoint).toLocaleString() + "P";
        }

        // 초기화 및 이벤트 핸들러 설정
        function init() {
            const selectAllCheckbox = document.getElementById('selectAll');
            selectAllCheckbox.checked = true;
            toggleSelectAll(selectAllCheckbox);

            const checkboxes = document.querySelectorAll('.selectItem');
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    checkSelectAll();
                    updateTotals();
                });
            });

            updateTotals();
        }

        // 전체 선택/해제 토글 함수
        function toggleSelectAll(source) {
            const checkboxes = document.querySelectorAll('.selectItem');
            checkboxes.forEach(checkbox => {
                checkbox.checked = source.checked;
            });
            updateTotals();
        }

        // 모든 체크박스의 상태를 확인하여 전체 선택 체크박스의 상태를 업데이트
        function checkSelectAll() {
            const selectAllCheckbox = document.getElementById('selectAll');
            const checkboxes = document.querySelectorAll('.selectItem');
            const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
            selectAllCheckbox.checked = allChecked;
        }

        // 삭제 버튼 클릭 이벤트
        $('#deleteConfirmButton').on('click', function () {
            const cartId = $(this).data('cart-id');
            console.log('삭제할 cartId:', cartId);

            $.ajax({
                url: '/cart/deleteCart',
                type: 'POST',
                data: { cartId: cartId },
                success: function (response) {
                    if (response.success) {
                        $(currentElement).closest('tr').remove();
                        updateTotals();
                        $('.fa-shopping-bag').next().text(response.CartCnt)
                    } else {
                        alert('삭제에 실패했습니다. 다시 시도해주세요.');
                    }
                },
                error: function (xhr, status, error) {
                    alert('에러가 발생했습니다: ' + error);
                }
            });

            $('#myModal').modal('hide');
        });

        // AJAX로 삭제 요청을 보내는 함수
        let currentElement; // 전역 변수로 현재 클릭된 요소를 저장

        window.showDeleteModal = function(cartId, element) {
            $('.modal-body').html("상품을 삭제하시겠습니까?");
            $('#deleteConfirmButton').data('cart-id', cartId);
            currentElement = element; // 현재 클릭된 요소 저장
            $('#myModal').modal('show'); // Bootstrap의 modal 메서드 사용
        }

        // 전역으로 함수 선언
        window.toggleSelectAll = toggleSelectAll;

        // 초기화 함수 호출
        init();

        function saveQty(cartId) {
            let qtyInput = document.getElementById('qtyInput-' + cartId);

            if (!qtyInput) {
                console.error("입력 필드를 찾을 수 없습니다: cartId=", cartId);
                alert("수량 입력 필드를 찾을 수 없습니다.");
                return;
            }

            let qty = parseInt(qtyInput.value); 

            if (isNaN(qty)) {
                alert("유효한 수량이 아닙니다.");
                return;
            }

            console.log("Received CartID:", cartId);
            console.log("Quantity:", qty);

            $.ajax({
                url: '/cart/updateQty',
                type: 'POST',
                data: {
                    cartId: cartId,
                    qty: qty
                },
                success: function(response) {
                    if (response.success) {
                        console.log("수량이 성공적으로 업데이트되었습니다.");
                        alert("해당 상품의 수량을 변경했습니다.");
                    } else {
                        alert("수량 업데이트에 실패했습니다. 다시 시도해주세요.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 중 오류 발생:", error);
                    alert("에러가 발생했습니다: " + error);
                }
            });
        }
        
        let selectedCartIds = []; // 선택된 cartId를 저장할 변수

        /* 선택 삭제 버튼 눌렀을 때 */
        $('#deleteSelectedButton').on('click', function() {
            // 선택된 체크박스의 cartId 수집
            selectedCartIds = [];
            $('.selectItem:checked').each(function() {
                selectedCartIds.push($(this).data('cart-id'));
            });

            if (selectedCartIds.length === 0) {
                alert("삭제할 상품을 선택해주세요.");
                return;
            }

            // 모달 띄우기
            $('#confirmDeleteModal').modal('show');
        });

        // 선택 삭제 버튼 클릭 시 처리
        $('#confirmDeleteButton').on('click', function() {
            // AJAX 요청으로 서버에 삭제 요청 보내기
            $.ajax({
                url: '/cart/deleteSelected',
                type: 'POST',
                contentType: 'application/json', // JSON 형식으로 전송
                data: JSON.stringify(selectedCartIds), // 데이터 JSON 문자열로 변환
                success: function(response) {
                    if (response.success) {
                        // 삭제 성공 시 항목 제거
                        selectedCartIds.forEach(function(cartId) {
                            // 해당 cartId를 가진 행 제거
                            $('input[data-cart-id="' + cartId + '"]').closest('tr').remove();
                        });
                        
                        // 모든 체크박스 다시 선택
                        $('.selectItem').prop('checked', true);
                        $('.selectAll').prop('checked', true);
                        
                        // 총합 업데이트 함수 호출
                        updateTotals();
                        $('.fa-shopping-bag').next().text(response.CartCnt)
                        
                        
                        
                    } else {
                        alert('삭제 중 오류가 발생했습니다.');
                    }
                    // 모달 닫기
                    $('#confirmDeleteModal').modal('hide');
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 중 오류 발생:", error);
                    alert("에러가 발생했습니다: " + error);
                    // 모달 닫기
                    $('#confirmDeleteModal').modal('hide');
                }
            });
        });

        $("#paymentButton").on("click", function(event) {
            console.log("결제 버튼 클릭됨"); // 클릭 이벤트 확인

            // 체크된 tr 태그에서 bookNo 가져오기
            let cartIds = [];
            console.log($("tr input[type='checkbox']:checked"));
            
            $("tr.cartItem input[type='checkbox']:checked").each(function(i, item) {
                console.log(i ,'번째 아이템 : ', item);
                
                cartIds.push($(item).attr('data-cart-id'));
            });



        });
    });
    

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

       
    

    
    $(function () {
       
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
             

        const cartIdList = [
            <c:forEach var="cart" items="${cartList}">
                '${cart.cartId}'<c:if test="${!status.last}">, </c:if>
            </c:forEach>
        ];

        $("#paymentButton").on("click", function (event) {
            console.log("결제 버튼 클릭됨");

            let fd = new FormData();  

            // 체크된 항목에 대해서만 반복문으로 처리
            $("tr.cartItem").has("input.selectItem:checked").each(function () {  
                let thumbNail = $(this).find("img[name='thumbNail']").attr("src") || '';  
                let title = $(this).find("td[name='title']").text().trim() || '';  
                let priceText = $(this).find("div[name='price']").text().trim() || '';  
                let price = priceText.replace(/[^\d]/g, ''); 

                let salePriceText = $(this).find("div[name='salePrice']").text().trim() || ''; 
                let salePrice = salePriceText.replace(/[^\d]/g, '');  

                let cartQty = $(this).find("input[name='cartQty']").val() || '';  
                let cartId = $(this).find("input.selectItem:checked").data("cart-id"); // 선택된 cartId 가져오기

                // 각 선택된 상품의 정보를 FormData에 추가
                fd.append("thumbNail", thumbNail);
                fd.append("title", title);
                fd.append("price", price);
                fd.append("salePrice", salePrice);
                fd.append("cartQty", cartQty);
                fd.append("cartId", cartId);  // 각 개별 cartId 추가
                
                console.log("추출된 체크된 책 정보:", {
                    thumbNail: thumbNail,
                    title: title,
                    price: price,
                    salePrice: salePrice,
                    cartQty: cartQty,
                    cartId: cartId
                });
            });

            // 체크된 항목이 없을 경우 경고
            if (!fd.has("thumbNail")) {
                alert("결제할 책을 선택해주세요.");
                return; 
            }

            // 총 결제 정보 추출 및 추가
            let totalPriceText = $("td[name='totalPrice']").text().trim();
            let totalPrice = totalPriceText.replace(/[^\d]/g, ''); 

            let totalSalePriceText = $("td[name='totalSalePrice']").text().trim();  
            let totalSalePrice = totalSalePriceText.replace(/[^\d]/g, '');  

            let totalPayText = $("td[name='totalPay']").text().trim();
            let totalPay = totalPayText.replace(/[^\d]/g, '');  

            let totalPointText = $("td[name='totalPoint']").text().trim();
            let totalPoint = totalPointText.replace(/[^\d]/g, '');  

            fd.append("totalPrice", totalPrice);
            fd.append("totalSalePrice", totalSalePrice);
            fd.append("totalPay", totalPay);
            fd.append("totalPoint", totalPoint);

            console.log("총 결제 정보:", {
                totalPrice: totalPrice,
                totalSalePrice: totalSalePrice,
                totalPay: totalPay,
                totalPoint: totalPoint
            });

            // AJAX로 전송
            $.ajax({
                url: "/order/payment",
                type: "POST",
                data: fd,
                contentType: false,
                processData: false,
                cache: false,
                success: function (response) {
                    console.log("성공:", response);
                    window.location.href = "/order/payment";
                },
                error: function () {
                    console.error("오류");
                }
            });
        });
    });



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
