<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<title>main</title>
<script>    
window.onload = function () {
var options = {
	animationEnabled: true,
	theme: "dark1",
	title:{
		text: "Monthly Expenses, 2016-17"
	},
	axisY :{
		includeZero: false,
		prefix: "$",
		lineThickness: 0
	},
	toolTip: {
		shared: true
	},
	legend: {
		fontSize: 13
	},
	data: [{
		type: "splineArea",
		showInLegend: true,
		name: "Salaries",
		yValueFormatString: "$#,##0",
		xValueFormatString: "MMM YYYY",
		dataPoints: [
			{ x: new Date(2016, 2), y: 28000 },
			{ x: new Date(2016, 3), y: 31500 },
			{ x: new Date(2016, 4), y: 28500 },
			{ x: new Date(2016, 5), y: 30400 },
			{ x: new Date(2016, 6), y: 26900 },
			{ x: new Date(2016, 7), y: 31400 },
			{ x: new Date(2016, 8), y: 31400 },
			{ x: new Date(2016, 9), y: 31000 },
			{ x: new Date(2016, 10), y: 33000 },
			{ x: new Date(2016, 11), y: 35000 },
			{ x: new Date(2017, 0),  y: 37900 },
			{ x: new Date(2017, 1),  y: 38000 }
		]
 	},
	{
		type: "splineArea", 
		showInLegend: true,
		name: "Office Cost",
		yValueFormatString: "$#,##0",
		dataPoints: [
			{ x: new Date(2016, 2), y: 18100 },
			{ x: new Date(2016, 3), y: 15000 },
			{ x: new Date(2016, 4), y: 14000 },
			{ x: new Date(2016, 5), y: 18500 },
			{ x: new Date(2016, 6), y: 18500 },
			{ x: new Date(2016, 7), y: 21800 },
			{ x: new Date(2016, 8), y: 20000 },
			{ x: new Date(2016, 9), y: 23000 },
			{ x: new Date(2016, 10), y: 22000 },
			{ x: new Date(2016, 11), y: 24000 },
			{ x: new Date(2017, 0), y: 23000 },
			{ x: new Date(2017, 1), y: 20500 }
		]
 	},
	{
		type: "splineArea", 
		showInLegend: true,
		name: "Entertainment",
		yValueFormatString: "$#,##0",     
		dataPoints: [
			{ x: new Date(2016, 2), y: 13100 },
			{ x: new Date(2016, 3), y: 8000 },
			{ x: new Date(2016, 4), y: 5400 },
			{ x: new Date(2016, 5), y: 4000 },
			{ x: new Date(2016, 6), y: 7000 },
			{ x: new Date(2016, 7), y: 7500 },
			{ x: new Date(2016, 8), y: 6200 },
			{ x: new Date(2016, 9), y: 8500 },
			{ x: new Date(2016, 10), y: 11300 },
			{ x: new Date(2016, 11), y: 12500 },
			{ x: new Date(2017, 0), y: 10500 },
			{ x: new Date(2017, 1), y: 9500 }
		]
 	},
	{
		type: "splineArea", 
		showInLegend: true,
		yValueFormatString: "$#,##0",      
		name: "Maintenance",
		dataPoints: [
			{ x: new Date(2016, 2), y: 1900 },
			{ x: new Date(2016, 3), y: 2300 },
			{ x: new Date(2016, 4), y: 1650 },
			{ x: new Date(2016, 5), y: 1860 },
			{ x: new Date(2016, 6), y: 1200 },
			{ x: new Date(2016, 7), y: 1000 },
			{ x: new Date(2016, 8), y: 1200 },
			{ x: new Date(2016, 9), y: 4500 },
			{ x: new Date(2016, 10), y: 1300 },
			{ x: new Date(2016, 11), y: 3700 },
			{ x: new Date(2017, 0), y: 2700 },
			{ x: new Date(2017, 1), y: 2300 }
		]
	}]
};
$("#chartContainer").CanvasJSChart(options);

}
</script>
<style type="text/css">
	#header{
	
	}
	span{
		font-weight: bold;
		font-size: 1em;
	}
	.container {
	  padding-right: 15px;
	  padding-left: 15px;
	  margin-right: auto;
	  margin-left: auto;
    }
	.row col-sm-12 {
		
	}
	button [type=button]{
		
	}
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="1">
<nav class="navbar col-sm-12 navbar-expand-sm bg-dark navbar-dark">
<a class="navbar-brand" href="#"><img src="/erp/images/was_logo2.PNG" width="150px" height="50px"></a>
	<nav class="navbar navbar-expand-sm">			
		<ul class="navbar-nav bg-light bg-dark text-white">
			<li class="nav-item"><a class="nav-link" href="#" style="color: white">Link 1</a></li>
			<li class="nav-item"><a class="nav-link" href="#" style="color: white">Link 2</a></li>
			<li class="nav-item"><a class="nav-link" href="#" style="color: white">Link 3</a></li>
		</ul>
	</nav>
