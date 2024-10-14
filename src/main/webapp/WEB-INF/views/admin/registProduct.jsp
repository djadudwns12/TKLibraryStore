<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<!--  <link rel="stylesheet" href="resources/template/css/adminlte.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b948e77617.js"
	crossorigin="anonymous"></script>
<!-- Load icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Google Fonts에서 Gowun Batang 폰트 불러오기 -->
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
let uploadedFiles = new Array();		//업로드 되는 파일들을 저장하는 배열


	// upfiles.push(file);		//배열에 담기
	//console.log(upfiles);
	//해당 파일 ,업로드
	//fileUpload(upfiles);
	
	function validBook() {

		let result = false;
		let fields = [
			  { element: $('#title'), value: $('#title').val() },
			  { element: $('#author'), value: $('#author').val() },
			  { element: $('#publisher'), value: $('#publisher').val() },
			  { element: $('#pubDate'), value: $('#pubDate').val() },
			  { element: $('#genre'), value: $('#genre').val() },
			  { element: $('#price'), value: $('#price').val() },
			  { element: $('#salePrice'), value: $('#salePrice').val() },
			  { element: $('#inven'), value: $('#inven').val() },			  
			  { element: $('#introduction'), value: $('#introduction').val() },
			  { element: $('#bookImgfile'), value: $('#bookImgfile	').val() }
			];

			// 빈 값이나 길이가 1 미만인 요소 찾기
			let emptyFieldIndex = fields.findIndex(field => !field.value || field.value.length < 1);

			// 해당 조건을 만족하는 요소가 있을 경우
			if (emptyFieldIndex != -1) {
			  fields[emptyFieldIndex].element.focus();  // 해당 요소에 포커스 주기
			  alert( fields[emptyFieldIndex].element.attr('id')+ "의 값을 입력해주세요.")
			} else {
			  console.log("모든 필드가 올바르게 입력되었습니다.");
			  	  result = true;
			}
				
			return result;
	}
	
	
	
	// 실제로 유저가 업로드한 파일을 컨트롤러단에 전송하여 저장되도록 하는 함수
	function fileUpload(uploadedFiles) {
		
		let result = false;
		let fd = new FormData(); 	//FormData() 객체 생성 : form태그와 같은 역할의 객체
		fd.append("file", uploadedFiles[0]);
		fd.append("bookNo", `${product.bookNo}`)
		
		
		$.ajax({
            url : '/admin/upfile',              			//데이터가 송수신 될 서버의 주소
            type : 'post',             		//통신 방식 : GET, POST, PUT, DELETE, PATCH
            dataType : 'json',        		//수신 받을 데이터의 타입 (text, xml, json)
			data : fd,						// 보낼 데이터
			// processData : false -> 데이터 쿼리스트링 형태로 보내지 안겠다는 설정
			// contentType 의 디폴트 값이 "application/x-www-form-unlencoded"인데, 파일을 전송하는 방식이기에 "multipart/form-data"로 되어야 하므로
			// 
			processData : false,
			contentType : false,
			//async : false,					// 비동기 통신 : false
			//console.log(response)
			success : function(data) {		//비동기 통신에 성공하면 자동으로 호출 될 callback funtion
                console.log(data);
          	 	
            	if(data.msg == 'success'){
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
	
	
	  // URL에서 파라미터 값을 가져오는 함수
	  function getParameterByName(name) {
	      const url = new URL(window.location.href);
	      return url.searchParams.get(name);
	  }

	  // 상태 값 확인 후 alert 실행
	  const status = getParameterByName('status');
	  if (status === 'success') {
	      alert('성공적으로 저장되었습니다!');
	  } else if (status === 'error') {
	      alert('저장에 실패했습니다.');
	  }
	

	  function excelValid() {
			var result = false;
			// 파일 선택 확인
		    var fileInput = $("#fileInput")[0];
		    if (fileInput.files.length === 0) {
		        alert("파일을 선택해 주세요.");
		        return;
		    }

		    // 파일 확장자 확인
		    var fileName = fileInput.files[0].name;
		    var fileExtension = fileName.split('.').pop().toLowerCase();

		    if (fileExtension !== "xls" && fileExtension !== "xlsx") {
		        alert("엑셀 파일(.xls, .xlsx)만 업로드할 수 있습니다.");
		        return; // 엑셀 파일이 아니면 전송 중단
		    }

		    // 엑셀 파일일 경우에만 Ajax 호출
		    var formData = new FormData();
		    formData.append("file", fileInput.files[0]);

		    $.ajax({
		        url: "/admin/uploadExcel",
		        type: "POST",
		        data: formData,
		        dataType:"text",
		        processData: false, // 데이터를 처리하지 않음
		        contentType: false, // 멀티파트 폼 데이터를 전송할 수 있도록 설정
		        success: function(data) {
		            console.log(data);
		        	alert(data);
		        	
		        },
		        error: function(data) {
		            alert(data);
		            
		        }
		        
		        
		    });
		   
		}
</script>





<style>
* {
	font-family: "Gowun Batang", serif;
	font-weight: 530;
	font-style: normal;
}

.fileBtns {
	display: flex;
	justify-content: flex-end;
}

.fileBtns input {
	margin-left: 5px;
}

.form-label {
	text-align: left;
}

.btns {
	display: flex;
	justify-content: center;
}

.jemok {
	margin-left: 30px;
}

.content0{
	border-bottom: 2px solid #e0e0e0;
}

.content1 {
	display: flex;
	justify-content: space-between;
	margin-left: 30px;
	width: 80%;
	
	margin-top: 30px;
}

.content2 {
	display: flex;
	justify-content: space-between;
	margin-left: 30px;
	width: 80%;
}

.fileUploadArea {
	width: 50%;
	height: 430px;
	background-color: lightgray;
	text-align: center;
	margin-left: 60px;
}

.content3 {
	display: flex;
	margin-left: 30px;
}

.content4 {
	display: flex;
	margin-left: 30px;
	border-top: 2px solid #e0e0e0;
}


</style>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
	<!--begin::App Wrapper-->

	<div class="app-wrapper">
		<!--begin::Header-->
		<div class="sideBar">
			<jsp:include page="sideBar.jsp" />
		</div>
		<div class="header">
			<jsp:include page="header.jsp" />
			<div class="content0">
			<h1 class="jemok">RegistProduct</h1>
			</div>
			<form action="/admin/registSave" method="post"
				enctype="multipart/form-data">

				<div class="content1">


					<div class="mb-3">
						<label for="title" class="form-label">Title</label> <input
							type="text" class="form-control" id="title" name="title">
					</div>
					<div class="mb-3">
						<label for="author" class="form-label">Author</label> <input
							type="text" class="form-control" id="author" name="author">
					</div>
					<div class="mb-3">
						<label for="publisher" class="form-label">Publisher</label> <input
							type="text" class="form-control" id="publisher" name="publisher">
					</div>

					<div class="mb-3">
						<label for="pubDate" class="form-label">PubDate</label> <input
							type="text" class="form-control" id="pubDate" name="pubDate"
							value="yyyy-MM-dd" style="opacity:">
					</div>

				</div>
				<div class="content2">

					<div class="mb-3">
						<label for="genre" class="form-label">Genre</label> <select
							class="form-control" id="genre" name="genre">
							<option value="">장르 선택</option>
							<optgroup label="인문">
								<option value="050101">인문교양일반</option>
							</optgroup>
							<optgroup label="심리학">
								<option value="050301">교양심리</option>
								<option value="050302">심리이론</option>
								<option value="050303">발달단계별심리</option>
							</optgroup>
							<optgroup label="교육학">
								<option value="050501">교육학에세이</option>
								<option value="050503">교육학이론</option>
								<option value="050505">교육사</option>
							</optgroup>
							<optgroup label="유아교육">
								<option value="050701">유아교육이론</option>
								<option value="050703">유아교육방법</option>
								<option value="050705">건강/생활지도</option>
							</optgroup>
						</select>
					</div>


					<div class="mb-3">
						<label for="price" class="form-label">Price</label> <input
							type="text" class="form-control" id="price" name="price">
					</div>
					<div class="mb-3">
						<label for="salePrice" class="form-label">SalePrice</label> <input
							type="text" class="form-control" id="salePrice" name="salePrice">
					</div>
					<div class="mb-3">
						<label for="inven" class="form-label">Qty</label> <input
							type="text" class="form-control" id="inven" name="inven">
					</div>


				</div>



				<div class="mb-3" style="width: 80%; margin-left: 30px;">
					<label for="thumbNail" class="form-label">bookImgfile</label> <input
						type="File" class="form-control imageText" id="bookImgfile"
						name="bookImgfile" style="width: 900px; margin-bottom: 50px;"
						readonly>
				</div>



				<div class="content3">
					<div id="imageArea"></div>
					<!-- 
					<div class="fileUploadArea mb-3">
						<p>업로드할 파일을 여기에 드래그 드랍하세요!</p>
					</div>  -->

				</div>
				<div class="mb-3"
					style="margin-top: 50px; margin-left: 30px; width: 85%;">
					<label for="introduction" class="form-label">Introduction</label>
					<textarea class="form-control" id="introduction"
						name="introduction" rows="5" style="height: 150px; ">
							
						</textarea>
				</div>



				<div style="margin-left: 1400px; margin-top: 50px; ">
					<button type="submit" class="btn btn-secondary btn"
						style="width: 70px;" onclick='return validBook();'>저장</button>
				</div>

			</form>

		
				<h1 class="jemok">Regist Product With Excel File</h1>

			<div class="content4">
				<form id="uploadForm" enctype="multipart/form-data">
					<input type="file" id="fileInput" name="file"
						class="form-control imageText" style="width: 400px; margin-top: 30px;  " /> <input
						type="button" value="Upload Excel" onclick="excelValid()"
						style="margin-top: 30px;" />
				</form>
			</div>

			




		</div>



	</div>


</body>


</html>
