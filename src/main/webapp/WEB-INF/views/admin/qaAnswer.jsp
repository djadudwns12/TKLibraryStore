<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<!--  <link rel="stylesheet" href="resources/template/css/adminlte.css"> -->

<style>
body {
        font-family: 'Cairo', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .qaContent {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 2em;
        background-color: #fff;
        max-width: 800px;
        margin: 2em auto;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .qaContent div {
        margin-bottom: 1.5em;
        width: 100%;
    }
    h2 {
        color: #007bff;
        text-align: center;
    }
    hr {
        border: 1px solid #007bff;
        margin: 1em 0;
    }
    .form-group {
        width: 100%;
        margin-bottom: 1.5em;
    }
    .form-group label {
        font-size: 1.1em;
        color: #333;
        margin-bottom: 0.5em;
        display: block;
    }
    .form-group input, .form-group textarea {
        width: 100%;
        padding: 0.8em;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 1em;
    }
    .form-group textarea {
        height: 150px;
    }
    .submit-btn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 1em 2em;
        border-radius: 4px;
        font-size: 1.1em;
        cursor: pointer;
    }
    .submit-btn:hover {
        background-color: #0056b3;
    }
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function selectAll(obj) {
		var checked = obj.checked
		
		if(checked){			
			$('input:checkbox').prop('checked',true);
		}else{
			$('input:checkbox').prop('checked',false);
		}
	}
	function checkallYN() {
		let ckbox = $('tbody input[type=checkbox]');
		
		yn = true;
		
		$(ckbox).each(function(i,c){
			if(!c.checked){
				yn = false;
			}
			console.log(yn)
		});
		if(yn){
			$('#allck').prop('checked',true);
		}else{
			$('#allck').prop('checked',false);
		}
		
	}
	function isValid() {
		// 검색 버튼을 눌렀을 때 searchType == -1 이거나 , searchWord에 ''이면 
		// 검색어가 제대로 입력되지 않았으므로 백엔드 단으로 데이터를 넘기면 안된다
		
		let result = false;
		if($('#searchType').val() == -1 || $('#searchWord').val() == ''){
			alert('검색 조건과 검색어를 입력해 주세요');
			$('#searchType').focus();
			return result;
		} else {
			result = true;
		}
		
		return result;
		
	}
	$(function () {
		
		$('.pagingSize').change(function(){
			console.log($(this).val());
			
			let pageNo = '${param.pageNo}';
			if (pageNo == ''){
				pageNo = 1;
			} else {
				pageNo = parseInt(pageNo);
			}
			
			location.href = '/admin/qaAnswerView?pagingSize='+ $(this).val() + '&pageNo=1&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}';
		});
		
		
		$('.sortByWhat').change(function(){
			console.log($(this).val());						
			 
			location.href = '/admin/qaAnswerView?ra='+ $(this).val() + '&pageNo=${param.pageNo}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}';
		});
				
	});
</script>


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

         <div class="content">
           	<h2>Q&A Form</h2>
        <hr>

        <!-- Input Form for Question and Answer -->
        <form action="/admin/qaAnswerSave" method="post">
        	<input type="hidden" name="qNo" value="${qa.qNo}">
            <div class="form-group">
                <label for="qTitle">Question title:</label>
                <input type="text" id="qTitle" name="qTitle" placeholder="Enter question qTitle" required readonly="readonly" value="${qa.qTitle}">
            </div>
            <div class="form-group">
                <label for="qContent">Question Content:</label>
                <textarea id="qContent" name="qContent" placeholder="Enter your question here" required readonly="readonly">${qa.qContent}</textarea>
            </div>
            <!-- 답변 -->
            <div class="form-group">
                <label for="qAnswer">Question qAnswer:</label>
                <textarea id="qAnswer" name="qAnswer" placeholder="Enter your question here" required>${qa.qAnswer}</textarea>
            </div>
            <div>
                <button type="submit" class="submit-btn">Submit</button>
            </div>
        </form>
    </div>
         </div>
         

      </div>
   </div>


</body>
</html>
