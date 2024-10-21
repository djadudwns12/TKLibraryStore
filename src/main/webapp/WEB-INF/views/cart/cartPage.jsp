<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>장바구니</title>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
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

/* 버튼 */
.button-link {
   color: white;
   text-decoration: none;
   padding: 5px 10px;
   border: none;
   background-color: transparent;
   display: inline-block;
   font-size: 16px;
   transition: transform 0.1s ease, box-shadow 0.1s ease;
}

/* 마우스 올렸을 때 */
.button-link:hover {
   color: #f0f0f0;
}

/* 클릭 시 눌리는 효과 */
.button-link:active {
   transform: translateY(2px);
}

.quantity-control {
   display: inline-flex;
   align-items: center;
   border: 1px solid #ddd;
   border-radius: 5px;
   overflow: hidden; /* 경계선에 맞춰서 내용이 잘리지 않도록 */
}

.quantity-control button {
   background-color: #f8f9fa; /* 버튼 배경색 */
   border: none;
   padding: 5px 10px;
   cursor: pointer;
   font-size: 18px; /* 버튼 크기 */
   transition: background-color 0.3s;
}

.quantity-control button:hover {
   background-color: #e2e6ea; /* 버튼 마우스 오버 시 색상 */
}

.quantity-control input {
   width: 40px; /* 수량 입력창 너비 */
   text-align: center; /* 텍스트 중앙 정렬 */
   border: none;
   outline: none; /* 포커스 시 경계선 제거 */
   font-size: 18px; /* 입력 텍스트 크기 */
}

.change-btn {
   background-color: #7FAD39; /* 원하시는 배경색으로 변경 가능 */
   color: white;
   border: none;
   border-radius: 5px; /* 귀여운 느낌을 위해 둥글게 */
   padding: 5px 10px; /* 여백을 적게 설정 */
   font-size: 12px; /* 작게 설정 */
   transition: background-color 0.3s;
   margin-top: 0.5em;
}

.change-btn:hover {
   background-color: #6FAF2E; /* 호버 시 색상 변경 */
}
</style>
</head>

