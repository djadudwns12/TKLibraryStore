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
		setRecenyBook();

		let userId = '${sessionScope.loginMember.userId}';
		let bookNo = '${product.bookNo}';
		
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
		/* const ratingStars = [...document.getElementsByClassName("rating__star")];
		executeRating(ratingStars); */
		
		
		
		// 로그인 이전에 적은 내용을 다시 집어 넣음
		$('#review').html(localStorage.getItem('reviewContent'));

	});

	// 별점기능------------------------------------------------------------------------------------
	   document.addEventListener("DOMContentLoaded", () => {
	        const starGroups = Array.from(document.querySelectorAll(".rating")).map(group => 
	          Array.from(group.querySelectorAll(".rating__star"))
	        );
	        executeRating(starGroups);
	      });
	   // 별점기능------------------------------------------------------------------------------------
	
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


	// 장바구니 버튼 누르면 (1)로그인여부 체크, (2)로그인했다면 장바구니에 담고, 장바구니 이동 여부 물어보기
	function addCart() {
		let userId = '${sessionScope.loginMember.userId}';
		var bookNo = document.getElementById("bookNo").value;
		var totalQty = document.getElementById("bqty").value;
		
		console.log(userId + '님께서 ' + bookNo + ' 번 책 ' + totalQty + ' 권을 장바구니에 담았습니다.');

		if (userId == '') {
			alert('로그인이 필요한 메뉴입니다');	// '확인' 버튼 누르면 로그인 창으로 이동 
			window.location.href = "/member/loginPage";

		} else {
			
			// (1) 해당 user의 장바구니에 겹치는 상품이 있는 경우: '장바구니에 이미 담은 상품입니다. 장바구니로 고고?'
			$.ajax({
		        url: '/cart/insertCart',
		        type: 'POST',
		        contentType: 'application/json',
		        data: JSON.stringify({
		            userId: userId,
		            qty: totalQty,  // 최종 선택한 수량
		            bookNo: bookNo
		        }),
		        success: function(response) {
		        	alert(response.message);
		        },
		        error: function(xhr, status, error) {
		        	alert('xxxxx');
		        	console.error('xxxxx :', xhr.responseText);
		        }
		    });
			
			// (2-1) 장바구니에 겹치는 상품이 없는 경우: cart(userId, qty, booNo) 업데이트 
			// (2-2) '장바구니에 상품이 담겼습니다. 장바구니로 고고?'
		}
	}
	
	function executeRating(starGroups) {
		  const starClassActive = "rating__star fas fa-star";
		  const starClassInactive = "rating__star far fa-star";

		  // 각 별점 그룹마다 개별적으로 적용
		  starGroups.forEach(stars => {
		    const starsLength = stars.length;

		    stars.forEach((star, index) => {
		      star.onclick = () => {
		        if (star.className === starClassInactive) {
		          // 현재 클릭한 별과 그 이전의 모든 별을 활성화
		          for (let i = 0; i <= index; ++i) {
		            stars[i].className = starClassActive;
		          }
		        } else {
		          // 현재 클릭한 별과 그 이후의 모든 별을 비활성화
		          for (let i = index; i < starsLength; ++i) {
		            stars[i].className = starClassInactive;
		          }
		        }
		      };
		    });
		  });
		}
	
	function validReviewWriter() {
		let reviewWriter = '${sessionScope.loginMember.userId}';
		let reviewContent = $('#review').val();
		const reviewScore = $(".fas").length;
		const bookNo = '${param.bookNo}';
		
		if(reviewWriter == '' || reviewWriter == null) {
			if(reviewContent != '') {
	            localStorage.setItem("reviewContent", reviewContent);
	            localStorage.setItem("reviewScore", reviewScore);
	         }	        
	        location.href = "/member/loginPage?redirectUri=/bookList/bookDetail?bookNo=${param.bookNo}";
		} else {
			return '${sessionScope.loginMember.userId}';
		}
	}
	
	
	function saveReview() {
		let reviewWriter = validReviewWriter();
		let bookNo = '${param.bookNo}';
		let reviewContent = $('#review').val();
		const reviewScore = $(".rating > .fas").length;
		
		localStorage.setItem('reviewContent',reviewContent);
				
		
		if (reviewContent.length < 1) {
			alert('리뷰 내용을 입력해주세요.');
		} else if (reviewScore == 0) {
			alert('별점을 입력해주세요.');
		} else {
			const reviewData = {
					'reviewWriter' : reviewWriter,
					'reviewContent' : reviewContent,
					'reviewScore' : reviewScore,
					'bookNo' : bookNo
				};
				
				console.log(JSON.stringify(reviewData));
		}
		
		
				
	}
	
	// localStorege에 최근본 책 넣는 내용
	function setRecenyBook(){
		
		let boll = $('#bs').val();
		
		let book = '${param.bookNo}';
		//alert(book);
		let localbook = localStorage.getItem("localbook");

		let bookList = new Set([]);
		if(localbook == null){
			// 로컬스토리지에 값을 넣어주기
			bookList.add(book);
			// set를 객체로 저장하는 함수(JSON.stringify(Array.from(bookList)))
            localStorage.setItem("localbook", JSON.stringify(Array.from(bookList)));
		}else{
			console.log(localStorage.getItem("localbook"));
			bookList =new Set(JSON.parse(localStorage.getItem("localbook")));
			
			bookList.add(book);
			localStorage.setItem("localbook", JSON.stringify(Array.from(bookList)));
			console.log(bookList)
		}

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
										<input type="hidden" value="${bookInfo.bookNo}" id="bs">
										
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
								<div class="author">${bookInfo.author} 지음</div>
								<div class="information">
									<p>&nbsp;</p>


									<p>
										<b>정가</b> <span><fmt:formatNumber
												value="${bookInfo.price}" type="currency" /></span>
									</p>
									<p>
										<b>판매가</b> <span style="font-size:25px;"><fmt:formatNumber
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
										onclick="addCart();">장바구니 담기</button>
									<span class="zzimHeart"> <img
										src="/resources/images/emptyHeart.png">
									</span><input type="hidden" value="${bookInfo.bookNo}" id="bookNo">

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
										href="#tabs-2" role="tab" aria-selected="false">회원 리뷰<span>()</span></a></li>

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
											<div class="reviewArea"
												style="display: flex; align-items: center; gap: 5px;">
												<div class="rating">
													<i class="rating__star far fa-star"></i> <i
														class="rating__star far fa-star"></i> <i
														class="rating__star far fa-star"></i> <i
														class="rating__star far fa-star"></i> <i
														class="rating__star far fa-star"></i>
												</div>
												<textarea class="reviewForm" id="review" name="review"
													placeholder="리뷰 내용을 작성해주세요" style="width: 80%;"></textarea>
												<button type="submit" class="btn btn-primary"
													style="background-color: #7FAD38; border: 0; width: 70px; height: 55px;"
													onclick="saveReview();">저장</button>
											</div>
											
											<div class="reviewList">
												<c:forEach var="review" items="${review}">
													<div class="review-item" data-review-content="${review.reviewContent}">
														<div class="review-content">
															<p>${review.reviewWriter}</p>
															<p>${review.reviewDate}</p>
															<p>${review.reviewContent}</p>
															<div class="reviewArea" style="display: flex; align-items: center; gap: 5px;">
												<div class="showRating">
													<c:forEach begin="1" end="${review.reviewScore}">
														<i class="rating__star fas fa-star"></i> 
													</c:forEach>
													<c:forEach begin="1" end="${5-review.reviewScore}">
														<i class="rating__star far fa-star"></i> 
													</c:forEach>
												</div>
														</div>
													</div>
												</c:forEach>
											</div>
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