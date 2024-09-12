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
	$(function(){
		
		
		// 비밀번호 변경을 위해 userPwd에 비밀번호를 입력하고 blur 되었을 때 > 비밀번호 양식 확인
		$('#userPwd').blur(function() {
			let tmpPwd = $('#userPwd').val();
			if(tmpPwd.length < 4 || tmpPwd.length > 8){
				outputError("비밀번호는 4-8자로 입력하세요", $('#userPwd'));
				setTimeout(() => {
		              $(".error").remove();
		            }, 500);
			} else {
				// 에러메시지 사라짐
				clearError($("#userPwd"));
	        	$("#userPwd").css("border", "");
			}
		});
		// userPwdConfirm에서 비밀번호 입력하고 blur 되었을때
        $("#userPwdConfirm").blur(function () {
        	let tmpPwd = $("#userPwd").val();
        	if (tmpPwd != $(this).val()) {
	            outputError("패스워드가 다릅니다.", $("#userPwdConfirm"));
	            $("#userPwdConfirm").val("");
	            $(this).val("");
	            $("#pwdValid").val("");
	          } else {
	            clearError($("#userPwdConfirm"));
	            $("#pwdValid").val("checked");
	          }
        });
		// 생년월일을 입력하고 blur되었을 때
		$("#userBirth").blur(function birthValid(){
			let userBirth = new Date($('#userBirth').val());
			let today = new Date();
			// 생년월일이 오늘보다 클 때
			if(userBirth>=today){
				alert('생년월일을 확인해주세요'); 
				userBirth=''; 
				userBirth.focus(); 
				return false; 
			} else {
				return true;
			}
		});
		// 이메일을 입력하고 blur되었을 때
	   	$("#email").blur(function emailValid(){
			// 1. 이메일 주소형식 확인
			let tmpEmail = $('#email').val();
			let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
			if(!emailFormat.test(tmpEmail)) {
				outputError("이메일 주소형식이 아닙니다.", $('#email'));
				$('#emailValid').val("");
			} else {
				// 2. 이메일 인증 : 인증메일을 보내고 문자를 입력받아서 검증한다
				clearError($('#email')); // 이메일형식 유효성검사후 css원상복구
				showAuthDiv(); // 이메일 인증코드 입력 태그 생성
				sendAuthMail(); // 이메일 보내기
				// 타이머 동작시키기
				// 코드 확인하기
				
			}
		});
		
		$('#emailEditBtn').click(function emailEdit(){
			// 이메일 변경버튼을 클릭했을 때
			$('#email').removeAttr("disabled");
			$('#email').removeAttr("readonly");
			$('#emailValid').val("");
			$('#email').focus();
		});
	});
	
//===============================인풋태그 오입력 처리=====================================//
	// 에러가 난 태그의 선색상을 빨간색으로
	function outputError(msg, obj) {
        let errorTag = `<div class='error'>\${msg}</div>`;
        $(errorTag).insertAfter(obj);
        $(obj).css("border", "2px solid red"); 
    }
	
	// obj 다음 이웃 태그(에러메시지 div)를 지운다
    function clearError(obj) {
      $(".error").remove();
      $(obj).css("border", ""); // css를 원래 상태로
    }
