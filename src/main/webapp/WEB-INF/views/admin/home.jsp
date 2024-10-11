<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<!--  <link rel="stylesheet" href="resources/template/css/adminlte.css"> -->


<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 구글차트 API -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script>
google.charts.load('current', {'packages':['corechart']});
//google.charts.setOnLoadCallback(drawMemberAge);

$(function(){
	// 방문자 통계페이지데이터를 가지고 오는 쿼리문
	getvisitHistory();
})

function getvisitHistory(){
	$.ajax({
		url : '/admin/getVisitorHistory',
		type : 'get',
		contentType : false,
		processData : false,
		dataType : 'json',
		success : function(result) {
			console.log(result);
			
			drawVisitHistory(result.visitHistory);
			drawMemberAge(result.memberAge);
			drawMemberClass(result.memberClass);
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('업로드 실패: ' + textStatus);
		}
	});
}
function drawMemberAge(arr) {	
	let aa = [['회원연령대', '파이그래프']]
	$.each(arr,function(i,item) {
  		aa.push([item.age_group, item.user_count])
	});
	
    var data = google.visualization.arrayToDataTable(aa);

    var options = {
      title: '나이'
    };

    var chart = new google.visualization.PieChart(document.getElementById('MemberAge'));

    chart.draw(data, options);
    
  }
function drawMemberClass(arr){
	let aa = [['회원등급별', '파이그래프']]
	$.each(arr,function(i,item) {
  		aa.push([item.userClass_group, item.user_count])
	});
	
    var data = google.visualization.arrayToDataTable(aa);

    var options = {
      title: '회원등급'
    };

    var chart = new google.visualization.PieChart(document.getElementById('MemberClass'));

    chart.draw(data, options);
}

function drawVisitHistory(arr) {
	let VisitHistory = [['날짜', '회원방문수']]
	$.each(arr,function(i,item) {
		let visitDate = longtodate(item.visitDate)
		VisitHistory.push([visitDate, item.visitCount]);
	});
	
	var data = google.visualization.arrayToDataTable(VisitHistory);

    var options = {
      title: '방문자 그래프',
      curveType: 'function',
      legend: { position: 'top' },
      hAxis : {title:'날짜',
//    	  	   slantedText: true,       // 텍스트를 기울이도록 설정
//             slantedTextAngle: 90     // 각도를 45도로 설정
          	   },
      vAxis : {title : '방문자수'}
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

    chart.draw(data, options);
  }
  
//날짜 yyyy-mm-dd형식으로 표현하여 주는 함수
function longtodate(datetime){
	let today=new Date(datetime);
	var year = today.getFullYear().toString().slice(2,4);
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year+'/'+month  + '/' + day;
	
	return dateString
}

	
</script>


<style>
img {
	width: 100px;
	height: 100px;
}

.content1 {
	margin-left: 100px;
	margin-top: 30px;
}

.content2 {
	display: flex;
	flex-direction: row;
	margin-left: 100px;
	margin-right: 100px;
	justify-content: space-around;
}

.content3 {
	margin-left: 100px;
	margin-top: 300px;
}

.content4 {
	display: flex;
	flex-direction: row;
	margin-left: 20px;
	margin-right: 100px;
	justify-content: space-around;
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

			<div class="content1">
				<h4>상품 통계</h4>
			</div>


			<div class="content2">
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>
				<div>
					<img src="/resources/images/TKlogo.png">
				</div>


			</div>

			<div class="content3">
				<h4>방문자통계</h4>
			</div>

			<div class="content4">
				<!-- 일별방문자 선그래프 그리기 -->
				<div>
					<div id="curve_chart" style="width: 500px; height: 300px; margin-right: 50px;"></div>
				</div>

				<!-- 연령대그래프 그리기(Pie) -->
				<div>
					<div id="MemberAge" style="width: 500px; height: 300px;margin-right: 50px;"></div>
				</div>

				<!-- 회원등급그래프 그리기(Pie) -->
				<div>
					<div id="MemberClass" style="width: 500px; height: 300px;margin-right: 50px;"></div>
				</div>
			</div>

		</div>

		<div></div>




	</div>
</body>
</html>
