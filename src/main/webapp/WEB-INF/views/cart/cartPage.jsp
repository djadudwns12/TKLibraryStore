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

</script>
<body>
	
	<c:import url="../header.jsp"></c:import>
	
	<div class="container">
	
	<table class="table table-hover">
						<thead>
							<tr>
								<th>이미지</th>
								<th>제목</th>
								<th>원가</th>
								<th>판매가</th>
								<th>수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cart" items="${userCartList}">
								
										<tr>
											<td>${cart.thumbNail}</td>
											<td>${cart.title}</td>
											<td>${cart.price}</td>
											<td>${cart.salePrice}</td>
											<td>${cart.qty}</td>
										</tr>

							</c:forEach>
						</tbody>
					</table>
	
	</div>

	
	<c:import url="../footer.jsp"></c:import>


</body>
</html>