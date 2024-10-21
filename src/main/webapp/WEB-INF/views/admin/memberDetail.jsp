<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>회원정보 상세보기</title>
<!--  <link rel="stylesheet" href="resources/template/css/adminlte.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b948e77617.js" crossorigin="anonymous"></script>
<!-- Load icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Google Fonts에서 Gowun Batang 폰트 불러오기 -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
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
		
			<h1 class="jemok">회원정보상세보기</h1>
		<div class="content">	

			<div class="mb-3 profile">	
				<div >
					<img src="${memberDetail.userImg }" style="width:200px; border-radius: 50%; margin-left:30px;"/>
				</div>
			
				<div class="content1">
					
					<div>
						<label for="userId" class="form-label">아이디</label> 
						<input type="text" class="form-control" id="userId" name="userId" value="${memberDetail.userId}" readonly>
					</div>
					<div>
						<label for="userPwd" class="form-label">비밀번호</label> 
						<input type="text" class="form-control" id="userPwd" name="userPwd" value="${memberDetail.userPwd}" readonly>	
					</div>
					<div class="mb-3">
						<label for="userName" class="form-label">이름</label> 
						<input type="text" class="form-control" id="userName" value="${memberDetail.userName}" readonly>
					</div>
				</div>
			</div>
				
				<div class="content2">
					<div class="mb-3">
						<label for="userBirth" class="form-label">생년월일</label> 
						<input type="text" class="form-control" id="userBirth" value="${memberDetail.userBirth}" readonly>
					</div>
					<div class="mb-3">
						<label for="phoneNum" class="form-label">휴대폰번호</label> 
						<input type="text" class="form-control" id="phoneNum" value="${memberDetail.phoneNum}" readonly>
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">이메일</label> 
						<input type="text" class="form-control" id="email" value="${memberDetail.email}" readonly>
					</div>
				</div>
				<div class="content3">
					<div class="mb-3">
						<label for="userClass" class="form-label">등급</label> 
						<input type="text" class="form-control" id="userClass" value="${memberDetail.userClass}" readonly>
					</div>
					<div class="mb-3">
						<label for="userPoint" class="form-label">포인트</label> 
						<input type="text" class="form-control" id="userPoint" value="${memberDetail.userPoint}" readonly>
					</div>
					<div class="mb-3">
						<label for="userTotalPay" class="form-label">총 구매액</label> 
						<input type="text" class="form-control" id="userTotalPay" value="${memberDetail.userTotalPay}" readonly>
					</div>

				</div>

				<div class="container mt-3" style="margin-top: 50px; margin-left: 30px; width: 80%;">
				  <h4>최근 주문 내역</h4>
				  <table class="table table-hover">
				    <thead>
				      <tr>
				        <th>주문일</th>
				        <th>주문번호</th>
				        <th>주문상태</th>
				      </tr>
				    </thead>
				    <tbody>
				    <c:choose>
				    	<c:when test="${recentOrder.isEmpty()}">
				    		<td colspan="5">주문내역이 없습니다...</td>
				    	</c:when>
				    	<c:otherwise>
					    	<c:forEach var="recentOrder" items="${recentOrder}">
						      <tr>
						        <td>${recentOrder.orderDate}</td>
						        <td>${recentOrder.orderNo}</td>
						        <td>${recentOrder.orderStatus}</td>
						        
						      </tr>
							</c:forEach>
						</c:otherwise>	
					</c:choose>
				    </tbody>
				  </table>
				</div>

				<div class="mb-3 reviews" >
					<h4>최근 리뷰</h4>	</div>
					<div class="mb-3 review" >
					<c:forEach var="recentReview" items="${recentReview}">
						<div class="card" style="width:25%;">
							<img class="card-img-top" src="${recentReview.thumbNail}" alt="Card image">
							<div class="card-body">
								<h4 class="card-title"><${recentReview.title}></h4>
								<div class="card-text">${recentReview.reviewContent}</div>
								<a href="#" class="btn btn-primary" style="border-color: #7fad38; background-color: #7fad38;">자세히..</a>
							</div>
						</div>
					</c:forEach>
					</div>
				

 				<div style="margin-left: 1400px; margin-top: 50px;">
					<button class="btn btn-secondary btn" style="width: 70px;" onclick="goBack()">뒤로가기
					</button>
				</div> 

			</div>
		
		</div>
	</div>

<style>
* {
   font-family: "Gowun Batang", serif;
   font-weight: 550;
   font-style: normal;
}
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
	margin-top: 50px;
	margin-left: 30px;
}
.profile {
	display: flex;
	justify-content: space-around;
	flex-direction: row;
	margin-left: 30px;
	margin-top: 50px;
	width: 80%;
}
.content1 {
	display: flex;
	justify-content: space-around;
	flex-direction: column;
	margin-left: 10px;
	width: 50%;
}

.content2 {
	display: flex;
	justify-content: space-around;
	margin-left: 30px;
	width: 80%;
}

.content3 {
	display: flex;
	justify-content: space-around;
	margin-left: 30px;
	width: 80%;
}

.reviews {
	margin-top: 50px; 
	margin-left: 40px; 
}
.review {
	display: flex;
	justify-content: flex-start;
	margin-top: 10px; 
	margin-left: 30px; 
	width: 80%;"

}

.card {
	margin-left: 10px;
}
</style>
<script>
$(function(){
	truncateText('.card-text', 10);
});
function goBack() {
    window.history.back();
}
function truncateText(selector, maxLength) {
    const element = document.querySelector(selector);
    const text = element.innerText;

    if (text.length > maxLength) {
        const truncated = text.substring(0, maxLength) + '...';
        element.innerText = truncated;
    }
}
</script>

</body>
</html>