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
<title> 마이페이지 | 회원정보수정</title>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
#emailAuth {
	margin-top:10px;
}
#emailAuth span{
	margin-left:10px;
	margin-right:10px;
}
#emailEditBtn {
	margin-left:10px; 
	border-color:#7fad38; 
	background-color:#7fad38;
}
</style>
</head>


<body>
	
	<jsp:include page="./../header.jsp"></jsp:include>
		<!-- 회원정보 : ${editMemberInfo} -->
    <div class="register-box pwdConfirm">
	<div class="card pwdConfirmCard" style="padding:10px">
		<p class="register-box-msg">회원 정보 수정</p>
		
		<form method="post"> <!-- action="/member/mypage" -->
			<div class="input-group mb-3">
				<label>이름</label>
				<input type="text" class="form-control" id="userName" name="userName" value="${editMemberInfo.userName}" readonly/>
            </div>
			<div class="input-group mb-3">
				<label>아이디</label>
				<input type="text" class="form-control" id="userId" name="userId" value="dooly" readonly/>
            </div>
			<div class="input-group mb-3">
				<label>생년월일</label>
				<input type="date" class="form-control" id="userBirth" name="userBirth" value="${editMemberInfo.userBirth}" />
            	<input type="hidden" id="userBirthCheck" value="checked"/>
            	<div id="userBirthError" style="color: red;"></div>
            </div>
			<div class="input-group mb-3">
				<label>비밀번호</label>
				<input type="password" class="form-control " id="userPwd" name="userPwd" value="${editMemberInfo.userPwd}"/>
            	<div id="userPwdError" style="color: red;"></div>
            </div>
			<div class="input-group mb-3">
				<label>비밀번호확인</label>
				<input type="password" class="form-control" id="userPwdConfirm" name="userPwdConfirm" value="${editMemberInfo.userPwd}"/>
            	<input type="hidden" id="pwdCheck" value="checked"/>
            	<div id="userPwdConfirmError" style="color: red;"></div>
            </div>
			<div class="input-group mb-3">
				<label>이메일</label>
				<input type="email" class="form-control" id="email" name="email" value="${editMemberInfo.email}" readonly/>
            	<button type="button" id="emailEditBtn" class="btn btn-primary" onclick="emailEdit();" >이메일변경</button>
            	<input type="hidden" id="emailCheck" value="checked"/>
            	<div id="emailError" style="color: red;"></div>
            </div>

			<div class="input-group mb-3">
				<label>핸드폰 번호</label>
				<input type="text" class="form-control" id="phoneNum" name="phoneNum" value="${editMemberInfo.phoneNum}" />
            	<input type="hidden" id="phoneNumCheck" value="checked"/>
            	<div id="phoneNumError" style="color: red;"></div>
            </div>

			<div class="d-grid gap-2" style="text-align:right;">
					<button type="submit" class="btn btn-primary" onclick="return isValid();" style="border-color:#7fad38; background-color:#7fad38;">수정완료</button>
					<button type="reset" class="btn btn-danger" >되돌리기</button>
					
			</div>
		</form>
	
	</div>
	</div>
	
	<jsp:include page="./../footer.jsp"></jsp:include>



<!-- <script src="/resources/js/authTimer.js"></script> -->
<script type="text/javascript">
$(function(){
	// 비밀번호 변경을 위해 userPwd에 비밀번호를 입력할 때 > 비밀번호 양식 확인
	$('#userPwd').on("input", function() {
		let tmpPwd = $('#userPwd').val();
		let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,20}$/;
		if (!passwordRegExp.test(tmpPwd)) {
			outputError("영문/숫자/특수문자[!@#$%^&*()] 조합 (8~20자)으로 입력하세요.", $('#userPwd'));
		} else {
			// 에러메시지 사라짐
			clearError($("#userPwd"));
        	$("#userPwd").css("border", "");
        	$("#pwdCheck").val("");
		}
	});
	// userPwdConfirm에서 비밀번호 입력하고 blur 되었을때
    $("#userPwdConfirm").blur(function () {
    	let tmpPwd = $("#userPwd").val();
    	if (tmpPwd != $(this).val()) {
            outputError("패스워드가 다릅니다.", $("#userPwdConfirm"));
            $("#userPwdConfirm").val("");
            $(this).val("");
            
          } else {
            clearError($("#userPwdConfirm"));
            $("#pwdCheck").val("checked");
          }
    });
	// 생년월일을 입력했을 때
	$("#userBirth").on("input", function(){
		let userBirth = new Date($('#userBirth').val());
		let today = new Date();
		let userBirthCheck = $('#userBirthCheck').val();
		// 생년월일이 오늘보다 클 때
		if(userBirth>=today){
			alert('생년월일을 확인해주세요'); 
			$('#userBirth').val('');
			$('#userBirthCheck').val('');
			return false; 
		} else if (userBirth<today) {
			$('#userBirthCheck').val('checked');
			return true;
		}
	});
	// 휴대폰번호 입력하고 blur
	$("#phoneNum").blur(function(){
		let tmpPhone = $('#phoneNum').val();
		let phoneRegExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
        if (!phoneRegExp.test(tmpPhone)) {
        	outputError('휴대폰 번호 형식이 아닙니다. 예) 010-1234-5678',$('#phoneNum')); 
        	$("#phoneNumCheck").val("");
			return false; 
		} else {
			clearError($('#phoneNum'));
			$("#phoneNumCheck").val("checked");
			return true;
		}
	});
});


