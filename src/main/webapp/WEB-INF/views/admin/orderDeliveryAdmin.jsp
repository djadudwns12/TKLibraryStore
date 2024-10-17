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
	
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>


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





/* book-info-container를 기본적으로 숨기기 */
.book-info-container {
  display: none; /* 기본적으로 보이지 않게 설정 */
  position: absolute; /* 테이블 크기에 영향을 주지 않도록 절대 위치 설정 */
  background-color: white; /* 배경을 하얗게 설정 */
  border: 1px solid #ddd; /* 테두리 추가 */
  padding: 10px; /* 내부 여백 추가 */
  z-index: 10; /* 다른 요소들보다 위에 나타나도록 설정 */
  box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가로 구분 강조 */
  margin-left: 140px;
}

/* td에 마우스를 올렸을 때 book-info-container 보이기 */
td:hover .book-info-container {
  display: block; /* 마우스를 올리면 보이도록 설정 */
}

/* 책 정보를 테이블처럼 정리 */
.book-info {
  display: flex; /* 책 이미지와 정보를 수평으로 나란히 정렬 */
  align-items: center; /* 수직 정렬 중앙에 맞춤 */
  border-bottom: 1px solid #ddd; /* 각 책 정보 항목 사이에 구분선 추가 */
  padding: 5px 0; /* 각 항목에 여백 추가 */
}

.book-thumbnail img {
  width: 50px; /* 썸네일 이미지 크기 설정 */
  height: auto;
  margin-right: 10px; /* 이미지와 책 정보 사이에 간격 추가 */
}

.book-details {
  display: flex;
  flex-direction: column; /* 책 번호와 수량을 세로로 나열 */
}

#cancelBtn {
	margin-left: 35px;
	margin-bottom: 5px;
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
				<h1 class="jemok">OrderList</h1>


				<!-- The form -->
				<form class="search"
					style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: center;"
					action="/admin/orderDeliveryAdmin" method="post">

					<div>
						<select class="searchType" name="searchType" id="searchType"
							style="text-align: center">
							<option value="-1">검색 조건</option>
							<option value="orderWho">사용자</option>
							<option value="orderName">제품정보</option>
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


						</div>
						<input type="hidden" name="pageNo" value="${param.pageNo}" /> <input
							type="hidden" name="pagingSize" value="${param.pagingSize}" />
					</section>
					<button type="submit" class="btn btn-outline-dark btn"
						onclick="return isValid()">검색</button>
				</form>
			

				<div
					style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: right; margin-bottom: 50px;">

					<div class="boardC">
						<select class="form-select sortByWhat" id="sortByWhat"
							style="width: 150px">
							<option value="default">기본 정렬</option>
							<option value="orderDate">주문 일자순</option>
							<option value="totalPay">주문 금액순</option>
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






				<div style="overflow-x: auto;">
				<button type="button" class="btn btn-danger btn"
										id="cancelBtn" style="width: 120px; font-size: small;"
										onclick="cancelSelected();">0개 주문취소</button>
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" onclick="selectAll(this)">
									selectAll</th>
								<th>주문자</th>
								<th>주문일자</th>
								<th>주문상태</th>
								<th>배송지</th>
								<th>제품정보</th>
								<th>사용포인트</th>
								<th>결제금액</th>
								
					
							
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${odInfo}">
								<tr>
									<td><input type="checkbox" name="proCheck"
										value="${order.orderNo}" onclick="updateButton()"></td>
									<td>${order.orderWho}</td>
									<td>${order.orderDate}</td>
									<td class="orderStatus" data-order-no="${order.orderNo}">${order.orderStatus}</td>
									<td>${order.orderAddress}</td>
									<td>${order.orderName}
									  <div class="book-info-container">
									    <c:forEach var="book" items="${order.orderBooks}">
									      <div class="book-info">
									        <div class="book-thumbnail">
									          <img src="${book.thumbNail}" alt="Book Thumbnail">
									        </div>
									        <div class="book-details">
									          <span>책 번호: ${book.bookNo}</span><br>
									          <span>수량: ${book.qty}</span>
									        </div>
									      </div>
									    </c:forEach>
									  </div>
									</td>



									<td>${order.usePoint}</td>
									<td>${order.totalPay}</td>
								
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
							href="/admin/orderDeliveryAdmin?pageNo=1
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">
								<< </a></li>
						<li class="page-item"><a class="page-link"
							href="/admin/orderDeliveryAdmin?pageNo=${pagingInfo.pageNo-1}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Previous</a></li>
					</c:if>

					<c:forEach var="i" begin="${pagingInfo.startPageNoCurBlock }"
						end="${pagingInfo.endPageNoCurBlock }">
						<c:choose>
							<c:when test="${param.pageNo == i }">
								<li class="page-item active" id="${i}"><a class="page-link"
									href="/admin/orderDeliveryAdmin?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" id="${i}"><a class="page-link"
									href="/admin/orderDeliveryAdmin?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${pagingInfo.pageNo < pagingInfo.totalPageCnt}">
						<li class="page-item"><a class="page-link"
							href="/admin/orderDeliveryAdmin?pageNo=${pagingInfo.pageNo+1}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Next</a></li>

						<li class="page-item"><a class="page-link"
							href="/admin/orderDeliveryAdmin?pageNo=${pagingInfo.totalPageCnt}
						&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">
								>> </a></li>
					</c:if>
				</ul>
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
							<button type="button" class="btn-close close" data-bs-dismiss="modal"></button>
						</div>

						<!-- Modal body -->
						<div class="modal-body" >
							<div style="display:flex;">
								<input type="text" style="width:330px; margin-right: 20px;"placeholder="검색할 책을 입력하세요." id="searchValue" />
								<button  class="btn btn-outline-dark btn" id="searchBtn" >검색</button>
							</div>
							<ul id="restockList" >
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



		</div>
	</div>


