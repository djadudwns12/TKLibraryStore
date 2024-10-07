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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">



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
		

		let userId = '${sessionScope.loginMember.userId}'
		let bookNo = '${product.bookNo}'
		let zzimed = false;
		//  ------------------------찜기능
		$('.zzimHeart').on('click', function() {

			if (!userId) {
				// 로그인 되어 있지 않으면 confirm 창 띄우기
				if (confirm("회원만 찜 가능합니다. 로그인하시겠습니까?")) {
					// yes 선택 시 로그인 페이지로 이동
					window.location.href = "/member/loginPage";
				}
			} else {
				// 로그인 되어 있으면 찜 기능 실행

				if (zzimed) {
					handleZzimRemove(userId, bookNo);
					zzimed = false;
				} else {
					handleZzim(userId, bookNo);
					zzimed = true;
				}

			}

		});

		if (userId) {

			$.ajax({
				url : '/admin/zzimCheck',
				type : 'POST',
				data : {
					userId : userId,
					bookNo : bookNo
				},
				success : function(response) {
					console.log(response);

					// 클릭된 div 내의 img 태그의 src 속성 변경
					$('.zzimHeart').find('img').attr('src',
							'/resources/images/heart.png');
					zzimed = true;
					console.log(zzimed);
				},
				error : function(error) {
					console.log(userId + "회원이 좋아요 하지 않은 글");
				}
			});
		}
		
		// 별점 기능을 위한 배열 선언
		const ratingStars = [...document.getElementsByClassName("rating__star")];
		executeRating(ratingStars);

	});

	
	function handleZzim(userId, bookNo) {
		$.ajax({
			url : '/admin/zzimAdd',
			type : 'POST',
			data : {
				userId : userId,
				bookNo : bookNo
			},
			success : function(response) {

				alert("찜 목록에 추가되었습니다.");
				// 클릭된 div 내의 img 태그의 src 속성 변경
				$('.zzimHeart').find('img').attr('src',
						'/resources/images/heart.png');
			},
			error : function(error) {
				alert("찜 추가에 실패했습니다.");
			}
		});
	}

	function handleZzimRemove(userId, bookNo) {
		$.ajax({
			url : '/admin/zzimRemove',
			type : 'POST',
			data : {
				userId : userId,
				bookNo : bookNo
			},
			success : function(response) {

				alert("찜 목록에서 삭제되었습니다.");
				// 클릭된 div 내의 img 태그의 src 속성 변경
				$('.zzimHeart').find('img').attr('src',
						'/resources/images/emptyHeart.png');
			},
			error : function(error) {
				alert("찜 삭제에 실패했습니다.");
			}
		});
	}

	// (-) (+) 버튼을 누르면 표시되는 수량 변경
	function count(action) {
		var maxQty = $("#inven").val();	// bqty의 최대값(재고량)
		var qtyInput = document.getElementById("bqty");	// 수량 입력 필드
		var currentQty = parseInt(qtyInput.value);	// 현재 수량을 정수로 변환 

		if (action == 'minus') {
			if (currentQty > 1) {
				qtyInput.value = currentQty - 1;
			}
		}

		if (action == 'plus') {
			if (currentQty < maxQty) {
				qtyInput.value = currentQty + 1;
			}
		}
		
		showTotalPrice();
	}

	// 책 수량을 2권 이상 선택하면 총 가격을 화면에 출력하는 기능
	function showTotalPrice() {
		var bookPrice = $('#salePrice').val();
		var totalQty = document.getElementById("bqty").value;

		console.log("bookPrice: ", bookPrice);
		console.log("totalQty: ", totalQty);

		if (totalQty >= 2) {
			var totalPrice = totalQty * bookPrice;

			document.getElementById("priceVal").innerText = totalPrice;
			document.getElementById("totalPrice").style.display = "block";
		} else {
			document.getElementById("totalPrice").style.display = "none";
		}
	}

	function checkLogin() {
		let user = '${sessionScope.loginMember.userId}';

		if (user == '') {
			alert('로그인이 필요한 메뉴입니다');

		} else {
			location.href = '/cart/cartPage?userId="${userId}"';
		}
	}
	
	function executeRating(stars) {
		  const starClassActive = "rating__star fas fa-star";
		  const starClassInactive = "rating__star far fa-star";
		  const starsLength = stars.length;
		  let i;
		  
		  stars.map((star) => {
			    star.onclick = () => {
			      i = stars.indexOf(star);

			      if (star.className===starClassInactive) {
			        for (i; i >= 0; --i) 
			        	stars[i].className = starClassActive;
			      } else {
			        for (i; i < starsLength; ++i) 
			        	stars[i].className = starClassInactive;
			      }
			    };
			  });
		  
		}
	
	function saveReview() {
		let result = false;
		let review = $('#review').val();
		
		console.log(review);

		if (rating == '' && review == null) {

			//별점을 입력하지 않고 리뷰 내용도 작성하지 않았을 때 
			alert("별점을 입력하거나 리뷰 내용을 작성하셔야 합니다");
			$('#review').focus();
		} else {
			// 둘 중 하나라도 입력했을 때 
			result = true;
		}

		return result;
	}
	
