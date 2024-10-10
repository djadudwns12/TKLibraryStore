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
	
	$(function() {
		// Ajax로 데이터 요청
        $.ajax({
            url: '/admin/bookChart',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                drawBookChart(data);
            },
            error: function (error) {
                console.error("Error fetching data", error);
            }
        });
		
        $.ajax({
            url: '/admin/publisherChart',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                drawPublisherChart(data);
            },
            error: function (error) {
                console.error("Error fetching data", error);
            }
        });

        function drawBookChart(bookData) {
            var dataArray = [['', '찜 수', '리뷰 수']];
            bookData.forEach(function (book) {
                dataArray.push([book.title, book.zzim, book.reviewCnt]);
            });

            var data = google.visualization.arrayToDataTable(dataArray);

            var options = {
                chart: {
                    title: '인기 책',
                    subtitle: '찜이 가장 많은 책 5개의 찜과 리뷰수',
                },
                bars: 'horizontal'
            };

            var chart = new google.charts.Bar(document.getElementById('barchart_material'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
        
        function drawPublisherChart(publisherData) {
            var dataArray = [['Task', 'Hours per Day']];
            publisherData.forEach(function (publisher) {
                dataArray.push([publisher.publisher, publisher.publisher_count]);
            });

            var data = google.visualization.arrayToDataTable(dataArray);

            var options = {
                title: '출판사별 책 종류',
                pieHole: 0.4
            };

            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }
    });
	

	// 출판사별 매출 TOP5 (임의)
	google.charts.load('current', {
		packages : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {

		var data = google.visualization.arrayToDataTable([
				[ '출판사', '매출', ], [ '학지사', 18175000 ], [ '창지사', 13792000 ],
				[ '공동체', 12695000 ], [ '양서원', 9099000 ], [ '동문사', 8526000 ] ]);

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

	
	
	
</script>


<style>
img {
	width: 100px;
	height: 100px;
}

.content1 {
	margin-left: 50px;
	margin-top: 30px;
	 margin-bottom: 50px;
}

 /* h4 태그 스타일 */
        .content1 h4 {
            font-family: 'Arial', sans-serif;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            padding: 10px;
            color: #333;
            border-bottom: 2px solid #e0e0e0;
           
        }

.content2 {
	display: flex;
	flex-direction: row;
	margin-left: 50px;
	margin-right: 100px;
	justify-content: space-around;
	border-bottom: 2px solid #e0e0e0;
}

.content2 div{
	margin-bottom: 30px;
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
