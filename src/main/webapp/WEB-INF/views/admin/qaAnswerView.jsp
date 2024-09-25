<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<!--  <link rel="stylesheet" href="resources/template/css/adminlte.css"> -->

<style>
body {
   color: #666;
   font: 14px/24px "Open Sans", "HelveticaNeue-Light",
      "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial,
      "Lucida Grande", Sans-Serif;
}

table {
   border-collapse: separate;
   border-spacing: 0;
   width: 1600px;
   margin-left: 30px;
   text-align: center;
}

th, td {
   padding: 6px 15px;
}

th {
   background: #42444e;
   color: #fff;
   text-align: center;
}

tr:first-child th:first-child {
   border-top-left-radius: 6px;
}

tr:first-child th:last-child {
   border-top-right-radius: 6px;
}

td {
   border-right: 1px solid #c6c9cc;
   border-bottom: 1px solid #c6c9cc;
   text-align: center;
}

td:first-child {
   border-left: 1px solid #c6c9cc;
}

tr:nth-child(even) td {
   background: #eaeaed;
}

tr:last-child td:first-child {
   border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
   border-bottom-right-radius: 6px;
}

$
background-color: #2A2E37 ; $search-bg-color: #242628 ; $icon-color: #00FEDE 
    ; $transition: all .5s ease ; * {
   box-sizing: border-box;
}

body {
   background: $background-color;
}

.search {
   margin-left: 30px;
}

.jemok {
   margin-left: 30px;
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
            <h1 class="jemok">ProductList</h1>


            <!-- The form -->
            <form class="search"style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: center;" 
            action="/admin/productAdmin" method="post">
                  
                  <div>
                     <select class="searchType" name="searchType" id="searchType" style="text-align: center">
                        <option value="-1">검색 조건</option>
                        <option value="title">제목</option>
                        <option value="author">작가</option>
                        <option value="introduction">내용</option>
                        <option value="genre">장르</option>
                        <option value="publisher">출판사</option>
                     </select>
                  </div>
               <section>
                  
                  <div class="searchBar" style="margin-right: 20px;">
                     <input type="text" class="searchWord"  name="searchWord" id="searchWord" placeholder="검색어를 입력하세요.">
                     <div class="searchIcon">
                        <i class="fas fa-search"></i>
                     </div>
                     <div class="keyBoard">
                        <i class="fas fa-keyboard"></i>
                     </div>
                     <div class="mic">
                        <i class="fas fa-microphone"></i>
                     </div>

                  </div>
               </section>
                  <button type="submit" class="btn btn-outline-dark btn" onclick="return isValid()">검색</button>
               </form>
               
               <div style="clear: right; display: flex; flex-direction: row; align-items: center; justify-content: right; margin-bottom: 50px;">
                  <div class="boardC" >
                     <select class="form-select sortByWhat" id="sortByWhat" style="width: 150px ">
                        <option value="default">기본 정렬</option>
                        <option value="salePrice">가격 높은순</option>
                        <option value="inven">재고 많은순</option>
                        <option value="zzim">찜 많은순</option>
                        <option value="reviewCnt">리뷰 많은순</option>
                        <option value="pubDate">최신순</option>
                     </select>
                  </div>
               
                  <div class="boardControll">
                     <select class="form-select pagingSize" id="pagingSize" style="width: 150px ">
                        <option value="0">정렬 기준</option>
                        <option value="10">10개씩 보기</option>
                        <option value="20">20개씩 보기</option>
                        <option value="30">30개씩 보기</option>
                        <option value="40">40개씩 보기</option>
                     </select>
                  </div>
               </div>
            
			<!-- QA 테이블 -->
            <table>
               <thead>
                  <tr>
                     <th><input type="checkbox" id="allck" onclick="selectAll(this)"></th>
                     <th>번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                     <th>답변여부</th>                     
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="qa" items="${qaList}">
                     <tr>
                        <td><input type="checkbox" name="proCheck" value="${qa.qNo}" onclick="checkallYN(this)"></td>
                        <td>${qa.qNo}</td>
                        <td>${qa.qTitle}</td>
                        <td>${qa.qWriter}</td>
                        <td>${qa.qDate}</td>
                        <td>${qa.qAnswer}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
         <!-- 페이징하는곳 -->
         <div class="pagination justify-content-center" style="margin: 20px 0">

            <ul class="pagination">

               <c:if test="${param.pageNo > 1 }">
                  <li class="page-item"><a class="page-link"
                     href="/admin/productAdmin?pageNo=1
                  &pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}"> << </a></li>
                  <li class="page-item"><a class="page-link"
                     href="/admin/productAdmin?pageNo=${pagingInfo.pageNo-1}
                  &pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Previous</a></li>
               </c:if>

               <c:forEach var="i" begin="${pagingInfo.startPageNoCurBlock }"
                  end="${pagingInfo.endPageNoCurBlock }">
                  <c:choose>
                     <c:when test="${param.pageNo == i }">
                        <li class="page-item active" id="${i}"><a class="page-link"
                           href="/admin/productAdmin?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">${i }</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="page-item" id="${i}"><a class="page-link"
                           href="/admin/productAdmin?pageNo=${i}&pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">${i }</a></li>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>

               <c:if test="${param.pageNo < pagingInfo.totalPageCnt}">
                  <li class="page-item"><a class="page-link"
                     href="/admin/productAdmin?pageNo=${pagingInfo.pageNo+1}
                  &pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}">Next</a></li>
                  
                  <li class="page-item"><a class="page-link"
                     href="/admin/productAdmin?pageNo=${pagingInfo.totalPageCnt}
                  &pagingSize=${param.pagingSize}&searchType=${search.searchType}&searchWord=${search.searchWord}&ra=${param.ra}"> >> </a></li>
               </c:if>
            </ul>
         </div>
         

      </div>
   </div>


</body>
</html>
