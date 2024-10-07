<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<title>주문/결제 페이지</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 20px;
}

.paymentContainer {
	width: 1200px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	gap: 20px;
}

/* 왼쪽 섹션 스타일 */
.left-section {
	width: 70%;
}

.section {
	background: #fff;
	padding: 20px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
}

.section-title {
	font-weight: bold;
	margin-bottom: 10px;
	font-size: 18px;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}

.address-info, .order-info, .point-info, .payment-method {
	margin-bottom: 20px;
}

.address-info div, .point-info div {
	display: inline-block;
}

.address-info .button-change {
	display: inline-block;
	border: none;
	margin-left: 15px;
	padding: 5px 10px;
	background: #7fad39;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

.button-change:hover{
	background: #719932;
}

.address-request select {
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.order-info {
	display: flex;
	gap: 10px;
	align-items: center;
	border-bottom: 1px solid #ddd; 
}

.order-info img {
	width: 100px;
	height: 140px;
	object-fit: cover;
	margin-bottom: 10px;
}

.order-info-details {
	
	flex: 1;
}

.price-details {
	text-align: right;
}

.point-info {
	display: flex;
	align-items: center;
}

.point-info div {
	margin-right: 10px;
}

.point-info input {
	border: 1px solid #ddd;
	padding: 5px;
	width: 100px;
	margin-right: 10px;
	border-radius: 4px;
	text-align: right;
}

.point-info button {
	padding: 8px 15px;
	border: none;
	background: #7fad39;;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

.point-info button:hover {
	background: #719932;
}

.payment-method {
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 8px;

}

.payment-method label {
	margin-left: 10px;
	font-size: 16px;
}

/* 오른쪽 섹션 스타일 */
.right-section {
	width: 30%;
	height: fit-content;
	background: #fff;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	position: sticky;
	top: 20px;
}

.right-section .summary-title {
	font-weight: bold;
	font-size: 18px;
	margin-bottom: 20px;
}

.summary-details p {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
}

.total-price {
	font-weight: bold;
	font-size: 22px;
}

.btn-submit {
	width: 100%;
	padding: 15px;
	background: #7fad39;;
	color: #fff;
	border: none;
	border-radius: 8px;
	font-size: 18px;
	cursor: pointer;
}

.btn-submit:hover {
	background: #719932;
}
.arrivalDate {
	text-align: right;
	padding-left: 20px;
	flex: 1;
}


/* 툴팁 */
.questionTooltip {
	position: relative;
	display: inline-block;
	cursor: pointer;
}

.questionTooltip .tooltiptext {
	width: 170px;
	background-color: #BDBDBD;
	color: #fff;
	text-align: left;
	border-radius: 6px;
	padding: 10px;
	position: absolute;
	z-index: 1;
	opacity: 0;
	margin-left: 10px;
	transition: opacity 1s;
	font-size: 0.5em;
    }

.questionTooltip:hover .tooltiptext {
	opacity: 1;
}
    
.deliveryContainer {
	display: flex;
}
span.help-icon {
    font-size: 14px;
    line-height: 1.9;
    padding-left: 5px;
}

.nearby-icon {
	color: #7FAD39;
	font-size: 20px;
	vertical-align: middle;
	

}

/* The Modal (background) */
.addressModal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.6); /* 반투명 검은색 배경 */
}

/* Modal Content/Box */
.addressModal-content {
    background-color: #ffffff;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #4CAF50;
    width: 50%; /* 모달 크기 고정 */
    max-width: 600px; /* 최대 너비 */
    min-width: 300px; /* 최소 너비 */
    height: auto;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    font-family: 'Noto Sans KR', Arial, sans-serif;
    color: #333;
    font-size: 14px; /* 기본 글자 크기 줄임 */
}

/* The Close Button */
span.addressModalClose {
    color: #aaa;
    float: right;
    font-size: 24px; /* 닫기 버튼 크기 조금 줄임 */
    font-weight: bold;

}

.addressModalClose:hover, .addressModalClose:focus {
    color: #4CAF50;
    text-decoration: none;
    cursor: pointer;
}

#list table {
    width: 100%;
    border-collapse: collapse;
}

