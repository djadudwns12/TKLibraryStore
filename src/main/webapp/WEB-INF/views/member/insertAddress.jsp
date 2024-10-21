<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>마이페이지 | 주소록 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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


.submit-btn {
        width: 100%; /* 100% 너비를 유지하기 위해 삭제 가능 */
        padding: 10px;
        border: none;
        background-color: #4CAF50;
        color: white;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 10px;
    }

    .submit-btn:hover {
        background-color: #45a049;
    }

    .cancel-btn {
        width: 100%; /* 너비 조정 (선택 사항) */
        padding: 10px;
        border: none;
        background-color: #4CAF50; /* 같은 배경색 */
        color: white; /* 같은 텍스트 색 */
        border-radius: 4px; /* 같은 테두리 반경 */
        cursor: pointer;
    }

    .cancel-btn:hover {
        background-color: #45a049; /* 같은 hover 효과 */
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
	
	$(document).ready(function() {
		// 마이페이메뉴 수정
		mypageNav();
		
        // 주소를 ',' 기준으로 나누어 input placeholder에 넣기
        var address = "${address.address}";
        var addressParts = address.split(',');

        // 앞 부분을 keyword의 placeholder에, 뒷 부분을 addressDetail의 placeholder에 설정
        document.getElementById('keyword').placeholder = addressParts[0].trim(); // 앞부분
        document.getElementById('addressDetail').placeholder = addressParts[1] ? addressParts[1].trim() : ''; // 뒷부분
        
        
        $('#submitBtn').click(function(event) {
            event.preventDefault();  // 기본 폼 제출 방지
            saveAddress();  // AJAX로 전송
        });
    });
	
	function saveAddress() {
	    // 폼 데이터를 객체로 만들기
	    let newAddressData = {
	        address_key: $('#addrName').val(),
	        receiver_name: $('#receiver_name').val(),
	        receiver_phone: $('#receiver_phone').val(),
	        keyword: $('#keyword').val(),
	        addressDetail: $('#addressDetail').val(),
	        request: $('#request').val(),
	        isDefault: $('#terms').is(":checked") ? 'N' : 'Y'  // 기본 배송지 설정 여부 (체크박스)
	    };

	    console.log(addressData); // 데이터 확인을 위한 로그

	 	// 모든 값이 null이 아닐 때만 AJAX 요청
	    if (Object.values(newAddressData).every(value => value !== null && value !== '')) {
	        // AJAX 요청
	        $.ajax({
	            url: '/member/insertNewAddress',  // Controller로 요청할 URL
	            type: 'POST',
	            contentType: 'application/json',  // JSON 타입으로 전송
	            data: JSON.stringify(newAddressData),
	        }).done(function() {
	            alert('새로운 배송지가 추가되었습니다.');
	            window.location.href = '/member/address';
	        }).fail(function(jqXHR) {
	            console.error('Error:', jqXHR.responseText); // 오류 메시지 로그
	            alert('추가 실패: ' + jqXHR.status + ' ' + jqXHR.statusText);
	        });
	    } else {
	        alert('모든 칸을 입력해주세요.'); // 모든 필드를 채우라는 경고 메시지
	    }
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
			// 입력 필드에 클릭된 주소를 설정
		    $('#keyword').val(address);
		    
		    // 모달 창 닫기
		    $('#myModal').hide();
		
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

		/* // x 버튼을 누르면 모달이 닫힘
		span.onclick = function() {
		  modal.style.display = "none";
		}

		// 모달 바깥을 클릭하면 닫힘
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		} */
		
		
		document.addEventListener("DOMContentLoaded", function() {
	        const modal = document.getElementById("myModal");
	        const span = document.querySelector(".close"); // span 태그를 선택합니다.
	        const openModalButton = document.getElementById("myBtn");
	        
	        // x 버튼 클릭 시 모달 닫기
	        if (span) {
	            span.onclick = function() {
	                modal.style.display = "none"; // 모달 숨김
	            };
	        } else {
	            console.error('close 요소를 찾을 수 없습니다.');
	        }

	        // 모달 외부 클릭 시 모달 닫기
	        window.onclick = function(event) {
	            if (event.target == modal) {
	                modal.style.display = "none"; // 모달 숨김
	            }
	        };
	    });

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
		
</script>

</head>

<body>


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

			<div class="form-group button-container" name="addrForm"
				id="addrForm">
				<input type="text" id="keyword" name="keyword"
					placeholder="도로명 / 지번 주소" required>
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
				<input type="text" id="addressDetail" name="addressDetail"
					placeholder="상세주소" required>
			</div>

			<div class="form-group">
				<input type="text" id="request" name="request"
					placeholder="배송 시 요청사항">
			</div>
			
			<!-- 기본 배송지 설정 -->
			<div id="agreement" style="margin-bottom:0.8em;">
				<input type="checkbox" id="terms" name="terms" <c:if test="${address.isDefault == 'N'}">checked</c:if>> 
				<label for="terms">기본 배송지로 설정</label>
			</div>

			<div style="display: flex;">
				<button type="submit" class="submit-btn" id="submitBtn">저장</button>
				<button type="button" class="cancel-btn" onclick="location.href='/member/address'">취소</button>
			</div>
		</form>

	</div>

</body>
</html>