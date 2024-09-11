<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<!--  <link rel="stylesheet" href="resources/template/css/adminlte.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b948e77617.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap"
	rel="stylesheet">
<!-- Load icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	$(function () {
		
		$('.pagingSize').change(function(){
			console.log($(this).val());
			
			let pageNo = '${param.pageNo}';
			if (pageNo == ''){
				pageNo = 1;
			} else {
				pageNo = parseInt(pageNo);
			}
			
			location.href = '/admin/productAdmin?pagingSize='+ $(this).val() + '&pageNo=1&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}';
		});
		
		
		$('.sortByWhat').change(function(){
			console.log($(this).val());						
			 
			location.href = '/admin/productAdmin?ra='+ $(this).val() + '&pageNo=${param.pageNo}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}';
		});
	});
	
	function pagingInfo() {
		let productList = '${param.productList}';
		console.log(productList);
	}
</script>

<style>
<!--
테이블 영역 -->body {
	color: #666;
	font: 14px/24px "Open Sans", "HelveticaNeue-Light",
		"Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
		"Lucida Grande", Sans-Serif;
}

table {
	border-collapse: separate;
	border-spacing: 0;
	width: 1300px;
	margin-left: 30px;
}

th, td {
	padding: 6px 15px;
}

th {
	background: #42444e;
	color: #fff;
	text-align: left;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:nth-child(even) td {
	background: #eaeaed;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}

$
background-color: #2A2E37 ; $search-bg-color: #242628 ; $icon-color: #00FEDE 
	 ; $transition: all .5s ease ; * {
	box-sizing: border-box;
}

body {
	background: $background-color;
}

.search {
	margin-left: 30px;
}

.jemok {
	margin-left: 30px;
}
<!--
페이지
 
영역--
>
</style>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
	<!--begin::App Wrapper-->

	<div class="app-wrapper">
		<!--begin::Header-->
		<div class="sideBar">
			<jsp:include page="sideBar.jsp" />
		</div>
		<div class="header">
			<jsp:include page="header.jsp" />

			<div class="content">
				<h1 class="jemok">productlist</h1>


				<!-- The form -->
				<form class="search" action="action_page.php">
						
						<div>
							<select class="searchConditions">
								<option>검색 조건</option>
								<option value="">제목</option>
								<option value="">작가</option>
								<option value="">내용</option>
								<option value="">장르</option>
							</select>
						</div>
					<section>
						
						<div class="searchBar">
							<input type="text" placeholder="검색어를 입력하세요.">
							<div class="searchIcon">
								<i class="fas fa-search"></i>
							</div>
							<div class="keyBoard">
								<i class="fas fa-keyboard"></i>
							</div>
							<div class="mic">
								<i class="fas fa-microphone"></i>
							</div>

						</div>

						
						

					</section>
					
					<div class="boardC">
							<select class="form-select sortByWhat" id="sortByWhat" style="width: 150px ">
								<option value="default">기본 정렬</option>
								<option value="salePrice">가격 높은순</option>
								<option value="inven">재고 많은순</option>
								<option value="zzim">찜 많은순</option>
								<option value="reviewCnt">리뷰 많은순</option>
								<option value="pubDate">최신순</option>
							</select>
						</div>
					
					<div class="boardControll">
							<select class="form-select pagingSize" id="pagingSize" style="width: 150px ">
								<option value="0">정렬 기준</option>
								<option value="10">10개씩 보기</option>
								<option value="20">20개씩 보기</option>
								<option value="30">30개씩 보기</option>
								<option value="40">40개씩 보기</option>
							</select>
						</div>
						
				</form>






				<table>
					<thead>
						<tr>
							<th>BookNo</th>
							<th>Title</th>
							<th>Author</th>
							<th>Publisher</th>
							<th>PubDate</th>
							<th>Genre</th>
							<th>Price</th>
							<th>SalePrice</th>
							<th>Inven</th>
							<th>ThumbNail</th>
							<th>Zzim</th>
							<th>ReviewCnt</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">
							<tr>
								<td>${product.bookNo}</td>
								<td>${product.title}</td>
								<td>${product.author}</td>
								<td>${product.publisher}</td>
								<td>${product.pubDate}</td>
								<td>${product.genre}</td>
								<td>${product.price}</td>
								<td>${product.salePrice}</td>
								<td>${product.inven}</td>
								<td><img src="${product.thumbNail}" width="50px"
									height="80"></td>
								<td>${product.zzim}</td>
								<td>${product.reviewCnt}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
			<div class="pagination justify-content-center" style="margin: 20px 0">

				<ul class="pagination">

					<c:if test="${param.pageNo > 1 }">
						<li class="page-item"><a class="page-link"
							href="/admin/productAdmin?pageNo=${pagingInfo.pageNo-1}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Previous</a></li>
					</c:if>

					<c:forEach var="i" begin="${pagingInfo.startPageNoCurBlock }"
						end="${pagingInfo.endPageNoCurBlock }">
						<c:choose>
							<c:when test="${param.pageNo == i }">
								<li class="page-item active" id="${i}"><a class="page-link"
									href="/admin/productAdmin?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" id="${i}"><a class="page-link"
									href="/admin/productAdmin?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${param.pageNo < pagingInfo.totalPageCnt}">
						<li class="page-item"><a class="page-link"
							href="/admin/productAdmin?pageNo=${pagingInfo.pageNo +1}&ra=${param.ra}">Next</a></li>
					</c:if>
				</ul>
			</div>


		</div>





	</div>


</body>
<style>
<!--
폰트 영역 --><!--페이지 영역-->.page-link {
	color: #999;
	background-color: #000;
	border-color: #444;
}

.page-item.active .page-link {
	z-index: 1;
	color: #ccc;
	font-weight: bold;
	background-color: #333;
	border-color: #444;
}

.page-link:focus, .page-link:hover {
	color: #ccc;
	background-color: #222;
	border-color: #444;
}

.searchConditions {
	border: 1px solid rgba(128, 128, 128, 0.2);
	border-radius: 22px;
	position: relative;
	display: flex;
	width: 150px;
	height: 44px;
}

<!--
검색 바 영역 -->* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

section div {
	margin: 0 auto;
	align-items: center;
}

.searchBar {
	position: relative;
	display: flex;
	width: 600px;
	height: 44px;
}

input {
	border: 1px solid rgba(128, 128, 128, 0.2);
	border-radius: 22px;
	width: 100%;
	height: 100%;
	text-align: center;
}

.searchIcon {
	position: absolute;
	top: 14px;
	left: 20px;
	opacity: 0.5;
}

.keyBoard {
	position: absolute;
	top: 14px;
	right: 45px;
	opacity: 0.8;
}

.mic {
	position: absolute;
	top: 14px;
	right: 20px;
	color: #5086ec;
}
</style>
</html>

