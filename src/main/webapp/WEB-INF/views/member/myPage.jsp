<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지 | 회원정보수정</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Swiper CSS/JS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- Custom Styles -->
<style>
/* 전역 스타일 */
body {
	font-family: 'Cairo', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.input-group {
	display: flex;
	margin-bottom: 10px;
	align-items: center;
}

.input-group label {
	width: 150px;
}

.input-group span {
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 8px;
	width: 100%;
}

/* 이미지 슬라이더 */
.swiper-container {
	height: 340px;
	border: 5px solid silver;
	border-radius: 7px;
	box-shadow: 0 0 20px #ccc inset;
}

.swiper-slide {
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 80%;
	object-fit: cover;
	width: 300px;
	height: 400px;
	margin: 10px;
}

/* 레이아웃 */
.ex1 {
	display: flex;
	flex-direction: column;
	gap: 20px;
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
}

.ex1>div {
	flex: 1;
	width: 100%;
}

/* 테이블 스타일 */
table.table {
	width: 100%;
	border-collapse: collapse;
}

table.table th, table.table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

table.table th {
	background-color: #f4f4f4;
	font-weight: bold;
}

/* 반응형 디자인 */
@media screen and (max-width: 768px) {
	.ex1 {
		flex-direction: column;
		gap: 10px;
	}
	.swiper-container {
		height: auto;
	}
}

.userInfoDiv {
	padding: 50px;
}
</style>

<script type="text/javascript">
$(function() {
    // 이미지 슬라이더
    new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 30,
        slidesPerGroup: 3,
        loopFillGroupWithBlank: true,
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });

    // 마이페이지 네비게이션 설정
    mypageNav();

    // 최근본목록 보기
    recentViews();

});

function mypageNav() {
    const inputHTML = `
        <li onclick="showHide()"><h5><b>내정보보기<span class="showInfo">▼</span><span class="hideInfo">◀</span></b></h5></li>
        <li class="myInfo"><a href="/member/edit">ㅤ> 수정</a></li>
        <li class="myInfo"><a href="/member/myPage">ㅤ> 주소록 관리</a></li>
        <li><a href="#"><h5><b>찜</b></h5></a></li>
        <li><a href="/cart/cartPage"><h5><b>장바구니</b></h5></a></li>
        <li><a href="/member/OrderStatus"><h5><b>주문현황</b></h5></a></li>
        <li><a href="#"><h5><b>알림</b></h5></a></li>
        <li><a href="#"><h5><b>나의 회원등급</b></h5></a></li>
        <li><a href="#"><h5><b>나의 포인트 적립기록</b></h5></a></li>
        <li><a href="#"><h5><b>나의 리뷰</b></h5></a></li>
        <li><a href="/qa/qaList"><h5><b>1:1문의</b></h5></a></li>`;
    $('#categoryList').html(inputHTML);
}
// 마이페이지 최근본 목록을 불러오는 함수
function recentViews() {
	let userId = '${sessionScope.loginMember.userId}';
    let localBook = localStorage.getItem(userId+"_localbook");
}
	function mypageNav(){
		let inputHTML = `<li onclick="showHide()"><h5><b>내정보보기<span class="showInfo">▼</span><span class="hideInfo">◀</span></b></h5></li>
			<li class="myInfo"><a href="/member/edit">ㅤ> 수정</a></li>
			<li class="myInfo"><a href="/member/address">ㅤ> 주소록 관리</a></li>
			<li><a href="#"><h5><b>찜</b></h5></a></li>
			<li><a href="/cart/cartPage"><h5><b>장바구니</b></h5></a></li>
			 <li><a href="/member/OrderStatus"><h5><b>주문현황</b></h5></a></li>
			<li><a href="#"><h5><b>알림</b></h5></a></li>
			<li><a href="#"><h5><b>나의 회원등급</b></h5></a></li>
			<li><a href="#"><h5><b>나의 포인트 적립기록</b></h5></a></li>
			<li><a href="#"><h5><b>나의 리뷰</b></h5></a></li>
			<li><a href="/qa/qaList"><h5><b>1:1문의</b></h5></a></li>`;
		$('#categoryList').html(inputHTML);
	}
	function viewRecentlyBook() {
		let booklist = localStorage.getItem('localbook');
    let obj = JSON.parse(localBook);

    console.log(obj);
    
    if(localBook != null){
    	$.ajax({
            url: "/bookList/getRecentViews",
            type: "post",
            dataType: "json",
            contentType: 'application/json',  // 전송할 데이터의 형식
            //data: {'obj':obj},
            data : localBook ,
            success: function(data) {
//            	console.log(data);
                let inputHTML = '';

                $.each(data.booklist, function(i,row){
                    inputHTML += `<li class="list-group-item" onclick="location.href='/bookList/bookDetail?bookNo=\${row.bookNo}'">`;
                    inputHTML += '<img src="'+row.thumbNail+'" alt="Product Image" style="border-radius: 50%; width: 30px;">';
                    inputHTML += '<span>'+row.title+'</span>';
                    inputHTML += '</li>';
                });
                $('#recentlyView').html(inputHTML);
            },
    		error : function(data){
    			console.log('최근본목록 불러오기 실패')
    		}
        	
        });	
    }

    	

}

</script>
</head>

<body>
	<!--<c:import url="../header.jsp"></c:import>-->

	<div class="register-box userInfoDiv">
		<div class="ex1">
			<h6>찜목록</h6>
			<div class="swiper-container col">
				<div class="swiper-wrapper">
					<c:forEach var="zzim" items="${zzimList}">
						<div class="swiper-slide" onclick="location.href='/bookList/bookDetail?bookNo=${zzim.bookNo}'">
							<img src="${zzim.thumbNail}" alt="Product Image 1">
						</div>
					</c:forEach>
					<c:if test="${zzimList.size() == 0}">
						<div class="swiper-slide">
							<img src="/resources/images/TKlogo.png" alt="Product Image 1">
						</div>
					</c:if>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>

			<div class="pointlog col">
				<h6>최근적립내역</h6>
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>적립사유</th>
							<th>적립금</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pointLog" items="${pointList}">
							<tr>
								<td>${pointLog.pWhen}</td>
								<td>${pointLog.pWhy}</td>
								<td>${pointLog.pScore}</td>
							</tr>
						</c:forEach>
						<c:if test="${pointList.size() == 0}">
							<tr>
								<td colspan="3">데이터가 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>

		<div class="ex1">
			<!-- 최근 주문 내역 -->
			<div class="col">
				<h6>최근주문내역</h6>
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>주문 내용</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<!-- 주문 리스트 가져오기 -->
						<c:forEach var="order" items="${orderList}">
							<tr>
								<td>${order.pubDate}</td>
								<td>${order.title}</td>
								<td>${order.salePrice}</td>
							</tr>
						</c:forEach>
						<%-- <c:if test="${orderList.size() == 0}">
							<tr>
								<td colspan="3">데이터가 없습니다.</td>
							</tr>
						</c:if> --%>
					</tbody>
				</table>
			</div>
			<div class="ex1">

				<!-- 최근 본 상품 -->
				<div class="ex1">
					<h6>최근본상품</h6>
					<ul class="list-group" id="recentlyView">
						<li class="list-group-item">
							<!-- <img src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800"
								alt="Product Image" style="border-radius: 50%; width: 30px;"> -->
							<span>최근본책이 없습니다.</span> 
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