</script>

<style>
.primary-btn {
	justify-content: space-between;
	color: #7FAD38;
	border: 0;
}

.zzimHeart {
	width: 40px; /* 가로 30px */
	height: 40px; /* 세로 30px */
	border: 1px solid black; /* 검은색 테두리 */
	border-radius: 5px; /* 모서리를 둥글게 */
	display: flex; /* 내부 요소를 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: center; /* 수평 가운데 정렬 */
	cursor: pointer; /* 마우스 커서를 손가락 모양으로 변경 */
}

.zzimHeart img {
	max-width: 65%; /* 이미지를 div 크기에 맞게 조정 */
	max-height: 65%; /* 이미지를 div 크기에 맞게 조정 */
}

.zzimHeart:hover {
	background-color: #f0f0f0; /* 마우스 오버 시 배경색을 밝은 회색으로 변경 */
}

.rating {
	width: 180px;
}

.rating__star {
	cursor: pointer;
	color: #dabd18b2;
}
</style>


<body>

	<c:import url="../header.jsp"></c:import>

	<div class="bDetail">

		<!-- 책 상세보기 Section Begin -->
		<section class="bookDetail">
			<div class="container">
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
								
								<div class="qtyControl" style="display: flex; align-items: center; gap: 10px;">
								<span><b>수량 </b></span> 
								<span class="count">
									<button type="button" class="minus" style="border: none;"
										onclick="count('minus');">-</button> <span><input
										type="text" id="bqty" name="bqty" value="1"
										readonly="readonly"
										style="text-align: center; width: 60px; border: none;"></span>
									<button type="button" class="plus" style="border: none;"
										onclick="count('plus');">+</button>
								</span> <input type="hidden" value="${bookInfo.inven }" id="inven">

								<!-- 선택 수량이 2개 이상일 때 가격을 표시하는 기능 -->
								<input type="hidden" value="${bookInfo.salePrice }" id="salePrice">
									<div id="totalPrice" style="display: none;">
										총 상품 금액: <span id="priceVal" style="color: red;"></span> 원
									</div>
								</div>
								<br>

								<div class="btns"
									style="display: flex; align-items: center; gap: 5px;">
									<button type="button" class="primary-btn"
										onclick="location.href='/order'"
										style="background-color: #DA8359;">바로주문</button>
									<button type="button" class="primary-btn"
										onclick="checkLogin();">장바구니 담기</button>
									<span class="zzimHeart"> <img
										src="/resources/images/emptyHeart.png">
									</span>

								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="product__details__tab">
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#tabs-1" role="tab"
										aria-selected="true">책 소개</a></li>

									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#tabs-2" role="tab" aria-selected="false">회원 리뷰<span>(1)</span></a></li>

								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tabs-1" role="tabpanel">
										<div class="product__details__tab__desc">
											<h4>책 소개</h4>
											<p>${bookInfo.introduction}</p>
										</div>
									</div>

									<div class="tab-pane" id="tabs-2" role="tabpanel">
										<div class="product__details__tab__desc">
											<h4>회원 리뷰</h4>
											<p></p>
											
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

	<c:import url="../footer.jsp"></c:import>


</body>
</html>