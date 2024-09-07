<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">	
	
<title>회원정보수정</title>
	<script>
	
	</script>
</head>

<body>
	
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="row">
		<div class="editMemberForm">
			<h3>회원정보 수정 페이지</h3>
		
			회원정보 : ${editMemberInfo}
		</div>
	</div>
	
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>