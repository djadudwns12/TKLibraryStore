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

.smsButton-container input {
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

[id$="Error"] {
    color: red;
    font-size: 12px;
    position: relative; 
    top: -10px;
    
}


/* The Modal (background) */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.6); /* 반투명 검은색 배경 */
}

/* Modal Content/Box */
.modal-content {
    background-color: #ffffff;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #4CAF50;
    width: 50%; /* 모달 크기 고정 */
    max-width: 600px; /* 최대 너비 */
    min-width: 300px; /* 최소 너비 */
    height: auto;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    font-family: 'Noto Sans KR', Arial, sans-serif;
    color: #333;
    font-size: 14px; /* 기본 글자 크기 줄임 */
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 24px; /* 닫기 버튼 크기 조금 줄임 */
    font-weight: bold;
}

.close:hover, .close:focus {
    color: #4CAF50;
    text-decoration: none;
    cursor: pointer;
}

/* Pagination Controls */
.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.pagination button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 16px;
    margin: 0 5px;
    border-radius: 5px;
    cursor: pointer;
}

.pagination button:hover {
    background-color: #45a049;
}

/* Address List Table */
#list table {
    width: 100%;
    border-collapse: collapse;
}

#list th, #list td {
    border: 1px solid #cccccc;
    padding: 8px;
    text-align: left;
    font-size: 13px; 
}

#list th {
    background-color: #f4f4f4;
    font-weight: bold;
}

#list td {
    font-size: 13px; /* 리스트 내부 텍스트 크기 */
}

input[readonly] {
    background-color: #e9ecef; /* 회색 배경 */
    color: #6c757d; /* 회색 텍스트 */
}

#timer {
    color: red;
    font-size: 12px;
    position: relative; 
    top: -10px; 
    left: 157px;
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
    <div id="timer"></div>
    
    <div class="form-group">
        <input type="email" id="email" name="email" placeholder="email@example.com" required>
    </div>
    
    <div id="emailError" style="color: red; margin-top: 5px;"></div> <!-- 에러 메시지 표시할 div -->
    
    <div class="form-group">
        <label for="birthday">생년월일</label>
        <input type="date" id="birthday" name="birthday" required>
    </div>
    
    <div class="form-group button-container" name="addrForm" id="addrForm">
        <input type="text" id="keyword" name="keyword" placeholder="주소 입력" required>
        <button type="button" id="myBtn" onclick="getAddr();">주소 검색</button>
    </div>
    
    						


						<!-- The Modal -->
						<div id="myModal" class="modal">
							<!-- Modal content -->
							<div class="modal-content">
								<span class="close">&times;</span>
								<div id="list"></div>
								<!-- Pagination Controls -->
								<div id="pagination" class="pagination">
									<!-- Pagination buttons will be added dynamically here -->
								</div>
							</div>
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
	    $('#userId').on('input', function () {
	      let tmpUserId = $('#userId').val();
	      if (tmpUserId.length < 4 || tmpUserId.length > 8) {
	        outputError("아이디는 4~8자로 입력하세요.", $('#userId'));
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
	  
    $('#password').on("input", function () {
      let tmpPwd = $('#password').val();
      let passwordRegExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,20}$/;

      if (!passwordRegExp.test(tmpPwd)) {
        outputError("영문/숫자/특수문자 조합 (8~20자)으로 입력하세요.", $('#password'));
      } else {
    	  clearError($('#password'));
      }
    });

    // 패스워드 확인을 입력하고 blur 되었을때
    $('#confirmPassword').on("input", function () {
      let tmpPwd = $("#password").val();
      if (tmpPwd != $(this).val()) {
        outputError("패스워드 다릅니다.", $('#confirmPassword'));
      } else {
    	  clearError($('#confirmPassword'));
      }
    });
    
    
    $('#phone').on("input", function () {
        let tmpPhone = $("#phone").val();
        let phoneRegExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
        if (!phoneRegExp.test(tmpPhone)) {
        	//$("#button-disabled").attr("cl", "button-disabled");
        	$('.button-active').removeClass("button-active").addClass("button-disabled");
			outputError("휴대폰 번호 형식이 아닙니다.", $('#phone'));
			$('#sendSMSButton').removeAttr("onclick");
        } else {
        	 //$("#button-disabled").attr("id", "button-active");
        	 // 순수 JavaScript  : 추가: document.getElementById("element").classList.add("className"); 제거  : .classList.remove 토글 : .classList.toggle
        	 //클래스가 있으면 제거, 없으면 추가 (toggle 기능) : $("#element").toggleClass("className");
        	 $('.button-disabled').removeClass("button-disabled").addClass("button-active");
			clearError($('#phone'));
			 $('#sendSMSButton').attr("onclick", "sendSMS()");
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
    
    
    
    
    $('#email').on("input", function () {
        let tmpEmail = $('#email').val();
        let emailRegExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
        if (!emailRegExp.test(tmpEmail)) {
          outputError("이메일 주소 형식이 아닙니다!", $('#email'));
        } else {
      	  clearError($('#email'));
        }
      });
    

  });
  
  

  
  
  
  
  
  
  
let code ='';
  
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
		      
			      let htmlStr = '';  // 변수 초기화
			      htmlStr += `<div class="form-group smsButton-container">`;
			      htmlStr += `<input type="text" id="verification" name="verification" placeholder="인증번호 입력" required>`;
			      htmlStr += `<button type="button" id="verificationBtn" class="button-active" onclick="verificationCode();">인증번호 확인</button>`;
			      htmlStr += `</div>`;

			      // .smsButton-container 뒤에 htmlStr을 추가
			      $('.smsButton-container').after(htmlStr); 
			      $('#sendSMSButton').removeAttr("onclick");
			      startTimer();
			      code = response;
			      
		  	
		    }
		  },
		  error: function(error) {
		    alert("AJAX 요청 실패");
		    console.error("AJAX 요청 실패:", error);
		  }
		});
	
	
	
	
	
	
	}
	
