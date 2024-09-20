<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>장바구니</title>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



<style>
/* 모든 td에 공통 스타일 적용 (cart.thumbNail 제외) */
.common-td {
	text-align: center !important;
	vertical-align: middle !important;
}

/* 이미지 td 스타일 (다르게 적용 가능) */
.thumbnail {
	width: 80px;
}
</style>
</head>
<script>
function toggleSelectAll(source) {
    const checkboxes = document.querySelectorAll('.selectItem');
    checkboxes.forEach(checkbox => {
        checkbox.checked = source.checked;
    });
    updateTotals();  // 체크 상태 변경 후 합계 업데이트
}

function updateTotals() {
    let totalPrice = 0;
    let totalSalePrice = 0;
    let totalPay = 0;
    let totalPoint = 0;

    const selectedItems = document.querySelectorAll('.selectItem:checked');
    selectedItems.forEach(item => {
        const price = parseInt(item.getAttribute('data-price'));
        const salePrice = parseInt(item.getAttribute('data-salePrice'));
        const qty = parseInt(item.getAttribute('data-qty'));

        totalPrice += price * qty;
        totalSalePrice += (price - salePrice) * qty;
        totalPay += salePrice * qty;
        totalPoint += salePrice * 0.02 * qty;
    });

    document.getElementById('totalPrice').innerText = totalPrice.toLocaleString() + "원";
    document.getElementById('totalSalePrice').innerText = totalSalePrice.toLocaleString() + "원";
    document.getElementById('totalPay').innerText = totalPay.toLocaleString() + "원";
    document.getElementById('totalPoint').innerText = totalPoint.toLocaleString() + "P";
}

document.addEventListener('DOMContentLoaded', () => {
    // Select all checkboxes by default
    const selectAllCheckbox = document.getElementById('selectAll');
    selectAllCheckbox.checked = true;
    toggleSelectAll(selectAllCheckbox);
});
</script>

<body>

	<c:import url="../header.jsp"></c:import>

	<div class="container">

		<table class="table table-hover">
			<thead>
				<tr style="text-align: center;">
					<th>
						<!-- 체크박스 헤더 추가 --> <input type="checkbox" id="selectAll"
						onclick="toggleSelectAll(this)" />
					</th>
					<th>이미지</th>
					<th>제목</th>
					<th>판매가</th>
					<th>할인가</th>
					<th>수량</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cart" items="${cartList}">

					<tr>
						<!-- 각 항목에 체크박스 추가 -->
						<td class="common-td"><input type="checkbox"
							class="selectItem" onclick="updateTotals()"
							data-price="${cart.price}" data-salePrice="${cart.salePrice}"
							data-qty="${cart.qty}"></td>
						<td class="thumbnail"><img src="${cart.thumbNail}"
							style="width: 70px;" /></td>
						<td class="common-td">${cart.title}</td>
						<td class="common-td">
							<div>
								<fmt:formatNumber value="${cart.price}" type="number"
									groupingUsed="true" />
								원
							</div>
						</td>
						<td class="common-td">
							<div>
								<fmt:formatNumber value="${cart.salePrice}" type="number"
									groupingUsed="true" />
								원
							</div>
						</td>
						<td class="common-td">
							<div>${cart.qty}</div>
						</td>
						<td class="common-td"><img
							src="/resources/images/cart_delete.png" width=30px;
							onclick="showDeleteModal();"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<table class="table table-hover" name="totalExpectedPayment">
			<thead>
				<tr style="text-align: center;">
					<th>총 상품금액</th>
					<th></th>
					<th>배송비</th>
					<th></th>
					<th>총 할인금액</th>
					<th></th>
					<th>결제예정금액</th>
					<th>적립예정포인트</th>
				</tr>
			</thead>
			<tbody>
				<!-- 총 합계를 저장할 변수 선언 -->
				<c:set var="totalPrice" value="0" />
				<c:set var="totalSalePrice" value="0" />
				<c:set var="totalPay" value="0" />
				<c:set var="totalPoint" value="0" />
				<c:forEach var="cart" items="${cartList}">
					<!-- 반복문을 돌면서 totalPrice에 cart.price 값을 더함 -->
					<c:set var="totalPrice"
						value="${totalPrice + cart.price * cart.qty}" />
					<c:set var="totalSalePrice"
						value="${totalSalePrice + (cart.price*cart.qty - cart.salePrice*cart.qty)}" />
					<c:set var="totalPay"
						value="${totalPay + cart.salePrice * cart.qty}" />
					<c:set var="totalPoint"
						value="${totalPoint + cart.salePrice * cart.qty * 0.02}" />
				</c:forEach>
				<!-- 최종 합계를 출력 -->
				<tr>
					<td class="common-td"><strong id="totalPrice"><fmt:formatNumber
								value="${totalPrice}" type="number" groupingUsed="true" />원</strong></td>
					<td class="common-td"><strong>-</strong></td>
					<td class="common-td"><strong>0원</strong></td>
					<td class="common-td"><strong>-</strong></td>
					<td class="common-td"><strong id="totalSalePrice"><fmt:formatNumber
								value="${totalSalePrice}" type="number" groupingUsed="true" />원</strong></td>
					<td class="common-td"><strong>=</strong></td>
					<td class="common-td"><strong id="totalPay"><fmt:formatNumber
								value="${totalPay}" type="number" groupingUsed="true" />원</strong></td>
					<td class="common-td"><strong id="totalPoint"><fmt:formatNumber
								value="${totalPoint}" type="number" groupingUsed="true" />P</strong></td>
				</tr>
			</tbody>

		</table>
		<div style="display: flex; justify-content: center; align-items: center;">
			<button type="button" class="btn btn-success">결제하기</button>
		</div>



	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">MiniProject</h4>
					<button type="button" class="btn-close modalCloseBtn"
						data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body"></div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-info"
						onclick="location.href='/cart/deleteCart?cartNo=${param.cartNo}';">삭제</button>
					<button type="button" class="btn btn-danger modalCloseBtn"
						data-bs-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>




	<c:import url="../footer.jsp"></c:import>


</body>
</html>