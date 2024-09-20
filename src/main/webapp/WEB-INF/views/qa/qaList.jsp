<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
</head>

<body>

	<c:import url="../header.jsp"></c:import>

	<div class="qaContent">
		<div class="container mt-3">
			<h2>Hover Rows</h2>
			<p>The .table-hover class enables a hover state (grey background
				on mouse over) on table rows:</p>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>제목</th>
						<th>등록일시</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qa" items="${list}"  >
						<tr>
							<td>${qa.qTitle}</td>
							<td>${qa.qDate}</td>
							<td>${qa.qAnswer}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>



	<c:import url="../footer.jsp"></c:import>

</body>

</html>