let completed = false;	
	
function verificationCode() {
	if(code == $('#verification').val()) {
		completed = true;
		console.log('인증성공');
		$('#phone').prop("readonly", true);
		$('#verification').prop('readonly', true);
		
		$('#verificationBtn').addClass('button-disabled');
		$('.button-active').removeClass("button-active").addClass("button-disabled");
		$('#verificationBtn').removeClass("button-active").addClass("button-disabled");
		$('#verificationBtn').html('인증완료');
		$('#verificationBtn').removeAttr("onclick");
		$('#sendSMSButton').removeAttr("onclick");
		
	} else {
		alert('인증번호가 다릅니다.');
	}
	
	
}
	
	
	

	
function startTimer() {
    let timer = 180; 
    let timerInterval = setInterval(() => {
        
        let min = Math.floor(timer / 60);  
        let sec = String(timer % 60).padStart(2, '0'); 

   
        $('#timer').html(`남은시간 : \${min}:\${sec}`);


        
        if (timer <= 0) {
            // clearInterval: setInterval에 의해 설정된 반복 실행을 중단
            // 이 메서드는 setInterval 함수의 반환 값인 ID(timerInterval)를 사용하여 해당 반복을 중단함
            clearInterval(timerInterval);  // 더 이상 타이머가 작동하지 않도록 반복 중지
            
            $('#verificationBtn').prop("disabled", true); // 인증 버튼을 비활성화
            $('#verificationBtn').addClass("button-disabled");
            alert('인증 시간이 만료되었습니다. 다시 시도하세요.');
            // 타이머가 끝났을 때, 인증 시간이 만료되었음을 처리하는 함수 호출
           
        }
        if (completed) {
        	clearInterval(timerInterval);
        	
        }
        
        

        // 타이머를 1초씩 감소
        --timer; // 1초 감소
    }, 1000);  // 1000ms (1초)마다 실행
}


	
	
	
	
	
	
let currentPage = 1;
const itemsPerPage = 3;
let totalPages = 0;
let addressData = [];


function getAddr(){ 
	  // 적용예 (api 호출 전에 검색어 체크)    
	 if (!checkSearchedWord($('#keyword'))) 
	  { 
	    return ; 
	  } 
	  

	 console.log("겟 어드레스 진입 확인")
	 let serializedData = serializeDiv('addrForm');
	   
	  $.ajax({ 
	     url :"/member/getAddr" 
	    ,type:"post" 
	    ,data:serializedData
	    ,dataType: "json" 
	    ,success:function(jsonStr){ 
	    $("#list").html(""); 
	    var errCode = jsonStr.results.common.errorCode; 
	    var errDesc = jsonStr.results.common.errorMessage; 
	    if(errCode!= "0"){ 
	       alert(errCode+"="+errDesc); 
	    }else{ 
	    	addressData = jsonStr.results.juso;
			console.log(addressData)
			totalPages = Math.ceil(addressData.length / itemsPerPage);
			renderList(); // 리스트 렌더링
			renderPagination(); // 페이징 버튼 렌더링
			console.log("getAddr ajax 이후 else 로 진입")
			$("#myModal").css('display', 'block'); // 모달 열기
		}
	},error: function(xhr,status, error){
    	alert("에러발생");
    }
});
}

