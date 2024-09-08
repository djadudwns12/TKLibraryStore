<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>회원 가입 폼</title>
<style>
body {
    font-family: 'Noto Sans KR', Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

.form-container {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 350px;
    margin: auto;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group input {
    width: calc(100% - 10px);
    padding: 10px;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-sizing: border-box;
}

/* 중복 확인 버튼 */
.button-container {
    display: flex;
    justify-content: space-between;
}

.button-container input[type="text"] {
    width: calc(100% - 110px); /* 버튼 옆의 필드 크기 */
}

.button-container button {
    width: 100px; /* 버튼 크기 */
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.button-container button:hover {
    background-color: #45a049;
}

/* 드래그 앤 드롭 이미지 업로드 */
#profileImageContainer {
    border: 2px dashed #cccccc;
    padding: 20px;
    text-align: center;
    border-radius: 4px;
    margin-bottom: 20px;
    cursor: pointer;
}

#profileImageContainer img {
    max-width: 100%;
    height: auto;
    display: none; /* 처음에는 미리보기 이미지 숨김 */
}

#profileImageContainer.dragover {
    background-color: #f0f8ff; /* 드래그 시 배경색 변경 */
}

.submit-btn {
    width: 100%;
    padding: 10px;
    border: none;
    background-color: #4CAF50;
    color: white;
    border-radius: 4px;
    cursor: pointer;
}

.submit-btn:hover {
    background-color: #45a049;
}

#agreement {
    margin-top: 20px;
}

#userIdError {
    color: red;
    font-size: 12px;
    position: relative; /* 요소의 위치를 기준으로 상대적인 위치 조정 */
    top: -10px; /* 위쪽으로 20px 이동 */
}

#passwordError {
    color: red;
    font-size: 12px;
    position: relative; /* 요소의 위치를 기준으로 상대적인 위치 조정 */
    top: -10px; /* 위쪽으로 20px 이동 */
}

#confirmPasswordError {
    color: red;
    font-size: 12px;
    position: relative; /* 요소의 위치를 기준으로 상대적인 위치 조정 */
    top: -10px; /* 위쪽으로 20px 이동 */
}

</style>
</head>
<body>
<form class="form-container">
    <div class="form-group button-container">
        <input type="text" id="userId" name="userId" placeholder="아이디 입력 (4~8자)" required>
        <button type="button">중복 확인</button>
    </div>
    
    <div id="userIdError" style="color: red; margin-top: 5px;"></div> <!-- 에러 메시지 표시할 div -->
    
    <div class="form-group">
        <input type="password" id="password" name="password" placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" required>
    </div>
    
    <div id="passwordError" style="color: red; margin-top: 5px;"></div> <!-- 에러 메시지 표시할 div -->
    
    <div class="form-group">
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 재입력" required>
    </div>
    
    <div id="confirmPasswordError" style="color: red; margin-top: 5px;"></div> <!-- 에러 메시지 표시할 div -->
    
    <div class="form-group">
        <input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요." required>
    </div>
    
    <div class="form-group">
        <input type="tel" id="phone" name="phone" placeholder="휴대폰 번호 입력" required>
    </div>
    
    <div class="form-group">
        <input type="email" id="email" name="email" placeholder="email@example.com" required>
    </div>
    
    <div class="form-group">
        <label for="birthday">생년월일</label>
        <input type="date" id="birthday" name="birthday" required>
    </div>
    
    <div class="form-group button-container">
        <input type="text" id="zipCode" name="zipCode" placeholder="주소 입력" required>
        <button type="button">주소 검색</button>
    </div>
    <div class="form-group">
        <input type="text" id="addressDetail" name="addressDetail" placeholder="상세주소" required>
    </div>
    
        <!-- 프로필 이미지 업로드 -->
    <div id="profileImageContainer">
        <p>프로필 사진을 드래그 앤 드롭하세요.</p>
        <img id="profilePreview" alt="프로필 사진 미리보기">
        <input type="file" id="profileImageInput" style="display: none;" accept="image/*">
    </div>

    <!-- 회원 가입 조항 동의 -->
    <div id="agreement">
        <input type="checkbox" id="terms" name="terms" required>
        <label for="terms">회원 가입 조항에 동의합니다.</label>
    </div>

    <button type="submit" class="submit-btn" id="submitBtn" disabled>가입하기</button>
