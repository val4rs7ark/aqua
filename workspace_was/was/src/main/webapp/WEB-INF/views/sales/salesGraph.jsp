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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js">
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
var change_year = thisYear;
var change_month = thisMonth;

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
	}else{
%>
	alert("데이터가 없습니다.");
<%		
	}
%>	
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
});

	///////////////////////// 매출현황 종류 - 년도별 매출현황  //////////////////////
	function selectYear(){
		location.href="/erp/salesYear.was?today_year="+change_year
		    
	}
	
	
	
	///////////////////////// 년도  //////////////////////////
	// (금년) < 버튼 클릭시 
	function preYear(){
		change_year = change_year-1;
		$.ajax({
			method:"get"
			,url:"/erp/salesSelectMonth.was?today_year="+change_year+"&today_month="+change_month
		    ,success:function(data){
		    	$("#div_chart").html(data);
		    	$("#d_day").text(change_year+"년  "+change_month+"월");
			
					   }
		}); 
	}
	// (금년) > 버튼 클릭시 
	function nextYear(){
		change_year = change_year+1;
		$.ajax({
			method:"get"
			,url:"/erp/salesSelectMonth.was?today_year="+change_year+"&today_month="+change_month
		    ,success:function(data){
		    	$("#div_chart").html(data);
		    	$("#d_day").text(change_year+"년  "+change_month+"월");
			
					   }
		}); 
	}
	// 금년 버튼 클릭시 
	function todayYear() {
		change_year = thisYear;
		$.ajax({
			method:"get"
			,url:"/erp/salesSelectMonth.was?today_year="+change_year+"&today_month="+change_month
		    ,success:function(data){
		    	$("#div_chart").html(data);
		    	$("#d_day").text(change_year+"년  "+change_month+"월");
			
					   }
		}); 
	}
	///////////////////////// 월별  //////////////////////////
	// 금월 버튼 클릭시 
	function todayMonth() {
		if(thisMonth>10){
			thisMonth = '0'+thisMonth;
		}
		change_month = thisMonth;
		location.href="salesMainSelect.was";
	}
	// (금월) < 버튼 클릭시 
	function preMonth(){
		if(change_month<2){
			change_year = change_year-1;
			change_month = 12;
		}
		else{
			if(change_month<10){
				change_month = "0"+change_month;
			}
			change_month = change_month-1;
		}
		$.ajax({
			method:"get"
			,url:"/erp/salesSelectMonth.was?today_year="+change_year+"&today_month="+change_month
		    ,success:function(data){
		    	$("#div_chart").html(data);
		    	$("#d_day").text(change_year+"년  "+change_month+"월");
			
					   }
		}); 
	}
	// (금월) > 버튼 클릭시 
	function nextMonth(){
		if(change_month>11){
			change_year = change_year+1;
			change_month = 1;
			if(change_month>10){
				change_month = '0'+change_month;
			}
		}
		else{change_month = change_month+1;}
		
		$.ajax({
			method:"get"
			,url:"/erp/salesSelectMonth.was?today_year="+change_year+"&today_month="+change_month
		    ,success:function(data){
		    	$("#div_chart").html(data);
		    	$("#d_day").text(change_year+"년  "+change_month+"월");
			
					   }
		}); 
	}
	///////////////////////// 기간선택  //////////////////////////
	function selectDate(){
		selectDate_1 = $("#sales_date_1").val();
		selectDate_2 = $("#sales_date_2").val();
		$.ajax({
			method:"get"
			,url:"/erp/salesTwoSelect.was?today_1="+selectDate_1+"&today_2="+selectDate_2
		    ,success:function(data){
		    	$("#div_chart").html(data);
		    	$("#d_day").text(selectDate_1+" - "+selectDate_2);
			
					   }
		}); 
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
<div style="width:20%; height:1050px;">
	 <%@ include file="/common/MenuCommon.jsp" %>
</div>
<!-- ==================================================  본 화면 78% ================================================== -->
<div style="width:78%">
  <div class="card bg-dark text-white" style="height:50px;width:95%;margin-top:50px;margin-bottom:15px;margin-left:20px;">
  <div class="card-body" style="height:30px;">영업/매출관리>매출현황</div>
  </div>
	    <!-- ========================================검색창 ================================ -->
  <div class="w3-container" style="margin-top: 5px;margin-bottom:25px; height: 80px;width:100%">
  <div class="container" style="margin-top: 5px; height: 40px;" align="center">
  <div id="box">
  <table>
     <thead>
      <th>
        	<td style="width:30px;">
        		<i class='fas fa-calendar-check' style='font-size:30px'></i>
        	</td>
        </th>
        <th>
             <td style="width:15%"> 
				<div class="btn-group">
				    <button type="button" class="btn btn-dark" onClick="javascript:preYear()"><</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:todayYear()">이번년도</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:nextYear()">></button>
				</div>
 			</td>

              <td style="width:14%;margin-right:4px;"> 
				<div class="btn-group">
				    <button type="button" class="btn btn-dark" onClick="javascript:preMonth()"><</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:todayMonth()">이번달</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:nextMonth()">></button>
				</div>
 			</td>

        </th>
        <th>
        	<td style="width:35px;padding-right: 5px;">
        		<i class='fas fa-calendar-check' style='font-size:30px'></i>
        	</td>
        </th>
        <th>
           <td style="width:230px;">
              <input type="month" id="sales_date_1" class="form-control">
           </td>
           <td style="width:45px;padding-left:5px;"><i class="fas fa-minus-square" style="font-size:36px" valign="center"></i></td>
           <td style="width:220px;">
              <input type="month" id="sales_date_2" class="form-control">
           </td>
           <td style="padding-left:5px;"><input id="btn_search" type="submit" value="조회" onClick="javascript:selectDate()"></td>
        </th>
     </thead>
  </div>
  </div>
  </table>
  <div style="margin-top:8px;">
  <button type="button" class="btn btn-light" onClick="javascript:selectYear()">년별 매출 보기</button>
  </div>
  </div>
  </div>
  </div>
    <!-- ========================================검색창 끝================================ -->
    <div id="d_day" style="font-size:24px;text-align:center;"></div>
    <script type="text/javascript">
    	$("#d_day").text(change_year+"년  "+change_month+"월");
    </script>
 <div id="div_chart">
	<!-- html의 canvas태그는 애니메이션을 지원하는 태그이다. 즉 차트를 그릴 위치를 선언. -->
		<canvas id="grChart" style="display: block; width: 1000px; height: 510px; margin-left:170px;" width="1000" height="510" class="chartjs-render-monitor"></canvas>
 </div>	
</div>
<div style="height:300px">
<h1>&nbsp;</h1>
</div>	
</body>
</html>