//===============================인풋태그 오입력 처리=====================================//
// 에러가 난 태그의 선색상을 빨간색으로
function outputError(msg, obj) {
	$("#" + obj.attr('id') + "Error").html(msg); 
	$("#" + obj.attr('id') + "Error").show();
    $(obj).css("border", "2px solid red"); 
}

// obj 다음 이웃 태그(에러메시지 div)를 지운다
function clearError(obj) {
	$("#" + obj.attr('id') + "Error").hide();
  $(obj).css("border", ""); // css를 원래 상태로
}
//==================================수정완료버튼 클릭시=========================================//
// 아래의 조건이 모두 만족할 때 회원수정 진행되도록
 	function isValid(){
	// 빈칸 없음, 비밀번호 확인, 이메일 변경시 이메일 인증 진행
	let pwdChecked = userPwdValid();
	let birthChecked = userBirthValid();
	let emailChecked = userEmailValid();
	let phoneNumChecked = phoneNumValid();
	if(pwdChecked && birthChecked && emailChecked && phoneNumChecked){
		//location.href="/member/mypage";
		return true;
	} else {
		return;
	}
}

// 생년월일 입력 확인
function userBirthValid(){
	let userBirth = Date($('#userBirth').val());
	let today = new Date();
	let userBirthCheck = $('#userBirthCheck').val();
	if(userBirth<today){
		$('#userBirthCheck').val('checked')
		return true; 
	} else if(userBirth>=today||userBirthCheck=='') {
		alert('생년월일을 확인해주세요'); 
		$('#userBirthCheck').val('');
		$('#userBirth').focus();
		return false;
	}
}

// 비밀번호 확인
function userPwdValid(){
	if ($("#pwdCheck").val() == 'checked') {
		return true;
	} else {
		alert("비밀번호를 확인하세요.");
		return false;
	}
}

// 이메일 확인
function userEmailValid(){
	if ($("#emailCheck").val() == 'checked') {
		return true;
	} else {
		alert("이메일 인증을 완료해주세요.");
		return false;
	}
}

// 이메일 변경버튼 클릭
	function emailEdit(){
	$('#email').removeAttr("readonly");
	$('#email').focus();
	$('#emailCheck').val("");
	// clearInterval(timerInterval);
	
	let emailInputEdit = `<button type="button" id="emailConfirmBtn" class="btn btn-primary" onclick='sendAuthCode()' style='margin-left:10px; border-color:#7fad38; background-color:#7fad38;'>인증코드 전송</button>`;
	$(emailInputEdit).insertAfter($("#emailEditBtn"));
	$("#emailEditBtn").hide();
	$("#emailAuth").remove();
} 

// 이메일 형식확인/인증
function sendAuthCode(){
	// 1. 이메일 주소형식 확인
	let tmpEmail = $('#email').val();
	let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if(!emailFormat.test(tmpEmail)) {
		outputError("이메일 주소형식이 아닙니다.", $('#email'));
		$('#emailCheck').val("");
	} else {
		$("#emailEditBtn").show();
		$("#emailConfirmBtn").hide();
		// 2. 이메일 인증 : 인증메일을 보내고 문자를 입력받아서 검증한다
		clearError($('#email')); // 이메일형식 유효성검사후 css원상복구
		showAuthDiv(); // 이메일 인증코드 입력 태그 생성
		sendAuthMail(); // 이메일 보내기
		//startTimer(); //타이머 동작시키기
		// 코드 확인하기
		
	}
}

// 이메일 인증
function showAuthDiv() {
	alert('이메일로 인증코드를 발송했습니다. \n인증코드를 입력해주세요.');
	authDiv = `<div class='input-group mb-3' id='emailAuth'>`;
	authDiv += `<label>이메일 인증코드</label>`;
	authDiv += `<input type="text" class="form-control" id="emailAuthCode" placeholder="인증코드입력..." />`;
    authDiv += `<div class='timer' ></div>`;
    authDiv += `<button type="button" id="authBtn" class="btn btn-primary" onclick="checkEmailAuthCode()" style='border-color:#7fad38; background-color:#7fad38;'>인증</button>`;
    authDiv += `<div id="emailAuthCodeError" style="color: red;"></div>`
    authDiv += `</div>`;

    $(authDiv).insertAfter($("#emailEditBtn"));
}

// 인증메일 전송
function sendAuthMail() {
	$.ajax({
		url: "/member/sendAuthMail", 
        type: "post",
        dataType: "text",
        data: {
          "tmpEmail" : $("#email").val()
        },
        success: function(data) {
			console.log(data);
			if (data == 'emailAuthSend') {
				alert("이메일로 인증코드를 발송했습니다..");
				$('#email').attr("readonly", true);
					$('#emailAuthCode').focus();
			}
        }
	});
}

// 인증코드 확인
function checkEmailAuthCode() {
	let userAuthCode = $('#emailAuthCode').val();
	$.ajax({
		url:'/member/checkEmailAuthCode',
		type:'post',
		dataType:'text',
		data:{
			"userAuthCode":userAuthCode
		},
        success: function (data) {
			console.log(data);
			if (data == 'success') {
				alert("인증 성공!");
                $('#email').attr("readonly", true);
                $('#emailAuth').remove();
                $('#emailCheck').val("checked");
			} else {
				alert("인증코드가 틀렸습니다. 다시 입력해주세요.");
				$('#emailCheck').val("");
			}
		}
	});
}

// 휴대폰번호 확인
function phoneNumValid(){
	if ($("#phoneNumCheck").val() == 'checked') {
		return true;
	} else {
		alert("휴대폰	번호를 확인해주세요.");
		return false;
	}
}
</script>
</body>
</html>