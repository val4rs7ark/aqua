<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>     
<%
	int size = 0;
	List<Map<String,Object>> gList = 
	      (List<Map<String,Object>>)request.getAttribute("gList");
	if(gList !=null && gList.size()>0){
	   size = gList.size();
}
%>   
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script type="text/javascript">
//첫화면에 뿌릴 그래프 값 담을 변수
var barLabel = new Array();
var barData  = new Array();
<%	
if(gList!=null){
	for(int i=0;i<gList.size();i++){
		%>
		barLabel.push(<%=gList.get(i).get("GRDATE").toString()%>);
		barData.push(<%=gList.get(i).get("MONEY").toString()%>);
<%		
	}
	%>
	console.log(barLabel);
	console.log(barData);
<%		
}
%>
</script>
</head>
<body>
		<canvas id="grChart" style="display: block; width: 1000px; height: 510px; margin-left:170px;" width="1000" height="510" class="chartjs-render-monitor"></canvas>
		<script type="text/javascript">
		var ctx = document.getElementById("grChart"); 
		var graphChart = new Chart(ctx, {
			   type: 'bar', //그래프 형태 지정하기
			    data: {
			        labels: barLabel,
			        datasets: [{
			        	lineTension: 0.2,
			            label: '매출현황', //상단 라벨(데이터값들의 그룹명)
			            data: barData,//데이터값
			             backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',   //1번째 그래프의 바탕색
			                'rgba(54, 162, 235, 0.2)',   //2번째 그래프의 바탕색
			                'rgba(255, 206, 86, 0.2)',   //3번째 그래프의 바탕색
			                'rgba(75, 192, 192, 0.2)',   //4번째 그래프의 바탕색
			                'rgba(153, 102, 255, 0.2)',  //5번째 그래프의 바탕색
			                'rgba(255, 159, 64, 0.2)',    //6번째 그래프의 바탕색
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
			                'rgba(255, 159, 64, 1)',      //6번째 그래프의 선색
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
			    	responsive: false,
			    	tooltips: {
			            mode: 'point'
			        }
			        ,scales: {
			        	//바의 크기를 조절한다.
			        	xAxes: [{
			        		barPercentage: 0.5,
			                 barThickness: 50,
			                 maxBarThickness: 50,
			                 minBarLength: 4
			        	}]
			           ,yAxes: [{
			                 ticks: {
			                    beginAtZero:true,
			                    callback: function(value, index, values) {
			                         if(parseInt(value) > 999){
			                             return '￦' + value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			                         } else if (parseInt(value) < -999) {
			                             return '-￦' + Math.abs(value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			                         } else {
			                             return '￦' + value;
			                         }
			                     }
			                }
			            }]
			        }
			    }
		});
		</script>
</body>
</html>