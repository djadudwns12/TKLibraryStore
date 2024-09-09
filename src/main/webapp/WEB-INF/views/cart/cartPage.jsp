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
</head>
<script>
$(function() {
	
	getCartList();
	
    // 전체 선택 체크박스 클릭 이벤트
    $('#checkAll').click(function() {
        // 전체 선택 체크박스의 상태에 따라 다른 체크박스들을 선택 또는 해제
        $('.form-check-input').prop('checked', $(this).prop('checked'));
    });
    
    // 개별 체크박스 클릭 이벤트
    $('.form-check-input').click(function() {
        // 전체 선택 체크박스의 상태를 업데이트
        var allChecked = $('.form-check-input').length === $('.form-check-input:checked').length;
        $('#checkAll').prop('checked', allChecked);
    });
    
    
});

function getCartList() {
	$.ajax({
        url : '/cart/putCart/' + '${sessionScope.loginMember.userId}', // ${sessionScope.loginMember.userId} 로 바꿔야 함
        type : 'get', // 가져오는 것 = select -> get 방식
        dataType : 'json',
        async : false,
        success : function(data) {    
           console.log(data);
           if(data.resultCode == 200) {
           	outputCart(data); // 읽어온 쪽지들을 출력
           }
           
        },
        error : function(data) {
           console.log(data);
        }
     });
}

function outputCart(data) {
	let output = `<table class="table table-striped">`;
	output += `<thead><tr><th>책 제목</th><th>원가</th><th>판매가격</th><th>수량</th></tr></thead>`;
	
	$.each(data.data, function(i, cart) {
		output += `<tr>`;
		
		output += `<td>\${cart.title}</td>`;
		output += `<td>\${cart.price}</td>`;
		output += `<td>\${cart.salePrice}</td>`;
		output += `<td>\${cart.qty}</td>`;
		
		output += `</tr>`;
	});
	
	output += `</table>`;
	
	$('.cartArea').html(output);
}


function changeQuantity(action, id) {
    var quantityElement = document.getElementById('quantity' + id);
    var currentQuantity = parseInt(quantityElement.innerText);

    if (action === 'up') {
        quantityElement.innerText = currentQuantity + 1;
    } else if (action === 'down' && currentQuantity > 1) {
        quantityElement.innerText = currentQuantity - 1;
    }
}
</script>
<body>
	<div>
	<c:import url="../header.jsp"></c:import>
	
	</div>

	<div class="cartTable">
		<h2 style="text-align: center;">Cart</h2>


		<div class="cartArea">
		
		</div>
		
		
		<div class="container">
			<table class="table table-striped">
				<thead>

					<tr>
						<th>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="checkAll"
									name="checkAll" value="checkAll"> <label
									class="form-check-label" for="checkAll"></label>
							</div>
						</th>

						<th>책 제목</th>
						<th>가격</th>
						<th>수량</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="check1"
									name="option1" value="check1"> <label
									class="form-check-label" for="check1"></label>
							</div>
						</td>
						<td>20대를 위한 연애와 사랑</td>
						<td>13500</td>
						<td>
							<div class="input-group">
								<button class="btn btn-outline-secondary" type="button"
									onclick="changeQuantity('down', 1)" style="width: 30px; height: 30px; padding: 0; font-size: 0.8em;">-</button>
								<span id="quantity1" style="margin: 0 10px;">1</span>
								<button class="btn btn-outline-secondary" type="button"
									onclick="changeQuantity('up', 1)" style="width: 30px; height: 30px; padding: 0; font-size: 0.8em;">+</button>
							</div>
						</td>
					</tr>
					
				</tbody>
			</table>

			<button type="submit" class="btn btn-primary mt-3"
				style="width: 90px; height: 30px; font-size: 0.9em"
				onclick="delete();">선택삭제</button>
		</div>

	</div>

	<c:import url="../footer.jsp"></c:import>


</body>

</html>
