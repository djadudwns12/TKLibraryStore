<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<!--  <link rel="stylesheet" href="resources/template/css/adminlte.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b948e77617.js"
	crossorigin="anonymous"></script>
<!-- Load icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>






<style>
.fileBtns {
	display: flex;
	justify-content: flex-end;
}

.fileBtns input {
	margin-left: 5px;
}

.form-label {
	text-align: left;
}

.btns {
	display: flex;
	justify-content: center;
}

.jemok {
	margin-left: 30px;
}

.content1 {
	display: flex;
	justify-content: space-between;
	margin-left: 30px;
	width: 80%;
}

.content2 {
	display: flex;
	justify-content: space-between;
	margin-left: 30px;
	width: 80%;
}
.fileUploadArea {
	width: 50%;
	height: 400px;
	background-color: lightgray;
	text-align: center;
	margin-left: 60px;
}
.content3{
	display: flex;
	margin-left: 30px;
	
}
</style>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
	<!--begin::App Wrapper-->

	<div class="app-wrapper">
		<!--begin::Header-->
		<div class="sideBar">
			<jsp:include page="sideBar.jsp" />
		</div>
		<div class="header">
			<jsp:include page="header.jsp" />

			<h1 class="jemok">ModifyProduct</h1>

			<form action="/hboard/modifyBoardSave" method="post"
				enctype="multipart/form-data">
				<div class="content1">

					<div class="mb-3">
						<label for="bookNo" class="form-label">BookNo</label> <input
							type="text" class="form-control" id="boardNo" name="boardNo"
							value="${product.bookNo}" readonly>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label">Title</label> <input
							type="text" class="form-control" id="title" name="title"
							value="${product.title}">
					</div>
					<div class="mb-3">
						<label for="author" class="form-label">Author</label> <input
							type="text" class="form-control" id="writer"
							value="${product.author}" readonly>
					</div>
					<div class="mb-3">
						<label for="publisher" class="form-label">Publisher</label> <input
							type="text" class="form-control" id="postdate"
							value="${product.publisher}" readonly>
					</div>

					<div class="mb-3">
						<label for="genre" class="form-label">Genre</label> <input
							type="text" class="form-control" id="readcount"
							value="${product.genre}" readonly>
					</div>

				</div>
				<div class="content2">

					<div class="mb-3">
						<label for="price" class="form-label">Price</label> <input
							type="text" class="form-control" id="readcount"
							value="${product.price}" readonly>
					</div>
					<div class="mb-3">
						<label for="salePrice" class="form-label">SalePrice</label> <input
							type="text" class="form-control" id="readcount"
							value="${product.salePrice}" readonly>
					</div>
					<div class="mb-3">
						<label for="inven" class="form-label">Inven</label> <input
							type="text" class="form-control" id="readcount"
							value="${product.inven}" readonly>
					</div>

					<div class="mb-3">
						<label for="reviewCnt" class="form-label">ReviewCnt</label> <input
							type="text" class="form-control" id="readcount"
							value="${product.reviewCnt}" readonly>
					</div>
					<div class="mb-3">
						<label for="zzim" class="form-label">Zzim</label> <input
							type="text" class="form-control" id="readcount"
							value="${product.zzim}" readonly>
					</div>

				</div>
				
					<div class="mb-3" style="width: 80%; margin-left: 30px;">
						<label for="thumbNail" class="form-label">ThumbNail</label> <input
							type="text" class="form-control" id="readcount"
							value="${product.thumbNail}"
							style="width: 900px; margin-bottom: 50px;" readonly>
					</div>
					<div class="content3">
					 <img
							src="${product.thumbNail}" >
					<div class="fileUploadArea mb-3">
						<p>업로드할 파일을 여기에 드래그 드랍하세요!</p>
					</div>
				</div>
					<div class="mb-3" style="margin-top: 50px; margin-left: 30px; width: 85%;">
						<label for="introduction" class="form-label">Introduction</label>
						<textarea class="form-control" id="content" name="content"
							rows="5" style="height: 150px;">
							${product.introduction}
						</textarea>
					</div>

				

				<div style="margin-left: 1400px; margin-top: 50px;">
					<button class="btn btn-secondary btn" style="width: 70px;"
						onclick="location.href='/admin/modifySave'">저장</button>
				</div>

			</form>





		</div>



	</div>


</body>


</html>
