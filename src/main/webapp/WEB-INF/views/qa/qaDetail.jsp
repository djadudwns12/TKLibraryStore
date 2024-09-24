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

<!-- CSS Styles -->
<style>
    body {
        font-family: 'Cairo', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .qaContent {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 2em;
        background-color: #fff;
        max-width: 800px;
        margin: 2em auto;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .qaContent div {
        margin-bottom: 1.5em;
        width: 100%;
    }
    h2 {
        color: #007bff;
        text-align: center;
    }
    hr {
        border: 1px solid #007bff;
        margin: 1em 0;
    }
    .Answer {
        display: block;
        padding: 1em;
        width: 100%;
        border: 1px solid #007bff;
        border-radius: 4px;
        background-color: #f9f9f9;
        font-size: 1em;
    }
    .Answer span {
        color: #333;
    }
    strong {
        font-size: 1.1em;
    }
</style>

<!-- Google Font -->
<link
    href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
    rel="stylesheet">
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function() {
        let qaList = $('.qaContent');
        $('#main_content').html(qaList);
    });
</script>

<body>

    <c:import url="../header.jsp"></c:import>

    <div class="qaContent" id="main_content">
        <div>
            <h2>제목 : ${qa.qNo}</h2>
            <hr>
            <div>
                <strong>내용:</strong> ${qa.qContent}
            </div>
        </div>
        <c:if test="${qa.qAnswer != null}">
        
        <div>
            <strong>답변</strong>
            <span class="Answer"> ${qa.qAnswer}</span>
        </div>
        </c:if>
    </div>

    <c:import url="../footer.jsp"></c:import>

</body>

</html>
