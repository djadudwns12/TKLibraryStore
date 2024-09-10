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

.smsButton-container input[type="tel"] {
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

.smsButton-container {
    display: flex;
    justify-content: space-between;
}


.button-disabled {
    width: 100px; /* 버튼 크기 */
    padding: 10px;
    background-color: gray;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.button-active {
    width: 100px; /* 버튼 크기 */
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.button-active:hover {
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

#phoneError {
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
    
    <div class="form-group smsButton-container">
        <input type="tel" id="phone" name="phone" placeholder="휴대폰 번호 입력" required>
         <button type="button" class="button-disabled"  id="sendSMSButton">문자 전송</button>
    </div>
    
    <div id="phoneError" style="color: red; margin-top: 5px;"></div> <!-- 에러 메시지 표시할 div -->
    
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
    
    
    $("#phone").on("input", function () {
        let tmpPhone = $("#phone").val();
        let phoneRegExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
        if (!phoneRegExp.test(tmpPhone)) {
        	//$("#button-disabled").attr("cl", "button-disabled");
        	$(".button-active").removeClass("button-active").addClass("button-disabled");
			outputError("휴대폰 번호 형식이 아닙니다.", $("#phone"));
			$("#sendSMSButton").removeAttr("onclick");
        } else {
        	 //$("#button-disabled").attr("id", "button-active");
        	 // 순수 JavaScript  : 추가: document.getElementById("element").classList.add("className"); 제거  : .classList.remove 토글 : .classList.toggle
        	 //클래스가 있으면 제거, 없으면 추가 (toggle 기능) : $("#element").toggleClass("className");
        	 $(".button-disabled").removeClass("button-disabled").addClass("button-active");
			clearError($("#phone"));
			 $("#sendSMSButton").attr("onclick", "sendSMS()");
			//addEventListener: 이벤트를 추가할 때, 동일한 이벤트에 대해 여러 개의 리스너를 추가할 수 있습니다. 즉, 동일한 이벤트에 대해 여러 개의 핸들러를 등록할 수 있으며, 나중에 필요하면 특정 리스너만 제거할 수도 있습니다.
			//setAttribute: onclick과 같은 속성에 이벤트를 직접 추가합니다. 이 방법은 한 번에 하나의 이벤트 핸들러만 추가할 수 있습니다. 즉, 만약 동일한 이벤트에 대해 새로운 핸들러를 추가하려면, 이전 핸들러는 덮어쓰여집니다.
			//document.getElementById("sendSMSButton").setAttribute("onclick", "sendSMS()");
			//$("#sendSMSButton").attr("onclick", "sendSMS()");
			//이벤트 리스너 사용
			//추가
			//document.getElementById("sendSMSButton").addEventListener("click", sendSMS);
			//$("#sendSMSButton").attr("onclick", "sendSMS()");
			//document.getElementById("sendSMSButton").setAttribute("onclick", "sendSMS()");
			//제거
			// $("#sendSMSButton").removeAttr("onclick");
			//document.getElementById("sendSMSButton").removeAttribute("onclick");
        }
      }); 
    
    
    
    
    
    
    
    
    
    
    
    $("#email").on("input", function () {
        let tmpPwd = $("#email").val();
        let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,20}$/;

        if (!passwordRegExp.test(tmpPwd)) {
          outputError("영문/숫자/특수문자 조합 (8~20자)으로 입력하세요.", $("#email"));
        } else {
      	  clearError($("#password"));
        }
      });
    
    
    
    


  });
  
  
function sendSMS() {

	let result = false;


	 
// 메인 폼의 SMS 관련 필드 값을 가져와 AJAX로 전송
let phone = $('#phone').val();
//var textValue = document.getElementById('text').value;
// 최근에는 변수의 스코프와 호이스팅 문제를 방지하기 위해 let과 const를 주로 사용. 
// let은 재할당이 필요한 변수에, const는 상수나 재할당이 필요 없는 변수에 사용.
// ES6(ECMAScript 2015)부터 도입되었으며, var 대신 let과 const를 사용하는 것이 권장. 
// let과 const를 사용하여 변수를 선언할 때, 스코프와 호이스팅 문제를 더 잘 제어할 수 있다.


$.ajax({
	  type: "POST",
	  url: "/member/coolsms",
	  data: {
		  	phone : phone,
		  },
	  success: function(response, textStatus, xhr) {
	    if (response == -1) {
	      alert("SMS 전송 실패: 서버 오류 발생");
	    } else if (response == null) {
	      alert("SMS 전송 실패: API 서버 문제");
	    } else {
	      alert("SMS 전송 성공: 인증 코드 - " + response);
	    }
	  },
	  error: function(error) {
	    alert("AJAX 요청 실패");
	    console.error("AJAX 요청 실패:", error);
	  }
	});






}

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