</form>

<script>

function outputError(msg, obj) {

	$("#" + obj.attr('id') + "Error").html(msg); 
	$("#" + obj.attr('id') + "Error").show();
    $(obj).css("border", "2px solid red"); // 에러가 난 태그의 선색상을 빨간색으로
    
 	}
  
function clearError(obj) {
	
	$("#" + obj.attr('id') + "Error").hide(); // 에러 메시지 div를 지움
    $(obj).css("border", ""); // css를 원래 상태로
    
	}

  $(function () {
	  
	    // 아이디에 키보드가 눌려졌을때 발생하는 이벤트
	    // **on**은 이벤트 리스너를 지정하는 메서드입니다. 즉, 특정 태그(HTML 요소)에 대해 어떤 이벤트가 발생했을 때, 그 이벤트에 반응하여 함수를 실행하도록 연결해 줍니다. on("input")은 "input" 이벤트가 발생했을 때라는 의미입니다.
	    $("#userId").on("input", function () {
	      let tmpUserId = $("#userId").val();
	      if (tmpUserId.length < 4 || tmpUserId.length > 8) {
	        outputError("아이디는 4~8자로 입력하세요.", $("#userId"));
	      } else {
	    	  clearError($("#userId"));
	/*         $.ajax({
	          url: "/member/isDuplicate", // 데이터가 송수신될 서버의 주소
	          type: "post", // 통신 방식 : GET, POST, PUT, DELETE, PATCH
	          dataType: "json", // 수신 받을 데이터의 타입 (text, xml, json)
	          data: {
	            tmpUserId: tmpUserId,
	          },
	          success: function (data) {
	            // 비동기 통신에 성공하면 자동으로 호출될 callback function
	            console.log(data);
	            if (data.msg == "duplicate") {
	              outputError("중복된 아이디입니다.", $("#userId"));
	              $("#idValid").val("");
	              $("#userId").focus();
	            } else if (data.msg == "not duplicate") {
	              clearError($("#userId")); // error 메시지 클리어
	              $("#idValid").val("checked");
	            }
	          },
	          error: function (data) {
	            console.log(data);
	          },
	        }); */
	      }
	    });
	  
	  
	  
	  
	  
    // userEmail이 focus 되었을 경우
    $('#userEmail').focus(function () {
      if($('#emailValid').val() == 'checked') {
        return;
      }
    }); 

    // 이메일 주소 입력을 완료하고 blur 되었을 경우
    $('#userEmail').blur(function (){
      emailValid();
    });

    // 패스워드1을 입력하고 blur 되었을때
    $("#password").on("input", function () {
      let tmpPwd = $("#password").val();
      let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,20}$/;

      if (!passwordRegExp.test(tmpPwd)) {
        outputError("영문/숫자/특수문자 조합 (8~20자)으로 입력하세요.", $("#password"));
      } else {
    	  clearError($("#password"));
      }
    });

    // 패스워드 확인을 입력하고 blur 되었을때
    $("#confirmPassword").on("input", function () {
      let tmpPwd = $("#password").val();
      if (tmpPwd != $(this).val()) {
        outputError("패스워드 다릅니다.", $("#confirmPassword"));
      } else {
    	  clearError($("#confirmPassword"));
      }
    });


  });

  function isValid() {
    // 아래의 조건에 만족할 때 회원가입이 진행 되도록(return true), 만족하지 않으면 회원가입이 되지 않도록 (return false)
    // 1) 아이디 : 필수이고, 4~8자, 아이디는 중복된 아이디가 없어야 함
    // 2) 비밀번호 : 필수이고, 4~8자, 비밀번호확인과 동일해야 한다.

    let idCheck = idValid();
    let pwdCheck = pwdValid();
    let genderCheck = genderValid();
    let emailCheck = emailValid();
    let mobileCheck = mobileValid();
    let imgCheck = imgValid();

    // 가입자 동의
    let agreeCheck = $('#agree').is(':checked'); // checkbox의 checked 여부

    if (idCheck && pwdCheck && genderCheck && emailCheck && mobileCheck && imgCheck && agreeCheck) {
      return true;
    } else {
      return false;
    }
  }
  
  function imgValid() {
     let result = false;
     let userImg = $('#userImg').val();
     if ($('#imgCheck').val() == 'checked' || userImg == '' || userImg == null ) {
        result = true;
     }
     
     return result;
  }

  function mobileValid() {
    let result = false;
    let tmpUserMobile = $("#mobile").val();
    let mobileRegExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
    if (!mobileRegExp.test(tmpUserMobile)) {
      outputError("휴대폰 번호 형식이 아입니다!", $("#mobile"));
    } else {
      clearError($("#mobile"));
      result = true;
    }

    return result;
  }

  function emailValid() {
      // 1) 이메일 주소 형식이면..(정규 표현식을 이용한다)
      // 2) 이메일 주소 형식이면..인증문자를 이메일로 보내고, 인증문자를 다시 입력받아 검증
      let result = false;

      let tmpUserEmail = $("#userEmail").val();
      let emailRegExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
      if (!emailRegExp.test(tmpUserEmail)) {
        outputError("이메일 주소 형식이 아닙니다!", $("#userEmail"));
      } else {
        // 이메일 주소 형식이다...
        // 유저가 입력한 이메일 주소로 인증 코드 발송(back end) - timer(3분)
        // 인증코드를 유저에게 입력 받음
        // 유저가 입력한 인증코드와 백엔드에서 만든 인증코드가 같은지 비교
        // 같고, 인증시간 안에 인증 완료 통과...

        if($('#emailValid').val() == 'checked') {
          result = true;
        } else {
          showAuthenticateDiv();  // 인증 코드를 입력하는 div창을 보여주기
          callSendMail();// 이메일 발송 하고
          startTimer(); // 타이머 동작 시키기..
          clearError($("#userEmail"));

          result = true;
        }           
        return result;
      }
      return result;
    }

    function callSendMail() {
      $.ajax({
            url: "/member/callSendMail", // 데이터가 송수신될 서버의 주소
            type: "post", // 통신 방식 : GET, POST, PUT, DELETE, PATCH
            dataType: "text", // 수신 받을 데이터의 타입 (text, xml, json)
            data: {
              "tmpUserEmail" : $("#userEmail").val()
            },
            success: function (data) {
              // 비동기 통신에 성공하면 자동으로 호출될 callback function
              console.log(data);
              if (data == 'success') {
                alert("이메일로 인증코드를 발송했습니다.");
                $('#userAuthCode').focus();
              }
            },
            error: function (data) {
              console.log(data);
            },
          });
    }


    function showAuthenticateDiv() {
        alert("이메일로 인증코드를 발송했습니다!\n 인증코드를 입력해주세요~");
        $('#userAuthCode').focus();
        let authDiv = "<div id='authenticateDiv'>";
        authDiv += `<input type="text" class="form-control" id="userAuthCode" placeholder="인증코드입력..." />`;
        authDiv += `<span class='timer'>3:00</span>`;
        authDiv += `<button type="button" id="authBtn" class="btn btn-primary" onclick="checkAuthCode()">인증</button>`;
        authDiv += "</div>";

        $(authDiv).insertAfter($("#userEmail"));
      }

      function checkAuthCode() {
        let userAuthCode = $("#userAuthCode").val();
        $.ajax({
          url: "/member/checkAuthCode", // 데이터가 송수신될 서버의 주소
          type: "post", // 통신 방식 : GET, POST, PUT, DELETE, PATCH
          dataType: "text", // 수신 받을 데이터의 타입 (text, xml, json)
          data: {
                "tmpUserAuthCode" : userAuthCode
          },    
          success: function (data) {
                // 비동기 통신에 성공하면 자동으로 호출될 callback function
                console.log(data);
                if (data == 'success') {
                  alert("인증 성공!");
                  $('#userEmail').attr("readonly", true);

                  $('#authenticateDiv').remove();

                  $('#emailValid').val("checked");
                } else {
                  alert("인증 실패!");
                  $('#emailValid').val("");
                }
          }
        });
      }

  function genderValid() {
    // 성별을 남성, 여성 중 하나를 반드시 선택해야 한다.
    let genders = document.getElementsByName("gender");
    let result = false;

    for (let g of genders) {
      if (g.checked) {
        console.log("하나라도 체크 되었음");
        result = true;
      }
    }

    if (!result) {
      outputError("성별은 필수 입니다!", $(".genderDiv"));
    } else {
      clearError($(".genderDiv"));
    }

    return result;
  }

  function pwdValid() {
    // 비밀번호 : 필수이고, 4~8자, 비밀번호확인과 동일해야 한다.
    let result = false;

    if ($("#pwdValid").val() == "checked") {
      result = true;
    }

    return result;
  }

  function idValid() {
    // 아이디 : 필수이고, 4~8자, 아이디는 중복된 아이디가 없어야 함
    let result = false;

    if ($("#idValid").val() == "checked") {
      result = true;
    }

    return result;
  }

 function showPreview(obj) {
  // 조건 : 이미지 파일이거나, 파일을 등록하지 않았다면 통과
    
  if (obj.files[0].size > 1024 * 1024 * 10) {
     alert("10MB 이하의 파일만 업로드할 수 있습니다.");
     obj.value = ""; // 선택한 파일 초기화
        return;  // 10MB 이하의 파일만 업로드할 수 있도록 return
  }
  console.log(obj.files[0]);
  let imageType = ["image/jpeg", "image/png", "image/gif", "image/jpg"];
  // 파일 타입 확인
  let fileType = obj.files[0].type;
  console.log(fileType);  // file type : 

  let fileName = obj.files[0].name;
  if (imageType.indexOf(fileType) != -1) {  // 이미지 파일이다.
     let reader = new FileReader();  // FileReader 객체 생성
       reader.onload = function(e) { 
           // reader객체에 의해 파일을 읽기 완료하면 실행되는 콜백함수
        let imgTag = `<div style='padding : 6px;'><img src='\${e.target.result}' width='40px' /><span>\${fileName}</span></div>`;
        $(imgTag).insertAfter(obj);
       }
       reader.readAsDataURL(obj.files[0]);  // 업로드된 파일을 읽어온다.
       
       clearError(obj);
    
       $('#imgCheck').val('checked');
       
  } else {
     outputError("이미지 파일만 올릴 수 있습니다", obj);
     $(obj).val('');
     // $('#imgCheck').val('noImage');
  }
}









