<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>주문/결제 페이지</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .container {
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
            margin-left: 15px;
            padding: 5px 10px;
            background: #4CAF50;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
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
        }

        .order-info img {
            width: 100px;
            height: 140px;
            object-fit: cover;
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
            background: #4CAF50;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .point-info button:hover {
            background: #45a049;
        }

        .payment-method {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            display: flex;
            align-items: center;
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
            background: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 왼쪽 섹션 -->
        <div class="left-section">
            <!-- 배송지 정보 섹션 -->
            <div class="section">
                <div class="section-title">배송지 정보</div>
                <div class="address-info">
                    <div>
                        <span>🏠 기본배송</span><br>
                        <span>받는 사람 이름 / 배송지 연락처</span><br>
                        <span>[00000] 서울시 화곡동 000동 000호</span>
                    </div>
                    <button class="button-change">변경</button>
                </div>
                <div class="address-request">
                    <label for="deliveryRequest">배송요청사항:</label>
                    <select id="deliveryRequest">
                        <option>경비실에 맡겨 주세요</option>
                        <option>문 앞에 두고 가세요</option>
                    </select>
                </div>
            </div>

            <!-- 주문상품 정보 섹션 -->
            <div class="section">
                <div class="section-title">주문상품</div>
                <div class="order-info">
                    <img src="book_image.jpg" alt="책 이미지">
                    <div class="order-info-details">
                        <span>[국내도서]해외 여행의 법칙 공통수학 1 (2025)</span>
                        <span>1개</span>
                        <span>7/7(토) 도착 예정</span>
                    </div>
                    <div class="price-details">
                        <p>상품 금액: 16,000원</p>
                        <p>상품 할인: -1,600원</p>
                        <p>포인트 사용: -340원</p>
                        <p class="total-price">최종 결제 금액: 14,060원</p>
                    </div>
                </div>
            </div>

            <!-- 포인트 정보 섹션 -->
            <div class="section">
                <div class="section-title">포인트</div>
                <div class="point-info">
                    <div>보유 포인트: <strong>700원</strong></div>
                    <input type="text" value="340" /> 원
                    <button>전액사용</button>
                </div>
            </div>

            <!-- 결제수단 정보 섹션 -->
            <div class="section">
                <div class="section-title">결제수단</div>
                <div class="payment-method">
                    <input type="radio" id="creditCard" name="paymentMethod" checked>
                    <label for="creditCard">신용카드</label>
                </div>
            </div>
        </div>

        <!-- 오른쪽 섹션 -->
        <div class="right-section">
            <div class="summary-title">결제 요약</div>
            <div class="summary-details">
                <p>상품 금액 <span>16,000원</span></p>
                <p>상품 할인 <span>-1,600원</span></p>
                <p>포인트 사용 <span>-340원</span></p>
                <hr>
                <p class="total-price">최종 결제 금액 <span>14,060원</span></p>
                <p>적립 예정 포인트 <span>800P</span></p>
            </div>
            <button class="btn-submit">결제하기</button>
        </div>
    </div>
</body>
</html>