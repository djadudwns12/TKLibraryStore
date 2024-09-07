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
<title>Ogani | Template</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function saveEditInfo() {
		$.ajax({
			url : '/member/mypage', 	
			type : 'post',
			dataType : 'json', 
			success : function(data) { 	
					console.log(data)
					if(data.msg == 'success'){
						alert("수정완료!");
						console.log(data);
						location.href="/member/mypage";
					}
			},
			error : function(data) {
				alert("수정 실패!");	
				console.log(data);
			}
		});
	}
</script>

<style>
.input-group{
	display: flex;
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
		<!-- 회원정보 : ${editMemberInfo} -->
    <div class="register-box pwdConfirm">
	<div class="card pwdConfirmCard" style="padding:10px">
		<p class="register-box-msg">회원 정보 수정</p>
		
		<form action="mypage" method="post">
			<div class="input-group mb-3">
				<label>이름</label>
				<input type="text" class="form-control" name="userName" value="${editMemberInfo.userName}" readonly/>
            </div>
			<div class="input-group mb-3">
				<label>아이디</label>
				<input type="text" class="form-control" value="SqlSession.userId" readonly/>
            </div>
			<div class="input-group mb-3">
				<label>생년월일</label>
				<input type="date" class="form-control" value="${editMemberInfo.userBirth}" />
            </div>
			<div class="input-group mb-3">
				<label>비밀번호</label>
				<input type="password" class="form-control" placeholder="비밀번호 변경" />
            </div>
			<div class="input-group mb-3">
				<label>비밀번호확인</label>
				<input type="password" class="form-control" placeholder="비밀번호 확인" />
            </div>
			<div class="input-group mb-3">
				<label>이메일</label>
				<input type="email" class="form-control" value="${editMemberInfo.email}" />
            </div>
			<div class="input-group mb-3">
				<label>이메일 인증번호</label>
				<input type="text" class="form-control" />
            </div>
			<div class="input-group mb-3">
				<label>핸드폰 번호</label>
				<input type="text" class="form-control" value="${editMemberInfo.phoneNum}" />
            </div>
			<div class="input-group mb-3">
				<label>선호장르 선택</label>
				<div class="form-check checkGenre" >
					<input class="form-check-input1" type="checkbox" value="" id="flexCheckDefault1" /> 장르1
					<input class="form-check-input2" type="checkbox" value="" id="flexCheckDefault2" /> 장르2
					<input class="form-check-input3" type="checkbox" value="" id="flexCheckDefault3" /> 장르3
				</div>
            </div>

			<div class="d-grid gap-2" style="text-align:right;">
					<button type="submit" class="btn btn-primary" onclick="saveEditInfo();" style="border-color:#7fad38; background-color:#7fad38;">수정완료</button>
					<button type="reset" class="btn btn-danger">되돌리기</button>
					
			</div>
		</form>
	
	</div>
	</div>
	
	<jsp:include page="./../footer.jsp"></jsp:include>
</body>
</html>