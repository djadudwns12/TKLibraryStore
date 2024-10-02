<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
    height: 420px;
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
    max-width: 100%;
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
</style>
<script type="text/javascript">
	$(function() {
		let qaList = $('.userInfoDiv');
		$('#main_content').html(qaList);
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

	})
</script>
</head>

<body>
    <jsp:include page="./../header.jsp"></jsp:include>

    <div class="register-box userInfoDiv">
        <!-- Swiper Image Slider -->
        <div class="ex1">
            <div class="swiper-container">
        	<h5>최근확인</h5>
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
            	<h6>최근주문내역</h6>
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
                <img src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800" alt="Recent Order 1" style="width: 100px;">
                <img src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800" alt="Recent Order 2" style="width: 100px;">
                <img src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800" alt="Recent Order 3" style="width: 100px;">
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

    <jsp:include page="./../footer.jsp"></jsp:include>
</body>
</html>