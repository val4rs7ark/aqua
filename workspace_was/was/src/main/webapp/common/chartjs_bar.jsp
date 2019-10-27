<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<title>Insert title here</title>
<style type="text/css">
	canvas { 
		background-color : #ffffff;
	}
</style>
<script>
var barData = new Array();
var barLabel= new Array();
$(document).ready(function() {
	 $.ajax({
		 	async: false
		   ,type : "POST"
		   ,url : "/erp/wasMainChart.was"
		   ,data : "gap=1"
		   ,success:function(data){
			   var jsonDoc = data;
				   if(jsonDoc.length>0){
					   for(var i=0;i<(jsonDoc.length-1);i++){
					   		barLabel[i] = jsonDoc[i].MCMONTH;
					   		barData[i] = jsonDoc[i].TOUCH;
					   }
				   }
		   }
		}); 
});

</script>
</head>
<body>
<div style="width:55%;">
		<!-- html의 canvas태그는 애니메이션을 지원하는 태그이다. 즉 차트를 그릴 위치를 선언. -->
		<canvas id="myChart" style="display: block; width: 545px; height: 272px;" width="545" height="272" class="chartjs-render-monitor"></canvas>
	</div>
	<script type="text/javascript">
	//캔버스 id값 가져오기
	var ctx = document.getElementById("myChart"); 
	//new Chart ==> chart.js에서 지원하는 클래스이다
	//첫번째 파라미터에 canvas(즉 차트를 생성할 위치)
	//두번째 파라미터에 차트의 속성들을 선언.
	var myChart = new Chart(ctx, {
    type: 'bar', //그래프 형태 지정하기
    data: {
        labels: barLabel,
        datasets: [{
            label: '6개월 매출', //상단 라벨(데이터값들의 그룹명)
            data: barData,//데이터값
             backgroundColor: [
                'rgba(255, 99, 132, 0.2)',   //1번째 그래프의 바탕색
                'rgba(54, 162, 235, 0.2)',   //2번째 그래프의 바탕색
                'rgba(255, 206, 86, 0.2)',   //3번째 그래프의 바탕색
                'rgba(75, 192, 192, 0.2)',   //4번째 그래프의 바탕색
                'rgba(153, 102, 255, 0.2)',  //5번째 그래프의 바탕색
                'rgba(255, 159, 64, 0.2)'    //6번째 그래프의 바탕색
            ],   
             borderColor: [  
                'rgba(255,99,132,1)',        //1번째 그래프의 선색
                'rgba(54, 162, 235, 1)',     //2번째 그래프의 선색
                'rgba(255, 206, 86, 1)',     //3번째 그래프의 선색
                'rgba(75, 192, 192, 1)',     //4번째 그래프의 선색
                'rgba(153, 102, 255, 1)',    //5번째 그래프의 선색
                'rgba(255, 159, 64, 1)'      //6번째 그래프의 선색
            ],   
            borderWidth: 1 //선굵기
        }]
    },
    options: {
    	tooltips: {
            mode: 'point'
        }
        ,scales: {
        	//바의 크기를 조절한다.
        	xAxes: [{
        		 barPercentage: 0.5,
                 barThickness: 20,
                 maxBarThickness: 20,
                 minBarLength: 4
        	}]
           ,yAxes: [{
                 ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
</body>
</html>