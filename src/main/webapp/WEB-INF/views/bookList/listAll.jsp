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
	                <td onclick="location.href='/bookList/bookDetail?bookNo=${list.bookNo}';">${list.title}</td>
	                <td>${list.author}</td>
	                <td>${list.publisher}</td>
	                <td>${list.pubDate}</td>
	                <td>${list.salePrice}</td>
	              </tr>
	              
	             </c:forEach>
	            </tbody>
	          </table>
          </div>
          
          
          
        </div>
		

		
		

	</div>

	<c:import url="../footer.jsp"></c:import>


</body>
</html>