#list th, #list td {
    border: 1px solid #cccccc;
    padding: 8px;
    text-align: left;
    font-size: 13px; 
}

#list th {
    background-color: #f4f4f4;
    font-weight: bold;
}

#list td {
    font-size: 13px; /* 리스트 내부 텍스트 크기 */
}

</style>
</head>
<body>
<c:import url="../header.jsp"></c:import>
	<div class="paymentContainer">
		<!-- 왼쪽 섹션 -->
		<div class="left-section">
			<!-- 배송지 정보 섹션 -->
			<div class="section">
				<div class="section-title">배송지 정보</div>
				<div class="address-info">
					<div>
						<span class="material-symbols-outlined nearby-icon">explore_nearby</span> <span id="addressKey">${orderInfo.defaultAddress.address_key}</span><br> <span id="receiverName">받는 사람 : ${orderInfo.defaultAddress.receiver_name}</span><br>
						<span id="deliveryAddress">${orderInfo.defaultAddress.address}</span>
					</div>
					<button class="button-change" onclick="addressChange();">변경</button>
				</div>
				<div class="address-request">
					<label for="deliveryRequest">배송요청사항:</label>
					 
					
					<select id="deliveryRequest">
						<c:forEach var="request" items="${orderInfo.address}">
							<c:if test="${request.isDefault =='Y'}">
								<option>${request.request}</option>
							</c:if>
						</c:forEach>
						<c:forEach var="request" items="${orderInfo.address}">
							<c:if test="${request.isDefault != 'Y'}">
								<option>${request.request}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>

			<!-- 주문상품 정보 섹션 -->
			<div class="section">
				<div class="section-title">주문상품</div>
				<c:forEach var="index" begin="0" end="${fn:length(orderInfo.thumbNail) - 1 }">
				<div class="order-info">
					<img src="${orderInfo.thumbNail[index]}" alt="책 이미지">
					<div class="order-info-details">
						<span>${orderInfo.title[index]}</span>
						<p>
						
						<span>수량:  </span><span>${orderInfo.cartQty[index]}</span>
						</p>
					</div>
					
					<div class="price-details">
						<p>
    						<span>상품 금액:  </span>
    						<span class="price">${orderInfo.price[index]}</span>
						</p>
						<p>
    						<span>상품 할인:  </span>
    						<span class="discount">${orderInfo.salePrice[index]}</span>
						</p>

					</div>
				</div>
				</c:forEach>
				<div class="deliveryContainer">
					<span class="delivery">배송 예정일</span>
					<span class="questionTooltip"><span class="material-symbols-outlined help-icon">help</span><span class="tooltiptext">
