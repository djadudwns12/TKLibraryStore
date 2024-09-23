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
	
	function isValid() {
		// 검색 버튼을 눌렀을 때 searchType == -1 이거나 , searchWord에 ''이면 
		// 검색어가 제대로 입력되지 않았으므로 백엔드 단으로 데이터를 넘기면 안된다
		
		let result = false;
		if($('#searchType').val() == -1 || $('#searchWord').val() == ''){
			alert('검색 조건과 검색어를 입력해 주세요');
			$('#searchType').focus();
			return result;
		} else {
			result = true;
		}
		
		return result;
		
	}
	
	function selectAll(selectAll)  {
		  const checkboxes 
		     = document.querySelectorAll('input[type="checkbox"]');
		  // forEach 메서드를 사용하여 모든 체크박스 요소를 순회하면서, 각 체크박스의 checked 속성을 selectAll.checked 값으로 설정합니다.
		  // 즉, '전체 선택' 체크박스가 체크되면 모든 체크박스도 체크되고, 선택 해제되면 모든 체크박스가 선택 해제됩니다.
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		  updateButton();
		}
	
	function deleteProduct() {
		let pro_check = document.querySelectorAll('input[name="proCheck"]:checked').length;
	    let delNo = [];
	    if (pro_check == 0) {
	        alert('하나 이상의 제품을 선택해주세요.');
	        return false;
	    }
	    if (confirm(pro_check+"개의 상품을 삭제하시겠습니까?")) {
	        
	        $('input:checkbox[name=proCheck]').each(function (index) {
	            if ($(this).is(":checked") == true) {
	                delNo = $(this).val();
	                console.log(delNo);
	                $.ajax({
	                    url: "/admin/deleteProduct", 
	                    type: "post", 
	                    dataType: "json", 
	                    data: {
	                      "delNo" : delNo
	                    },
	                    success: function (data) {	  
	                    	// 실행시키기 위해선 컨트롤러단에서 json데이터로 변환 후 데이터를 보내주어야한다.
	                    	  alert(pro_check+"개의 상품을 삭제했습니다.");
	                    	  location.href = '/admin/productAdmin';
	                        
	                      
	                    },
	                    error: function (data) {
	                      console.log(data);
	                     
	                    },
	                  });
	            }
	            
	        });
	        
	        
	    } else {
	        alert("취소");
	    }
	}
	
	function updateButton() {
        // 모든 체크박스를 가져오기
        let pro_check = document.querySelectorAll('input[name="proCheck"]:checked').length;
        // 버튼의 텍스트 업데이트
        document.getElementById('delBtn').innerText = pro_check+"개 삭제";
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
				<h1 class="jemok">ProductList</h1>


				<!-- The form -->
				<form class="search"style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: center;" 
				action="/admin/productAdmin" method="post">
						
						<div>
							<select class="searchType" name="searchType" id="searchType" style="text-align: center">
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
							<input type="text" class="searchWord"  name="searchWord" id="searchWord" placeholder="검색어를 입력하세요.">
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
						<input
					type="hidden" name="pageNo" value="${param.pageNo}" /> <input
					type="hidden" name="pagingSize" value="${param.pagingSize}" />
					</section>
						<button type="submit" class="btn btn-outline-dark btn" onclick="return isValid()">검색</button>
					</form>
					
					<div style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: right; margin-bottom: 50px;">
						<div class="boardC" >
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
					</div>
				






				<table>
					<thead>
						<tr>
							<th><input type="checkbox" onclick="selectAll(this)"> selectAll </th>
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
							
							<th><button type="button" class="btn btn-danger btn" id="delBtn" style="width:90px; font-size:small;" onclick="deleteProduct();" value="선택 삭제">선택 삭제</button></th> 

						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">
							<tr>
								<td><input type="checkbox" name="proCheck" value=${product.bookNo} onclick="updateButton()"></td>
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
								<td colspan="2"><button type="submit" class="btn btn-secondary btn" style="width:70px;">수정</button></td>
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
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}"> << </a></li>
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
							href="/admin/productAdmin?pageNo=${pagingInfo.pageNo+1}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Next</a></li>
						
						<li class="page-item"><a class="page-link"
							href="/admin/productAdmin?pageNo=${pagingInfo.totalPageCnt}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}"> >> </a></li>
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
</style>
</html>

