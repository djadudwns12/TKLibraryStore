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
<title> 마이페이지 | 회원탈퇴</title>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
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


</style>
</head>
<body>
	<jsp:include page="./../header.jsp"></jsp:include>
	<div class="register-box pwdConfirm">
		<div class="card pwdConfirmCard" style="padding:10px">
			<p class="register-box-msg">회원 탈퇴</p>
			<div> 정말로 탈퇴하시겠습니까? </div>
			<button type="button" class="btn" onclick="deleteConfirm()" style="border-color:#7fad38; background-color:#7fad38; color:white;">회원탈퇴</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='/member/edit'">돌아가기</button>
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
					<button type="button" class="btn btn-info" data-bs-dismiss="modal" style="border-color:#7fad38; background-color:#7fad38; color:white;" onclick="location.href='/member/deleteconfirm';">확인</button>
				</div>
			</div>
		</div>
	</div>
<script>
	//onclick="location.href='/member/deleteconfirm?userId=${param.userId}';"
	function deleteConfirm(){
		$('#myModal').show(500);
		$(function() {
			// Close, X 버튼 클릭하면 모달창 종료
			$('.modalCloseBtn').click(function() {
				$('#myModal').hide(100);
			});
		});
		$('.modal-body').html("그동안 이용해주셔서 감사합니다.");
	}
</script>
</body>
</html>