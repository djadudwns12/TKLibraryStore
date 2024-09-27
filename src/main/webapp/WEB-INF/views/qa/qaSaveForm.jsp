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
<title>Ogani | Q&A Form</title>

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
    .form-group {
        width: 100%;
        margin-bottom: 1.5em;
    }
    .form-group label {
        font-size: 1.1em;
        color: #333;
        margin-bottom: 0.5em;
        display: block;
    }
    .form-group input, .form-group textarea {
        width: 100%;
        padding: 0.8em;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 1em;
    }
    .form-group textarea {
        height: 150px;
    }
    .submit-btn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 1em 2em;
        border-radius: 4px;
        font-size: 1.1em;
        cursor: pointer;
    }
    .submit-btn:hover {
        background-color: #0056b3;
    }
</style>

<!-- Google Font -->
<link
    href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
    rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		let qaList = $('.qaContent');
		
		$('#main_content').html(qaList);
	})
</script>
</head>

<body>

    <c:import url="../header.jsp"></c:import>

    <div class="qaContent">
        <h2>Q&A Form</h2>
        <hr>

        <!-- Input Form for Question and Answer -->
        <form action="/qa/qaSave" method="get">
            <div class="form-group">
                <label for="qTitle">Question No:</label>
                <input type="text" id="qTitle" name="qTitle" placeholder="Enter question qTitle" required>
            </div>
            <div class="form-group">
                <label for="qContent">Question Content:</label>
                <textarea id="qContent" name="qContent" placeholder="Enter your question here" required></textarea>
            </div>
            <div>
                <button type="submit" class="submit-btn">Submit</button>
            </div>
        </form>
    </div>

    <c:import url="../footer.jsp"></c:import>

</body>

</html>