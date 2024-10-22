<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지 | 회원정보수정</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Swiper CSS/JS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- Custom Styles -->
<style>
/* 전역 스타일 */
body {
	font-family: 'Cairo', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.input-group {
	display: flex;
	margin-bottom: 10px;
	align-items: center;
}

.input-group label {
	width: 150px;
}

.input-group span {
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 8px;
	width: 100%;
}

/* 이미지 슬라이더 */
.swiper-container {
	height: 340px;
	border: 5px solid silver;
	border-radius: 7px;
	box-shadow: 0 0 20px #ccc inset;
}

.swiper-slide {
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 80%;
	object-fit: cover;
	width: 300px;
	height: 400px;
	margin: 10px;
}

/* 레이아웃 */
.ex1 {
	display: flex;
	flex-direction: column;
	gap: 20px;
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
}

.ex1>div {
	flex: 1;
	width: 100%;
}

/* 테이블 스타일 */
table.table {
	width: 100%;
	border-collapse: collapse;
}

table.table th, table.table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

table.table th {
	background-color: #f4f4f4;
	font-weight: bold;
}

/* 반응형 디자인 */
@media screen and (max-width: 768px) {
	.ex1 {
		flex-direction: column;
		gap: 10px;
	}
	.swiper-container {
		height: auto;
	}
}

.userInfoDiv {
	padding: 50px;
}
</style>

<script type="text/javascript">
$(function() {
    // 이미지 슬라이더
    new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 30,
        slidesPerGroup: 3,
        loopFillGroupWithBlank: true,
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });

    // 마이페이지 네비게이션 설정
    mypageNav();

    // 최근본목록 보기
    recentViews();
    
    
    $('.close').on('click',function(){
    	$('#Modal').hide();
    })

});

function mypageNav() {
    const inputHTML = `
        <li onclick="showHide()"><h5><b>내정보보기<span class="showInfo">▼</span><span class="hideInfo">◀</span></b></h5></li>
        <li class="myInfo"><a href="/member/edit">ㅤ> 수정</a></li>
        <li class="myInfo"><a href="/member/myPage">ㅤ> 주소록 관리</a></li>
        <li><a href="#"><h5><b>찜</b></h5></a></li>
        <li><a href="/cart/cartPage"><h5><b>장바구니</b></h5></a></li>
        <li><a href="/member/OrderStatus"><h5><b>주문현황</b></h5></a></li>
        <li><a href="#"><h5><b>알림</b></h5></a></li>
        <li><a href="#"><h5><b>나의 회원등급</b></h5></a></li>
        <li><a href="#"><h5><b>나의 포인트 적립기록</b></h5></a></li>
        <li><a href="#"><h5><b>나의 리뷰</b></h5></a></li>
        <li><a href="/qa/qaList"><h5><b>1:1문의</b></h5></a></li>`;
    $('#categoryList').html(inputHTML);
}
// 마이페이지 최근본 목록을 불러오는 함수
function recentViews() {
	let userId = '${sessionScope.loginMember.userId}';
    let localBook = localStorage.getItem(userId+"_localbook");

    let obj = JSON.parse(localBook);

    console.log(obj);
    
    if(localBook != null){
    	$.ajax({
            url: "/bookList/getRecentViews",
            type: "post",
            dataType: "json",
            contentType: 'application/json',  // 전송할 데이터의 형식
            //data: {'obj':obj},
            data : localBook ,
            success: function(data) {
//            	console.log(data);
                let inputHTML = '';

                $.each(data.booklist, function(i,row){
                    inputHTML += `<li class="list-group-item" onclick="location.href='/bookList/bookDetail?bookNo=\${row.bookNo}'">`;
                    inputHTML += '<img src="'+row.thumbNail+'" alt="Product Image" style="border-radius: 50%; width: 30px;">';
                    inputHTML += '<span>'+row.title+'</span>';
                    inputHTML += '</li>';
                });
                $('#recentlyView').html(inputHTML);
            },
    		error : function(data){
    			console.log('최근본목록 불러오기 실패')
    		}
        	
        });	
    }

    	

}
// 주문 상세보기 모달띄우기 위해서 불러오는 부분
function detailOrder(orderNo){
	$.ajax({
        url: "/order/detailOrder",
        type: "post",
        dataType: "json",
        contentType: 'application/json',  // 전송할 데이터의 형식
        //data: {'obj':obj},
        data : orderNo,
        success: function(data) {
        	console.log(data);
        	let totalPrice = 0;
        	let inputHTML = '';
        	$.each(data,function(i,item){
        		let intPrice = parseInt(item.salePrice * item.qty)
        		let price = intPrice.toLocaleString('ko-KR',{ style: "currency", currency: "KRW" });
        		inputHTML += '<div class="restockLI"><li class="list-group-item"><img src="'+item.thumbNail+'" style="width : 50px; height: 80px;">'+item.title+'<span style="font-size: 10px; color: gray;">  '+item.author+'</span><span style="font-size: 16px;">  '+item.qty+'권</span><span style="font-size: 16px;float: right;">  '+price+'원</span></li></div>'
        		totalPrice += intPrice;
        		$('.modal-title').html('주문 번호 : '+item.orderNo)
        	});
        	$("#orderList").html(inputHTML);
        	$("#orderList").append('<div  style="text-align: right;"> 총금액 : '+totalPrice.toLocaleString('ko-KR',{ style: "currency", currency: "KRW" })+' </div>');
        	showModal()
        	
        	
        },
		error : function(data){
			console.log('최근본목록 불러오기 실패')
		}
    	
    });	
}
function showModal() {
    $('#Modal').show();
 }
 
 // 체크 박스 함수
 function selectAll(obj) {
		var checked = obj.checked
		
		if(checked){			
			$('input:checkbox').prop('checked',true);
		}else{
			$('input:checkbox').prop('checked',false);
		}
	}
	function checkallYN() {
		let ckbox = $('tbody input[type=checkbox]');
		
		yn = true;
		
		$(ckbox).each(function(i,c){
			if(!c.checked){
				yn = false;
			}
			console.log(yn)
		});
		if(yn){
			$('#allck').prop('checked',true);
		}else{
			$('#allck').prop('checked',false);
		}
		
	}
 
	
	