</nav>
<div class="row">
	<!-- ==================================================================================================================
														사이드바				
	 ==================================================================================================================-->
	<div class="col-sm-3">
		<div class="row" padding="2px">  		
			<div class="card" style="width:350px">
			<img class="card-img-top" src="/erp/images/통모짜.jpg" alt="Card image" style="width:350px">
				<div class="card-body">
					<h4 class="card-title">${msg}</h4>
					<p class="card-text">마지막 접속시간: ${outtime}</p>
					<a href="#" class="btn btn-primary">내 정보 보기</a>
				</div>
			</div>
		<div class="list-group" style="width:350px">
			<button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#jaego">재고/품질관리</button>
			<div id="jaego" class="collapse">
			<button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#jaego2" style="width:350px">재고관리</button>
				<div id="jaego2" class="collapse">
					<a href="#" class="list-group-item list-group-item-action">재고등록</a>
				</div>
			<button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#jaego2" style="width:350px">품질관리</button>
				<div id="jaego2" class="collapse">
					<a href="#" class="list-group-item list-group-item-action">품목등록</a>
				</div>
			</div>
			<button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#sales">영업관리</button>
			<div id="sales" class="collapse">
			<button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#sales2" style="width:350px">영업</button>
				<div id="sales2" class="collapse">
					<a href="#" class="list-group-item list-group-item-action">거래처등록</a>
					<a href="#" class="list-group-item list-group-item-action">판매관리</a>
				</div>
			</div>
			<button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#management">인사경영관리</button>
			<div id="management" class="collapse">
				<a href="#" class="list-group-item list-group-item-action">인사관리</a>
				<a href="#" class="list-group-item list-group-item-action">회계관리</a>
				<a href="#" class="list-group-item list-group-item-action">급여관리</a>
			</div>
		</div>
		</div>
	</div>
	<!-- ==================================================================================================================
														메인 페이지				
	 ==================================================================================================================-->
	 
	<div class="col-sm-9">
		<div class="row">
			<div id="chartContainer" style="height: 300px; width: 1150px;"/>
		</div>
		<div class="row">			
			<div class="col-sm-6">
				<%@ include file="./was/calendar3.jsp" %>
			</div>
			<div class="col-sm-6">
				<div id="notice" style="width: 750px; height: 500px;">
			 	<h2>사내 공지사항</h2>
			  	<p>The .table-striped class adds zebra-stripes to a table:</p>            
			  	<table class="table table-striped">
			    	<thead>
			      		<tr>
			        	<th>번호</th>
			        	<th>제목</th>
			        	<th>작성자</th>
			        	<th>작성일</th>
			        	<th>조회수</th>
			      		</tr>
			    	</thead>
			    	<tbody>
			      		<tr>
				        	<td>3</td>
				        	<td>Doe</td>
				        	<td>john</td>
				        	<td>2019-08-30</td>
				        	<td>3</td>
			      		</tr>
					      	<tr>
					        <td>2</td>
					        <td>Moe</td>
					        <td>mary</td>
					        <td>2019-08-29</td>
					        <td>7</td>
				      	</tr>
				      	<tr>
					        <td>1</td>
					        <td>Dooley</td>
					        <td>july</td>
					        <td>2019-08-23</td>
					        <td>12</td>
				      	</tr>
			    	</tbody>
				</table>
				</div>	
			</div>			
		</div>
   </div>
</div> 
</body>
</html>