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
	$(function(){
		//showCartList();
	});

	/*
	function showCartList() {
		$.ajax({
			url : '/cart/cartPage/' + '${sessionScope.loginMember.userId}',
			type : 'get',
			dataType : 'json',
			async : false,
			success : function(data) {
				if(data.resultCode == 200) {
					console.log(data);
					outputCartList(data);
				}
			},
			error : function(data) {
				consol.log(data);
			}
		});
	}
	
	function outputCartList(data) {
		let output = `<table class="table table-striped">`;
		output += `<thead><tr><th>이미지</th><th>제목</th><th>원가</th><th>판매가</th><th>수량</th></tr></thead>`;
		
		$.each(data.data, function(i, cList) {
			output += `<tr>`;
			
			output += `<td>\${cList.thumbNail}</td>`;
			output += `<td>\${cList.title}</td>`;
			output += `<td>\${cList.price}</td>`;
			output += `<td>\${cList.salePrice}</td>`;
			output += `<td>\${cList.qty}</td>`;
			
			output += `</tr>`;
		});
		
		output += `</table>`;
		
		$('.outputCartArea').html(output);
	}
	*/
	
	
</script>
<body>
	
	<c:import url="../header.jsp"></c:import>
	
	<div class="container">
	
	<div class="outputCartArea">
		${cartList }
	</div>
	
	</div>

	
	<c:import url="../footer.jsp"></c:import>


</body>
</html>