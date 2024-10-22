<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- <!DOCTYPE html> -->
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title> 마이페이지 | 회원탈퇴</title>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
* {
   font-family: "Gowun Batang", serif;
   font-weight: 550;
   font-style: normal;
}
.register-box{
	display : flex;
	justify-content: center;
}

.input-group{
	display: flex;
	text-align: center;
}
.input-group label{
	display :inline-block;
	width : 150px;
}
.input-group form-check {
	padding-left : 0px;
}
p {
	margin: 10px 0;
	font-family: "Gowun Batang", serif;
	font-weight: 550;
	font-style: normal;
}

ol {
	padding-left: 0; /* 왼쪽 여백 제거 */
}
li {
	margin-bottom: 15px; /* 각 리스트 항목 간 간격 추가 */
}
</style>
</head>
<body>
	<jsp:include page="./../header.jsp"></jsp:include>
	<div class="register-box pwdConfirm" style="margin:10px;">
		<div class="card pwdConfirmCard" style="padding:10px;">
			<p class="register-box-msg">회원 탈퇴</p>
			
			<div>
			
			<div><img src="/resources/images/TKlogo.png" style="width:50px;">  회원님께서 탈퇴 요청을 하신 후, 저희는 아래와 같은 절차로 회원님의 정보를 처리합니다.</div>
<section class="notice-section" style="margin : 30px;">
    <ol>
        <li><strong>유예기간 30일 부여</strong>  
            <p>회원 탈퇴 후에도 회원님의 소중한 정보를 보호하기 위해, 30일간의 유예기간을 제공합니다. 이 기간 동안 회원님의 계정 및 모든 정보는 삭제되지 않고 안전하게 보관됩니다.</p>
        </li>
        <li><strong>배송 완료되지 않은 결제 건이 있을 경우 탈퇴 불가</strong>  
            <p>회원 탈퇴를 요청하신 시점에 배송이 완료되지 않은 결제 건이 있는 경우, 탈퇴 처리가 불가능합니다. 모든 배송이 완료된 후 탈퇴 신청이 가능합니다.</p>
        </li>
        <li><strong>보유 포인트 소멸</strong>  
            <p>회원 탈퇴 시 회원님이 보유한 모든 포인트는 <span class="important">소멸</span>되며, 탈퇴 후에는 복구할 수 없습니다. 이 점 유의하시기 바랍니다.</p>
        </li>
        <li><strong>30일 이내 로그인 시 계정 복구</strong>  
            <p>회원 탈퇴 후 30일 이내에 다시 로그인하시면, 회원님의 계정은 복구되며 모든 정보가 유지됩니다. 단, 소멸된 포인트는 복구되지 않습니다.</p>
        </li>
        <li><strong>30일 이후 계정 및 정보 삭제</strong>  
            <p>탈퇴 후 30일이 경과한 시점부터는 회원님의 모든 정보가 영구적으로 삭제되며, 이는 복구가 불가능합니다.</p>
        </li>
    </ol>

    <div class="important" style="color:red;">주의 사항: 탈퇴 후 30일 이내에 로그인하지 않으면, 회원님의 정보는 복구할 수 없으므로 신중히 결정해주시기 바랍니다.</div>
</section>
			</div>
			
			<br>
			<div style="text-align:center;">
			<div> 정말로 탈퇴하시겠습니까? </div>
			<br>
				<button type="button" class="btn" onclick="deleteConfirm()" style="border-color:#7fad38; background-color:#7fad38; color:white;">회원탈퇴</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='/member/edit'">돌아가기</button>
			</div>
		</div>
	</div>
	<jsp:include page="./../footer.jsp"></jsp:include>
	
	<!-- The Modal -->
	<div class="modal" id="myModal" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">떡잎서점</h4>
					<button type="button" class="btn-close modalCloseBtn" data-bs-dismiss="modal"></button>
				</div>
			
				<!-- Modal body -->
				<div class="modal-body"></div>
			
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-info modalConfirmBtn" data-bs-dismiss="modal" style="border-color:#7fad38; background-color:#7fad38; color:white;" >확인</button><!-- onclick="location.href='/member/deleteconfirm'"; -->
				</div>
			</div>
		</div>
	</div>
<script>
//onclick="location.href='/member/deleteconfirm?userId=${param.userId}';"
$(function() {
	// Close, X 버튼 클릭하면 모달창 종료
	$('.modalCloseBtn').click(function() {
		$('#myModal').hide(100);
	});
	$('.modalConfirmBtn').click(function(){
		$('#myModal').hide();
	})
});

function deleteConfirm() {
	var userId = "${sessionScope.loginMember.userId}";
	$.ajax({
		url: "/member/deleteconfirm", 
		type: "post",
		dataType: 'text', // 응답을 텍스트로 받아옴
		data: {
			"userId": userId
		}, 
		success: function(response) {
			try {
				var jsonResponse = JSON.parse(response); // JSON으로 변환
				console.log(jsonResponse);
				if (jsonResponse.status === 'success') {
					$('#myModal').show();
					$('.modal-body').html("그동안 이용해주셔서 감사합니다.");
					$('.modalConfirmBtn').off("click").on("click", function() {
						$('#myModal').hide();
						location.href="/";
			        });
				} else if (jsonResponse.status === 'fail') {
					$('.modal-body').html("주문의 배송이 완료된 후에 탈퇴 가능합니다.");
					$('#myModal').show();
					$('.modalConfirmBtn').off("click").on("click", function() {
						$('#myModal').hide();
						location.href="/member/OrderStatus";
			        });
				}
       	        } catch (e) {
       	            console.error("JSON 변환 오류:", e);
       	            $('.modal-body').html("응답 처리 중 오류가 발생했습니다.");
       	            $('#myModal').show();
       	        }
       	    },
       	    error: function(xhr, status, error) {
       	        console.error("오류 발생:", error);
				$('#myModal').show();
				$('.modal-body').html("오류가 발생했습니다. 다시 시도해 주세요.");
       	    }
		
	});
}
</script>
</body>
</html>