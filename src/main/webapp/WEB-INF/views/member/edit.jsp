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
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
* {
	font-family: "Gowun Batang", serif;
	font-weight: 550;
	font-style: normal;
}

.register-box {
	display: flex;
	justify-content: center;
}

.input-group {
	display: flex;
	text-align: center;
}

.input-group label {
	display: inline-block;
	width: 150px;
}

.input-group form-check {
	padding-left: 0px;
}

#emailAuth {
	margin-top: 10px;
}

#emailAuth span {
	margin-left: 10px;
	margin-right: 10px;
}

#emailEditBtn {
	margin-left: 10px;
	border-color: #7fad38;
	background-color: #7fad38;
}

#profileImageContainer {
	display: flex;
	justify-content: space-around;
}

#imageDropBox {
	border: 2px dashed #cccccc;
	padding: 20px;
	text-align: center;
	border-radius: 4px;
	margin-bottom: 20px;
	cursor: pointer;
}
</style>
<script>

$(function() {
	//let qaList = $('.register-box');
	
	//$('#main_content').html(qaList);
})
</script>


</head>


<body>

	<jsp:include page="./../header.jsp"></jsp:include>
	<!-- 회원정보 : ${loginMember} -->
	<div class="register-box pwdConfirm">
		<div class="card pwdConfirmCard" style="padding: 10px">
			<p class="register-box-msg">회원 정보 수정</p>

			<form action="/member/saveMemberEdit" method="post"
				enctype="multipart/form-data">
				<!-- -->
				<div class="input-group mb-3">
					<label>이름</label> <input type="text" class="form-control"
						id="userName" name="userName" value="${loginMember.userName}"
						readonly />
				</div>
				<div class="input-group mb-3">
					<label>아이디</label> <input type="text" class="form-control"
						id="userId" name="userId" value="${loginMember.userId}" readonly />
				</div>
				<div class="input-group mb-3">
					<label>생년월일</label> <input type="date" class="form-control"
						id="userBirth" name="userBirth" value="${loginMember.userBirth}" />
					<input type="hidden" id="userBirthCheck" value="checked" />
					<div id="userBirthError" style="color: red;"></div>
				</div>
				<div class="input-group mb-3">
					<label>비밀번호</label>
					<button type="button" id="pwdEditBtn" class="btn btn-primary"
						onclick="pwdEdit()" style="border-color:#7fad38; background-color:#7fad38; color:white;">비밀번호 변경</button>
				</div>
				<!-- 			
				<label>비밀번호</label>
				<input type="password" class="form-control " id="userPwd" name="userPwd" "/>
            	<div id="userPwdError" style="color: red;"></div>
            </div>
			<div class="input-group mb-3">
				<label>비밀번호확인</label>
				<input type="password" class="form-control" id="userPwdConfirm" name="userPwdConfirm" "/>
            	
            	<div id="userPwdConfirmError" style="color: red;"></div>
            </div> -->

				<input type="hidden" id="pwdCheck" value="checked" />

				<div class="input-group mb-3">
					<label>이메일</label> <input type="email" class="form-control"
						id="email" name="email" value="${loginMember.email}" readonly />
					<button type="button" id="emailEditBtn" class="btn btn-primary"
						onclick="emailEdit();">이메일변경</button>
					<input type="hidden" id="emailCheck" value="checked" />
					<div id="emailError" style="color: red;"></div>
				</div>

				<div class="input-group mb-3">
					<label>핸드폰 번호</label> <input type="text" class="form-control"
						id="phoneNum" name="phoneNum" value="${loginMember.phoneNum}" />
					<input type="hidden" id="phoneNumCheck" value="checked" />
					<div id="phoneNumError" style="color: red;"></div>
				</div>

				<div class="input-group mb-3" id="profileImageContainer">
					<label>프로필사진</label>
					<div id="imageDropBox" style="width: 400px;">
						<div id="dropBoxText">프로필 사진을 변경하려면 드래그 앤 드롭하세요.</div>
						<input type="file" id="profileImageInput" style="display: none;"
							accept="image/*"> <img id="profilePreview"
							src="${loginMember.userImg}">
					</div>
				</div>
				<div class="d-grid gap-2" style="text-align: right;"><!-- return isValid(); -->
					<button type="submit" class="btn btn-primary saveEditInfo"
						onclick="return isValid()" 
						style="border-color: #7fad38; background-color: #7fad38;">수정완료</button>
					<button type="reset" class="btn btn-danger resetBtn">되돌리기</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='/member/deletemember';">회원탈퇴</button>
				</div>
			</form>

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
				<div class="modal-body">
					<div class="input-group mb-3">
						<label>비밀번호</label>
						<input type="password" class="form-control " id="userPwd" name="userPwd" "/>
		            	<div id="userPwdError" style="color: red;"></div>
	            	</div>
					<div class="input-group mb-3">
						<label>비밀번호확인</label>
						<input type="password" class="form-control" id="userPwdConfirm" name="userPwdConfirm" "/>
            			<div id="userPwdConfirmError" style="color: red;"></div>
            		</div>
				</div>
			
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-bs-dismiss="modal" style="border-color:#7fad38; background-color:#7fad38; color:white;" onclick="userPwdValid();">저장</button>
				</div>
			</div>
		</div>
	</div>
