<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>떡잎서점: 전체리스트</title>
<link rel="icon" href="/resources/images/TKlogo.png" type="image/png">
<!-- Google Fonts에서 Gowun Batang 폰트 불러오기 -->
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="/resources/js/category.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">


</head>



<script>
	$(function() {
		// content 영역 설정 
		// let bList = $('.bList'); 
		// $('#main_content').html(bList);
		$('.categoryArea').show();
		
		$('#bookList').children().removeAttr('href');
		
		//<li id="bookList">도서리스트 보기</li>
		
		 // 클릭시 해당도서리스트로 이동
	    $("#bookList").click(function() {
	        $('html, body').animate({
	            scrollTop: $("#targetSection").offset().top
	        }, 0); // 1000은 애니메이션 시간 (1초)
	    });

	});
	
	
</script>

<script type="module">
    
    var swiper = new Swiper('.swiper', {
      direction: 'vertical',
	  autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      //pagination: {
        //el: '.swiper-pagination',
      //  clickable: true,
      //},
    });
  </script>
<style>
table {
	text-align: center;
}

table td, table th {
	vertical-align: middle !important;
}

* {
	font-family: "Gowun Batang", serif;
	font-weight: 550;
	font-style: normal;
}

/* 페이징 부분 */

/* 페이지 링크 기본 스타일 */
.pagination .page-link {
	color: #7fad39; /* 기본 텍스트 색상 */
	background-color: #fff; /* 기본 배경색 흰색 */
	border: 1px solid #ddd; /* 테두리 */
}

/* 페이지 링크 hover 및 focus 상태 */
.pagination .page-link:hover, .pagination .page-link:focus {
	color: #7fad39; /* Hover 시 텍스트 색상 */
	background-color: #f5f5f5; /* Hover 시 배경색 */
	border-color: #7fad39; /* Hover 시 테두리 색상 */
}

/* 페이지 링크 active 상태 */
.pagination .page-item.active .page-link {
	color: #fff; /* Active 상태의 텍스트 색상 */
	background-color: #7fad39; /* Active 상태의 배경색 */
	border-color: #7fad39; /* Active 상태의 테두리 색상 */
}

/* 페이지 링크 Disabled 상태 */
.pagination .page-item.disabled .page-link {
	color: #ccc; /* 비활성화 상태 텍스트 색상 */
	background-color: #fff; /* 비활성화 상태 배경색 */
	border-color: #ddd; /* 비활성화 상태 테두리 색상 */
}




    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper {
      width: 2000px;
      height: 600px;
      position: relative;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: flex-start;
    }
   
   #category_young{
   		display: flex;
   		flex-direction: row;
   }
    #fourImg {
   	display: flex;
   	justify-content: center;
   }
    #comment {
   	display: flex;
   	justify-content: center;
   	margin-bottom: 20px;
   }
   

</style>


<body>

	<c:import url="../header.jsp"></c:import>

	<!-- <img src="https://contents.kyobobook.co.kr/advrcntr/IMAC/creatives/2024/10/02/75288/kyobo_new_book_resize.png" style="margin-left: 300px; ">-->
	<!-- <img src="https://contents.kyobobook.co.kr/display/i_1624_450%204_c0a8a1264c1a44aba4975622222949d7.jpg" style="margin-left: 300px; "> -->
	<!--<img src="https://contents.kyobobook.co.kr/pmtn/2024/event/a40ff528883748dd9d6f73aa4a6f8025.jpg" style="margin-left: 300px; ">-->
	<!-- <img src="https://contents.kyobobook.co.kr/pmtn/2024/event/9e794bad98b84309806edd2fa150e2b6.png" style="margin-left: 300px; "> -->

	<div class="swiper"  style="width:1200px;">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="/resources/images/mbanner01.png" ></div>
			<div class="swiper-slide"><img src="/resources/images/mbanner02.png" ></div>
			<div class="swiper-slide"><img src="/resources/images/mbanner03.png" ></div>
			
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		
	</div>
	
	
	  <span id="comment" style="font-size: 20px; font-weight: 700;">독서의 계절 가을, 떡잎서점과 함께♥ @)))))))))) 김밥 한줄과 함께♣</span>
	<div id="fourImg">
      <span><img src="/resources/images/autumn1.jpg" style="width: 280px; height: 170px; margin-bottom: 40px; border-radius: 40px; "></span>
      <span style="margin-left: 30px; "><img src="/resources/images/library.jpg" style="width: 280px; height: 170px; margin-bottom: 40px;border-radius: 40px;"></span>
      <span style="margin-left: 30px; "><img src="/resources/images/autumn2.jpg" style="width: 280px; height: 170px; margin-bottom: 40px;border-radius: 40px;"></span>
      <span style="margin-left: 30px; "><img src="/resources/images/book.jpg" style="width: 280px; height: 170px; margin-bottom: 40px;border-radius: 40px;"></span>
   </div>  
		<!-- 카테고리 -->
				<div class="container" style="margin-bottom: 20px;">
					
					<div class="categoryArea" style="display: none;">
						<input type="hidden" class="categoryNo">
						<div id="category_young">
							<select id="high_class" onchange="category(this)">
								<option value="">선택</option>
								<option value="05">인문</option>
							</select>
							<!-- 중분류 -->
							<select id="mid_class" onchange="category(this)">
								<option value="-1">선택</option>
							</select>
							<!-- 소분류 -->
							<select id="low_class" onchange="category(this)">
								<option value="-1">선택</option>
							</select>
						</div>
						<div id="main_content"></div>
					</div>
					
				</div>
		<div class="bList">



			<div class="container">
				<table class="table" id="targetSection">
					<thead>
						<tr>
							<th class="thumbNail"></th>
							<th>제목</th>
							<th>작가</th>
							<th>출판사</th>
							<th>출간일</th>
							<th>가격</th>
							<th>찜</th>
							<th>리뷰</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">

							<tr>
								<td

									onclick="location.href='/bookList/bookDetail?bookNo=${product.bookNo}';"><img
									src="${product.thumbNail}" style="width: 80px; height: 100px;"></td>
								<td
									onclick="location.href='/bookList/bookDetail?bookNo=${product.bookNo}';">${product.title}</td>
								<td>${product.author}</td>
								<td>${product.publisher}</td>
								<td>${product.pubDate}</td>
								<td><span><fmt:formatNumber
											value="${product.salePrice}" type="currency" /></span></td>
								<td>${product.zzim}</td>
								<td>${product.reviewCnt}</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="pagination justify-content-center" style="margin: 20px 0">
				<ul class="pagination">
					<c:if test="${param.pageNo > 1}">
						<li class="page-item"><a class="page-link"
							href="/bookList/listAll?pageNo=${param.pageNo - 1}&pagingSize=${param.pagingSize}">Previous</a></li>
					</c:if>

					<c:forEach var="i" begin="${pagingInfo.startPageNoCurBlock}"
						end="${pagingInfo.endPageNoCurBlock }">
						<c:choose>
							<c:when test="${param.pageNo == i}">
								<li class="page-item active" id="${i}"><a class="page-link"
									href="/bookList/listAll?pageNo=${i}&pagingSize=${param.pagingSize}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" id="${i}"><a class="page-link"
									href="/bookList/listAll?pageNo=${i}&pagingSize=${param.pagingSize}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pagingInfo.pageNo < pagingInfo.totalPageCnt}">
						<li class="page-item"><a class="page-link"
							href="/bookList/listAll?pageNo=${pagingInfo.pageNo + 1}&pagingSize=${param.pagingSize}">Next</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	
	<c:import url="../footer.jsp"></c:import>


</body>

</html>