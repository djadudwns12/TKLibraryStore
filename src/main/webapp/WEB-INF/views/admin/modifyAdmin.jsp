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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
let upfiles = '';		//업로드 되는 파일들을 저장하는 배열

$(function(){
	//업로드 파일 영역에 drag&drop과 관련된 이벤트(파일의 경우 파일이 웹브라우저에서 실행되는 등)을 방지해야 한다 -> 이벤트 캔슬링
	$('.fileUploadArea').on("dragenter dragover", function(evt) {
		evt.preventDefault();  		//기본 이벤트 캔슬
	});
	
	// 유저가 fileUploadArea에 파일을 드래그&드랍 하면...
	$('.fileUploadArea').on("drop", function(evt){
		evt.preventDefault();
		
		//console.log(evt.originalEvent.dataTransfer.files);	//업로드 되는 파일 객체의 정보
		
			let file = evt.originalEvent.dataTransfer.files; 
			//이미지 파일이 아닐경우 alert
			//if(file.)
		
			//파일 사이즈 검사하여 10MB가 넘게되면 파일 업로드가 안되도록
			for(let file of evt.originalEvent.dataTransfer.files){
				
				//파일 사이즈 검사하여 10MB가 넘게되면 파일 업로드가 안되도록
				if(file.size > 10485760){
					alert("파일 용량이 너무 큽니다. 업로드한 파일을 확인해 주세요.");
				}else{	
					// 파일이 이미지인지 확인
	                if(file.type.startsWith('image/')) {
	                    var reader = new FileReader();
	                    
	                    // 파일을 읽어온 후 처리
	                    reader.onload = function(e) {
	                        // id가 imageArea인 태그에 이미지 덮어씌우기
	                        
	                        $('#imageArea').html('<img src="' + e.target.result + '" alt="업로드된 이미지" style="width: 100%; height: 100%;">');
	                        console.log(file)
	                        $('.imageText').val('/resources/'+file.name);
	                        
	                        
	                    }
	                    
	                    reader.readAsDataURL(file);  // 파일을 읽어옴
	                } else {
	                    alert("이미지 파일만 업로드 가능합니다.");
	                }
					
					
					
				}
			}
		
	});
});
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
			  { element: $('#introduction'), value: $('#introduction').val() }
			];

			// 빈 값이나 길이가 1 미만인 요소 찾기
			let emptyFieldIndex = fields.findIndex(field => !field.value || field.value.length < 1);

			// 해당 조건을 만족하는 요소가 있을 경우
			if (emptyFieldIndex != -1) {
			  fields[emptyFieldIndex].element.focus();  // 해당 요소에 포커스 주기
			  alert(emptyFieldIndex)
			  alert( fields[emptyFieldIndex].element.attr('id')+ "의 값을 입력해주세요.")
			} else {
			  console.log("모든 필드가 올바르게 입력되었습니다.");
			  result = ture;
			}
		return result;
	}
	
	
	
	// 실제로 유저가 업로드한 파일을 컨트롤러단에 전송하여 저장되도록 하는 함수
	function fileUpload(file) {
		
		let result = false;
		let fd = new FormData(); 	//FormData() 객체 생성 : form태그와 같은 역할의 객체
		fd.append("file", file);
		
		
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
            success : function(data) {		//비동기 통신에 성공하면 자동으로 호출 될 callback funtion
                console.log(data);
          	 	
            	if(data.msg == 'success'){
            		//미리보기
					//showPreview(file, data.newFileName);
           		 }
            	
            }//,error : function (data) {
            //	console.log(data);
           // 	if (data == 'fail'){
           // 		alert ('파일을 업로드 하지 못했습니다');

           // 	}
		//	}              

	    });
	}


</script>





<style>
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

.content1 {
	display: flex;
	justify-content: space-between;
	margin-left: 30px;
	width: 80%;
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

			<h1 class="jemok">ModifyProduct</h1>

			<form action="/admin/modifySave" method="post"
				enctype="multipart/form-data">
				
				<div class="content1">

					<div class="mb-3">
						<label for="bookNo" class="form-label">BookNo</label> <input
							type="text" class="form-control" id="boardNo" name="boardNo"
							value="${product.bookNo}" readonly>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label">Title</label> <input
							type="text" class="form-control" id="title" name="title"
							value="${product.title}">
					</div>
					<div class="mb-3">
						<label for="author" class="form-label">Author</label> <input
							type="text" class="form-control" id="author" name="author"
							value="${product.author}" >
					</div>
					<div class="mb-3">
						<label for="publisher" class="form-label">Publisher</label> <input
							type="text" class="form-control" id="publisher" name="publisher"
							value="${product.publisher}" >
					</div>

					<div class="mb-3">
						<label for="genre" class="form-label">PubDate</label> <input
							type="text" class="form-control" id="pubDate" name="pubDate"
							value="${product.pubDate}" >
					</div>

				</div>
				<div class="content2">

					<div class="mb-3">
						<label for="genre" class="form-label">Genre</label> <input
							type="text" class="form-control" id="genre" name="genre"
							value="${product.genre}" >
					</div>
					
						
					<div class="mb-3">
						<label for="price" class="form-label">Price</label> <input
							type="text" class="form-control" id="price" name="price"
							value="${product.price}" >
					</div>
					<div class="mb-3">
						<label for="salePrice" class="form-label">SalePrice</label> <input
							type="text" class="form-control" id="salePrice" name="salePrice"
							value="${product.salePrice}" >
					</div>
					<div class="mb-3">
						<label for="inven" class="form-label">Inven</label> <input
							type="text" class="form-control" id="inven" name="inven"
							value="${product.inven}">
					</div>

					<div class="mb-3">
						<label for="reviewCnt" class="form-label">ReviewCnt</label> <input
							type="text" class="form-control" id="reviewCnt" name="reviewCnt"
							value="${product.reviewCnt}" readonly>
					</div>
					<div class="mb-3">
						<label for="zzim" class="form-label">Zzim</label> <input
							type="text" class="form-control" id="zzim" name="zzim"
							value="${product.zzim}" readonly>
					</div>

				</div>

				<div class="mb-3" style="width: 80%; margin-left: 30px;">
					<label for="thumbNail" class="form-label">ThumbNail</label> <input
						type="text" class="form-control imageText" id="thumbNail" name="thumbNail"
						value="${product.thumbNail}"
						style="width: 900px; margin-bottom: 50px;" readonly>
				</div>
				<div class="content3">
					<div id="imageArea">
						<img src="${product.thumbNail}">
					</div>
					<div class="fileUploadArea mb-3">
						<p>업로드할 파일을 여기에 드래그 드랍하세요!</p>
					</div>
				</div>
				<div class="mb-3"
					style="margin-top: 50px; margin-left: 30px; width: 85%;">
					<label for="introduction" class="form-label">Introduction</label>
					<textarea class="form-control" id="introduction" name="introduction" rows="5"
						style="height: 150px;">
							${product.introduction}
						</textarea>
				</div>



				<div style="margin-left: 1400px; margin-top: 50px;">
					<button type="submit" class="btn btn-secondary btn" style="width: 70px;"
						onclick='return validBook();'>저장</button>
				</div>

			</form>





		</div>



	</div>


</body>


</html>