function orderCancel(){
		let checked = $('.ckOrder:checked');
		let ckArr = []
		
		// 체크된 것 array에 넣기
		$(checked).each(function(i,item){
			ckArr.push(item.value);
		});
		console.log(ckArr);
		$.ajax({
	        url: "/order/orderCancel",
	        type: "post",
	        dataType: "json",
	        contentType: 'application/json',  // 전송할 데이터의 형식
	        data : JSON.stringify(ckArr),
	        success: function(data) {
	        	console.log(data);	
	        	if(data.result == true){
	        		alert(checked.length+'개 주문 취소 요청완료');
	        		setOrderList(data.orderList)
	        	}
	        },
			error : function(data){
				console.log('주문취소 실패')
			}
	    	
	    });		
	}
function setOrderList(orderList){
	let inputHTML = '';
	$.each(orderList,function(i,order){
		inputHTML += '<tr>'
		if(order.orderStatus=='배송중' || order.orderStatus=='결제완료'){
			inputHTML += `<td><input type="checkbox" value="\${order.orderNo}" name="proCheck" class="ckOrder" onclick="checkallYN(this)"></td>`
		}else{
			inputHTML += `<td></td>`
		}
		
		inputHTML += `<td>\${order.orderNo}</td>`
		let orderDate =	formatDate(order.orderDate);
		inputHTML += `<td>\${orderDate}</td>`
		let price = parseInt(order.totalPay).toLocaleString('ko-KR',{ style: "currency", currency: "KRW" });
		inputHTML += `<td>\${price}</td>`
		inputHTML += `<td>\${order.orderAddress}</td>`
		inputHTML += `<td>\${order.orderStatus}</td>`
		inputHTML += `<td><button class='btn btn-info' onclick="detailOrder('\${order.orderNo}')">상세보기</button></td>`
		inputHTML += `</tr>`		
	});
	$('#orderTable').html(inputHTML);
	
}
//날짜를 포맷에 맞게 출력하는 함수
function formatDate(longDate) {
  const date = new Date(longDate);
  const year = date.getFullYear();
  const month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1
  const day = ('0' + date.getDate()).slice(-2);
  const hours = ('0' + date.getHours()).slice(-2);
  const minutes = ('0' + date.getMinutes()).slice(-2);
  const seconds = ('0' + date.getSeconds()).slice(-2);
  const milliseconds = date.getMilliseconds(); // 밀리초
  
  return `\${year}-\${month}-\${day} \${hours}:\${minutes}:\${seconds}.\${milliseconds}`;
}
</script>
</head>

<body>
	<c:import url="../header.jsp"></c:import>

	<div class="register-box userInfoDiv">
		<div class="ex1">
			<!-- 최근 주문 내역 -->
			<div class="col">
				<h4>주문내역</h4>
				<button class='btn btn-info' onclick="orderCancel()" style="float: right; margin-bottom: 15px;">주문취소요청</button>
				<table class="table">
					<thead>
						<tr>
							<th><input type="checkbox" id="allck" onclick="selectAll(this)"></th>
							<th>주문번호</th>
							<th>날짜</th>
							<th>금액</th>
							<th>배송지</th>
							<th>주문상태</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody id="orderTable">
						<!-- 주문 리스트 가져오기 -->
						<c:forEach var="order" items="${orderList}">
							<tr>
								<td>
									<c:if test="${order.orderStatus == '배송중' || order.orderStatus == '결제완료'}">							
										<input type="checkbox" value="${order.orderNo}" name="proCheck" class="ckOrder" onclick="checkallYN(this)">
									</c:if>
								</td>
								<td>${order.orderNo}</td>
								<td>${order.orderDate}</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.totalPay}" /></td>
								<td>${order.orderAddress}</td>
								<td>${order.orderStatus}</td>
								<td><button class='btn btn-info' onclick="detailOrder('${order.orderNo}')">상세보기</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal" id="Modal" style="height: 800px;">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                     <h5 class="modal-title">주문 번호</h5>
                     <button type="button" class="btn-close close" data-bs-dismiss="modal"></button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body" >
                     <!-- <div style="display:flex;">
                        <input type="text" style="width:330px; margin-right: 20px;"placeholder="검색할 책을 입력하세요." id="searchValue" />
                        <button  class="btn btn-outline-dark btn" id="searchBtn" >검색</button>
                     </div> -->
                     <ul id="orderList" class="list-group" >
                        <!-- 추천 검색어가 동적으로 삽입될 곳 -->
                     </ul>
                     
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                     <button type="button" class="btn btn-danger close"
                        data-bs-dismiss="modal">Close</button>
                  </div>

               </div>
            </div>
         </div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
