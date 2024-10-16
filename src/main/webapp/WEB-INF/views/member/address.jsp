<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지 | 주소록 관리</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>
/* 전역 스타일 */
body {
	font-family: 'Cairo', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
</style>
<script type="text/javascript">
	$(function() {	
		// 마이페이메뉴 수정
		mypageNav();
	});
	
	// nav
	function mypageNav(){
		let inputHTML = `<li onclick="showHide()"><h5><b>내정보보기<span class="showInfo">▼</span><span class="hideInfo">◀</span></b></h5></li>
			<li class="myInfo"><a href="/member/edit">ㅤ> 수정</a></li>
			<li class="myInfo"><a href="/member/address">ㅤ> 주소록 관리</a></li>
			<li><a href="#"><h5><b>찜</b></h5></a></li>
			<li><a href="/cart/cartPage"><h5><b>장바구니</b></h5></a></li>
			<li><a href="#"><h5><b>알림</b></h5></a></li>
			<li><a href="#"><h5><b>나의 회원등급</b></h5></a></li>
			<li><a href="#"><h5><b>나의 포인트 적립기록</b></h5></a></li>
			<li><a href="#"><h5><b>나의 리뷰</b></h5></a></li>
			<li><a href="/qa/qaList"><h5><b>1:1문의</b></h5></a></li>`;
		$('#categoryList').html(inputHTML);
	}
	
	function editAddress(addressId) {
		$.ajax({
            type: 'POST', // 요청 방식 (GET, POST 등)
            url: '/member/modifyAddress', // 요청할 컨트롤러의 URL
            data: { addressId: addressId }, // 전송할 데이터 (JSON 형식)
            success: function(response) {
                // 만약 주소 수정 페이지로 바로 이동하고 싶다면
                window.location.href = '/member/modifyAddress?addressId=' + addressId;
            },
            error: function(error) {
                // 요청 실패 시 처리
                alert('수정 요청에 실패했습니다.');
                console.error(error);
            }
        });
	}

</script>

</head>

<body>
	<c:import url="../header.jsp"></c:import>

	<div class="container">
		<div onclick="location.href='/member/insertAddress'"
			style="display: flex; justify-content: flex-end; align-items: center;">
			<img src="/resources/images/plus.png" style="width: 20px;" /> <span>배송지
				추가하기</span>
		</div>
		<div class="addressList">
			<div class="NAddress">
				<!-- isDefault가 'N'인 항목을 먼저 출력 -->
				<c:forEach var="address" items="${address}">
					<c:if test="${address.isDefault == 'N'}">
						<div class="AddressName">
							<strong>${address.address_key}</strong> <span
								class="badge rounded-pill bg-primary" style="color: white;">기본
								배송지</span>
						</div>
						<div class="detailAddress">
							<div>${address.receiver_name}/${address.receiver_phone}</div>
							<div>${address.address}</div>
							<div>${address.request}</div>
						</div>
						<div class="btn">
							<div class="badge rounded-pill bg-success" style="color: white;"
								onclick="editAddress(${address.addressId});">수정</div>
							<div class="badge rounded-pill bg-danger" style="color: white;"
								onclick="removeAddress(${address.addressId});">삭제</div>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div class="YAddress">
				<!-- isDefault가 'Y'인 항목을 그 다음에 출력 -->
				<c:forEach var="address" items="${address}">
					<c:if test="${address.isDefault == 'Y'}">
						<div class="AddressName">
							<strong>${address.address_key}</strong> <span
								class="badge rounded-pill bg-secondary" style="color: white;">일반
								배송지</span>
						</div>
						<div class="detailAddress">
							<div>${address.receiver_name}/${address.receiver_phone}</div>
							<div>${address.address}</div>
							<div>${address.request}</div>
						</div>
						<div class="btn">
							<div class="badge rounded-pill bg-success" style="color: white;"
								onclick="editAddress(${address.addressId});">수정</div>
							<div class="badge rounded-pill bg-danger" style="color: white;"
								onclick="removeAddress(${address.addressId});">삭제</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>


	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>