// 드래그 앤 드롭 이미지 업로드 및 미리보기
const profileImageContainer = document.getElementById('profileImageContainer');
const profileImageInput = document.getElementById('profileImageInput');
const profilePreview = document.getElementById('profilePreview');

profileImageContainer.addEventListener('click', () => {
    profileImageInput.click();
});

profileImageInput.addEventListener('change', handleImageUpload);

profileImageContainer.addEventListener('dragover', (e) => {
    e.preventDefault();
    profileImageContainer.classList.add('dragover');
});

profileImageContainer.addEventListener('dragleave', () => {
    profileImageContainer.classList.remove('dragover');
});

profileImageContainer.addEventListener('drop', (e) => {
    e.preventDefault();
    profileImageContainer.classList.remove('dragover');
    
    const file = e.dataTransfer.files[0];
    handleFile(file);
});

function handleImageUpload(e) {
    const file = e.target.files[0];
    handleFile(file);
}

function handleFile(file) {
    if (file && file.type.startsWith('image/')) {
        const reader = new FileReader();
        reader.onload = function(e) {
            profilePreview.src = e.target.result;
            profilePreview.style.display = 'block';
        };
        reader.readAsDataURL(file);
    }
}

// 회원가입 조항 체크박스 처리
const termsCheckbox = document.getElementById('terms');
const submitBtn = document.getElementById('submitBtn');

termsCheckbox.addEventListener('change', () => {
    submitBtn.disabled = !termsCheckbox.checked;
});


$("form").on("submit", function (e) {
	  // 모든 Error 태그가 숨겨져 있는지 확인
	  let allErrorsHidden = true;

	  // .hide()된 요소는 jQuery에서 is(":visible")로 검사하여 보이지 않으면 false 반환
	  //$ 기호는 **"끝나는"**이라는 의미입니다. , ^ 기호는 **"시작하는"**이라는 의미입니다.
	  $("div[id$='Error']").each(function () {
	    if ($(this).is(":visible")) {
	      allErrorsHidden = false;
	    }
	  });

	  // Error 태그가 하나라도 보이면 submit 방지
	  if (!allErrorsHidden) {
	    e.preventDefault(); // submit 방지
	    alert("잘못된 입력이 있습니다. 입력을 다시 확인하세요.");
	  }
	});

</script>
</body>
</html>
