<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

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

.loginform {
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
	background-color: #7FAD39;
	margin-top: 20px;
}

input[type="button"] {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	color: #fff;
	font-size: 16px;
	background-color: #7FAD39;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		let status = '${status}'
		if (status == 'loginFail') {
			$('.modal-body').text('로그인 실패 다시로그인 하여 주세요');
			$('#myModal').show();
		}
		// 체크박스 체크시 로그인 하는 유저의 id 저장
		if (localStorage.getItem('userId') != null) {
			$('#userId').val(localStorage.getItem('userId'));
			$('#remember-check').prop('checked', true);
		}
	})

	// 유저의 id 저장
	function userIdsave() {
		if ($('#remember-check')[0].checked == true) {
			let userId = $('#userId').val()
			localStorage.setItem('userId', userId);
		} else if ($('#remember-check')[0].checked == false) {
			localStorage.removeItem('userId');
			console.log(localStorage.getItem('userId'));
		}
	}

	// 로그인시 유효성 검사하는 함수
	function valid() {
		let userId = $('#userId').val()
		let userPwd = $('#userPwd').val()

		let returnYn = false;

		if (userId == '') {
			//alert('아이디를 입력하여 주세요');
			$('.modal-body').text('아이디를 입력하여 주세요');
			$('#myModal').show();
			return returnYn;
		}
		if (userPwd == '') {
			$('.modal-body').text('비밀번호를 입력하여 주세요');
			$('#myModal').show();
			return returnYn;
		}
		if (userId != '' && userPwd != '') {
			userIdsave();
			returnYn = true;
		}
		
		returnYn = checkSearchKeyword();
		
		return returnYn;

	}
	function modalClose(){
		$('#myModal').hide();
	}
	function kakaoLogin(){
		
	}
	
	const checkSearchKeyword = () => {
		  let keyword = document.getElementById("userPwd").value;

		  if (keyword.length > 0) {
		    //특수문자 제거
		    let expText = /[%=*><]/;
		    if (expText.test(keyword)) {
		      alert("[No SQL Injection] 특수문자를 입력 할 수 없습니다.");
		      keyword = keyword.split(expText).join("");
		      return false;
		    }

		    //특정문자열(sql예약어의 앞뒤공백포함) 제거
		    let sqlArray = new Array(
		      //sql 예약어
		      "OR ",
		      "SELECT",
		      "INSERT",
		      "DELETE",
		      "UPDATE",
		      "CREATE",
		      "DROP",
		      "EXEC",
		      "UNION",
		      "FETCH",
		      "DECLARE",
		      "TRUNCATE"
		    );

		    let regex;
		    for (let i = 0; i < sqlArray.length; i++) {
		      regex = new RegExp(sqlArray[i], "gi");
		      if (regex.test(keyword)) {
		        alert('[No SQL Injection] "' + sqlArray[i] + '"와(과) 같은 문자는 입력이 불가능 합니다.');
		        keyword = keyword.replace(regex, "");
		        return false;
		      }
		    }
		  }
		  return true;
		};
	
</script>

</head>
<body>
	<div class="loginform">
		<div class="login-wrapper">
			<h2>Login</h2>
			<form method="post" action="/member/login" id="login-form">
				<input type="text" name="userId" id="userId" placeholder="아이디">
				<input type="password" name="userPwd" id="userPwd"
					placeholder="Password"> <label for="remember-check">
					<input type="checkbox" id="remember-check" onclick="userIdsave()">아이디
					저장하기
				</label> 
				<input type="submit" value="Login" onclick="return valid()">
				<!-- <img src="/resources/images/kakao_login.png" style="width: 100%" onclick="kakaoLogin()"> -->
			</form>
			<!-- 회원 가입 버튼 -->
			<a href="/member/register"><input type="button" value="회원가입"></a>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" onclick="modalClose()"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body"></div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="modalClose()"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>