<body>

   <c:import url="../header.jsp"></c:import>

   <div class="container">
      <button type="button" class="btn btn-outline-danger"
         id="deleteSelectedButton" style="margin-bottom:0.5em;">선택삭제</button>
      <form>
      <div style="max-height: 500px; overflow-y: auto;">
         <table class="table table-hover">
            <thead>
               <tr style="text-align: center;">
                  <th><input type="checkbox" id="selectAll" class="selectAll"
                     onclick="toggleSelectAll(this)" /></th>
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
                  <tr class="cartItem">
                     <td class="common-td"><input type="checkbox"
                        class="selectItem" data-price="${cart.price}"
                        data-salePrice="${cart.salePrice}" data-cart-id="${cart.cartId}"></td>
                     <td class="thumbnail"><img src="${cart.thumbNail}"
                        style="width: 70px;" name="thumbNail" /></td>
                     <td class="common-td" name="title">${cart.title}</td>
                     <td class="common-td">
                        <div name="price">
                           <fmt:formatNumber value="${cart.price}" type="number"
                              groupingUsed="true"/>
                           원
                        </div>
                     </td>
                     <td class="common-td">
                        <div name="salePrice">
                           <fmt:formatNumber value="${cart.salePrice}" type="number"
                              groupingUsed="true"/>
                           원
                        </div>
                     </td>
                     <td class="common-td">
                        <div class="quantity-control">
                           <button type="button" class="decrease-btn"
                              data-cart-id="${cart.cartId}">-</button>
                           <input type="text" id="qtyInput-${cart.cartId}"
                              value="${cart.qty}" size="2" readonly name="cartQty"/> <input type="hidden"
                              id="inven-${cart.cartId}" value="${cart.inven}" />
                           <script>
                                console.log("생성된 qtyInput ID:", 'qtyInput-${cart.cartId}');
                                console.log("cartId : ", '${cart.cartId}', "재고수량 : ", '${cart.inven}');
                            </script>
                           <button type="button" class="increase-btn"
                              data-cart-id="${cart.cartId}">+</button>
                        </div>
                     </td>
                     <td class="common-td"><img
                        src="/resources/images/cart_delete.png" width="30px"
                        onclick="showDeleteModal('${cart.cartId}', this);"></td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>

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
            <span id="pointRate" style="display: none;">${pointRate}</span>
            <!-- pointRate 추가 -->
            <c:set var="totalPrice" value="0" />
            <c:set var="totalSalePrice" value="0" />
            <c:set var="totalPoint" value="0" />

            <c:forEach var="cart" items="${cartList}">
               <!-- 총 상품 금액 (할인 전) -->
               <c:set var="totalPrice"
                  value="${totalPrice + cart.price * cart.qty}" />


            </c:forEach>

            <!-- 총 할인가 계산 (상품 가격의 10% 할인 적용) -->
            <c:set var="totalSalePrice"
               value="${totalSalePrice + totalPrice * 0.1}" />

            <!-- 결제 예정 금액 (총 상품 금액 - 할인된 금액) -->
            <c:set var="totalPay" value="${totalPrice - totalSalePrice}" />

            <!-- 적립 예정 포인트 계산 (결제 예정 금액 * pointRate) -->
            <c:set var="totalPoint" value="${totalPay * pointRate}" />

            <!-- 소수점 이하 제거 -->
            <c:set var="totalPoint"
               value="${fn:substringBefore(totalPoint, '.')}" />

            <tr>
               <td class="common-td" name="totalPrice"><strong id="totalPrice"> <fmt:formatNumber
                        value="${totalPrice}" type="number" groupingUsed="true"/>원
               </strong></td>
               <td class="common-td"><strong>-</strong></td>
               <td class="common-td"><strong>0원</strong></td>
               <td class="common-td"><strong>-</strong></td>
               <td class="common-td" name="totalSalePrice"><strong id="totalSalePrice"> <fmt:formatNumber
                        value="${totalSalePrice}" type="number" groupingUsed="true" />원
               </strong></td>
               <td class="common-td"><strong>=</strong></td>
               <td class="common-td" name="totalPay"><strong id="totalPay"> <fmt:formatNumber
                        value="${totalPay}" type="number" groupingUsed="true" />원
               </strong></td>
               <td class="common-td" name="totalPoint"><strong id="totalPoint"> <fmt:formatNumber
                        value="${totalPoint}" type="number" groupingUsed="true" />P
               </strong></td>
            </tr>
         </tbody>
      </table>
      </form>
      <div
         style="display: flex; justify-content: center; align-items: center;">
         <button type="button" id="paymentButton" class="btn btn-success"
            style="background: #7FAD39;">주문하기</button>
      </div>
   </div>

   <!-- The Modal -->
   <div class="modal" id="myModal" style="display: none;">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title"></h4>
               <button type="button" class="btn-close modalCloseBtn"
                  data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
               <button type="button" class="btn btn-info" id="deleteConfirmButton">삭제</button>
               <button type="button" class="btn btn-danger modalCloseBtn"
                  onclick="$('#myModal').modal('hide');">취소</button>
            </div>
         </div>
      </div>
   </div>

   <!-- 재고 부족 모달 -->
   <div class="modal" id="stockModal" style="display: none;">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">재고 부족</h4>
               <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
               <p>재고가 부족합니다.</p>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-danger"
                  data-bs-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>

   <!-- 삭제 확인 모달 -->
   <div class="modal fade" id="confirmDeleteModal" tabindex="-1"
      aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="confirmDeleteModalLabel">삭제 확인</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">선택한 상품들을 삭제하시겠습니까?</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">취소</button>
               <button type="button" class="btn btn-danger"
                  id="confirmDeleteButton">삭제</button>
            </div>
         </div>
      </div>
   </div>

   <c:import url="../footer.jsp"></c:import>

   <!-- jQuery 및 Bootstrap JS를 body 끝 부분에 배치 -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <!-- JavaScript 코드 -->
   <script>
    $(document).ready(function() {
        // 수량 증가 함수
        function increaseQty(cartId) {
            let qtyInput = document.getElementById('qtyInput-' + cartId);
            let currentQty = parseInt(qtyInput.value);
            let maxQty = parseInt(document.getElementById('inven-' + cartId).value);

            if (currentQty < maxQty) {
                qtyInput.value = currentQty + 1;
                updateTotals();
                updateQtyInDB(cartId, qtyInput.value);  // AJAX로 수량 업데이트
            } else {
                // 재고 부족 모달 표시
                $('#stockModal').modal('show');
            }
        }

        // 수량 감소 함수 (1보다 작은 값은 허용하지 않음)
        function decreaseQty(cartId) {
            let qtyInput = document.getElementById('qtyInput-' + cartId);
            let currentQty = parseInt(qtyInput.value);
            if (currentQty > 1) {
                qtyInput.value = currentQty - 1;
                updateTotals();
                updateQtyInDB(cartId, qtyInput.value);  // AJAX로 수량 업데이트
            } else {
                alert("수량은 1보다 작을 수 없습니다.");
            }
        }

        // AJAX로 DB에 수량 업데이트
        function updateQtyInDB(cartId, newQty) {
            $.ajax({
                url: '/cart/updateQty',
                type: 'POST',
                data: { cartId: cartId, qty: newQty },
                success: function(response) {
                    if (response.success) {
                        console.log("수량이 성공적으로 업데이트되었습니다.");
                    } else {
                        alert("수량 업데이트에 실패했습니다. 다시 시도해주세요.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 중 오류 발생:", error);
                    alert("에러가 발생했습니다: " + error);
                }
            });
        }

        // 이벤트 위임으로 수량 증가/감소 버튼 핸들러
        $(document).on('click', 'button.increase-btn', function() {
            const cartId = $(this).data('cart-id');
            increaseQty(cartId);
        });

        $(document).on('click', 'button.decrease-btn', function() {
            const cartId = $(this).data('cart-id');
            decreaseQty(cartId);
        });

        // 선택된 상품의 합계 업데이트 함수
        function updateTotals() {
            let totalPrice = 0;
            let totalSalePrice = 0;
            let totalPay = 0;
            let totalPoint = 0;

            // pointRate를 DOM에서 가져오기
            const pointRate = parseFloat(document.getElementById('pointRate').innerText) || 0; // 기본값 0

            const selectedItems = document.querySelectorAll('.selectItem:checked');
            selectedItems.forEach(item => {
                const price = parseInt(item.getAttribute('data-price')) || 0;  // NaN 방지
                const salePrice = parseInt(item.getAttribute('data-salePrice')) || 0;  // NaN 방지
                const cartId = item.getAttribute('data-cart-id');
                const qtyInput = document.getElementById('qtyInput-' + cartId);
                const qty = qtyInput ? parseInt(qtyInput.value) || 0 : 0;  // NaN 방지 및 요소 존재 확인

                totalPrice += price * qty;
                totalSalePrice += (price * 0.1) * qty;  // 10% 할인 적용
                totalPay += salePrice * qty;
                totalPoint += salePrice * pointRate * qty; // pointRate 적용
            });

            // 결과를 DOM에 반영
            document.getElementById('totalPrice').innerText = totalPrice.toLocaleString() + "원";
            document.getElementById('totalSalePrice').innerText = totalSalePrice.toLocaleString() + "원";
            document.getElementById('totalPay').innerText = totalPay.toLocaleString() + "원";
            document.getElementById('totalPoint').innerText = Math.floor(totalPoint).toLocaleString() + "P";
        }

        // 초기화 및 이벤트 핸들러 설정
        function init() {
            const selectAllCheckbox = document.getElementById('selectAll');
            selectAllCheckbox.checked = true;
            toggleSelectAll(selectAllCheckbox);

            const checkboxes = document.querySelectorAll('.selectItem');
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    checkSelectAll();
                    updateTotals();
                });
            });

            updateTotals();
        }

        // 전체 선택/해제 토글 함수
        function toggleSelectAll(source) {
            const checkboxes = document.querySelectorAll('.selectItem');
            checkboxes.forEach(checkbox => {
                checkbox.checked = source.checked;
            });
            updateTotals();
        }

        // 모든 체크박스의 상태를 확인하여 전체 선택 체크박스의 상태를 업데이트
        function checkSelectAll() {
            const selectAllCheckbox = document.getElementById('selectAll');
            const checkboxes = document.querySelectorAll('.selectItem');
            const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
            selectAllCheckbox.checked = allChecked;
        }

        // 삭제 버튼 클릭 이벤트
        $('#deleteConfirmButton').on('click', function () {
            const cartId = $(this).data('cart-id');
            console.log('삭제할 cartId:', cartId);

            $.ajax({
                url: '/cart/deleteCart',
                type: 'POST',
                data: { cartId: cartId },
                success: function (response) {
                    if (response.success) {
                        $(currentElement).closest('tr').remove();
                        updateTotals();
                        $('.fa-shopping-bag').next().text(response.CartCnt)
                    } else {
                        alert('삭제에 실패했습니다. 다시 시도해주세요.');
                    }
                },
                error: function (xhr, status, error) {
                    alert('에러가 발생했습니다: ' + error);
                }
            });

            $('#myModal').modal('hide');
        });

        // AJAX로 삭제 요청을 보내는 함수
        let currentElement; // 전역 변수로 현재 클릭된 요소를 저장

        window.showDeleteModal = function(cartId, element) {
            $('.modal-body').html("상품을 삭제하시겠습니까?");
            $('#deleteConfirmButton').data('cart-id', cartId);
            currentElement = element; // 현재 클릭된 요소 저장
            $('#myModal').modal('show'); // Bootstrap의 modal 메서드 사용
        }

        // 전역으로 함수 선언
        window.toggleSelectAll = toggleSelectAll;

        // 초기화 함수 호출
        init();

        function saveQty(cartId) {
            let qtyInput = document.getElementById('qtyInput-' + cartId);

            if (!qtyInput) {
                console.error("입력 필드를 찾을 수 없습니다: cartId=", cartId);
                alert("수량 입력 필드를 찾을 수 없습니다.");
                return;
            }

            let qty = parseInt(qtyInput.value); 

            if (isNaN(qty)) {
                alert("유효한 수량이 아닙니다.");
                return;
            }

            console.log("Received CartID:", cartId);
            console.log("Quantity:", qty);

            $.ajax({
                url: '/cart/updateQty',
                type: 'POST',
                data: {
                    cartId: cartId,
                    qty: qty
                },
                success: function(response) {
                    if (response.success) {
                        console.log("수량이 성공적으로 업데이트되었습니다.");
                        alert("해당 상품의 수량을 변경했습니다.");
                    } else {
                        alert("수량 업데이트에 실패했습니다. 다시 시도해주세요.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 중 오류 발생:", error);
                    alert("에러가 발생했습니다: " + error);
                }
            });
        }
        
        let selectedCartIds = []; // 선택된 cartId를 저장할 변수

        /* 선택 삭제 버튼 눌렀을 때 */
        $('#deleteSelectedButton').on('click', function() {
            // 선택된 체크박스의 cartId 수집
            selectedCartIds = [];
            $('.selectItem:checked').each(function() {
                selectedCartIds.push($(this).data('cart-id'));
            });

            if (selectedCartIds.length === 0) {
                alert("삭제할 상품을 선택해주세요.");
                return;
            }

            // 모달 띄우기
            $('#confirmDeleteModal').modal('show');
        });

        // 선택 삭제 버튼 클릭 시 처리
        $('#confirmDeleteButton').on('click', function() {
            // AJAX 요청으로 서버에 삭제 요청 보내기
            $.ajax({
                url: '/cart/deleteSelected',
                type: 'POST',
                contentType: 'application/json', // JSON 형식으로 전송
                data: JSON.stringify(selectedCartIds), // 데이터 JSON 문자열로 변환
                success: function(response) {
                    if (response.success) {
                        // 삭제 성공 시 항목 제거
                        selectedCartIds.forEach(function(cartId) {
                            // 해당 cartId를 가진 행 제거
                            $('input[data-cart-id="' + cartId + '"]').closest('tr').remove();
                        });
                        
                        // 모든 체크박스 다시 선택
                        $('.selectItem').prop('checked', true);
                        $('.selectAll').prop('checked', true);
                        
                        // 총합 업데이트 함수 호출
                        updateTotals();
                        $('.fa-shopping-bag').next().text(response.CartCnt)
                        
                        
                        
                    } else {
                        alert('삭제 중 오류가 발생했습니다.');
                    }
                    // 모달 닫기
                    $('#confirmDeleteModal').modal('hide');
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 중 오류 발생:", error);
                    alert("에러가 발생했습니다: " + error);
                    // 모달 닫기
                    $('#confirmDeleteModal').modal('hide');
                }
            });
        });

        $("#paymentButton").on("click", function(event) {
            console.log("결제 버튼 클릭됨"); // 클릭 이벤트 확인

            // 체크된 tr 태그에서 bookNo 가져오기
            let cartIds = [];
            console.log($("tr input[type='checkbox']:checked"));
            
            $("tr.cartItem input[type='checkbox']:checked").each(function(i, item) {
                console.log(i ,'번째 아이템 : ', item);
                
                cartIds.push($(item).attr('data-cart-id'));
            });



        });
    });
    
    
    

    
    $(function () {
        const cartIdList = [
            <c:forEach var="cart" items="${cartList}">
                '${cart.cartId}'<c:if test="${!status.last}">, </c:if>
            </c:forEach>
        ];

        $("#paymentButton").on("click", function (event) {
            console.log("결제 버튼 클릭됨");

            let fd = new FormData();  

            // 체크된 항목에 대해서만 반복문으로 처리
            $("tr.cartItem").has("input.selectItem:checked").each(function () {  
                let thumbNail = $(this).find("img[name='thumbNail']").attr("src") || '';  
                let title = $(this).find("td[name='title']").text().trim() || '';  
                let priceText = $(this).find("div[name='price']").text().trim() || '';  
                let price = priceText.replace(/[^\d]/g, ''); 

                let salePriceText = $(this).find("div[name='salePrice']").text().trim() || ''; 
                let salePrice = salePriceText.replace(/[^\d]/g, '');  

                let cartQty = $(this).find("input[name='cartQty']").val() || '';  
                let cartId = $(this).find("input.selectItem:checked").data("cart-id"); // 선택된 cartId 가져오기

                // 각 선택된 상품의 정보를 FormData에 추가
                fd.append("thumbNail", thumbNail);
                fd.append("title", title);
                fd.append("price", price);
                fd.append("salePrice", salePrice);
                fd.append("cartQty", cartQty);
                fd.append("cartId", cartId);  // 각 개별 cartId 추가
                
                console.log("추출된 체크된 책 정보:", {
                    thumbNail: thumbNail,
                    title: title,
                    price: price,
                    salePrice: salePrice,
                    cartQty: cartQty,
                    cartId: cartId
                });
            });

            // 체크된 항목이 없을 경우 경고
            if (!fd.has("thumbNail")) {
                alert("결제할 책을 선택해주세요.");
                return; 
            }

            // 총 결제 정보 추출 및 추가
            let totalPriceText = $("td[name='totalPrice']").text().trim();
            let totalPrice = totalPriceText.replace(/[^\d]/g, ''); 

            let totalSalePriceText = $("td[name='totalSalePrice']").text().trim();  
            let totalSalePrice = totalSalePriceText.replace(/[^\d]/g, '');  

            let totalPayText = $("td[name='totalPay']").text().trim();
            let totalPay = totalPayText.replace(/[^\d]/g, '');  

            let totalPointText = $("td[name='totalPoint']").text().trim();
            let totalPoint = totalPointText.replace(/[^\d]/g, '');  

            fd.append("totalPrice", totalPrice);
            fd.append("totalSalePrice", totalSalePrice);
            fd.append("totalPay", totalPay);
            fd.append("totalPoint", totalPoint);

            console.log("총 결제 정보:", {
                totalPrice: totalPrice,
                totalSalePrice: totalSalePrice,
                totalPay: totalPay,
                totalPoint: totalPoint
            });

            // AJAX로 전송
            $.ajax({
                url: "/order/payment",
                type: "POST",
                data: fd,
                contentType: false,
                processData: false,
                cache: false,
                success: function (response) {
                    console.log("성공:", response);
                    window.location.href = "/order/payment";
                },
                error: function () {
                    console.error("오류");
                }
            });
        });
    });



</script>

</body>
</html>
