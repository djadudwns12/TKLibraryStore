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
		let qaList = $('.qaContent');
		
		$('#main_content').html(qaList);
	})
</script>

<body>

	<c:import url="../header.jsp"></c:import>

	<div class="qaContent">
	${qa}
		<div>제목 : ${qa.qNo}</div>
		<div>내용 : ${qa.qContent}</div>
		<div>답변 : ${qa.qAnswer}</div>
	</div>



	<c:import url="../footer.jsp"></c:import>

</body>

</html>
