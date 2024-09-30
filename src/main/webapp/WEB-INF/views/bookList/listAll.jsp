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
<title>책 리스트</title>



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
		// content 영역 설정 
		let bList = $('.bList');
		$('#main_content').html(bList);
		
	});
	
</script>
<body>

	<c:import url="../header.jsp"></c:import>

	<div class="bList">
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th>제목</th>
						<th>작가</th>
						<th>출판사</th>
						<th>출간일</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${listAll}">

						<tr>
							<td
								onclick="location.href='/bookList/bookDetail?bookNo=${list.bookNo}';"><img
								src="${list.thumbNail}"></td>
							<td
								onclick="location.href='/bookList/bookDetail?bookNo=${list.bookNo}';">${list.title}</td>
							<td>${list.author}</td>
							<td>${list.publisher}</td>
							<td>${list.pubDate}</td>
							<td>${list.salePrice}</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="pagination justify-content-center" style="margin: 20px 0">
			<ul class="pagination">
				<c:if test="${param.pageNo > 1}">
					<li class="page-item"><a class="page-link" href="/bookList/listAll?pageNo=${param.pageNo - 1}&pagingSize=${param.pagingSize}">Previous</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${pagingInfo.startPageNoCurBlock}" end="${pagingInfo.endPageNoCurBlock }">
					<c:choose>
						<c:when test="${param.pageNo == i}">
							<li class="page-item active" id="${i}"><a class="page-link" href="/bookList/listAll?pageNo=${i}&pagingSize=${param.pagingSize}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item" id="${i}"><a class="page-link" href="/bookList/listAll?pageNo=${i}&pagingSize=${param.pagingSize}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${param.pageNo < pagingInfo.totalPageCnt}">
					<li class="page-item"><a class="page-link" href="/bookList/listAll?pageNo=${param.pageNo + 1}&pagingSize=${param.pagingSize}">Next</a></li>
				</c:if>
			
			</ul>
		</div>
		

	</div>



	<c:import url="../footer.jsp"></c:import>


</body>
</html>