<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
	border: none;
}

body {
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
}
.loginform{
	display: flex;
	justify-content: center;
	align-content: space-between;
}
.login-wrapper {
	width: 400px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
}

.login-wrapper>h2 {
	font-size: 24px;
	color: green;
	margin-bottom: 20px;
}

#login-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#login-form>input::placeholder {
	color: #D2D2D2;
}

#login-form>input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #0D7C66;
	margin-top: 20px;
}
input[type="button"]{
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	color: #fff;
	font-size: 16px;
	background-color: #41B3A2;
	margin-top: 20px;
}

#login-form>input[type="checkbox"] {
	display: none;
}

#login-form>label {
	color: #999999;
}

#login-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#login-form input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	let status = '${status}'
	if(status == 'fail'){
		alert('로그인 실패 다시로그인 하여 주세요');
	}
	// 체크박스 체크시 로그인 하는 유저의 id 저장
	if (localStorage.getItem('userId') != null) {
		$('#userId').val(localStorage.getItem('userId'));
        $('#remember-check').prop('checked', true);
	}

})

// 유저의 id 저장
function userIdsave(){
	if($('#remember-check')[0].checked == true){
		let userId = $('#userId').val()
		localStorage.setItem('userId', userId);
	}
	else if($('#remember-check')[0].checked == false){
		localStorage.removeItem('userId');
		console.log(localStorage.getItem('userId'));
	}
}

// 로그인시 유효성 검사하는 함수
function valid() {
	let userId = $('#userId').val()
	let userPwd = $('#userPwd').val()
	
	let returnYn = false;
	
	if(userId == ''){
		alert('아이디를 입력하여 주세요');
		return returnYn;
	}
	if(userPwd == ''){
		alert('비밀번호를 입력하여 주세요');
		return returnYn;
	}
	if(userId != '' && userPwd != ''){
		returnYn = true;
	}
	return returnYn;
	
}

</script>

</head>
<body>
		<div class="loginform">
			<div class="login-wrapper">
				<h2>Login</h2>
				<form method="post" action="/member/login" id="login-form">
					<input type="text" name="userId" id="userId" placeholder="아이디"> <input
						type="password" name="userPwd" id="userPwd" placeholder="Password">
					<label for="remember-check"> <input type="checkbox"
						id="remember-check" onclick="userIdsave()">아이디 저장하기</label> 
					<input type="submit" value="Login" onclick="return valid()">
				</form>
				<!-- 회원 가입 버튼 -->
				<input type="button" value="회원가입" onclick="register()">
			</div>
		</div>
</body>
</html>