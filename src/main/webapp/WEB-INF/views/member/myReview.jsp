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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 저장 성공 시 성공메세지 띄우는 함수
		msgStatus();
		
	});
	
	function msgStatus() {
		let status = '${param.status}';
		if(status == 'success'){
			alert('저장성공');
		}else if(status == 'fail'){
			alert('저장실패');
		}
		
	}
</script>

<body>

	<c:import url="../header.jsp"></c:import>

	<div class="myReview">
		<div class="container mt-3">
			<a href="/member/myReview" style="float: right;"></a>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>날짜</th>
						<th>책</th>
						<th>리뷰 내용</th>
						<th>별점</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${review}"  >
						<tr onclick="location.href='/bookList/bookDetail?bookNo=${review.bookNo}'">
							<td>${review.reviewDate}</td>
							<td>${review.bookNo}</td>
							<td>${review.reviewContent}</td>
							<td>${review.reviewScore}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>



	<c:import url="../footer.jsp"></c:import>

</body>

</html>
