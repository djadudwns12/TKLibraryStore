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

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>

	// 출판사별 매출 TOP5 (임의)
	google.charts.load('current', {
		packages : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {

		var data = google.visualization.arrayToDataTable([
				[ '출판사', '매출', ], [ '학지사', 8175000 ], [ '창지사', 3792000 ],
				[ '공동체', 2695000 ], [ '양서원', 2099000 ], [ '동문사', 1526000 ] ]);

		var options = {
			title : '출판사 비중 현황 (임의)',
			chartArea : {
				width : '60%'
			},
			hAxis : {
				title : '매출 단위(원)',
				minValue : 0
			},
			vAxis : {
				title : '출판사'
			}
		};

		var chart = new google.visualization.BarChart(document
				.getElementById('chart_div'));

		chart.draw(data, options);
	}

	// 출판사별 책 수 현황
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ '학지사', 8175000 ], [ '창지사', 3792000 ],
				[ '공동체', 2695000 ], [ '양서원', 2099000 ], [ '동문사', 1526000 ] ]);

		var options = {
			title : '출판사별 책 종류',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
	
	// 찜순 TOP5 리뷰수와 찜수
	 google.charts.load('current', {'packages':['bar']});
     google.charts.setOnLoadCallback(drawChart2);

     function drawChart2() {
       var data = google.visualization.arrayToDataTable([
         ['', '찜 수', '리뷰 수'],
         ['아이의 마음 속으로 떠나는 여행', 1000, 400],
         ['학부모의 마음 읽기와 지혜로운 소통', 1170, 460],
         ['몸의 만남 마음의 연결: 공간의 한계를 넘어', 660, 1120],
         ['성격 좋다는 말에 가려진 것들', 1030, 540],
         ['일상으로서의 명상', 1030, 540],
       ]);

       var options = {
         chart: {
           title: '인기 책',
           subtitle: '찜이 가장 많은 책 5개의 찜과 리뷰수',
         },
         bars: 'horizontal' // Required for Material Bar Charts.
       };

       var chart = new google.charts.Bar(document.getElementById('barchart_material'));

       chart.draw(data, google.charts.Bar.convertOptions(options));
     }
</script>


<style>
img {
	width: 100px;
	height: 100px;
}

.content1 {
	margin-left: 50px;
	margin-top: 30px;
}

.content2 {
	display: flex;
	flex-direction: row;
	margin-left: 50px;
	margin-right: 100px;
	justify-content: space-around;
}

.content3 {
	margin-left: 100px;
	margin-top: 100px;
}

.content4 {
	display: flex;
	flex-direction: row;
	margin-left: 100px;
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
					<div id="chart_div" style="width: 500px; height: 300px; margin-right: 50px;"></div>
				</div>
				<div>
					<div id="donutchart" style="width: 500px; height: 300px; margin-right: 50px;"></div>
				</div>
				<div>
					<div id="barchart_material" style="width: 500px; height: 300px;"></div>
				</div>


			</div>

			<div class="content3">
				<h4>방문자통계</h4>
			</div>

			<div class="content4">
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

		</div>

		<div></div>




	</div>
</body>
</html>