배송 예정일이란?<br><br>
주문상품의 결제(입금)가 확인 된 날 기준으로 상품을 준비/포장하여 물류센터에서 택배사로 전달하는 예상 일정입니다.</span></span>
					<span class="arrivalDate">${orderInfo.arrivalDate} - 도착예정</span>
				</div>
			</div>

			<!-- 포인트 정보 섹션 -->
			<div class="section">
				<div class="section-title">포인트</div>
				<div class="point-info">
					<div>
						보유 포인트: <strong class="price" id="userPoint" >${orderInfo.userPoint}</strong>
					</div>
					<input type="text"  id="userPointInput" value="0" /> 원
					<button id="useAllPoints">전액사용</button>
				</div>
			</div>

			<!-- 결제수단 정보 섹션 -->
			<div class="section">
				<div class="section-title">결제수단</div>
				<div class="payment-method">
					<p>
						<input type="radio" id="creditCard" name="paymentMethod" checked>
						<label for="creditCard">신용카드</label>
					</p>
					<p>
						<input type="radio" id="cash" name="paymentMethod" >
						<label for="cash">현금 직접 결제</label>
					</p>
				</div>
			</div>
		</div>

		<!-- 오른쪽 섹션 -->
		<div class="right-section">
			<div class="summary-title">결제 요약</div>
			<div class="summary-details">
				<p>
					총 상품 금액 <span class="price">${orderInfo.totalPrice}</span>
				</p>
				<p>
					총 상품 할인 <span class="price">${orderInfo.totalSalePrice}</span>
				</p>
				<p>
					포인트 사용 <span class="discount usePoint">0</span>
				</p>
				<hr>
				<p class="total-price">
					최종 결제 금액 <span class="price" id="totalPay">${orderInfo.totalPay}</span>
				</p>
				<p>
					적립 예정 포인트 <span class="price">${orderInfo.totalPoint}</span>
				</p>
			</div>
			<button class="btn-submit" onclick="requestPayment();">결제하기</button>
		</div>
	</div>
	<c:import url="../footer.jsp"></c:import>
	
							<!-- The Modal -->
						<div id="myModal" class="addressModal">
							<!-- Modal content -->
							<div class="addressModal-content">
								<span class="addressModalClose">&times;</span>
								<div id="list">
								
								 <table>
								<tr><th>배송지</th><th>받는 사람</th><th>전화 번호</th><th>주 소</th></tr>
	    						
	    						<c:forEach var="index" begin="0" end="${fn:length(orderInfo.address) - 1}">
	    						<tr onclick="selectAddress(this);">
	    							<td>${orderInfo.address[index].address_key}</td>
	    							<td>${orderInfo.address[index].receiver_name}</td>
	    							<td>${orderInfo.address[index].receiver_phone}</td>
   									<td>${orderInfo.address[index].address}</td>
   								</tr>
								</c:forEach>
	    												
								</div>
								<!-- Pagination Controls -->
								<div id="pagination" class="pagination">
									<!-- Pagination buttons will be added dynamically here -->
								</div>
							</div>
						</div>
						
	
	
<script>

let totalPay = null; //변경하지 않는 최종 결제 금액(포인트 차감에 사용)

let remainingPoint = null; // 결제 후 insert할 남은 포인트 금액

let finalInputPoint = null; // 결제 후 insert할 최종 사용 포인트

let totalAmount = null; // 포인트 차감후 실제 결제되는 결제 금액



$(function(){
	
	totalPay = Number($('#totalPay').text().replace(/[^0-9]/g, ''));
	totalAmount =Number($('#totalPay').text().replace(/[^0-9]/g, ''));
	
	$('.price').each(function(){ 
		
		let price = $(this).text();
		let intPrice = price.replace(/[^0-9]/g, '')
		let formattedPrice = new Intl.NumberFormat().format(intPrice); 
		$(this).text(formattedPrice + "원");
		
	});
	$('.discount').each(function(){ 
		
		let price = $(this).text();
		let intPrice = price.replace(/[^0-9]/g, '')
		let formattedPrice = new Intl.NumberFormat().format(intPrice); 
		$(this).text("-" + formattedPrice + "원");
		
	});
	
	$('#userPointInput').on('blur keydown', function() {
		if (event.type === 'blur' || (event.type === 'keydown' && (event.key === 'Enter' || event.keyCode === 13))) {
	  
			let myPoints = Number($('#userPoint').text().replace(/[^0-9]/g, ''));
		       
		       
			let inputValue = Number($(this).val().replace(/[^0-9]/g, ''));
	
			// 보유 포인트 초과
			if (inputValue > myPoints) {
				alert(`보유 포인트(\${myPoints}원)를 초과할 수 없습니다!`);
				$(this).val(myPoints); 
				pointPayment(myPoints);
				deduct(myPoints);
				return;
			} else if(totalPay < inputValue){
				alert(`결제 금액(\${totalPay}원)를 초과할 수 없습니다!`);
				$(this).val(myPoints); 
				pointPayment(myPoints);
				deduct(myPoints);
				
			}
			pointPayment(inputValue);
			deduct(inputValue);
		}
	});

	$('#useAllPoints').click(function() {
		let myPoints = Number($('#userPoint').text().replace(/[^0-9]/g, ''));
		$('#userPointInput').val(myPoints);
		pointPayment(myPoints);
		deduct(myPoints);
		
	});

	
	
	
});