<script src="/resources/js/authTimer.js"></script>
<script type="text/javascript">
//이미지파일을 저장할 배열
let uploadedFiles = new Array();

$(function(){
/* 	// 비밀번호 변경을 위해 userPwd에 비밀번호를 입력할 때 > 비밀번호 양식 확인
	$('#userPwd').on("input", function() {
		let tmpPwd = $('#userPwd').val();
		let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,20}$/;
		if (!passwordRegExp.test(tmpPwd) || tmpPwd =='') {
			outputError("영문/숫자/특수문자[!@#$%^&*()] 조합 (8~20자)으로 입력하세요.", $('#userPwd'));
			$("#pwdCheck").val("");
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
    }); */
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
	
	// 이미지파일을 드래그드롭했을 때 프리뷰
    $("#profileImageContainer").on("dragenter dragover", function(event) {
        event.preventDefault(); // 기본 동작 방지 (파일 열기)
    });

	$('#profileImageContainer').on("drop", function(evt){
		evt.preventDefault();
		console.log("dataTransfer.files : ", evt.originalEvent.dataTransfer.files);	//업로드 되는 파일 객체의 정보
	
		// 기존의 파일 배열을 비움
    	uploadedFiles.length = 0;  // 이전에 저장된 파일 정보 삭제
		let files = evt.originalEvent.dataTransfer.files;
    	console.log("files : "+ files);
		for (let file of files) {
			// 파일 사이즈가 10MB 이상이면 업로드 금지
 			if (file.size > 10485760) {
				alert("파일 용량이 너무 큽니다. 업로드한 파일을 확인해 주세요.");
 			} else if (!files[0].type.startsWith('image/')) {
 				alert("이미지 파일만 가능합니다.");
 			} else if (file.length > 1) {
 				alert("1개의 이미지만 가능합니다.");
			} else {
				var reader = new FileReader();
				reader.onload = function(e) {
					// 이미지 미리보기
					$('#profilePreview').attr('src', e.target.result);
                    // 파일 경로 저장
                    $('.imagePath').val('/resources/profileImgs/' + file.name);

                    // 전역 변수에 파일 정보 저장
                   	uploadedFiles.push(file);  // 파일을 전역 변수에 추가
                    console.log("uploadedFiles.push : ", uploadedFiles);
                }
			}
			reader.readAsDataURL(file);   // 파일을 읽어옴
			console.log("reader.readAsDataURL : ", file);
		}
	});
	
	$('.resetBtn').click(function(){
		$('#profilePreview').attr('src', '${loginMember.userImg}');
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
	//let pwdChecked = userPwdValid();
	let birthChecked = userBirthValid();
	let emailChecked = userEmailValid();
	let phoneNumChecked = phoneNumValid();
	if( birthChecked && emailChecked && phoneNumChecked){ //pwdChecked &&
		fileUpload(uploadedFiles);
		return true;
	} else {
		return false;
	}
}

// 생년월일 입력 확인
function userBirthValid(){
	let userBirth =new Date($('#userBirth').val());
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

// 비밀번호 변경 팝업
function pwdEdit() {
	$('#myModal').show(500);
	$(function() {
		// 비밀번호 변경을 위해 userPwd에 비밀번호를 입력할 때 > 비밀번호 양식 확인
		$('#userPwd').on("input", function() {
			let tmpPwd = $('#userPwd').val();
			let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,20}$/;
			if (!passwordRegExp.test(tmpPwd) || tmpPwd =='') {
				outputError("영문/숫자/특수문자[!@#$%^&*()] 조합 (8~20자)으로 입력하세요.", $('#userPwd'));
				$("#pwdCheck").val("");
			} else {
				// 에러메시지 사라짐
				clearError($("#userPwd"));
	        	$("#userPwd").css("border", "");
	        	$("#pwdCheck").val("formatCheck");
	        	
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
		// Close, X 버튼 클릭하면 모달창 종료
		$('.modalCloseBtn').click(function() {
			$('#myModal').hide(100);
			$("#pwdCheck").val("checked");
		});
	});
	//$('.modal-body').html(".....");
}

// 비밀번호 확인
function userPwdValid(){
	if ($("#pwdCheck").val() == 'checked') {
		let userInfo = {
				"userPwd" : $("#userPwd").val(),
				"userId" : $("#userId").val()
	        }
		
		$.ajax({
			url: "/member/pwdChange", 
	        type: "post",
	        dataType: "text",
	        contentType : 'application/json; charset=utf-8',
	        data: JSON.stringify(userInfo),
	        success: function(data) {
	        	console.log(data)
	        	if ($("#pwdCheck").val() == 'checked'&& data=='success') {
					console.log(data);
					$('#myModal').hide();
	        	} else if ($("#pwdCheck").val() != 'checked') {
	        		alert ('비밀번호를 확인해주세요.');
	        		return;
	        	}
	        },
	        error : function(data){
	        	console.log(data)
	        }
		});
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

	}
}

// 이메일 인증
function showAuthDiv() {
	alert('이메일로 인증코드를 발송했습니다. \n인증코드를 입력해주세요.');
	authDiv = `<div class='input-group mb-3' id='emailAuth'>`;
	authDiv += `<label>이메일 인증코드</label>`;
	authDiv += `<input type="text" class="form-control" id="emailAuthCode" placeholder="인증코드입력..." />`;
    authDiv += `<span class='timer'></span>`;
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
				startTimer();
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

// 실제로 유저가 업로드한 파일을 컨트롤러단에 전송하여 저장되도록 하는 함수
function fileUpload(uploadedFiles) {
	let result = false;
	let fd = new FormData(); 	//FormData() 객체 생성 : form태그와 같은 역할의 객체
	fd.append("file", uploadedFiles[0]);
	fd.append("userId", `${loginMember.userId}`);
	$.ajax({
        url : '/member/profileImgEdit',             
        type : 'post',             	
        dataType : 'json',        		
		data : fd,				
		processData : false,
		contentType : false,
		success : function(data) {		
            console.log(data);
        	if(data.msg == 'success'){
        		//alert ('파일을 업로드 완료');
        		result = true;
        		
       		 }
        },error : function (data) {
        	console.log(data);
        	if (data == 'fail'){
        		alert ('파일을 업로드 하지 못했습니다');
        	}
		}
	});
	
	return result;
}
</script>
</body>
</html>