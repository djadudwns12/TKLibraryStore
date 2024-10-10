<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>떡잎서점 상세페이지</title>
<link rel="icon" href="/resources/images/TKlogo.png" type="image/png">



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
		//let bDetail = $('.bDetail');
		//$('#main_content').html(bDetail);

	});

	function checkLogin() {
		let user = '${sessionScope.loginMember.userId}';

		if (user == '') {
			alert('로그인이 필요한 메뉴입니다');

		} else {
			location.href = '/cart/cartPage?userId="${userId}"';
		}
	}
</script>

<style>
.primary-btn {
	justify-content: space-between;
	color: #7FAD38;
	border: 0;
}
</style>
<body>

	<c:import url="../header.jsp"></c:import>

	<div class="bDetail">
		<div class="container">

			<!-- 책 상세보기 Section Begin -->
			<section class="bookDetail">
				<div class="bookContainer">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="product__details__pic">
								<div class="product__details__pic__item">

									<c:forEach var="bookInfo" items="${bookDetailInfo}">
										<img class="bookImagelarge" src="${bookInfo.thumbNail}" alt="">
								</div>

							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="bookBriefInfo">
								<h3>${bookInfo.title}</h3>
								<div class="product__details__rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
								</div>
								<div class="author">${bookInfo.author}</div>
								<div class="information">
									<p>&nbsp;</p>


									<p>
										<b>정가</b> <span><fmt:formatNumber
												value="${bookInfo.price}" type="currency" /></span>
									</p>
									<p>
										<b>할인가</b> <span><fmt:formatNumber
												value="${bookInfo.salePrice}" type="currency" /></span>
									</p>
									<p>
										<b>배송예정일</b> <span>주문일로부터 3일 이내</span>
									</p>
									<p>
										<b>적립</b> <span>책 정가의 10%</span>
									</p>

								</div>

								<div class="btns">
									<p>
										<span><b>수량</b></span> <input type="number" id="bookCnt"
											value="1" min="1" style="width: 50px;" />
									</p>
									
									
									<p></p>
									<button type="button" class="primary-btn"
										onclick="location.href='/order'"
										style="backgroundcolor: #d0e5b0;">바로주문</button>
									<button type="button" class="primary-btn"
										onclick="checkLogin();">장바구니 담기</button>



								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="product__details__tab">
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#tabs-1" role="tab"

										aria-selected="true">Description</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tabs-2" role="tab" aria-selected="false">Information</a>
									</li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(1)</span></a>

										aria-selected="true">책 소개</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tabs-2" role="tab" aria-selected="false">구매 리뷰 <span>(1)</span></a>

									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tabs-1" role="tabpanel">
										<div class="product__details__tab__desc">
											<h6>책 소개</h6>
											<p>${bookInfo.introduction}</p>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
					</c:forEach>
				</div>
		</div>
		</section>


		<!-- The Modal -->
		<div class="modal" id="myModal" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">떡잎서점</h4>
						<button type="button" class="btn-close modalCloseBtn"
							data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body"></div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-info" onclick="">로그인</button>
						<button type="button" class="btn btn-danger modalCloseBtn"
							data-bs-dismiss="modal">취소</button>
					</div>

				</div>
			</div>
		</div>

	</div>
	</div>

	<c:import url="../footer.jsp"></c:import>


</body>
</html>