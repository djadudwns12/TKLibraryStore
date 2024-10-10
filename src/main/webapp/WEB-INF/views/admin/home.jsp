<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<!--  <link rel="stylesheet" href="resources/template/css/adminlte.css"> -->


<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 구글차트 API -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script>
$(function(){
	// 방문자 통계페이지데이터를 가지고 오는 쿼리문
	getvisitHistory();
})

function getVisitorHistory(){
	$.ajax({
		url : '/admin/getVisitorHistory',
		type : 'get',
		contentType : false,
		processData : false,
		dataType : 'json',
		success : function(result) {
			console.log(result);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('업로드 실패: ' + textStatus);
		}
	});
}

	
</script>


<style>
img {
	width: 100px;
	height: 100px;
}

.content1 {
	margin-left: 100px;
	margin-top: 30px;
}

.content2 {
	display: flex;
	flex-direction: row;
	margin-left: 100px;
	margin-right: 100px;
	justify-content: space-around;
}

.content3 {
	margin-left: 100px;
	margin-top: 300px;
}

.content4 {
	display: flex;
	flex-direction: row;
	margin-left: 100px;
	margin-right: 100px;
	justify-content: space-around;
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

			<div class="content1">
				<h4>상품 통계</h4>
			</div>


			<div class="content2">
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>


			</div>

			<div class="content3">
				<h4>방문자통계</h4>
			</div>

			<div class="content4">
				<!-- 일별방문자 선그래프 그리기 -->
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>

				<!-- 연령대그래프 그리기(Pie) -->
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>

				<!-- 회원등급그래프 그리기(Pie) -->
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>
			</div>

		</div>

		<div></div>




	</div>
</body>
</html>
