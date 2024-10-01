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
<!-- Load icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	$(function() {

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

		
		<!-- 최근 검색어 기능 구현 -->
		
		// 모달을 숨기거나 보여주는 기능
        var modal = $("#recentSearchModal");
        var searchInput = $("#searchWord");

        // 검색창 클릭 시 모달 띄우기
        searchInput.on("click", function () {
            // 검색창의 위치와 크기 정보 가져오기
            var offset = searchInput.offset();
            var width = searchInput.outerWidth();

            // 모달을 검색창 바로 아래로 위치시키기
            modal.css({
                top: offset.top + searchInput.outerHeight(),  // 검색창 바로 아래
                left: offset.left,  // 검색창의 왼쪽에 맞추기
                width: width  // 검색창과 동일한 너비로 설정
            }).show();  // 모달 열기

            //loadRecentSearches();  // 최근 검색 기록을 가져오는 함수 호출
        });

        // 모달 닫기 버튼 클릭 시 모달 닫기
        $(".close").on("click", function () {
            modal.hide();  // 모달 닫기
        });

        // 모달 외부 클릭 시 모달 닫기
        $(window).on("click", function (event) {
            if (!$(event.target).closest("#recentSearchModal, #searchWord").length) {
                modal.hide();  // 모달 닫기
            }
        });

        function getCookie(name) {
            let value = "; " + document.cookie;
            let parts = value.split("; " + name + "=");
            if (parts.length === 2) return parts.pop().split(";").shift();
        }

        // 최근 검색어 쿠키 가져오기
        let recentSearch = getCookie("recentSearch");
        if (recentSearch) {
            let searchArray = decodeURIComponent(recentSearch).split(',');

            // 검색어 목록 표시
            searchArray.forEach(function(keyword) {
                $("#recentSearchesList").append('<li class="recentSearchs"><a href= "/admin/productAdmin?searchType=title&searchWord=' + keyword + '";>' + keyword + '</a></li>');
            });
        }
    });
	

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
	width: 1600px;
	margin-left: 30px;
	text-align: center;
}

th, td {
	padding: 6px 15px;
}

th {
	background: #42444e;
	color: #fff;
	text-align: center;
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
	text-align: center;
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

/* 모달 스타일 */
.modal {
	display: none; /* 기본적으로 숨김 */
	position: absolute; /* 검색창 아래 고정 */
	z-index: 1;
	width: 100%; /* 검색창과 동일한 가로 길이 */
	max-height: 300px; /* 모달 최대 높이 설정 */
	overflow-y: auto; /* 스크롤 가능 */
}

/* 모달 내부 콘텐츠 스타일 */
.modal-content {
	padding: 10px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
}

ul {
	list-style-type: none;
	padding: 0;
}

li {
	padding: 5px 0;
}

.content-top {
	display: flex;
}

/* 최근 검색어 */
a:link {
	color: 5C636A;
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
				<h1 class="jemok">ProductList</h1>


				<!-- The form -->
				<form class="search"
					style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: center;"
					action="/admin/productAdmin" method="post">

					<div>
						<select class="searchType" name="searchType" id="searchType"
							style="text-align: center">
							<option value="-1">검색 조건</option>
							<option value="title">제목</option>
							<option value="author">작가</option>
							<option value="introduction">내용</option>
							<option value="genre">장르</option>
							<option value="publisher">출판사</option>
						</select>
					</div>
					<section>

						<div class="searchBar" style="margin-right: 20px;">
							<input type="text" class="searchWord" name="searchWord"
								id="searchWord" placeholder="검색어를 입력하세요." autocomplete="off">
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
						<input type="hidden" name="pageNo" value="${param.pageNo}" /> <input
							type="hidden" name="pagingSize" value="${param.pagingSize}" />
					</section>
					<button type="submit" class="btn btn-outline-dark btn"
						onclick="return isValid()">검색</button>
				</form>
				<div style="display: flex; margin-left: 50px; width: 200px;">
					<button type="button" class="btn btn-outline-dark btn"
						onclick="location.href='/admin/registProduct';">Add
						Product</button>
				</div>

				<div
					style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: right; margin-bottom: 50px;">

					<div class="boardC">
						<select class="form-select sortByWhat" id="sortByWhat"
							style="width: 150px">
							<option value="default">기본 정렬</option>
							<option value="salePrice">가격 높은순</option>
							<option value="inven">재고 많은순</option>
							<option value="zzim">찜 많은순</option>
							<option value="reviewCnt">리뷰 많은순</option>
							<option value="pubDate">최신순</option>
						</select>
					</div>

					<div class="boardControll">
						<select class="form-select pagingSize" id="pagingSize"
							style="width: 150px">
							<option value="0">정렬 기준</option>
							<option value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
							<option value="40">40개씩 보기</option>
						</select>
					</div>
				</div>







				<table>
					<thead>
						<tr>
							<th><input type="checkbox" onclick="selectAll(this)">
								selectAll</th>
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

							<th><button type="button" class="btn btn-danger btn"
									id="delBtn" style="width: 90px; font-size: small;"
									onclick="deleteProduct();">0개 삭제</button></th>
							<th><button type="button" class="btn btn-success btn"
									id="soldOutBtn" style="width: 90px; font-size: small;"
									onclick="soldOutProduct();">0개 품절</button></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">
							<tr>
								<td><input type="checkbox" name="proCheck"
									value=${product.bookNo } onclick="updateButton()"></td>
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
								<td colspan="3"><button class="btn btn-secondary btn"
										style="width: 70px"
										onclick="location.href='/admin/modifyProduct?bookNo=${product.bookNo}'">수정</button></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
			<div class="pagination justify-content-center" style="margin: 20px 0">

				<ul class="pagination">

					<c:if test="${param.pageNo > 1 }">
						<li class="page-item"><a class="page-link"
							href="/admin/productAdmin?pageNo=1
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">
								<< </a></li>
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

					<c:if test="${pagingInfo.pageNo < pagingInfo.totalPageCnt}">
						<li class="page-item"><a class="page-link"
							href="/admin/productAdmin?pageNo=${pagingInfo.pageNo+1}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Next</a></li>

						<li class="page-item"><a class="page-link"
							href="/admin/productAdmin?pageNo=${pagingInfo.totalPageCnt}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">
								>> </a></li>
					</c:if>
				</ul>
			</div>

			<!--  모달 영역 -->
			<div id="recentSearchModal" class="modal">
				<div class="modal-content">
					<div class="content-top">
						<h4>최근 검색 기록</h4>
						<span class="close" style="margin-left: 400px;">&times;</span>
					</div>
					<ul id="recentSearchesList">
						<!-- 검색 기록이 동적으로 삽입될 곳 -->

					</ul>
				</div>
			</div>

		</div>
	</div>


</body>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap"
	rel="stylesheet">
<style>
<!--
폰트 영역 -->* {
	font-family: "Gowun Batang", serif;
	font-weight: 400;
	font-style: normal;
}

.page-item .page-link {
	color: #999;
	background-color: #343a40;
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

.searchType {
	border: 1px solid rgba(128, 128, 128, 0.2);
	border-radius: 22px;
	position: relative;
	display: flex;
	width: 150px;
	height: 44px;
}

.btn {
	border: 1px solid rgba(128, 128, 128, 0.2);
	border-radius: 22px;
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

