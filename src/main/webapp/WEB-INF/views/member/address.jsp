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
	
	// 배송지 추가
	function insertAddress() {
	    // 모달 띄우기
	    var addModal = new bootstrap.Modal(document.getElementById('addAddressModal'));
	    addModal.show();
	}
	
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
	
	// 수정 모달창 띄우기
	function editAddress(addressKey, receiverName, receiverPhone, address, request, addressId) {
	    // address를 ','로 분리
	    const addressParts = address.split(',');
	    const keyword = addressParts[0]; // 키워드 부분
	    const addressDetail = addressParts[1] ? addressParts[1].trim() : ''; // 상세 주소 부분

	    // 각 필드에 데이터 채우기
	    document.getElementById('address_key').value = addressKey;
	    document.getElementById('receiver_name').value = receiverName;
	    document.getElementById('receiver_phone').value = receiverPhone;
	    document.getElementById('address_keyword').value = keyword; // 키워드를 입력 필드에 세팅
	    document.getElementById('address_detail').value = addressDetail; // 상세 주소를 입력 필드에 세팅
	    document.getElementById('request').value = request;

	    // 모달 띄우기
	    var editModal = new bootstrap.Modal(document.getElementById('editAddressModal'));
	    editModal.show();
	}
	

</script>

</head>

<body>
	<c:import url="../header.jsp"></c:import>

	<div class="container">
		<div onclick="insertAddress();"
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
								onclick="editAddress('${address.address_key}', '${address.receiver_name}', '${address.receiver_phone}', '${address.address}', '${address.request}', ${address.addressId});">수정</div>
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
								onclick="editAddress('${address.address_key}', '${address.receiver_name}', '${address.receiver_phone}', '${address.address}', '${address.request}', ${address.addressId});">수정</div>
							<div class="badge rounded-pill bg-danger" style="color: white;"
								onclick="removeAddress(${address.addressId});">삭제</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>


		<!-- 모달 HTML 구조 -->
		<div class="modal fade" id="editAddressModal" tabindex="-1"
			aria-labelledby="editAddressModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title" id="editAddressModalLabel">주소 수정</h6>
					</div>
					<div class="modal-body">
						<!-- 수정 폼 -->
						<form class="form-container">
							<div class="mb-3">
								<label for="address_key" class="form-label">배송지명</label> <input
									type="text" class="form-control" id="address_key"
									name="address_key" required>
							</div>
							<div class="mb-3">
								<label for="receiver_name" class="form-label">받는 분</label> <input
									type="text" class="form-control" id="receiver_name"
									name="receiver_name" required>
							</div>
							<div class="mb-3">
								<label for="receiver_phone" class="form-label">전화번호</label> <input
									type="text" class="form-control" id="receiver_phone"
									name="receiver_phone" required>
							</div>
							<div class="mb-3">
								<label for="address_keyword" class="form-label">도로명/지번
									주소</label> <input type="text" class="form-control" id="address_keyword"
									name="address_keyword" required>
							</div>

							<!-- The Modal -->
							<div id="addrModal" class="modal">
								<!-- Modal content -->
								<div class="modal-content">
									<span class="close">&times;</span>
									<div id="list"></div>
									<!-- Pagination Controls -->
									<div id="pagination" class="pagination">
										<!-- Pagination buttons will be added dynamically here -->
									</div>
								</div>
							</div>

							<div class="mb-3">
								<label for="address_detail" class="form-label">상세 주소</label> <input
									type="text" class="form-control" id="address_detail"
									name="address_detail" required>
							</div>
							<div class="mb-3">
								<label for="request" class="form-label">요청사항</label> <input
									type="text" class="form-control" id="request" name="request">
							</div>
							<div class="modalBtns" style="text-align: center;">
								<button type="submit" class="btn btn-primary">저장</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>



		<!-- 배송지 추가 모달 -->
		<div class="modal fade" id="addAddressModal" tabindex="-1"
			aria-labelledby="addAddressModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title" id="addAddressModalLabel">새 배송지 추가</h6>
					</div>
					<div class="modal-body">
						<form class="form-container">
							<div class="mb-3">
								<label for="new_address_key" class="form-label">배송지명</label> <input
									type="text" class="form-control" id="new_address_key"
									name="new_address_key" required>
							</div>
							<div class="mb-3">
								<label for="new_receiver_name" class="form-label">받는 분</label> <input
									type="text" class="form-control" id="new_receiver_name"
									name="new_receiver_name" required>
							</div>
							<div class="mb-3">
								<label for="new_receiver_phone" class="form-label">전화번호</label>
								<input type="text" class="form-control" id="new_receiver_phone"
									name="new_receiver_phone" required>
							</div>
							<div class="mb-3">
								<label for="new_address_keyword" class="form-label">도로명/지번
									주소</label> <input type="text" class="form-control"
									id="new_address_keyword" name="new_address_keyword" required>
							</div>
							<div class="mb-3">
								<label for="new_address_detail" class="form-label">상세 주소</label>
								<input type="text" class="form-control" id="new_address_detail"
									name="new_address_detail" required>
							</div>
							<div class="mb-3">
								<label for="new_request" class="form-label">요청사항</label> <input
									type="text" class="form-control" id="new_request"
									name="new_request">
							</div>
							<div class="modalBtns" style="text-align: center;">
								<button type="submit" class="btn btn-primary">저장</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>