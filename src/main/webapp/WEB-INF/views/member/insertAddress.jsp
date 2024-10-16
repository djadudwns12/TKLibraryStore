<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지 | 주소록 관리</title>
<style>
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
</style>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
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

.sendButton-container input {
	width: calc(100% - 110px); /* 버튼 옆의 필드 크기 */
}

.sendSmsButton-container input {
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

.sendButton-container {
	display: flex;
	justify-content: space-between;
}

.sendSmsButton-container {
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
	/* pointer-events: auto; 마우스 이벤트 허용 */
	/* z-index: 100; 드래그 앤 드롭 시 상위 요소로 설정 */
}

#profileImageContainer img {
	max-width: 100%;
	height: auto;
	display: none; /* 처음에는 미리보기 이미지 숨김 */
}

#profileImageContainer.dragover {
	background-color: #f0f8ff; /* 드래그 시 배경색 변경 */
}

#delPreview {
	width: 70px; /* 버튼 크기 */
	padding: 5px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 0.5em;
	cursor: pointer;
	display: none;
}

#delPreview:hover {
	background-color: #45a049;
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
	margin-top: 5px;
}

#confirmId {
	font-size: 12px;
	position: relative;
	top: -10px;
	margin-top: 5px;
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
</style>
<script type="text/javascript">
	$(function() {	
		// 마이페이메뉴 수정
		mypageNav();
	});
	
	
	// 배송지 추가
	function insertAddress() {
	    // 모달 띄우기
	    var addModal = new bootstrap.Modal(document.getElementById('addAddressModal'));
	    addModal.show();
	}
	
	// nav
	function mypageNav(){
		let inputHTML = `<li onclick="showHide()"><h5><b>내정보보기<span class="showInfo">▼</span><span class="hideInfo">◀</span></b></h5></li>
			<li class="myInfo"><a href="/member/edit">ㅤ> 수정</a></li>
			<li class="myInfo"><a href="/member/address">ㅤ> 주소록 관리</a></li>
			<li><a href="#"><h5><b>찜</b></h5></a></li>
			<li><a href="/cart/cartPage"><h5><b>장바구니</b></h5></a></li>
			<li><a href="#"><h5><b>알림</b></h5></a></li>
			<li><a href="#"><h5><b>나의 회원등급</b></h5></a></li>
			<li><a href="#"><h5><b>나의 포인트 적립기록</b></h5></a></li>
			<li><a href="#"><h5><b>나의 리뷰</b></h5></a></li>
			<li><a href="/qa/qaList"><h5><b>1:1문의</b></h5></a></li>`;
		$('#categoryList').html(inputHTML);
	}
	

	
	
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
				
		$('#terms').change(function() {
			$('#submitBtn').prop('disabled', !$(this).is(':checked'));
		});
					
				
			

		
			$("form").on("submit", function (evt) {
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
				    evt.preventDefault(); // submit 방지
				    alert("잘못된 입력이 있습니다. 입력을 다시 확인하세요.");
				  } else {
					  evt.preventDefault();
					  register();
				  }
				});

	  });
			
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
		/* span.onclick = function() {
		  modal.style.display = "none";
		} */

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
		
		
		
	async function register() {
	    let form = $("form")[0];  // 폼 요소를 선택
	    let fd = new FormData(form);  // FormData 객체 생성
	    fd.append("imgFile", uploadedFile);
	    
	/* 	    for (var pair of fd.entries()) {
	        console.log(pair[0]+ ', ' + pair[1]);
	    } */

	    try {
	        let response = await $.ajax({
	            url: '/member/register',             // 데이터가 송수신될 서버의 주소
	            type: 'post',                                     // 통신 방식 : GET, POST, PUT, DELETE, PATCH
	            data: fd,                          // 보낼 데이터
	            cache: false,
	            processData: false,                 // 데이터를 쿼리스트링 형태로 보내지 않겠다는 설정
	            contentType: false,                 // "multipart/form-data"로 전송되도록 설정
	            //async: true                         // 비동기 통신을 true로 설정 (기본 값)
	            statusCode: {
	                // 상태 코드 200: 성공 처리
	                200: function () {
	                    alert('가입 성공!');
	                    window.location.href = '/member/loginPage';
	                },
	                // 상태 코드 406: 실패 처리
	                406: function () {
	                    alert('가입 실패');
	                }
	            }
	        });

	    } catch (error) {
	        console.log("에러 발생: ", error);
	        alert('입력된 회원가입 정보를 확인 후 가입해 주세요');
	    }
	}


</script>

</head>

<body>
	<c:import url="../header.jsp"></c:import>

	<div class="container">
		<form class="form-container">

			<div class="form-group">
				<input type="text" id="addrName" name="addrName"
					placeholder="배송지명" required>
			</div>

			<div class="form-group">
				<input type="text" id="receiver_name" name="receiver_name"
					placeholder="받는 분" required>
			</div>

			<div class="form-group">
				<input type="text" id="receiver_phone" name="receiver_phone"
					placeholder="전화번호" required>
			</div>

			<div class="form-group button-container" name="addrForm" id="addrForm">
				<input type="text" id="keyword" name="keyword" placeholder="도로명 / 지번 주소" required>
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
				<input type="text" id="addressDetail" name="addressDetail" placeholder="상세 주소" required>
			</div>

			<div class="form-group">
				<input type="text" id="request" name="request" placeholder="배송 시 요청사항" onclick="selectRequest();" required>
			</div>

			<!-- 기본 배송지 설정 -->
			<div id="agreement">
				<input type="checkbox" id="terms" name="terms" required> 
				<label for="terms">기본 배송지로 설정</label>
			</div>
			<div class="button-container" style="display: flex;">
				<button type="submit" class="submit-btn" id="submitBtn">저장</button>
				<button type="button" class="cancel-btn" onclick="location.href='/member/address'">취소</button>
			</div>
		</form>

	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>