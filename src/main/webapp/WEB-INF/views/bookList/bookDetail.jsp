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
		var modifyModal = $("#modifyModal");
		var deleteModal = $("#deleteModal");
		//let bDetail = $('.bDetail');
		//$('#main_content').html(bDetail);
		setRecenyBook();

		let userId = '${sessionScope.loginMember.userId}';
		let bookNo = '${param.bookNo}';
		console.log('지금 책 번호: ' + bookNo);
		
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
		
		
		$('.nav-tabs .nav-item a[href="#tabs-2"]').tab('show');
		
		
		
		// 로그인 이전에 적은 내용을 다시 집어 넣음
		//$('#review').html(localStorage.getItem('reviewContent'));

	
		 $(".close").on("click", function () {
			 modifyModal.hide();  // 모달 닫기
			 deleteModal.hide(); 
	        });
	
	});

	// 별점기능------------------------------------------------------------------------------------
	   document.addEventListener("DOMContentLoaded", () => {
	        const starGroups = Array.from(document.querySelectorAll(".rating")).map(group => 
	          Array.from(group.querySelectorAll(".rating__star"))
	        );
	        
	        executeRating(starGroups);
	      });
	
	   document.addEventListener("click", () => {
	        const starGroups = Array.from(document.querySelectorAll("#ratingModal")).map(group => 
	          Array.from(group.querySelectorAll(".rating__star"))
	        );
	        console.log($(starGroups)+ "---------------------")
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

			// 세 자리마다 콤마를 찍어서 출력
	        var formattedPrice = totalPrice.toLocaleString();

	        document.getElementById("priceVal").innerText = formattedPrice;
	        document.getElementById("totalPrice").style.display = "block";
	    } else {
	        document.getElementById("totalPrice").style.display = "none";
	    }
		
	}

	// 장바구니 버튼 누르면 (1)로그인여부 체크, (2)로그인했다면 장바구니에 담고, (3)장바구니에 겹치는 상품이 있는지 여부 확인+장바구니로 이동 여부 물어보기
 	function addToCart() {
		let userId = '${sessionScope.loginMember.userId}';
		let bookNo = document.getElementById("bs").value;
		let totalQty = document.getElementById("bqty").value;
		
		console.log(bookNo + ' 번 책 ' + totalQty + ' 권을 장바구니에 담자!');
		
		if (userId == '') {
			confirm("로그인이 필요한 메뉴입니다. 로그인하시겠습니까?");
			window.location.href='/member/loginPage';
			
		} else {
			 $.ajax({
		        url: '/bookList/insertCart',	// 데이터 보내는 곳 URL
		        type: 'POST',
		        //contentType: 'application/json',
		        data: {
		            userId: userId,
		            qty: totalQty,  // 최종 선택한 수량
		            bookNo: bookNo
		        },
		        success: function(response) {
		        	// (1) 해당 user의 장바구니에 겹치는 상품이 있는 경우
		        	if(response == 'updateTrue') {
		        		if(confirm('장바구니에 이미 있는 상품입니다. 장바구니로 이동하시겠습니까?')){
		        			location.href='/cart/cartPage';
		        		}
		        	// (2) 해당 user의 장바구니에 겹치는 상품이 없는 경우	
		        	} else if(response == 'insertTrue'){
		        		if(confirm('장바구니에 상품을 추가했습니다. 장바구니로 이동하시겠습니까?')){
		        			location.href='/cart/cartPage';
		        		}
		        	} 
		            
		        },
		        error: function(error) {
		            alert('장바구니 담기에 실패했습니다. 다시 확인해주세요.' + error);
		        }
		    }); 
			
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
	
	// ------------------------ 김가윤 ------------------------
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
					'reviewContent' : reviewContent,
					'reviewScore' : reviewScore,
					'bookNo' : bookNo
				};
				
				console.log(JSON.stringify(reviewData));
				
				$.ajax({
					url:'/review/insertReview',
					type:'POST',
					contentType:'application/json',
					data:JSON.stringify(reviewData),
					success: function(response) {
						window.location.href = response;
		            },
		            error: function(xhr, status, error) {
		                alert('리뷰 저장 중 오류가 발생했습니다: ' + error);
		                console.error('Error details:', xhr.responseText); // 오류 로그 출력
		            }
				});
		}		
	}
	
	function modifyReview() {
		let bookNo = '${param.bookNo}';
		let reviewNo = $('#reviewNo').val();
		let reviewContent = $('#reviewModal').val();
		const reviewScore = $(".rating > .fas").length;
		
		if (reviewContent.length < 1) {
			alert('리뷰 내용을 입력해주세요.');
		} else if (reviewScore == 0) {
			alert('별점을 입력해주세요.');
		} else {
			const reviewModifyData = {
					'bookNo' : bookNo,
					'reviewNo' : reviewNo,
					'reviewContent' : reviewContent,
					'reviewScore' : reviewScore
				};
				
				console.log(JSON.stringify(reviewModifyData));
				
				$.ajax({
					url:'/review/modifyReview',
					type:'POST',
					contentType:'application/json',
					data:JSON.stringify(reviewModifyData),
					success: function(response) {
		               
		             	// 리다이렉트 URL로 이동
		                window.location.href = response;
		                
		        		modifyModal.remove();	
		        		
		            },
		            error: function(xhr, status, error) {
		                alert('리뷰 수정 중 오류가 발생했습니다: ' + error);
		                console.error('Error details:', xhr.responseText); // 오류 로그 출력
		            }
				});
		
		
	}
		
	}
	
	function editReview(reviewNo,reviewScore, reviewContent) {
		$('#reviewModal').val(reviewContent);
		$('#modifyModal').show();
		
		console.log(reviewScore);
		
		let star = '';
		
		for(let i=1; i<=reviewScore;i++){
			star+='<i class="rating__star fas fa-star"></i>'
		}
		
		for(let i=1; i<=5-reviewScore;i++){
			star+='<i class="rating__star far fa-star"></i>'
		}
		console.log(star);
		$('#ratingModal').html(star);
		$('#reviewNo').val(reviewNo);

	}
	
	function deleteReviewModal(reviewNo) {
		$('#deleteModal').show();
		$('#reviewNo').val(reviewNo);
		
	}
	
	function deleteModal(){
		let reviewNo = $('#reviewNo').val();
		let bookNo = '${param.bookNo}';
		
		$.ajax({
			url:'/review/deleteReview',
			type:'POST',
			data: {
				reviewNo: reviewNo,
				bookNo: bookNo
			},
			success: function(response) {
				// 리다이렉트 URL로 이동
                window.location.href = response;
                $('#deleteModal').remove();	
        		location.reload();
            },
            error: function(xhr, status, error) {
                alert('리뷰 삭제 중 오류가 발생했습니다: ' + error);
                console.error('Error details:', xhr.responseText); // 오류 로그 출력
            }
		});
	}
	
	// ------------------------ 김가윤 ------------------------
	
	
	// localStorege에 최근본 책 넣는 내용
	function setRecenyBook(){
		
		let boll = $('#bs').val();
		
		let book = '${param.bookNo}';
		let userId = '${sessionScope.loginMember.userId}';
		//alert(book);
		let localbook = localStorage.getItem(userId+"_localbook");

		let bookList = new Set([]);
		if(localbook == null){
			// 로컬스토리지에 값을 넣어주기
			bookList.add(book);
			// set를 객체로 저장하는 함수(JSON.stringify(Array.from(bookList)))
            localStorage.setItem(userId+"_localbook", JSON.stringify(Array.from(bookList)));
		}else{
			console.log(localStorage.getItem(userId+"_localbook"));
			bookList =new Set(JSON.parse(localStorage.getItem(userId+"_localbook")));
			
			bookList.add(book);
			localStorage.setItem(userId+"_localbook", JSON.stringify(Array.from(bookList)));
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
									<div class="showRating">
										<c:forEach begin="1" end="${avgReviewScore}">
											<i class="rating__star fas fa-star"></i>
										</c:forEach>
										<c:forEach begin="1" end="${5-avgReviewScore}">
											<i class="rating__star far fa-star"></i>
										</c:forEach>
										<span>(${reviewCnt}개의 리뷰)</span>
									</div>
								</div>
								<div class="author">${bookInfo.author}지음</div>
								<div class="information">
									<p>
										<b>정가</b> <span><fmt:formatNumber
												value="${bookInfo.price}" type="currency" /></span>
									</p>
									<p>
										<b>판매가</b> <span style="font-size: 25px;"><fmt:formatNumber
												value="${bookInfo.salePrice}" type="currency" /></span>
									</p>
									<p>
										<b>배송예정일</b> <span>주문일로부터 3일 이내</span>
									</p>
									<p>
										<b>적립</b> <span>책 정가의 10%</span>
									</p>

								</div>

								<div class="qtyControl"
									style="display: flex; align-items: center; gap: 10px;">
									<span><b>수량 </b></span> <span class="count">
										<button type="button" class="minus" style="border: none;"
											onclick="count('minus');">-</button> <span><input
											type="text" id="bqty" name="bqty" value="1"
											readonly="readonly"
											style="text-align: center; width: 60px; border: none;"></span>
										<button type="button" class="plus" style="border: none;"
											onclick="count('plus');">+</button>
									</span> <input type="hidden" value="${bookInfo.inven }" id="inven">

									<!-- 선택 수량이 2개 이상일 때 가격을 표시하는 기능 -->
									<input type="hidden" value="${bookInfo.salePrice }"
										id="salePrice">
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
										onclick="addToCart();">장바구니 담기</button>
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
										href="#tabs-2" role="tab" aria-selected="false">회원 리뷰<span>(${reviewCnt}개)</span></a></li>

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
													<div class="review-item"
														data-review-content="${review.reviewContent}">
														<div
															class="review-content review_'${review.reviewContent}'">
															<p>${review.reviewWriter}</p>
															<p>
																<fmt:formatDate value="${review.reviewDate}"
																	pattern="yyyy-MM-dd" />
															</p>
															<p>${review.reviewContent}</p>

															<div class="reviewArea"
																style="display: flex; align-items: center; gap: 5px;">
																<div class="showRating">
																	<c:forEach begin="1" end="${review.reviewScore}">
																		<i class="rating__star fas fa-star"></i>
																	</c:forEach>
																	<c:forEach begin="1" end="${5-review.reviewScore}">
																		<i class="rating__star far fa-star"></i>
																	</c:forEach>
																</div>
															</div>

															<!-- 세션에 저장된 userId와 reviewWriter 비교 -->
															<c:if
																test="${sessionScope.loginMember.userId != null && sessionScope.loginMember.userId == review.reviewWriter}">
																<button
																	onclick="editReview(${review.reviewNo},${review.reviewScore},'${review.reviewContent}')">수정</button>
																<button onclick="deleteReviewModal(${review.reviewNo})">삭제</button>
															</c:if>
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

		<!-- The Modal -->
		<div class="modal" id="deleteModal" style="display: none;">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">떡잎서점</h4>
						<button type="button" class="btn-close close"
							data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">해당 리뷰를 삭제하시겠습니까?</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" onclick="deleteModal();">삭제</button>
						<button type="button" class="btn btn-secondary close"
							data-bs-dismiss="modal">취소</button>
					</div>

				</div>
			</div>
		</div>


		<!-- 수정 모달 -->
		<div class="modal" id="modifyModal" style="height: 800px;">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">리뷰 수정</h4>
					</div>

					<!-- Modal body -->

					<form>
						<div class="modal-body">

							<ul id="modifyForm">

								<div class="reviewArea"
									style="display: flex; align-items: center; gap: 5px;">
									<div class="rating" id="ratingModal"></div>
									<textarea class="reviewForm" id="reviewModal" name="review"
										placeholder="리뷰 내용을 작성해주세요" style="width: 150%;"></textarea>
									<input type="hidden" id="reviewNo">
								</div>

							</ul>

						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="modifyReview();">저장</button>
						
						<button type="button" class="btn btn-secondary close">취소</button>
						</div>
					</form>
					

				</div>
			</div>
		</div>


	</div>

	<c:import url="../footer.jsp"></c:import>


</body>
</html>