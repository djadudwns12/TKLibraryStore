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
	<!-- Google Fonts에서 Gowun Batang 폰트 불러오기 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>

google.charts.load('current', {'packages':['corechart']});



$(function() {
	//location.reload();
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

    // 엄영준
    getvisitHistory();
    

})


google.charts.load('current', { packages: ['corechart', 'bar'] });

// 라이브러리 로드 완료 후 차트 그리기 함수 호출
google.charts.setOnLoadCallback(loadChartData);

// Ajax로 서버에서 데이터 가져오기
function loadChartData() {
    $.ajax({
        url: '/admin/salesChart',  // 서버에서 데이터 가져오는 URL
        method: 'GET',
        dataType: 'json',  // 서버 응답 형식을 JSON으로 설정
        success: function (data) {
            drawBasic(data);  // 데이터를 받아서 차트를 그리는 함수 호출
        },
        error: function (error) {
            console.error("데이터를 가져오는 중 오류 발생: ", error);
        }
    });
}

function drawBasic(salesData) {
    // Google Charts 데이터 형식으로 변환
    var dataArray = [['월', '매출']];  // 첫 행에 헤더 추가
    salesData.forEach(function(row) {
        dataArray.push([row.order_month, row.total_pay]);
    });

    var data = google.visualization.arrayToDataTable(dataArray);

    var options = {
        title: '월별 매출',
        chartArea: { width: '60%' },
        hAxis: {
            title: '매출 단위(원)',
            minValue: 0
        },
        vAxis: {
            title: '출판사'
        }
    };

    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}
    // 엄영준
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
* {
	font-family: "Gowun Batang", serif;
	font-weight: 530;
	font-style: normal;
}


.content1 {
	margin-left: 50px;
	margin-top: 30px;
	 margin-bottom: 50px;
}

 /* h4 태그 스타일 */
 .content1 h4 {
     
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
	margin-left: 50px;
	margin-top: 30px;
	 margin-bottom: 50px;
}

.content3 h4 {
     
     font-size: 30px;
     font-weight: bold;
     text-align: center;
     padding: 10px;
     color: #333;
     border-bottom: 2px solid #e0e0e0;
    
 }

.content4 {
	display: flex;
	flex-direction: row;
	margin-left: 50px;
	margin-right: 100px;
	justify-content: space-around;
	border-bottom: 2px solid #e0e0e0;
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
