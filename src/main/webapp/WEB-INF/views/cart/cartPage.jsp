<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(function() {
		//showCartList();
	});
</script>

<body>

	<c:import url="../header.jsp"></c:import>

	<div class="container">

		<div class="outputCartArea">${cartList}</div>

		<table class="table table-hover">
			<thead>
				<tr style="text-align: center;">
					<th>
						<!-- 체크박스 헤더 추가 --> <input type="checkbox" id="selectAll" />
					</th>
					<th>이미지</th>
					<th>제목</th>
					<th>원가</th>
					<th>판매가</th>
					<th>수량</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cart" items="${cartList}">

					<tr>
						<!-- 각 항목에 체크박스 추가 -->
						<td class="common-td"><input type="checkbox"
							class="selectItem" /></td>
						<td class="thumbnail"><img src="${cart.thumbNail}"
							style="width: 70px;" /></td>
						<td class="common-td"><div style="text-align: left;">${cart.title}</div></td>
						<td class="common-td"><div>${cart.price}</div></td>
						<td class="common-td"><div>${cart.salePrice}</div></td>
						<td class="common-td">
							<div>${cart.qty}
								<div>수량변경</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<table class="totalExpectedPayment">
			<thead>
				<th>총 상품금액</th>
				<th>배송비</th>
				<th>총 할인금액</th>
				<th>결제예정금액</th>
				<th>적립예정포인트</th>
			</thead>
		</table>



	</div>


	<c:import url="../footer.jsp"></c:import>


</body>
</html>