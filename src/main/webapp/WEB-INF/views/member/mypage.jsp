<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
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
    display: inline-block;
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
}

.ex1 {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    gap: 20px;
    justify-content: space-between;
}

/* 포인트 현황 테이블 스타일 */
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

/* 최근 주문내역 및 최근 본 상품 */
.ex1 > div {
    flex: 1;
}

.ex1 img {
    width: 100%;
    max-width: 150px;
    height: auto;
    margin-right: 10px;
}

.list-group-item {
    display: flex;
    align-items: center;
    gap: 10px;
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
.userInfoDiv{
	padding: 100px;
}
</style>
<script type="text/javascript">
	$(function() {
		// 이미지 슬라이더
		new Swiper('.swiper-container', {

			slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 30, // 슬라이드간 간격
			slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

			// 그룹수가 맞지 않을 경우 빈칸으로 메우기
			// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
			loopFillGroupWithBlank : true,

			loop : true, // 무한 반복

			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
		
		// 마이페이메뉴 수정
		mypageNav();
		

	});
	function mypageNav(){
		let inputHTML = `<li onclick="showHide()"><h5><b>내정보보기<span class="showInfo">▼</span><span class="hideInfo">◀</span></b></h5></li>
			<li class="myInfo"><a href="/member/edit">ㅤ> 수정</a></li>
			<li class="myInfo"><a href="/member/myPage">ㅤ> 주소록 관리</a></li>
			<li><a href="#"><h5><b>찜</b></h5></a></li>
			<li><a href="/cart/cartPage"><h5><b>장바구니</b></h5></a></li>
			<li><a href="#"><h5><b>알림</b></h5></a></li>
			<li><a href="#"><h5><b>나의 회원등급</b></h5></a></li>
			<li><a href="#"><h5><b>나의 포인트 적립기록</b></h5></a></li>
			<li><a href="#"><h5><b>나의 리뷰</b></h5></a></li>
			<li><a href="/qa/qaList"><h5><b>1:1문의</b></h5></a></li>`;
		$('#categoryList').html(inputHTML);
	}
	function viewRecentlyBook() {
		let booklist = localStorage.getItem('localbook');

        $.ajax({
            url : "/bookList/recentBookList",
            type : "GET",
            dataType : "json",
            success : function(data) {
                console.log(data);
            },
            error : function(request, status, error) {
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }

        })

	}
	
	
	
	
	
</script>
</head>

<body>
  <c:import url="../header.jsp"></c:import>

    <div class="register-box userInfoDiv"> 
        <!-- Swiper Image Slider -->
        <div class="ex1">
            <div class="swiper-container">
        	<h5>찜목록</h5>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800" alt="Product Image 1">
                    </div>
                    <div class="swiper-slide">
                        <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2021/02/04/105283173.2.jpg" alt="Product Image 2">
                    </div>
                    <div class="swiper-slide">
                        <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2021/02/04/105283173.2.jpg" alt="Product Image 3">
                    </div>
                    <div class="swiper-slide" style="font-size: 50pt;">- 끝 -</div>
                </div>

                <!-- Navigation Buttons -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>

            <!-- Points Table -->
            <div class="pointlog">
            	<h6>최근적립내역</h6>
                <table class="table">
                    <thead>
                        <tr>
                            <th>날짜</th>
                            <th>적립사유</th>
                            <th>적립금</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2024-08-23</td>
                            <td>사용</td>
                            <td>500</td>
                        </tr>
                        <tr>
                            <td>2024-08-23</td>
                            <td>사용</td>
                            <td>500</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="ex1">
            <!-- Recent Orders -->
            <div>
                <h6>최근주문내역</h6>
                 
                 
                 <c:forEach var="order" items="${orderList}">
                 	<img src="${order.thumbNail}" alt="Recent Order 1" style="width: 100px;">
                 </c:forEach>
                 
                
            
            </div>

            <!-- Recently Viewed Products -->
            <div style="margin-left: 35px; margin-top: 10px;">
                <h6>최근본상품</h6>
                <ul class="list-group">
                    <li class="list-group-item">
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800" alt="Product Image" style="border-radius: 50%; width: 30px;">
                        <span>연금술사</span>
                    </li>
                </ul>
            </div>
        </div>
        
       
        
    </div>

   <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>