function changePage(page) {
    if (page < 1 || page > totalPages) return; // 페이지 범위 체크
    currentPage = page; // currentPage 업데이트
    renderList(); // 리스트를 다시 렌더링
    renderPagination(); // 페이지네이션 버튼을 다시 렌더링
}

	function renderList() {
	    $("#list").html("");
	    const start = (currentPage - 1) * itemsPerPage;
	    const end = start + itemsPerPage;
	    const pageData = addressData.slice(start, end);

	    let htmlStr = "<table><tr><th>도로명</th><th>지번주소</th><th>우편번호</th></tr>";
	    pageData.forEach(function(item) {
	        htmlStr += "<tr onclick='selectAddress(\"" + item.roadAddr + "\")'>";
	        htmlStr += "<td>" + item.roadAddr + "</td>";
	        htmlStr += "<td>" + item.jibunAddr + "</td>";
	        htmlStr += "<td>" + item.zipNo + "</td>";
	        htmlStr += "</tr>";
	    });
	    htmlStr += "</table>";
	    $("#list").html(htmlStr);
	}

	function renderPagination() {
    let paginationHtml = "";
    for (let i = 1; i <= totalPages; i++) {
        paginationHtml += '<button onclick="changePage(' + i + ')">' + i + '</button>';
    }
    $("#pagination").html(paginationHtml);
}

	function changePage(page) {
	    if (page < 1 || page > totalPages) return;
	    currentPage = page;
	    renderList();
	    renderPagination();
	}
	// function makeListJson(jsonStr){
	// 	var htmlStr = "";
	// 	htmlStr += "<table><tr><th>도로명</th><th>지번주소</th><th>우편번호</th></tr>";
	// 	$(jsonStr.results.juso).each(function(){
	// 		htmlStr += "<tr onclick='selectAddress(\"" + this.roadAddr + "\")'>";
	// 		htmlStr += "<td>"+this.roadAddr+"</td>";
	// 		htmlStr += "<td>"+this.jibunAddr+"</td>";
	// 		htmlStr += "<td>"+this.zipNo+"</td>";
	// 		htmlStr += "</tr>";
	// 	});
	// 	htmlStr += "</table>";
	// 	$("#list").html(htmlStr);
	// }
	
	function selectAddress(address) {
	    $("#keyword").val(address);
	    $("#list").css('display', 'none')
	    modal.style.display = "none";
	    
	    
	    
	    addressDetail.addEventListener('keydown', function (event) {
	        const cursorPos = addressDetail.selectionStart;
	        if (cursorPos < baseAddress.length && event.key !== 'Backspace') {
	            event.preventDefault();  // 기본 주소는 수정할 수 없도록 막기
	        }
	    });

	    // 사용자가 클릭해서 커서를 움직일 때, 기본 주소 뒤로만 커서를 이동
	     $("#addressDetail").addEventListener('click', function () {
	        if ( $("#addressDetail").selectionStart < baseAddress.length) {
	        	 $("#addressDetail").setSelectionRange(baseAddress.length, baseAddress.length);
	        }
	    });
	
	}
	
	
	
	
	
	//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
	function checkSearchedWord(obj){
		// if (!checkSearchedWord(document.getElementById('keyword'))) 위에서 자바 스크립트 기본 언어로 
		// 아래에서 값을 가져올 때 value로 하고 지금은 제이쿼리니깐 .val로 한다.
		if(obj.val.length >0){
			//특수문자 제거
			var expText = /[%=><]/ ;
			if(expText.test(obj.value) == true){
				alert("특수문자를 입력 할수 없습니다.") ;
				obj.value = obj.value.split(expText).join(""); 
				return false;
			}
			
			//특정문자열(sql예약어의 앞뒤공백포함) 제거
			var sqlArray = new Array(
				//sql 예약어
				"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
	             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
			);
			
			var regex;
			for(var i=0; i<sqlArray.length; i++){
				regex = new RegExp( sqlArray[i] ,"gi") ;
				
				if (regex.test(obj.value) ) {
				    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
					obj.value =obj.value.replace(regex, "");
					return false;
				}
			}
		}
		return true ;
	}

	let modal = document.getElementById('myModal');
	let span = document.getElementsByClassName('close')[0];

	// x 버튼을 누르면 모달이 닫힘
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// 모달 바깥을 클릭하면 닫힘
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	
	


function serializeDiv(divId) {
		
	    let formData = [];
	    $('#' + divId).find(':input').each(function() {
	        if (this.name) {
	            formData.push(encodeURIComponent(this.name) + '=' + encodeURIComponent(this.value));
	        }
	        console.log('시리얼 라이즈 진입 확인');
	    });
	    return formData.join('&');
	}






$(document).ready(function() {
    $('#terms').change(function() {
        $('#submitBtn').prop('disabled', !$(this).is(':checked'));
    });
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