<script>

	function cancelSelected() {
	    let selectedOrders = [];
	    
	    // 체크된 체크박스에서 각 주문번호와 관련된 요소를 배열로 수집
	    $('input[name="proCheck"]:checked').each(function() {
	        let orderNo = $(this).val();  // 체크된 체크박스의 value (주문번호)
	        let element = $(this).closest('tr').find('.orderStatus');  // 해당 주문의 상태를 표시하는 element
	        
	        // 주문번호와 element를 객체로 저장
	        selectedOrders.push({
	            orderNo: orderNo,
	            element: element
	        });
	    });
	
	    // 선택된 주문이 있을 때 cancel 호출
	    if (selectedOrders.length > 0) {
	        cancel(selectedOrders);  // 선택된 주문 정보를 cancel 함수에 전달
	    } else {
	        alert("취소할 주문을 선택하세요.");
	    }
	}



	function cancel(elementOrOrders, orderNo) {
	    let orderNos = [];  // 서버로 보낼 주문 번호 배열

	    // 단일 항목일 경우
	    if (!Array.isArray(elementOrOrders)) {
	        
	        orderNos.push(orderNo);  

	    } else {
	        // 여러 주문인 경우 (배열로 주문 번호들이 전달됨)
	        elementOrOrders.forEach(function(order) {
	            orderNos.push(order.orderNo); 
	        });
	    }
	    
	    
	    
	    $.ajax({
	        url: '/admin/cancelOrders',  // 서버에서 취소 처리할 엔드포인트
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(orderNos),
	        success: function(response) {
	            alert(orderNos.length + "개의 주문이 취소 완료되었습니다.");
	            console.log(response);  // 서버에서 받은 응답 처리
	            
	            
	            if (!Array.isArray(elementOrOrders)) {
	    	        $(elementOrOrders).text("취소완료");  
	    	        $(elementOrOrders).css({
	    	            'color': 'blue',
	    	            'font-weight': 'bold',
	    	            'cursor': 'default'
	    	        });
	    	    } else {
	    	        // 여러 주문인 경우 (배열로 주문 번호들이 전달됨)
	    	        elementOrOrders.forEach(function(order) {  	      
	    	            $(order.element).text("취소완료");  
	    		        $(order.element).css({
	    		            'color': 'blue',
	    		            'font-weight': 'bold',
	    		            'cursor': 'default'
	    		        });
	    	           
	    	            
	    	        });
	    	    }
	        },
	        error: function(response) {
	            console.error(response);
	            alert("취소 처리 중 오류가 발생했습니다. 다시 시도하세요");
	        }
	    });

	    
	}

	$(function() {
	    console.log($('.orderStatus').text());
	    $('.orderStatus').each(function() {
	        // 각 .orderStatus 요소에 대해 실행
	        var orderStatusText = $(this).text().trim();

	        if (orderStatusText == "취소요청") {
	            // 글자 색상 및 굵기 설정
	            $(this).css({
	                'color': 'red', // 글자 색상 빨간색으로 설정
	                'font-weight': 'bold', // 글자를 굵게 설정
	                'cursor': 'pointer'
	            });

	            let orderNo = $(this).data('order-no');
	            // onclick 이벤트 추가 (prop에서 콜론 추가)
	            $(this).attr("onclick", "cancel(this,'" + orderNo + "')");
	        }

	        if (orderStatusText == "취소완료") {
	            $(this).css({
	                'color': 'blue',
	                'font-weight': 'bold',
	                'cursor': 'default'
	            });
	        }

	    });
	});

		

		
		
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

							location.href = '/admin/orderDeliveryAdmin?pagingSize='
									+ $(this).val()
									+ '&pageNo=1&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}';
						});

		$('.sortByWhat')
				.change(
						function() {
							console.log($(this).val());

							location.href = '/admin/orderDeliveryAdmin?ra='
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
                $("#recentSearchesList").append('<li><a href= "/admin/orderDeliveryAdmin?searchType=title&searchWord=' + keyword + '";>' + keyword + '</a></li>');
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
		                	popularList.append('<li><a href= "/admin/orderDeliveryAdmin?searchType=title&searchWord=' + keyword + '";>' +  index + "　　" + keyword + '</a></li>');
		                	
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
		                		 $("#searchRecommend").append('<li style="margin-bottom:10px;"><a href= "/admin/orderDeliveryAdmin?searchType=title&searchWord=' + title + '";>' + title + '</a></li>');
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
							location.href = '/admin/orderDeliveryAdmin?ra=${param.ra}&pageNo=${param.pageNo}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}';

						},
						error : function(data) {
							console.log(data);

						},
					});

		} else {
			alert("취소");
		}
	}

	// =========================== 기능 삭제 예정
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
							location.href = '/admin/orderDeliveryAdmin?ra=${param.ra}&pageNo=${param.pageNo}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}';

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
		$('#cancelBtn').text(pro_check + "개 주문취소");
		
	}
	
	
	
	
		
		
</script>

</body>
</html>