//==================================수정완료버튼 클릭시=========================================//
	// 아래의 조건이 모두 만족할 때 회원수정 진행되도록
	function isValid(){
		// 빈칸 없음, 비밀번호 확인, 이메일 변경시 이메일 인증 진행
		let pwdCheck = pwdValid();
		let birthCheck = birthValid();
		let emailCheck = emailValid();
//		let mobileCheck = mobileValid();
		if(pwdCheck && birthCheck && emailCheck){
			return true;
		} else {
			return false;
		}
	}

	// 생년월일 입력 확인
	function birthValid(){
		let userBirth = Date($('#userBirth').val());
		let today = new Date();
		if(userBirth>=today){
			alert('생년월일을 확인해주세요'); 
			userbirth.focus(); 
			return false; 
		} else {
			return true;
		}
	}
	
	// 비밀번호 확인
	function pwdValid(){
		if ($("#pwdValid").val() == 'checked') {
			return true;
		} else {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
	
	// 이메일 확인
	function emailValid(){
		// 1. 이메일 주소형식 확인
		let tmpEmail = $('#email').val();
		let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		if(!emailFormat.test(tmpEmail)) {
			outputError("이메일 주소형식이 아닙니다.", $('#email'));
			$('#emailValid').val("");
		} else {
			// 2. 이메일 인증 : 인증메일을 보내고 문자를 입력받아서 검증한다
			clearError($('#email')); // 이메일형식 유효성검사후 css원상복구
			showAuthDiv(); // 이메일 인증코드 입력 태그 생성
			sendAuthMail(); // 이메일 보내기
			// 타이머 동작시키기
			// 코드 확인하기
			
		}
	}
	
	// 이메일 인증
	function showAuthDiv() {
		alert('이메일로 인증코드를 발송했습니다. \n인증코드를 입력해주세요.');
		authDiv = `<div class='input-group mb-3' id='emailAuth'>`;
		authDiv += `<label>이메일 인증코드</label>`;
		authDiv += `<input type="text" class="form-control" id="emailAuthCode" placeholder="인증코드입력..." />`;
        authDiv += `<span class='timer'>1:00</span>`;
        authDiv += `<button type="button" id="authBtn" class="btn btn-primary" onclick="checkEmailAuthCode()" style='border-color:#7fad38; background-color:#7fad38;'>인증</button>`;
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
					$('#email').attr("disabled", true);
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
	                $('#email').attr("disabled", true);
	                $('#emailAuth').remove();
	                $('#emailValid').val("checked");
				} else {
					alert("인증코드가 틀렸습니다. 다시 입력해주세요.");
					$('#emailValid').val("");
				}
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
#emailAuth {
	margin-top:10px;
}
#emailAuth span{
	margin-left:10px;
	margin-right:10px;
}

</style>

</head>


<body>
	
	<jsp:include page="./../header.jsp"></jsp:include>
		<!-- 회원정보 : ${editMemberInfo} -->
    <div class="register-box pwdConfirm">
	<div class="card pwdConfirmCard" style="padding:10px">
		<p class="register-box-msg">회원 정보 수정</p>
		
		<form action="/member/mypage" method="post">
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
            </div>
			<div class="input-group mb-3">
				<label>비밀번호</label>
				<input type="password" class="form-control " id="userPwd" name="userPwd" value="${editMemberInfo.userPwd}" />
            </div>
			<div class="input-group mb-3">
				<label>비밀번호확인</label>
				<input type="password" class="form-control" id="userPwdConfirm" name="userPwdConfirm" value="${editMemberInfo.userPwd}" />
            	<input type="hidden" id="pwdValid" value="checked"/>
            </div>
			<div class="input-group mb-3">
				<label>이메일</label>
				<input type="email" class="form-control" id="email" name="email" value="${editMemberInfo.email}" disabled/>
            	<button type="button" id="emailEditBtn" class="btn btn-primary" style='margin-left:10px; border-color:#7fad38; background-color:#7fad38;'>이메일 변경</button>
            	<input type="hidden" id="emailValid" value="checked"/>
            </div>

			<div class="input-group mb-3">
				<label>핸드폰 번호</label>
				<input type="text" class="form-control" id="phoneNum" name="phoneNum" value="${editMemberInfo.phoneNum}" />
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
					<button type="submit" class="btn btn-primary" onclick="return isValid();" style="border-color:#7fad38; background-color:#7fad38;" >수정완료</button>
					<button type="reset" class="btn btn-danger">되돌리기</button>
					
			</div>
		</form>
	
	</div>
	</div>
	
	<jsp:include page="./../footer.jsp"></jsp:include>
</body>
</html>