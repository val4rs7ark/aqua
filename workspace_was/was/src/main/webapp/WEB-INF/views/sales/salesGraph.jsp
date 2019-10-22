<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>     
<%
	int size = 0;
	List<Map<String,Object>> gList = 
	      (List<Map<String,Object>>)request.getAttribute("gList");
	if(gList !=null && gList.size()>0){
	   size = gList.size();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAS,AQUA - 매출현황</title>
<%@ include file="/common/bootStrap4.jsp" %>
<%@ include file="/common/styles.jsp" %>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script type="text/javascript">
///////.......매출현황 그래프 보는 페이지. 현재 진행중....
//현재 년도 가져와서 담는 변수
var thisDate = new Date();
var thisYear = thisDate.getFullYear();
var thisMonth = thisDate.getMonth()+1;
//기간 선택 후 담을 변수
var selectDate_1;
var selectDate_2;
//날짜 이동
var pre_year;
var next_year
var pre_month;
var next_month;
//첫화면에 뿌릴 그래프 값 담을 변수
var barLabel = new Array();
var barData  = new Array();

$(document).ready(function(){
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
});

	///////////////////////// 년도  //////////////////////////
	// (금년) < 버튼 클릭시 
	function preYear(){
		pre_year = thisYear-1;
		alert(pre_year);
	}
	// (금년) > 버튼 클릭시 
	function nextYear(){
		next_year = thisYear+1;
		alert(next_year);
	}
	// 금년 버튼 클릭시 
	function todayYear() {
		alert(thisYear);
	}
	///////////////////////// 월별  //////////////////////////
	// 금월 버튼 클릭시 
	function todayMonth() {
		alert(thisMonth);
	}
	// (금월) < 버튼 클릭시 
	function preMonth(){
		pre_month = thisMonth-1;
		alert(pre_month);
	}
	// (금월) > 버튼 클릭시 
	function nextMonth(){
		next_month = thisMonth+1;
		alert(next_month);
	}
	///////////////////////// 기간선택  //////////////////////////
	function selectDate(){
		selectDate_1 = $("#sales_date_1").val();
		selectDate_2 = $("#sales_date_2").val();
		alert(selectDate_1+" - "+selectDate_2);
		
	}
	

</script>
<style type="text/css">
	input[id=btn_search] {
	  background-color: #343A40;
	  border: 0;
	  border-radius: 4px;
	  cursor: pointer;
	  color: #fff;
	  font-size:15px;
	  line-height: 1.1;
	  padding: 9px;
	  width: 55px
	}

</style>
</head>
<body>
<div class="container-fluid">
<div class="row">
<div style="width:20%">
	 <%@ include file="/common/MenuCommon.jsp" %>
</div>
<!-- ==================================================  본 화면 78% ================================================== -->
<div style="width:78%">
  <div class="card bg-dark text-white" style="height:50px;margin-top:70px;">
  <div class="card-body" style="height:30px;">매출현황</div>
  </div>
	    <!-- ========================================검색창 ================================ -->
  <div class="w3-container" style="margin-top: 5px; height: 80px;width:100%">
  <div class="box-container" style="margin-top: 5px; height: 40px;" align="center">
  <div id="box">
  <table>
     <thead>
      <th>
        	<td>
        		<i class='fas fa-calendar-check' style='font-size:30px'></i>
        	</td>
        </th>
        <th>
           <td>
             <td style="width:15%"> 
				<div class="btn-group">
				    <button type="button" class="btn btn-dark" onClick="javascript:preYear()"><</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:todayYear()">금년</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:nextYear()">></button>
				</div>
 			</td>
           </td>
           <td>
              <td style="width:15%;margin-right:4px;"> 
				<div class="btn-group">
				    <button type="button" class="btn btn-dark" onClick="javascript:preMonth()"><</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:todayMonth()">금월</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:nextMonth()">></button>
				</div>
 			</td>
           </td>
        </th>
        <th style="padding-right: 5px;">
        	<td>
        		<i class='fas fa-calendar-check' style='font-size:30px'></i>
        	</td>
        </th>
        <th>
           <td>
              <input type="date" id="sales_date_1" class="form-control">
           </td>
           <td style="padding-left:5px;padding-right:5px;"><i class="fas fa-minus-square" style="font-size:36px" valign="center"></i></td>
           <td>
              <input type="date" id="sales_date_2" class="form-control">
           </td>
           <td style="padding-left:5px;"><input id="btn_search" type="submit" value="조회" onClick="javascript:selectDate()"></td>
        </th>
     </thead>
  </div>
  </div>
  </table>
  </div>
  </div>
  </div>
    <!-- ========================================검색창 끝================================ -->
 <div>
	<!-- html의 canvas태그는 애니메이션을 지원하는 태그이다. 즉 차트를 그릴 위치를 선언. -->
		<canvas id="grChart" style="display: block; width: 545px; height: 272px;" width="545" height="272" class="chartjs-render-monitor"></canvas>
 </div>	
 <script type="text/javascript">
	//캔버스 id값 가져오기
 	var ctx = document.getElementById("grChart"); 
	var graphChart = new Chart(ctx, {
		   type: 'bar', //그래프 형태 지정하기
		    data: {
		        labels: barLabel,
		        datasets: [{
		            label: '매출현황', //상단 라벨(데이터값들의 그룹명)
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
	
</div>	
</body>
</html>