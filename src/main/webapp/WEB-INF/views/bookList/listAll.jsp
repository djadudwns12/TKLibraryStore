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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



</head>



<script>
	$(function() {
		// content 영역 설정 
		// let bList = $('.bList'); 
		// $('#main_content').html(bList);
		$('.categoryArea').show();

		
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

</style>


<body>

	<c:import url="../header.jsp"></c:import>

	<img src="https://contents.kyobobook.co.kr/advrcntr/IMAC/creatives/2024/10/02/75288/kyobo_new_book_resize.png" style="margin-left: 300px; ">
		<!-- <img src="https://contents.kyobobook.co.kr/display/i_1624_450%204_c0a8a1264c1a44aba4975622222949d7.jpg" style="margin-left: 300px; "> -->
		<!--<img src="https://contents.kyobobook.co.kr/pmtn/2024/event/a40ff528883748dd9d6f73aa4a6f8025.jpg" style="margin-left: 300px; ">-->
		 <!-- <img src="https://contents.kyobobook.co.kr/pmtn/2024/event/9e794bad98b84309806edd2fa150e2b6.png" style="margin-left: 300px; "> -->
		

	<section class="product spad">
	
		
	<div class="bList">
		

		
		<div class="container">
			<table class="table">
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
					<c:forEach var="list" items="${listAll}">

						<tr>
							<td
								onclick="location.href='/bookList/bookDetail?bookNo=${list.bookNo}';"><img
								src="${list.thumbNail}" style="width: 80px; height: 100px;"></td>
							<td
								onclick="location.href='/bookList/bookDetail?bookNo=${list.bookNo}';">${list.title}</td>
							<td>${list.author}</td>
							<td>${list.publisher}</td>
							<td>${list.pubDate}</td>
							<td><span><fmt:formatNumber value="${list.salePrice}"
										type="currency" /></span></td>
							<td>${list.zzim}</td>
							<td>${list.reviewCnt}</td>
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
	</section>
	<c:import url="../footer.jsp"></c:import>


</body>

</html>