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
	<!-- 회원정보 : ${loginMember} -->
	<div class="register-box userInfoDiv">
		<%-- <div class="card pwdConfirmCard" style="padding:10px">
		<p class="register-box-msg">회원 정보표출</p>		
			<div class="input-group mb-3">
				<label>이름</label>
				<span>${loginMember.userName}</span>
            </div>
			<div class="input-group mb-3">
				<label>아이디</label>
				<span>${loginMember.userId}</span>
            </div>
			<div class="input-group mb-3">
				<label>생년월일</label>
				<span>${loginMember.userBirth}</span>
            </div>
			<div class="input-group mb-3">
				<label>이메일</label>
				<span>${loginMember.email}</span>
            </div>

			<div class="input-group mb-3">
				<label>핸드폰 번호</label>
            	<span>${loginMember.phoneNum}</span>
            </div>
	</div> --%>
		<div class="ex1">

			<!-- 클래스명은 변경하면 안 됨 -->
			<div class="swiper-container">
				찜목록
				<div class="swiper-wrapper">
					<!-- 슬라이드할 이미지 넣는곳 -->
					<div class="swiper-slide">
						<img
							src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800">
					</div>
					<div class="swiper-slide">
						<img
							src="https://dimg.donga.com/wps/NEWS/IMAGE/2021/02/04/105283173.2.jpg">
					</div>
					<div class="swiper-slide">
						<img
							src="data:image/jpeg;base64,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">
					</div>

					<div class="swiper-slide" style="font-size: 50pt;">- 끝 -</div>
				</div>

				<!-- 네비게이션 -->
				<div class="swiper-button-next"></div>
				<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div>
				<!-- 이전 버튼 -->
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</div>
			<!-- 포인트 현황 -->
			<div class="pointlog">
				<table class="table" style="width: 200%">
					<thead>
						<tr>
							<th>날짜</th>
							<th>적립사유</th>
							<th>적립금</th>
						</tr>
					</thead>
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
				</table>

			</div>
		</div>
		<div class="ex1">
			<!-- 최근 주문내역 -->
			<div>
				<img  style="width: 100px"
					src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800">
				<img style="width: 100px"
					src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800">
				<img style="width: 100px"
					src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800">
			</div>
			<!-- 최근본상품 -->
			<div style="margin-left: 35px; margin-top: 10px">
			최근본상품
				<ul class="list-group">
					<li class="list-group-item"><img
						style="border-radius: 50%; width: 30px"
						src="https://mblogthumb-phinf.pstatic.net/MjAxODEyMDhfMTQz/MDAxNTQ0MjMyMDE4NDU4.x8TtSN-Knc5CrNjwpb1ulTDLpEui7mTLYPqGNUjnDbQg.-9zaXZALDcAXbsdoOfiPngUMs5JRQ6KNVPi0MCoowAgg.PNG.8713232/image.png?type=w800"><span>연금술사</span></li>
				</ul>
			</div>

		</div>


	</div>

	<jsp:include page="./../footer.jsp"></jsp:include>
</body>
</html>