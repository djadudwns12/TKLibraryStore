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
	if (confirm(pro_check + "개의 상품을 발주하시겠습니까?")) {

		alert('발주성공');
		

	} else {
		alert("취소");
	}
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

function updateButton() {
	// 체크박스 선택된 개수 가져오기
	let pro_check = $('input[name="proCheck"]:checked').length;
	// 버튼 텍스트 업데이트
	$('#OrderingBtn').text(pro_check + "개 발주");
	
}

function ordering(title) {
	
	
	
	if (confirm(title + " 상품을 발주하시겠습니까?")) {

		alert('발주성공');
		

	} else {
		alert("취소");
	}
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
				<h1 class="jemok">RestockList</h1>




				<!-- 테이블의 가로길이 자동으로 줄여줌 -->
				<div style="overflow-x: auto;">
					<table>
						<thead>
							<tr>
								<th style="width: 100px;"><input type="checkbox" onclick="selectAll(this)">
									selectAll</th>
								<th style="width: 100px;">restockNo</th>
								<th style="width: 400px;">Title</th>
								<th style="width: 300px;">Author</th>
								<th style="width: 350px;">Timestamp</th>
								<th>Image</th>
								
								
								<th style="width: 150px;"><button type="button" class="btn btn-success btn"
										id="OrderingBtn" style="width: 90px; font-size: small;"
										onclick="soldOutProduct();">0개 발주</button></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="restock" items="${restockList}">
								<tr>
									<td><input type="checkbox" name="proCheck"
										value=${restock.restockNo} onclick="updateButton()"></td>
									<td>${restock.restockNo}</td>
									<td>${restock.title}</td>
									<td>${restock.author}</td>
									<td>${restock.timestamp}</td>
									<td><img src="${restock.image}" width="100px"
										height="150"></td>
									<td colspan="3"><button class="btn btn-secondary btn"
											style="width: 70px"
											onclick="ordering('${restock.title}')">발주</button></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
			<div class="pagination justify-content-center" style="margin: 20px 0">

				<ul class="pagination">

					<c:if test="${param.pageNo > 1 }">
						<li class="page-item"><a class="page-link"
							href="/admin/restockList?pageNo=1
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}">
								<< </a></li>
						<li class="page-item"><a class="page-link"
							href="/admin/restockList?pageNo=${pagingInfo.pageNo-1}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}">Previous</a></li>
					</c:if>

					<c:forEach var="i" begin="${pagingInfo.startPageNoCurBlock }"
						end="${pagingInfo.endPageNoCurBlock }">
						<c:choose>
							<c:when test="${param.pageNo == i }">
								<li class="page-item active" id="${i}"><a class="page-link"
									href="/admin/restockList?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" id="${i}"><a class="page-link"
									href="/admin/restockList?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pagingInfo.pageNo < pagingInfo.totalPageCnt}">
						<li class="page-item"><a class="page-link"
							href="/admin/restockList?pageNo=${pagingInfo.pageNo+1}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}">Next</a></li>

						<li class="page-item"><a class="page-link"
							href="/admin/restockList?pageNo=${pagingInfo.totalPageCnt}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}">
								>> </a></li>
					</c:if>
				</ul>
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


</style>
</html>

