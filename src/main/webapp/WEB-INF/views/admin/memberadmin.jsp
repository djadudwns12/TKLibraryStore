<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b948e77617.js" crossorigin="anonymous"></script>
<!-- Load icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>회원관리페이지</title>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
	<div class="app-wrapper">
		<!--begin::Header-->
		<div class="sideBar">
			<jsp:include page="sideBar.jsp" />
		</div>
		<div class="header">
			<jsp:include page="header.jsp" />
			<div class="content">
				<h1 class="jemok">회원관리페이지</h1>
				
				<!-- The form -->
				<form class="search"style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: center;" action="" method="post">
					<div>
						<select class="searchType" name="searchType" id="searchType" style="text-align: center">
							<option value="-1">검색 조건</option>
							<option value="title">제목</option>
		
						</select>
					</div>
					<section>
						<div class="searchBar" style="margin-right: 20px;">
							<input type="text" class="searchWord" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요.">
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
						<input type="hidden" name="pageNo" value="${param.pageNo}" /> 
						<input type="hidden" name="pagingSize" value="${param.pagingSize}" />
					</section>
						<button type="submit" class="btn btn-outline-dark btn" onclick="return isValid()">검색</button>
				</form>
				<div style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: right; margin-bottom: 50px;">
					<div class="boardC" >
						<select class="form-select sortByWhat" id="sortByWhat" style="width: 150px ">
							<option value="default">기본 정렬</option>
							<option value="salePrice">가격 높은순</option>
							<option value="inven">재고 많은순</option>

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
				</div>

				<table>
					<thead>
						<tr>
							<th><input type="checkbox" onclick="selectAll(this)"> selectAll </th>
							<th>BookNo</th>
							<th>Title</th>
							<th>Author</th>
							<th>Publisher</th>
							
							<th><button type="button" class="btn btn-danger btn" id="delBtn" style="width:90px; font-size:small;" onclick="deleteProduct();" >0개 삭제</button></th> 
							<th><button type="button" class="btn btn-success btn" id="soldOutBtn" style="width:90px; font-size:small;" onclick="soldOutProduct();">0개 품절</button></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">
							<tr>
								<td><input type="checkbox" name="proCheck" value=${product.bookNo} onclick="updateButton()"></td>
								<td><img src="${product.thumbNail}" width="50px" height="80"></td>
								<td>${product.bookNo}</td>
								<td>${product.title}</td>
								<td>${product.author}</td>
								<td>${product.publisher}</td>

								<td colspan="3"><button class="btn btn-secondary btn" style="width:70px" onclick="location.href='/admin/modifyProduct?bookNo=${product.bookNo}'">수정</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="pagination justify-content-center" style="margin: 20px 0">
				<ul class="pagination">
					<c:if test="${param.pageNo > 1 }">
						<li class="page-item"><a class="page-link" href="/admin/memberadmin?pageNo=1&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}"> << </a></li>
						<li class="page-item"><a class="page-link" href="/admin/memberadmin?pageNo=${pagingInfo.pageNo-1} &pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Previous</a></li>
					</c:if>

					<c:forEach var="i" begin="${pagingInfo.startPageNoCurBlock }"
						end="${pagingInfo.endPageNoCurBlock }">
						<c:choose>
							<c:when test="${param.pageNo == i }">
								<li class="page-item active" id="${i}"><a class="page-link"
									href="/admin/memberadmin?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" id="${i}"><a class="page-link"
									href="/admin/memberadmin?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${param.pageNo < pagingInfo.totalPageCnt}">
						<li class="page-item"><a class="page-link"
							href="/admin/memberadmin?pageNo=${pagingInfo.pageNo+1}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Next</a></li>
						
						<li class="page-item"><a class="page-link"
							href="/admin/memberadmin?pageNo=${pagingInfo.totalPageCnt}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}"> >> </a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>



<style>
<!--
폰트 영역 -->
*{
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

.btn{
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
<!--테이블영역-->
body {
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


<script type="text/javascript">


</script>
</body>
</html>