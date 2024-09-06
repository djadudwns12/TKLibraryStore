<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</script>
<body>
	
	<c:import url="../header.jsp"></c:import>

		<div class="cartTable">
			<h2 style="text-align: center;">Cart</h2>

			
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
						<td>2</td>
					</tr>
					<tr>
						<td>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="check2"
									name="option1" value="check1"> <label
									class="form-check-label" for="check1"></label>
							</div>
						</td>
						<td>마음 정렬</td>
						<td>17820</td>
						<td>3</td>
					</tr>
					<tr>
						<td>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="check3"
									name="option1" value="check1"> <label
									class="form-check-label" for="check1"></label>
							</div>
						</td>
						<td>일상으로서의 명상</td>
						<td>18000</td>
						<td>3</td>
					</tr>
				</tbody>
			</table>
			
			<button type="submit" class="btn btn-primary mt-3"
						style="width: 90px; height: 30px; font-size: 0.9em" onclick="delete();">선택삭제</button>
		</div>
	
	<c:import url="../footer.jsp"></c:import>
	
	
</body>

</html>