function addressChange() {
	$("#myModal").css('display', 'block');
	
}

let modal = $('#myModal'); 
let span = $('.addressModalClose');    


span.on('click', function() {
  modal.hide(); 
});


$(window).on('click', function(event) {
  if ($(event.target).is(modal)) { 
    modal.hide(); 
  }
});


function selectAddress(trElement) {
    // 배열로 저장
    let values = $(trElement).find('td').map(function() {
        return $(this).text().trim(); 
    }).get();


    let addressKey = values[0];      // td 값
    let receiverName = values[1];   
    let receiverPhone = values[2];  
    let address = values[3];         

    
    $('#addressKey').text(addressKey);
    $('#receiverName').text(receiverName);
    $('#deliveryAddress').text(address);

    modal.hide();

}

function pointPayment(userPointInput) {
	let formattedPrice = new Intl.NumberFormat().format(userPointInput); 
	$('.usePoint').text("-" + formattedPrice + "원");
	
	
}

function deduct(userPointInput) {
	finalInputPoint = userPointInput; // 결제 정보에 insert 할때 보낼 차감에 사용된 최종 포인트
	let deductTotalPay = totalPay - userPointInput;
	
	let myPoints = Number($('#userPoint').text().replace(/[^0-9]/g, ''));
	
	remainingPoint = myPoints - userPointInput; // 결제후 member에서 update에 사용할 남은 포인트 
	
	console.log("최종 금액" + deductTotalPay);
	
	let formattedPrice = new Intl.NumberFormat().format(deductTotalPay); 
	$('#totalPay').text(formattedPrice);
	totalAmount = deductTotalPay;
	
}

// 서버에서 전달된 결제 정보를 받아옴


async function requestPayment() { 
	 const orderTitleList = [
	      <c:forEach var="title" items="${orderInfo.title}">
	         '${title}'<c:if test="${!status.last}">, </c:if>
	      </c:forEach>
	   ];
	console.log(orderTitleList);
	const paymentRequestData = {
		    storeId: "${orderInfo.storeId}",
		    channelKey: "${orderInfo.channelKey}",
		    paymentId: "${orderInfo.paymentId}",
		    totalAmount: totalAmount,
		    orderName: "${orderInfo.orderName}",
		    currency: "CURRENCY_KRW",
		    payMethod: "EASY_PAY"
		};

	console.log("진입확인"+ totalAmount);
	const response = await PortOne.requestPayment(paymentRequestData);
	console.log(response);
	
	  if (response.code != null) {
		    // 오류 발생
		    return alert(response.message);
		  }

		  // /payment/complete 엔드포인트를 구현해야 합니다. 다음 목차에서 설명합니다.
		  const notified = await fetch("/order/paymentInfo", {
		    method: "POST",
		    headers: { 
		    	"Content-Type": "application/json" 
		    	},
		    // paymentId와 주문 정보를 서버에 전달합니다
		    body: JSON.stringify({
		    	totalAmount: totalAmount,
		    	remainingPoint: remainingPoint,
		    	finalInputPoint: finalInputPoint,
    			paymentId: paymentRequestData.paymentId,
    			orderName: paymentRequestData.orderName,
    			titleName: orderTitleList
			})
		  });
		  if (notified.ok) {
				const redirectUrl =await notified.text();
		        window.location = redirectUrl;
		    } else {
		    	console.log(notified.message);
		        alert('결제 완료 요청에 실패했습니다.');
		    }

		}



</script>
</body>

</html>