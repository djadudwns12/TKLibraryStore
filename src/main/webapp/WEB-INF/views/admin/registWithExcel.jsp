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
	
function isValid() {
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
        processData: false, // 데이터를 처리하지 않음
        contentType: false, // 멀티파트 폼 데이터를 전송할 수 있도록 설정
        success: function(response) {
            alert("파일이 성공적으로 업로드되었습니다.");
        },
        error: function() {
            alert("파일 업로드에 실패했습니다.");
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

			<h1 class="jemok">Regist Product With Excel File</h1>


		

			<form id="uploadForm" enctype="multipart/form-data">
				<input type="file" id="fileInput" name="file" class="form-control imageText"
					style="width: 400px;" /> <input
					type="submit" value="Upload Excel" onclick ="isValid()"style="margin-top: 30px;" />
			</form>



		</div>



	</div>


</body>


</html>
